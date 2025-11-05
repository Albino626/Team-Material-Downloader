// uTools预加载脚本
// 由于共享浏览器方案使用WebSocket连接服务器，客户端无需Node.js功能
// 此文件保留为空，仅用于满足uTools的preload配置要求

console.log('[共享浏览器] 预加载脚本已加载');

// 暴露utools API（如果需要）
if (typeof window !== 'undefined') {
    console.log('[共享浏览器] 运行环境已就绪');
}

