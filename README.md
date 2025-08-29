# Docker 开发环境一键部署指南

## 🚀 快速开始

### 先决条件

- 已安装 Docker（版本 28.0.1 或更高）
- 已安装 Docker Compose

### 一键安装

```bash
bash -x install.sh
```

## 📦 包含服务及版本

| 服务       | 版本                  | 管理端口  | 默认账号密码       |
|----------|---------------------|-------|--------------|
| RabbitMQ | 3.12-management     | 15672 | admin/admin  |
| Redis    | 7.0.12              | 6379  | default/root |
| MySQL    | 8.0.32              | 3306  | root/root    |
| Nacos    | nacos-server:v2.5.1 | 8848  | nacos/nacos  |

> 💡 如需修改服务版本，请编辑 `docker-compose.yml` 文件

## 🔍 服务验证指南

### 1. RabbitMQ 管理界面

访问地址：`http://localhost:15672`

```bash
# 命令行验证
curl http://localhost:15672/
```

### 2. Redis 连接测试

```bash
# 进入Redis容器
docker exec -it redis redis-cli --user default --pass root

# 执行测试命令
127.0.0.1:6379> PING
# 应返回 "PONG"
```

### 3. MySQL 连接测试

```bash
# 进入MySQL容器
docker exec -it mysql mysql -uroot -proot

# 执行测试命令
mysql> SHOW DATABASES;
# 应看到 nacos_config 数据库
```

### 4. Nacos 控制台

访问地址：`http://localhost:8848/nacos`

```bash
# 健康检查
curl http://localhost:8848/nacos/health
```

## 📊 监控与管理

### 查看实时日志

```bash
docker-compose logs -f
```

### 服务状态检查

```bash
docker-compose ps
```

### 进入容器内部

```bash
docker exec -it rabbitmq /bin/bash
```

## 🗑️ 卸载指南

```bash
bash uninstall.sh
```

> ⚠️ 注意：此操作将停止所有服务并删除本地挂载文件

## 🆘 常见问题

### Q1: 安装失败怎么办？

1. 检查 Docker 是否正常运行：`docker ps`
2. 查看详细错误日志：`docker-compose logs`
3. 确保端口未被占用（5672, 15672, 6379, 3306, 8848）

### Q2: 如何修改密码？

编辑 `docker-compose.yml` 中对应服务的环境变量：

- RabbitMQ: `RABBITMQ_DEFAULT_USER` 和 `RABBITMQ_DEFAULT_PASS`
- Redis: `REDIS_PASSWORD`
- MySQL: `MYSQL_ROOT_PASSWORD`

### Q3: 数据会丢失吗？

所有数据已配置持久化存储，卸载时需执行 `uninstall.sh` 才会删除数据

## 📚 学习资源

- https://docs.docker.com/
- https://www.rabbitmq.com/management.html
- https://nacos.io/zh-cn/docs/quick-start.html

---

💖 祝您使用愉快！如有问题，请检查日志或查阅相关文档。