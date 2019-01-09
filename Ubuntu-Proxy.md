安装tiny proxy

sudo apt-get update

sudo apt-get install tinyproxy

修改配置文件  配置文件在 /etc/tinyproxy.conf

vim /etc/tinyproxy.conf

Port 8888 #预设是8888 Port,你可以更改

Allow 127.0.0.1 #将127.0.0.1改成你自己的IP

例如你的IP 是1.2.3.4,你改成Allow 1.2.3.4,那只有你才可以连上这个Proxy

若你想任何IP都可以脸到Proxy在Allow前面打#注释

以根用户启动时，在初始化完成后切换 uid/gid 为 nobody/nogroup

Port 默认监听端口为 8888(该端口无需用 root 权限绑定)

默认在所在网卡上监听

Logfile (必须) 日志文件, 默认 / usr/var/log/tinyproxy/tinyproxy.log，在 LogFile 文件不存在时会警告，不会运行失败。

Pidfile (必须)pid 文件, 默认 / usr/var/run/tinyproxy/tinyproxy.pid，在 PidFile 文件不存在时会运行失败。

StartServers 初始启动的代理服务器子进程 (默认是 10 个)

Allow 允许使用 tinyproxy 进行 HTTP 代理的 IP 地址。默认是 127.0.0.1，如果想要公开 tinyproxy 代理服务器，则把 Allow 一行注释掉

service tinyproxy start

sudo service tinyproxy start

连接测试

在另一台客户机上输入

curl -x <IP>:<PORT> www.baidu.com
