# devops-test
Pasos para crear IaC
Configurar AWS CLI
● Ejecutar comando aws configure
● Ingresar Access Key ID (generado desde IAM)
● Ingresar Secret Access Key (generado desde IAM)
● Ingresar region name
● Ingresar formato de salida: json, yaml, yaml-stream, text o table
Ejecutar archivos terraform
● git clone https://github.com/EliasCesar/devops-test.git
● cd iac
● terraform init
● terraform plan
● terraform apply -auto-approve