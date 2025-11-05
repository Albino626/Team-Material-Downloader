# 贡献指南

感谢您对项目的关注！我们欢迎所有形式的贡献。

## 🚀 如何贡献

### 报告问题

如果发现 bug 或有功能建议，请：

1. 检查 [Issues](https://github.com/your-repo/issues) 中是否已有相关问题
2. 如果没有，请创建新的 Issue，包含：
   - 清晰的问题描述
   - 复现步骤
   - 预期行为 vs 实际行为
   - 环境信息（操作系统、Node.js 版本等）

### 提交代码

1. **Fork 项目**
   ```bash
   git clone https://github.com/your-username/material-downloader.git
   cd material-downloader
   ```

2. **创建分支**
   ```bash
   git checkout -b feature/your-feature-name
   ```

3. **提交更改**
   ```bash
   git add .
   git commit -m "feat: 添加新功能"
   ```

4. **推送并创建 Pull Request**
   ```bash
   git push origin feature/your-feature-name
   ```

### 代码规范

- 使用有意义的变量和函数名
- 添加必要的注释
- 遵循现有代码风格
- 确保代码可以通过测试

### 提交信息规范

使用清晰的提交信息：

- `feat:` 新功能
- `fix:` 修复 bug
- `docs:` 文档更新
- `style:` 代码格式调整
- `refactor:` 代码重构
- `test:` 测试相关
- `chore:` 构建/工具相关

示例：
```
feat: 添加Docker支持
fix: 修复登录状态检测问题
docs: 更新README部署说明
```

## 📝 开发指南

### 本地开发环境

1. **安装依赖**
   ```bash
   cd server
   npm install
   ```

2. **启动开发服务器**
   ```bash
   node server-browser.js
   ```

3. **测试**
   - 确保所有功能正常工作
   - 测试不同操作系统的兼容性

### 代码结构

```
server/
├── server-browser.js    # 主服务器文件
└── parsers/             # 解析器模块
    ├── base.js         # 基础解析器
    ├── yuansu.js       # 觅元素解析器
    ├── 90sheji.js      # 90设计解析器
    └── design006.js    # 享设计解析器
```

## 🎯 贡献方向

我们特别欢迎以下方面的贡献：

- 🐛 Bug 修复
- ✨ 新功能开发
- 📚 文档改进
- 🎨 UI/UX 优化
- ⚡ 性能优化
- 🔒 安全改进
- 🌐 多语言支持
- 🧪 测试用例

## 📋 Pull Request 检查清单

在提交 PR 前，请确保：

- [ ] 代码遵循项目规范
- [ ] 已测试所有功能
- [ ] 更新了相关文档
- [ ] 提交信息清晰明确
- [ ] 没有引入新的警告或错误
- [ ] 已阅读并同意 [LICENSE](LICENSE)

## 🤝 行为准则

- 保持友好和尊重
- 接受建设性批评
- 专注于对项目最有利的事情
- 尊重不同的观点和经验

## 📞 联系

如有问题，请通过以下方式联系：

- 提交 Issue
- 创建 Discussion
- 发送邮件

---

感谢您的贡献！🎉

