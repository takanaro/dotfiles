#!/bin/bash -eu

if [ "$(whoami)" != "root" ]; then
  echo "Require root privilege"
  exit 1
fi

# すでにChromeがインストールされている場合はスキップ
if [ ! -e /etc/apt/sources.list.d/google-chrome.list ]; then
  echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >>/etc/apt/sources.list.d/google.list
  wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
fi

apt update && apt install -y google-chrome-stable python3-pip
chrome_version=$(google-chrome --version | perl -pe 's/([^0-9]+)([0-9]+\.[0-9]+).+/$2/g')

pip3 install selenium chromedriver-binary~=${chrome_version}
pip3 install gspread oauth2client

# chrome上でスクリーンショットを利用するために必要
apt install -y fonts-ipafont-gothic --no-install-recommends
