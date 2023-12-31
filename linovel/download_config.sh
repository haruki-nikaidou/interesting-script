#!/bin/bash

git clone https://github.com/lightnovel-center/linovelib2epub.git

cd "linovelib2epub" || exit 1
python3 -m venv venv
source ./venv/bin/activate
pip install -r requirements.txt
pip install -e .

pushd "src" || exit 1
wget -O "download.py" "https://raw.githubusercontent.com/haruki-nikaidou/interesting-script/main/linovel/download.py"

echo "==========================="
echo "准备完成，请修改 src/download.py"
echo "==========================="
echo "修改对应参数后，在src目录运行以下命令"
echo "source ../venv/bin/activate"
echo "python3 download.py"