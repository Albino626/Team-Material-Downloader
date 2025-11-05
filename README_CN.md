# 团队素材下载工具 v1.0.0

[English](README.md) | 中文

## ⚠️ 首次使用必读

**启动服务器前，请先安装依赖！**

## 📖 功能特性

- ✅ **多站点支持** - 花瓣网、觅元素、90设计、享设计四大设计素材网站
- 👥 **团队共享** - 管理员集中登录，团队成员共享下载权限
- 🚀 **一键下载** - 自动解析素材链接，快速下载
- 📊 **配额显示** - 实时显示各站点下载配额状态
- 🔐 **安全可靠** - 管理员密码保护，权限分离
- 🐳 **Docker支持** - 一键部署，简单快速

## 🚀 快速开始

### 方式一：Docker 部署（推荐）

最简单的部署方式，适合所有操作系统。

```bash
# 1. 克隆项目
git clone <repository-url>
cd material-downloader

# 2. 启动服务
docker-compose up -d

# 3. 查看日志
docker-compose logs -f
```

详细说明请查看：[DOCKER.md](DOCKER.md)

### 方式二：本地部署

```bash
cd server
npm install
node server-browser.js
```

### 方式三：远程服务器部署

支持 Linux 和 Windows 服务器，详见：[远程服务器部署指南.md](远程服务器部署指南.md)

## ⚠️ 免责声明

**重要**：使用本工具前，请务必阅读 [免责声明](DISCLAIMER.md)。

本工具仅供学习和研究使用，作者不对使用本工具造成的任何损失承担责任。

## 📄 许可证

本项目采用 [MIT License](LICENSE) 开源许可证。

## 🤝 贡献

欢迎提交 Issue 和 Pull Request！

---

**祝您使用愉快！** 🎉

