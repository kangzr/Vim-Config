### Windows Subsystem for Linux (WSL)

**可用版本**：Windows 10 2004**版本及以上:

**更新**：

- 主要目标是提高文件系统性能并增加完全的系统调用兼容性。对基础体系结构进行了重构，使用虚拟化技术和Linux内核来实现其新功能。[开源](https://github.com/microsoft/WSL2-Linux-Kernel)

- 彻底重构wsl1，速度比wsl1快20%
- 支持原生Docker安装，启动(相当于完整的Linux系统、虚拟机运行)；(win10桌面版docker启动一分钟左右，wsl2秒开)
- win10文件管理器可访问Linux系统文件
- 使用最新，最强大的虚拟化技术在轻量级使用程序虚拟机VM中运行其Linux内核。
- 文件密集型操作（例如，`git clone, npm install, apt update, apt upgrade`）等速度提升明显。
- ifconfig， route -n , cat /etc/resolv.conf 等网络相关指令可用，wsl2中有IP地址

**升级方式**：(WSL1升级至2)

1. 启动虚拟机平台可选组件, 管理员权限打开powershell，执行`dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`，开启后重启机器
2. [下载Linux内核更新包](https://docs.microsoft.com/zh-cn/windows/wsl/wsl2-kernel)
3. `wsl ---set-version Ubuntu-18.04 2`  (默认体系设置`wsl --set-default-verion 2`)
4. 查看`wsl -l -v`

