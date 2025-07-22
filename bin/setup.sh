# https://7-zip.org/a/7z2500-linux-x64.tar.xz
cd $HOME/bin/
wget https://7-zip.org/a/7z2500-linux-x64.tar.xz
mkdir 7z2500-linux-x64
tar -xf 7z2500-linux-x64.tar.xz -C 7z2500-linux-x64
ln -s -f 7z2500-linux-x64/7zz
rm 7z2500-linux-x64.tar.xz
