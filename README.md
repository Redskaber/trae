# Trae AI IDE for NixOS / Nix

自动从官方 API 获取最新版本并生成可重现的 Nix 包。

## 快速开始

```bash
# 更新到最新版本（自动下载 deb 并更新 sources.nix）
nix run .#update-sources

# 构建当前配置的版本
nix build .#packages.x86_64-linux.default

# 运行
./result/bin/trae

