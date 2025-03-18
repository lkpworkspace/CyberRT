# 构建cyberrt
```sh
sudo apt update
sudo apt install -y wget libcurl4-openssl-dev autoconf automake libtool g++ pkg-config uuid-dev libncurses5-dev python3-dev python3-pip libeigen3-dev libtiff-dev libsqlite3-dev sqlite3
python3 -m pip install protobuf==3.14.0

python3 install.py

cmake -S . -B build \
    -DCMAKE_PREFIX_PATH=${PWD}/install \
    -DCMAKE_INSTALL_PREFIX=${PWD}/install
cmake \
    --build build -j --config Release --target install
```