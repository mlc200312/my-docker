# my-docker
本项目通过docker-compose可一键部署开发环境

## 环境须知！
- 安装 Docker，示例 Version:28.0.1
- 安装 Docker Compose

## 安装
运行 install.sh 可一键部署mysql、redis、nacos、rabbitmq等服务。
``` bash
 bash install.sh                     
```

### 版本
- mysql:8.0.32
- redis:7.0.12
- nacos/nacos-server:v2.5.1
- rabbitmq:3.12-management

### 验证
1. RabbitMQ 管理界面：`http://服务器IP:15672`，示例：http://localhost:15672/
2. Nacos 控制台：`http://服务器IP:8848/nacos`，示例：http://localhost:8848/nacos/
3. MySQL 连接验证：mysql -h 服务器IP -P 3306 -uroot -proot
4. Redis 连接验证：docker exec redis redis-cli -a yourpassword info server

## 卸载
运行 uninstall.sh 一键停止服务并卸载本地挂载文件。
``` bash
 bash uninstall.sh                     
```