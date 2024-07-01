
# Instrucciones:

- Una vez ubicados en este directorio, desde Powershell hay que ejecutar el comando "Compress-Archive -Path .\lambdafunction.py -DestinationPath lambda_function.zip" así creamos un archivo .zip en esta ubicación que luego será el .zip con el que se ejecutara la función de python en AWS Lambda (para esto antes también personalizar la función en la parte en la cual se indica el Webhook URL de la App creada en Slack).

- Personalizar variables en variablevalues.tfvars.

- terraform plan --var-file variablevalues.tfvars

- terraform apply --var-file variablevalues.tfvars

# Instructions:

- Once in this directory, run the command "Compress-Archive -Path .\lambdafunction.py -DestinationPath lambda_function.zip" in PowerShell. This creates a .zip file in this location, which will later be used to execute the Python function in AWS Lambda (beforehand, customize the function where the Slack App's Webhook URL is specified).

- Customize variables in variablevalues.tfvars.

- Run `terraform plan --var-file variablevalues.tfvars`.

- Run `terraform apply --var-file variablevalues.tfvars`.
