# 安装mysql服务 
sudo apt-get install mysql-server 
# 安装客户端 
sudo apt install mysql-client 
# 安装依赖 
sudo apt install libmysqlclient-dev 
# 检查状态 
sudo netstat -tap | grep mysql

# 修改配置文件，注释掉bind-address = 127.0.0.1
$ sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf

# 保存退出，然后进入mysql服务，执行授权命令：
$ mysql -uroot -p

grant all on *.* to root@'%' identified by '123456' with grant option;
flush privileges;
