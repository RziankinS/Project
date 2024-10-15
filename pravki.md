### Не увидел - деплой терраформа через cicd или atlantis или terraform cloud

1. Внесены изменения в .github/workflows/main.yml
```bash
  terraform_apply:
    needs: deploy
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      - name: Set up Terraform
        uses: hashicorp/setup-terraform@v2
        with:
          cli_config_credentials_token: ${{ secrets.TF_API_TOKEN }}
      - name: Terraform init
        run: terraform init
      - name: Terraform apply
        run: terraform apply -auto-approve   
   ```
2. Для успешного terraform apply, добавлен [variables.tf](https://github.com/RziankinS/mynginxrepo/blob/c0b14ab802ca4cb6bfd6b99c009db6e79aeaabb0/variables.tf)
3. Вносим изменения, отправляем коммит, проверяем Action:
   ![1](https://github.com/RziankinS/devops-netology/blob/e6c8fe4b203c0a026391cb07d8202a9823ac4d04/screen/project/2.png)
   ![2](https://github.com/RziankinS/devops-netology/blob/e6c8fe4b203c0a026391cb07d8202a9823ac4d04/screen/project/3.png)

4. Переходим в terroform cloud, задача успешно выполнена:
   ![3](https://github.com/RziankinS/devops-netology/blob/e6c8fe4b203c0a026391cb07d8202a9823ac4d04/screen/project/4.png)
   ![4](https://github.com/RziankinS/devops-netology/blob/e6c8fe4b203c0a026391cb07d8202a9823ac4d04/screen/project/5.png)
   ![5](https://github.com/RziankinS/devops-netology/blob/e6c8fe4b203c0a026391cb07d8202a9823ac4d04/screen/project/6.png)
