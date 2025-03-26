#!/bin/bash
# filename: uninstall.sh
# 描述：一键卸载开发环境容器服务

docker-compose down -v

# 创建目录结构（已存在不会报错）
rm -rf ./{mysql,redis,nacos,rabbitmq}