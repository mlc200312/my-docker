#!/bin/bash
# filename: install.sh
# 描述：一键部署开发环境容器服务（包含RabbitMQ、MySQL、Redis、Nacos）
# 版本：1.1.0
# 作者：Min
# 最后更新：2025-08-29

#######################################
# 初始化数据目录结构
# 参数说明：
#   -p 确保目录存在，不存在则创建
#   目录结构说明：
#     ./data/mysql/init       MySQL初始化脚本
#     ./data/redis/conf       Redis配置文件
#######################################
echo "正在创建数据目录结构..."
mkdir -p ./{data/mysql/init,data/redis/conf}

#######################################
# 拷贝配置文件
# 功能说明：
#   1. 拷贝MySQL初始化脚本
#   2. 拷贝Redis配置文件
# 错误处理：
#   - 检查源文件是否存在
#   - 记录拷贝操作结果
#######################################
echo "正在拷贝配置文件..."

# 检查并拷贝MySQL初始化脚本
if [ -f "conf/init.sql" ]; then
    echo "拷贝MySQL初始化脚本: conf/init.sql -> ./data/mysql/init/"
    cp -v conf/init.sql ./data/mysql/init/
else
    echo "警告：未找到MySQL初始化脚本 conf/init.sql"
fi

# 检查并拷贝Redis配置文件
if [ -f "conf/redis.conf" ]; then
    echo "拷贝Redis配置文件: conf/redis.conf -> ./data/redis/conf/"
    cp -v conf/redis.conf ./data/redis/conf/
else
    echo "警告：未找到Redis配置文件 conf/redis.conf"
fi

#######################################
# 容器服务管理
# 执行步骤：
#   1. 停止并删除现有容器（-v同时删除卷）
#   2. 重新构建并启动容器（-d后台运行）
# 注意事项：
#   - 确保docker-compose.yml文件存在
#   - 需要docker和docker-compose环境
#######################################
echo "正在启动容器服务..."
docker-compose down -v && docker-compose up -d

#######################################
# 服务状态检查
# 输出说明：
#   显示各容器运行状态
#   返回0表示成功，非0表示失败
#######################################
echo -e "\n容器服务状态："
docker-compose ps

exit $?