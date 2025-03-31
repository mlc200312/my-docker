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
- rabbitmq:3.12-management
- redis:7.0.12
- mysql:8.0.32
- nacos/nacos-server:v2.5.1

### 验证
- RabbitMQ 管理界面：`http://服务器IP:15672`
```bash
curl http://localhost:15672/
```
- Redis 连接验证：
```bash
# 示例（容器名为 my_redis）
docker exec -it redis redis-cli --user default --pass root
```
- Nacos 控制台：`http://服务器IP:8848/nacos`
```bash
curl http://localhost:8848/nacos/
```
- MySQL 连接验证：mysql -h 服务器IP -P 3306 -uroot -proot
```bash
docker exec -it mysql mysql -h localhost -p -uroot -proot
```

## 卸载
运行 uninstall.sh 一键停止服务并卸载本地挂载文件。
``` bash
 bash uninstall.sh                     
```