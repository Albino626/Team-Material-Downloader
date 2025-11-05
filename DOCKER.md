# Docker 部署指南

本指南介绍如何使用 Docker 部署团队素材下载工具。

## 📋 前置要求

- Docker >= 20.10
- Docker Compose >= 2.0（可选，推荐使用）

## 🚀 快速开始

### 方法一：使用 Docker Compose（推荐）

1. **克隆或下载项目**
   ```bash
   git clone <repository-url>
   cd material-downloader
   ```

2. **启动服务**
   ```bash
   docker-compose up -d
   ```

3. **查看日志**
   ```bash
   docker-compose logs -f
   ```

4. **停止服务**
   ```bash
   docker-compose down
   ```

### 方法二：使用 Docker 命令

1. **构建镜像**
   ```bash
   docker build -t material-downloader .
   ```

2. **运行容器**
   ```bash
   docker run -d \
     --name material-downloader \
     -p 3000:3000 \
     -v $(pwd)/downloads:/app/Downloads \
     -v $(pwd)/browser-data:/app/browser-data \
     -v $(pwd)/config:/app \
     --restart unless-stopped \
     material-downloader
   ```

## ⚙️ 配置说明

### 环境变量

可以通过环境变量自定义配置：

```yaml
environment:
  - PORT=3000              # 服务端口
  - HOST=0.0.0.0          # 监听地址
  - DOWNLOADS_PATH=/app/Downloads  # 下载目录
```

### 数据持久化

Docker Compose 配置会自动创建以下目录并持久化数据：

- `./downloads` - 下载文件存储目录
- `./browser-data` - 浏览器数据（保存登录状态）
- `./config` - 配置文件目录

### 端口配置

默认端口为 `3000`，如需修改：

```yaml
ports:
  - "8080:3000"  # 将主机端口8080映射到容器端口3000
```

## 🔧 高级配置

### 资源限制

在 `docker-compose.yml` 中可以配置资源限制：

```yaml
deploy:
  resources:
    limits:
      cpus: '2.0'
      memory: 4G
    reservations:
      cpus: '1.0'
      memory: 2G
```

### 健康检查

容器包含健康检查配置，可以通过以下命令查看：

```bash
docker ps  # 查看容器状态
docker inspect material-downloader | grep Health
```

## 📦 数据管理

### 查看下载文件

```bash
ls -lh downloads/
```

### 备份数据

```bash
# 备份下载目录
tar -czf downloads-backup.tar.gz downloads/

# 备份浏览器数据（包含登录状态）
tar -czf browser-data-backup.tar.gz browser-data/

# 备份配置
tar -czf config-backup.tar.gz config/
```

### 清理数据

```bash
# 清理下载文件（保留目录结构）
rm -rf downloads/*

# 清理浏览器数据（需要重新登录）
rm -rf browser-data/*
```

## 🐛 故障排查

### 查看容器日志

```bash
# Docker Compose
docker-compose logs -f material-downloader

# Docker 命令
docker logs -f material-downloader
```

### 进入容器调试

```bash
docker exec -it material-downloader /bin/bash
```

### 检查容器状态

```bash
docker ps -a | grep material-downloader
```

### 重启容器

```bash
# Docker Compose
docker-compose restart

# Docker 命令
docker restart material-downloader
```

### 常见问题

#### 1. 容器无法启动

- 检查端口是否被占用：`netstat -tulpn | grep 3000`
- 检查 Docker 日志：`docker logs material-downloader`
- 检查资源限制是否足够（内存至少 2GB）

#### 2. 浏览器启动失败

- 确保有足够的系统资源（内存、CPU）
- 检查 Docker 资源限制设置
- 查看容器日志中的错误信息

#### 3. 无法访问服务

- 检查防火墙设置
- 确认端口映射正确：`docker ps` 查看端口映射
- 检查容器是否正常运行：`docker ps`

#### 4. 登录状态丢失

- 确保 `browser-data` 目录已正确挂载
- 检查目录权限：`ls -la browser-data/`
- 重新登录后检查数据是否保存

## 🔄 更新镜像

```bash
# 停止容器
docker-compose down

# 重新构建镜像
docker-compose build --no-cache

# 启动新容器
docker-compose up -d
```

## 🌐 生产环境部署

### 使用反向代理（Nginx）

```nginx
server {
    listen 80;
    server_name your-domain.com;

    location / {
        proxy_pass http://localhost:3000;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}
```

### 使用 HTTPS

建议使用 Nginx 或 Traefik 作为反向代理，配置 SSL 证书。

## 📊 监控

### 查看资源使用

```bash
docker stats material-downloader
```

### 查看容器信息

```bash
docker inspect material-downloader
```

## 🔐 安全建议

1. **不要暴露管理端口到公网**
   - 使用反向代理配置访问控制
   - 配置防火墙规则

2. **定期更新镜像**
   ```bash
   docker pull node:18-slim
   docker-compose build --no-cache
   ```

3. **限制资源使用**
   - 在 docker-compose.yml 中配置资源限制
   - 监控容器资源使用情况

4. **数据备份**
   - 定期备份重要数据
   - 使用版本控制管理配置

## 📝 注意事项

1. **首次启动较慢**：Puppeteer 需要下载 Chromium，首次启动可能需要几分钟
2. **内存需求**：建议至少 2GB 内存，推荐 4GB 以上
3. **磁盘空间**：确保有足够的磁盘空间存储下载文件和浏览器数据
4. **网络连接**：确保容器可以访问目标网站（huaban.com、51yuansu.com 等）

## 🆘 获取帮助

如遇问题，请查看：
- [README.md](README.md) - 完整使用文档
- [DISCLAIMER.md](DISCLAIMER.md) - 免责声明
- GitHub Issues - 提交问题或反馈

---

**最后更新**：2025-01-XX

