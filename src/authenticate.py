import json
import boto3
import os

def validate_cpf(cpf):
    return len(cpf) == 11 and cpf.isdigit()

def handler(event, context):
    try:
        body = json.loads(event['body'])
        cpf = body.get('cpf')

        if not cpf:
            return {
                'statusCode': 400,
                'body': json.dumps({'message': 'CPF não fornecido'})
            }

        if not validate_cpf(cpf):
            return {
                'statusCode': 400,
                'body': json.dumps({'message': 'CPF inválido'})
            }

        cognito = boto3.client('cognito-idp')
        user_pool_id = os.environ['COGNITO_USER_POOL_ID']

        try:
            user = cognito.admin_get_user(
                UserPoolId=user_pool_id,
                Username=cpf
            )
            return {
                'statusCode': 200,
                'body': json.dumps({'message': 'Usuário autenticado com sucesso'})
            }
        except cognito.exceptions.UserNotFoundException:
            cognito.admin_create_user(
                UserPoolId=user_pool_id,
                Username=cpf,
                UserAttributes=[
                    {
                        'Name': 'custom:cpf',
                        'Value': cpf
                    }
                ],
                MessageAction='SUPPRESS'
            )
            return {
                'statusCode': 201,
                'body': json.dumps({'message': 'Usuário criado e autenticado com sucesso'})
            }

    except Exception as e:
        return {
            'statusCode': 500,
            'body': json.dumps({'message': f'Erro interno: {str(e)}'})
        }