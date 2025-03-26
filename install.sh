#!/bin/bash
# filename: install.sh
# 描述：一键部署常用开发环境容器服务

# 创建目录结构（已存在不会报错）
mkdir -p ./{rabbitmq,mysql/conf,mysql/data,mysql/logs,mysql/init,redis/conf,redis/data,redis/logs,nacos/logs,nacos/conf}

# 拷贝 init.sql
cp conf/init.sql ./mysql/init

# 拷贝 redis.conf
cp conf/redis.conf ./redis/conf

# 执行dokcker-compose
docker-compose down -v && docker-compose up -d