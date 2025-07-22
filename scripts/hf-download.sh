#!/bin/bash

# 颜色定义
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
NC='\033[0m' # No Color

REPO_ID="$1"
BASE_PATH="$HOME/model-hub/huggingface"
LOCAL_DIR="$BASE_PATH/$REPO_ID"
MAX_RETRIES=10

if [ -z "$REPO_ID" ]; then
  echo -e "Usage: $0 <repo_id>"
  exit 1
fi

if [ ! -d "$BASE_PATH" ]; then
  echo -e "${RED}Error: $BASE_PATH does not exist. SMB mount may not be available.${NC}"
  exit 1
fi

mkdir -p "$LOCAL_DIR"

for ((i = 1; i <= MAX_RETRIES; i++)); do
  echo -e "${YELLOW}======================================${NC}"
  echo -e "${YELLOW}Download attempt $i/$MAX_RETRIES...${NC}"
  echo -e "${BLUE}Repository: $REPO_ID${NC}"
  echo -e "${BLUE}Local directory: $LOCAL_DIR${NC}"
  echo -e "${YELLOW}======================================${NC}"

  huggingface-cli download "$REPO_ID" --local-dir "$LOCAL_DIR"
  EXIT_CODE=$?

  if [ $EXIT_CODE -eq 0 ]; then
    echo -e "${GREEN}✓ Download completed successfully.${NC}"
    exit 0
  fi

  echo -e "${RED}✗ Download failed, retrying...${NC}"
  if [ $i -lt $MAX_RETRIES ]; then
    sleep 2
  fi
done

echo -e "${RED}✗ Download failed after $MAX_RETRIES attempts.${NC}"
exit 1
