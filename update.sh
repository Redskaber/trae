#!/usr/bin/env bash
set -euo pipefail

# https://icube-normal.traeapi.us/icube/api/v1/native/version/trae/latest
#
# derivations/trae
# ❯ curl https://icube-normal.traeapi.us/icube/api/v1/native/version/trae/latest | jq
#   % Total    % Received % Xferd  Average Speed  Time    Time    Time   Current
#                                  Dload  Upload  Total   Spent   Left   Speed
# 100   6372 100   6372   0      0   9590      0                              0
# {
#   "success": true,
#   "status": "success",
#   "message": "",
#   "data": {
#     "manifest": {
#       "win32": {
#         "download": [
#           {
#             "region": "cn",
#             "x64": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/win32/Trae-Setup-x64.exe"
#           },
#           {
#             "region": "sg",
#             "x64": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/win32/Trae-Setup-x64.exe"
#           },
#           {
#             "region": "va",
#             "x64": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/win32/Trae-Setup-x64.exe"
#           },
#           {
#             "region": "usttp",
#             "x64": "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/2.3.30128/win32/Trae-Setup-x64.exe"
#           }
#         ],
#         "extra": {
#           "uploadDate": 1779354534749
#         },
#         "version": "2.3.30128"
#       },
#       "linux": {
#         "download": [
#           {
#             "arm64.deb": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.deb",
#             "arm64.rpm": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.rpm",
#             "arm64.tar.gz": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.tar.gz",
#             "region": "cn",
#             "x64.deb": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.deb",
#             "x64.rpm": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.rpm",
#             "x64.tar.gz": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.tar.gz"
#           },
#           {
#             "arm64.deb": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.deb",
#             "arm64.rpm": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.rpm",
#             "arm64.tar.gz": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.tar.gz",
#             "region": "sg",
#             "x64.deb": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.deb",
#             "x64.rpm": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.rpm",
#             "x64.tar.gz": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.tar.gz"
#           },
#           {
#             "arm64.deb": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.deb",
#             "arm64.rpm": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.rpm",
#             "arm64.tar.gz": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.tar.gz",
#             "region": "va",
#             "x64.deb": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.deb",
#             "x64.rpm": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.rpm",
#             "x64.tar.gz": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.tar.gz"
#           },
#           {
#             "arm64.deb": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.deb",
#             "arm64.rpm": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.rpm",
#             "arm64.tar.gz": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-arm64.tar.gz",
#             "region": "usttp",
#             "x64.deb": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.deb",
#             "x64.rpm": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.rpm",
#             "x64.tar.gz": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/linux/Trae-linux-x64.tar.gz"
#           }
#         ],
#         "extra": {
#           "uploadDate": 1779351927780
#         },
#         "version": "2.3.30128"
#       },
#       "darwin": {
#         "download": [
#           {
#             "apple": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-arm64.dmg",
#             "intel": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-x64.dmg",
#             "region": "cn"
#           },
#           {
#             "apple": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-arm64.dmg",
#             "intel": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-x64.dmg",
#             "region": "sg"
#           },
#           {
#             "apple": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-arm64.dmg",
#             "intel": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-x64.dmg",
#             "region": "va"
#           },
#           {
#             "apple": "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-arm64.dmg",
#             "intel": "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/2.3.30128/darwin/Trae-darwin-x64.dmg",
#             "region": "usttp"
#           }
#         ],
#         "extra": {
#           "uploadDate": 1779352070983
#         },
#         "version": "2.3.30128"
#       }
#     },
#     "solo": {
#       "win32": {
#         "download": [
#           {
#             "region": "cn",
#             "x64": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.32253/win32/TRAE_SOLO-Setup-x64.exe"
#           },
#           {
#             "region": "sg",
#             "x64": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.32253/win32/TRAE_SOLO-Setup-x64.exe"
#           },
#           {
#             "region": "va",
#             "x64": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.32253/win32/TRAE_SOLO-Setup-x64.exe"
#           },
#           {
#             "region": "usttp",
#             "x64": "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/2.3.32253/win32/TRAE_SOLO-Setup-x64.exe"
#           }
#         ],
#         "extra": {
#           "uploadDate": 1779864378592
#         },
#         "version": "2.3.32253"
#       },
#       "darwin": {
#         "download": [
#           {
#             "apple": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-arm64.dmg",
#             "intel": "https://lf-cdn.trae.com.cn/obj/trae-com-cn/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-x64.dmg",
#             "region": "cn"
#           },
#           {
#             "apple": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-arm64.dmg",
#             "intel": "https://lf-cdn.trae.ai/obj/trae-ai-sg/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-x64.dmg",
#             "region": "sg"
#           },
#           {
#             "apple": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-arm64.dmg",
#             "intel": "https://lf-cdn.trae.ai/obj/trae-ai-us/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-x64.dmg",
#             "region": "va"
#           },
#           {
#             "apple": "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-arm64.dmg",
#             "intel": "https://lf-static.traecdn.us/obj/trae-ai-tx/pkg/app/releases/stable/2.3.32253/darwin/TRAE_SOLO-darwin-x64.dmg",
#             "region": "usttp"
#           }
#         ],
#         "extra": {
#           "uploadDate": 1779864079027
#         },
#         "version": "2.3.32253"
#       }
#     },
#     "mobile": {
#       "ios": {},
#       "android": {}
#     }
#   },
#   "logId": "20260530204852F796B2AAA5514138448E"
# }
#

API_URL="https://icube-normal.traeapi.us/icube/api/v1/native/version/trae/latest"
REGION="${REGION:-cn}"
SOURCES_FILE="sources.nix"
TMP_DIR=$(mktemp -d)
trap 'rm -rf "$TMP_DIR"' EXIT

echo "Fetching version info from $API_URL ..."
JSON=$(curl -s "$API_URL")

VERSION=$(echo "$JSON" | jq -r '.data.manifest.linux.version')
if [[ -z "$VERSION" || "$VERSION" == "null" ]]; then
  echo "ERROR: Failed to extract version"
  exit 1
fi
echo "Latest version: $VERSION"

declare -A ARCH_MAP=(
  ["x86_64-linux"]="x64.deb"
  ["aarch64-linux"]="arm64.deb"
)

# 找到对应 region 的下载条目
REGION_ENTRY=$(echo "$JSON" | jq -c --arg reg "$REGION" '.data.manifest.linux.download[] | select(.region == $reg)' | head -1)
if [[ -z "$REGION_ENTRY" ]]; then
  echo "ERROR: No download entry for region '$REGION'"
  exit 1
fi

# 生成 sources.nix
{
  echo "{"
  echo "  version = \"$VERSION\";"
  for system in "${!ARCH_MAP[@]}"; do
    arch_key="${ARCH_MAP[$system]}"
    url=$(echo "$REGION_ENTRY" | jq -r --arg key "$arch_key" '.[$key]')
    if [[ -z "$url" || "$url" == "null" ]]; then
      echo "ERROR: Missing $arch_key for $system" >&2
      exit 1
    fi
    echo "  $system = {"
    echo "    url = \"$url\";"
    # 使用 nix-prefetch-url 计算 nix 兼容的 base32 哈希
    sha256=$(nix-prefetch-url "$url")
    echo "    sha256 = \"$sha256\";"
    echo "  };"
  done
  echo "}"
} >"$SOURCES_FILE"

echo "Updated $SOURCES_FILE with version $VERSION"
