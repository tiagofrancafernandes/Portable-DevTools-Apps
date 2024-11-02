# MariaDB Server Configuration File

[client]
socket=mysql.sock
host=127.0.0.1
user=root
password=mysql
port=3307
plugin-dir=../lib/plugin
; plugin-dir=C:\apps\mariadb\mariadb-11.4.3/lib/plugin
skip-ssl-verify-server-cert=true
socket=mysql.sock

[mysqld]
# Configurações de rede
socket=mysql.sock
bind-address=0.0.0.0
port=3307


# Configurações de desempenho
max_connections=100
key_buffer_size=16M
table_open_cache=64
sort_buffer_size=256K
read_buffer_size=256K
read_rnd_buffer_size=256K
myisam_sort_buffer_size=8M
named-pipe=ON

# Diretórios de dados
datadir=./
;; Value examples:
; datadir=/var/mariadb/11.4.3/data
; datadir=C:/apps/mariadb/mariadb-11.4.3/data
; datadir=./
; datadir=./data
; datadir=../data

# Configurações de log
log-error=./mariadb-error.log
pid-file=./mariadb.pid

# Configurações de segurança
; skip-name-resolve
; skip-grant-tables
