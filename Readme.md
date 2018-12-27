# 安装MySql

安装mysql服务

sudo apt-get install mysql-server

安装客户端

sudo apt install mysql-client

安装依赖

sudo apt install libmysqlclient-dev

检查状态

sudo netstat -tap | grep mysql

修改配置文件，注释掉bind-address = 127.0.0.1

sudo vi /etc/mysql/mysql.conf.d/mysqld.cnf

保存退出，然后进入mysql服务，执行授权命令：

mysql -uroot -p

grant all on *.* to root@'%' identified by '123456' with grant option;

flush privileges;

# 安装配置Java

下载 JavaSE

wget -O jdk-8u191-linux-x64.tar.gz https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jdk-8u191-linux-x64.tar.gz?AuthParam=1545878502_55697b14c36e06157d0a35c4ab623e27

解压

tar -zxvf xx.tar.gz

设置变量

vim /etc/profile

在文件的末尾加入以下内容

export JAVA_HOME="Jdk Path"

export JRE_HOME=${JAVA_HOME}/jre

export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib

export PATH=.:${JAVA_HOME}/bin:$PATH

生效

source /etc/profile

检查

java -version

# Tomcat 安装与配置

下载
https://tomcat.apache.org/download-90.cgi

wget -O apache.tar.gz http://apache.claz.org/tomcat/tomcat-9/v9.0.14/bin/apache-tomcat-9.0.14.tar.gz

解压

tar -zxvf apache.tar.gz

移动到指定目录（一般是/opt下）

sudo mv apache-tomcat-9.0.14 /opt/tomcat9

更改文件夹的权限（鉴于电脑都是自己用，所以直接把权限改成777也没事，根据你的情况而定）

sudo chmod -R 777 /opt/tomcat9

配置环境变量

切换目录到/opt/tomcat9/bin

cd /opt/tomcat9/bin

修改./startup.sh

vim ./startup.sh

打开以后，最后一行是exec "$PRGDIR"/"$EXECUTABLE" start "$@"，我们将以下内容添加到它的前面的位置即可

export JAVA_HOME="Java Path"

export JRE_HOME=${JAVA_HOME}/jre

export CLASSPATH=.:${JAVA_HOME}/lib:${JRE_HOME}/lib

export PATH=.:${JAVA_HOME}/bin:$PATH

export TOMCAT_HOME=/opt/tomcat9

启动tomcat服务器并检测是否配置成功

启动，打开startup.sh这个文件，根据路径而输入命令，或者直接输入

/opt/tomcat9/bin/startup.sh

修改端口为80

vim /opt/tomcat9/conf/server.xml

