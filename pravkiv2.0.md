### Токен отозвать:
- [x] Чтобы отозвать токен, был выполнен выход на всех компьютерах в Яндекс ID. Согласно инструкции ["Отзыв токенов"](https://yandex.ru/dev/id/doc/ru/tokens/token-invalidate)
---
- [x] Из [variables.tf](https://github.com/RziankinS/mynginxrepo/blob/46771681b2fd1c72dc74ccfd6f40b900ecd4f602/variables.tf) удален раздел:
```
variable "yandex_cloud_auth" {
  sensitive = true
}
```
---
- [x] Для доступа к Terraform cloud в [".github/workflows/main.yml"](https://github.com/RziankinS/mynginxrepo/blob/46771681b2fd1c72dc74ccfd6f40b900ecd4f602/.github/workflows/main.yml) указана переменная, которая используется для установки API-ключа Terraform Cloud в контексте сборки GitHub Actions:
```
cli_config_credentials_token: ${{ secrets.TF_API_TOKEN }}
```
Секрет с именем TF_API_TOKEN содержит API-ключ, необходимый для авторизации в Terraform Cloud и выполнения операций с проектами и инфраструктурой.

---
- [x] После, произведенных изменений, прооверяем что все успешно отрабатывает:
![новый тэг](https://github.com/RziankinS/devops-netology/blob/9d1edef1cecbc97cd4c5641180f333df8ed73877/screen/pravki/new_tag.png)

![terr_cloud](https://github.com/RziankinS/devops-netology/blob/9d1edef1cecbc97cd4c5641180f333df8ed73877/screen/pravki/new_tag_terr_cloud.png)

![runs](https://github.com/RziankinS/devops-netology/blob/9d1edef1cecbc97cd4c5641180f333df8ed73877/screen/pravki/runs.png)
---
