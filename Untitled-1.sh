#!/bin/bash

echo "如果你想在国内免费访问 'https://pixiv.net',那么你不得不运行这个脚本。"
echo "请仔细阅读README.md文件"

killall apache2
sudo apt-get install nginx
systemctl stop nginx

echo "下载必要组件..."
mkdir /usr/pixiv
wget https://ghproxy.com/https://raw.githubusercontent.com/LemonFan-maker/PIXIV-CN/master/hosts -P /usr/pixiv
wget https://ghproxy.com/https://raw.githubusercontent.com/LemonFan-maker/PIXIV-CN/master/ca.cer -P /usr/pixiv
wget https://ghproxy.com/https://raw.githubusercontent.com/LemonFan-maker/PIXIV-CN/master/nginx.conf -P /usr/pixiv
wget https://ghproxy.com/https://raw.githubusercontent.com/LemonFan-maker/PIXIV-CN/master/ca/pixiv.net.crt -P /usr/pixiv
wget https://ghproxy.com/https://raw.githubusercontent.com/LemonFan-maker/PIXIV-CN/master/ca/pixiv.net.key -P /usr/pixiv

echo "复制必要组件..." 
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bak
rm /etc/nginx/nginx.conf
cp /usr/pixiv/nginx.conf /etc/nginx/
mkdir /etc/nginx/ca
cp /usr/pixiv/pixiv.net.key /etc/nginx/ca
cp /usr/pixiv/pixiv.net.crt /etc/nginx/ca
echo "添加hosts中..."
cp /etc/hosts /etc/hosts.bak
cp /usr/pixiv/hosts /etc/
echo "#UTF-8 encoded  #www.google.com域名仅用于登陆验证  127.0.0.1       www.google.com  #Pixiv Start 127.0.0.1       pixiv.net  127.0.0.1       www.pixiv.net  127.0.0.1       ssl.pixiv.net 127.0.0.1       accounts.pixiv.net  127.0.0.1       touch.pixiv.net 127.0.0.1       oauth.secure.pixiv.net 127.0.0.1       dic.pixiv.net 127.0.0.1       en-dic.pixiv.net  127.0.0.1       sketch.pixiv.net 127.0.0.1       payment.pixiv.net 127.0.0.1       factory.pixiv.net  127.0.0.1       comic.pixiv.net   127.0.0.1       novel.pixiv.net  127.0.0.1       imgaz.pixiv.net  127.0.0.1       sensei.pixiv.net 127.0.0.1       fanbox.pixiv.net 127.0.0.1       source.pixiv.net 127.0.0.1       i1.pixiv.net  127.0.0.1       i2.pixiv.net  127.0.0.1       i3.pixiv.net  127.0.0.1       i4.pixiv.net 127.0.0.1       hls1.pixivsketch.net 127.0.0.1       hls2.pixivsketch.net 127.0.0.1       hls3.pixivsketch.net 127.0.0.1       hls4.pixivsketch.net 127.0.0.1       hls5.pixivsketch.net 127.0.0.1       hls6.pixivsketch.net 127.0.0.1       hls7.pixivsketch.net 127.0.0.1       hls8.pixivsketch.net 127.0.0.1       hls9.pixivsketch.net 127.0.0.1       hls10.pixivsketch.net 127.0.0.1       hls11.pixivsketch.net 127.0.0.1       hls12.pixivsketch.net 127.0.0.1       hls13.pixivsketch.net 127.0.0.1       hls14.pixivsketch.net 127.0.0.1       hls15.pixivsketch.net 127.0.0.1       hls16.pixivsketch.net 127.0.0.1       hls17.pixivsketch.net 127.0.0.1       hls18.pixivsketch.net 127.0.0.1       hls19.pixivsketch.net 127.0.0.1       hls20.pixivsketch.net 127.0.0.1       hlsa1.pixivsketch.net 127.0.0.1       hlsa2.pixivsketch.net 127.0.0.1       hlsa3.pixivsketch.net 127.0.0.1       hlsa4.pixivsketch.net 127.0.0.1       hlsa5.pixivsketch.net 127.0.0.1       hlsa6.pixivsketch.net 127.0.0.1       hlsa7.pixivsketch.net 127.0.0.1       hlsa8.pixivsketch.net 127.0.0.1       hlsa10.pixivsketch.net 127.0.0.1       hlsa11.pixivsketch.net 127.0.0.1       hlsa12.pixivsketch.net 127.0.0.1       hlsa13.pixivsketch.net 127.0.0.1       hlsa14.pixivsketch.net 127.0.0.1       hlsa15.pixivsketch.net 127.0.0.1       hlsa16.pixivsketch.net 127.0.0.1       hlsa17.pixivsketch.net 127.0.0.1       hlsa18.pixivsketch.net 127.0.0.1       hlsa19.pixivsketch.net 127.0.0.1       hlsc1.pixivsketch.net 127.0.0.1       hlsc2.pixivsketch.net 127.0.0.1       hlsc3.pixivsketch.net 127.0.0.1       hlsc4.pixivsketch.net 127.0.0.1       hlsc5.pixivsketch.net 127.0.0.1       hlsc6.pixivsketch.net 127.0.0.1       hlse1.pixivsketch.net 127.0.0.1       hlse2.pixivsketch.net 127.0.0.1       hlse3.pixivsketch.net 127.0.0.1       hlse4.pixivsketch.net 127.0.0.1       hlse5.pixivsketch.net 127.0.0.1       hlse6.pixivsketch.net 127.0.0.1       hlse7.pixivsketch.net 127.0.0.1       hlse8.pixivsketch.net 127.0.0.1       hlse9.pixivsketch.net 127.0.0.1       hlst1.pixivsketch.net 127.0.0.1       i.pximg.net 127.0.0.1       app-api.pixiv.net   13.226.113.16    g-client-proxy.pixiv.net  210.140.131.159 d.pixiv.org  210.140.92.140  pixiv.pximg.net   210.140.92.139  s.pximg.net 210.140.131.246  api.booth.pm 210.140.131.220  myaccount.pixiv.net #Pixiv End" >> /etc/hosts
systemctl start nginx
echo"!!!注意!!!请打开Firefox浏览器，添加证书否则访问报错。证书目录:\usr\pixiv\ca.cer"

