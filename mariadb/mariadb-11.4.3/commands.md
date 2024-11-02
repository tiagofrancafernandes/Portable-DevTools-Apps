### Starting the service
```sh
/c/apps/mariadb/mariadb-11.4.3/bin/mysqld --verbose
```

### MySQL CLI SQL Client
- Login as `mysql` user
```sh
/c/apps/mariadb/mariadb-11.4.3/bin/mysql --skip-ssl-verify-server-cert -u mysql -h 127.0.0.1 -P 3307 -pmysql
```

- Login as `root` user
```sh
/c/apps/mariadb/mariadb-11.4.3/bin/mysql --skip-ssl-verify-server-cert -u root -h 127.0.0.1 -P 3307 -pmysql
```


#### For first use:

1. Create the `data` dir or run:

```sh
/c/apps/mariadb/mariadb-11.4.3/bin/mariadb-install-db.exe --config=../base-my.ini.tpl --allow-remote-root-access --default-user
```

Or full

```sh
/c/apps/mariadb/mariadb-11.4.3/bin/mariadb-install-db.exe --config=/c/apps/mariadb/mariadb-11.4.3/base-my.ini.tpl --allow-remote-root-access --default-user --password=mysql --port=3307 --socket=mysql.sock
```

------

### Criar Usuário com senha e Privilégios Totais
> Para fim de exemplo, o usuário será 'mysql'.

Para criar um usuário chamado mysql com a senha mysql, que tenha privilégios totais e possa acessar de qualquer lugar, você pode seguir os passos abaixo após se conectar ao MariaDB.

    Conectar ao MariaDB:
        Abra o terminal e conecte-se ao MariaDB como um usuário com privilégios suficientes (como root):
        cmd

    ```sh
    mysql -u root -p
    ```

Criar o Usuário:

    Execute o seguinte comando para criar o usuário mysql com a senha mysql:
    sql

    ```sql
    CREATE USER 'mysql'@'%' IDENTIFIED BY 'mysql';
    ```

Conceder Privilégios Totais:

    Para conceder todos os privilégios ao usuário mysql, execute:
    sql

    ```sql
    GRANT ALL PRIVILEGES ON *.* TO 'mysql'@'%' WITH GRANT OPTION;
    ```

Recarregar as Permissões:

    Após conceder os privilégios, é importante recarregar as permissões para que as alterações tenham efeito:
    sql

    ```sql
    FLUSH PRIVILEGES;
    ```

Verificar a Criação do Usuário:

    Você pode verificar se o usuário foi criado corretamente e se os privilégios foram concedidos com o seguinte comando:
    sql

    ```sql
    SELECT user, host FROM mysql.user;
    ```
Verificar a criação:

    Você pode verificar se a senha foi alterada corretamente tentando se conectar novamente:
    cmd

    ```sh
    mysql -u mysql -p
    ```

Quando solicitado, insira mysql como a nova senha.

Considerações de Segurança

    Acesso de Qualquer Lugar: O uso de '%' permite que o usuário mysql se conecte de qualquer endereço IP. Isso pode ser um risco de segurança, especialmente em ambientes de produção. Considere restringir o acesso a endereços IP específicos, se possível.
    Senhas Fracas: Usar uma senha simples como mysql não é recomendado para ambientes de produção. É sempre melhor usar senhas fortes e complexas.

Seguindo esses passos, você terá criado o usuário mysql com acesso total ao banco de dados. Se precisar de mais assistência, estou aqui para ajudar!
