#!/bin/bash
# deploy-config.sh

# clean hammerspoon config directory
rm -r ~/.hammerspoon/* 2> /dev/null
# copy repository dir to main dir
cp -R `ls . | grep -v ${0##*/}` ~/.hammerspoon

# reload 도 하고싶은데, 몇 가지 문제 있음
## 1. hs console 에서 hs.ipc.cliInstall() 를 먼저 실행해야 함. zsh에서 바로 실행하는 방법을 모르겠음.
## 2. hs.ipc.cliInstall() 을 하고 hs.reload() 를 하면, MessagePort 가 끊겼다는 말이 나옴. 1을 해결할 수 없음
# hs.ipc.cliInstall() << EOF
#     hs -c "hs.reload()"
# EOF