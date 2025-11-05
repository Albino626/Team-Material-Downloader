# 使用官方Node.js镜像
FROM node:18-slim

# 设置工作目录
WORKDIR /app

# 安装系统依赖（Puppeteer需要）
RUN apt-get update && apt-get install -y \
    wget \
    gnupg \
    ca-certificates \
    fonts-liberation \
    libasound2 \
    libatk-bridge2.0-0 \
    libatk1.0-0 \
    libatspi2.0-0 \
    libcups2 \
    libdbus-1-3 \
    libdrm2 \
    libgbm1 \
    libgtk-3-0 \
    libnspr4 \
    libnss3 \
    libwayland-client0 \
    libxcomposite1 \
    libxdamage1 \
    libxfixes3 \
    libxkbcommon0 \
    libxrandr2 \
    xdg-utils \
    && rm -rf /var/lib/apt/lists/*

# 复制package文件
COPY server/package*.json ./

# 安装Node.js依赖
RUN npm install --production

# 复制服务器文件
COPY server/server-browser.js ./
COPY server/parsers/ ./parsers/

# 创建下载目录
RUN mkdir -p Downloads

# 设置环境变量
ENV NODE_ENV=production
ENV PORT=3000
ENV HOST=0.0.0.0

# 暴露端口
EXPOSE 3000

# 启动命令
CMD ["node", "server-browser.js"]

