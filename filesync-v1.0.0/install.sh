#!/bin/sh

curdir=`pwd`

clear
echo
echo -e "\033[1m\033[31m----------------------------------欢 迎 您 使 用 filesync v1.0.0------------------------------------"
echo -e "\033[0m----------------------------------WELCOME TO USE filesync v1.0.0------------------------------------"
echo -e "\033[1m\033[33m------------如果你在使用的过程中有任务问题，可以通过filesync_maintain@163.com邮箱进行反馈-----------"
echo -e "\033[0m------------If you have any questions, you can contact filesync_maintain@163.com by email-----------"
echo -e "\033[1m\033[33m--------------如果你期望获取软件许可，请将序列号通过邮箱发送至filesync_license@163.com--------------"
echo -e "\033[0mIf you wish to obtain a software license, please email the serial number to filesync_license@163.com."
echo -e "\033[1m\033[31m------------------------Copyright 2018-2019 WuNanhui. All rights reserved.--------------------------"
echo -e "\033[0m"
##
##  linux内核检查
##
confirm=""
echo -e "\033[1m\033[31m 显示系统内核版本\033[0m  (Dispory system kernel version)"
printf " \033[1m\033[35m"
uname -an
echo -e "\033[1m\033[31m 请确认系统内核版本 >= 2.6.13\033[0m  (Please confirm the system kernel version >= 2.6.13)"
printf " Confirm [yes/no]:"
read confirm
if [ "x$confirm" != "xyes" ] && [ "x$confirm" != "xy" ] && [ "x$confirm" != "xY" ] ; then
	exit 0
fi
echo ""
##
##  g++版本检查
##
confirm=""
echo -e "\033[0m 如果需要升级g++版本,请参考 https://jingyan.baidu.com/article/15622f2435355dfdfcbea595.html, 或者通过邮箱filesync_mailtain@126.com寻求协助"
echo -e "\033[0m (If you need to upgrade  g++ version, please refer to https://jingyan.baidu.com/article/15622f2435355dfdfcbea595.html, Or ask for assistance at filesync_mailtain@126.com)"
echo -e "\033[1m\033[31m 显示g++版本\033[0m  (Dispory g++ version)"
printf " \033[1m\033[35m"
g++ --version | awk 'NR==1'
echo -e "\033[1m\033[31m 请确认g++版本 >= 4.8\033[0m  (Please confirm the g++ version >= 4.8)"
printf " Confirm [yes/no]:"
read confirm
if [ "x$confirm" != "xyes" ] && [ "x$confirm" != "xy" ] && [ "x$confirm" != "xY" ] ; then
	exit 0
fi
echo ""
##
##  选择安装目录
##
confirm=""
dstdir="/usr/local/filesync"
echo -e "\033[1m\033[31m 请输入要安装的目标目录,默认:$dstdir\033[0m  (Destination dir to install,default:$dstdir)"
printf " input:"
read v
if [ "x$v" != "x" ]; then
	dstdir=$v
fi

if [ -d "$dstdir" ]; then
	echo -e "\033[1m\033[31m $dstdir已经存在,现有文件将被覆盖\033[0m  ($dstdir already exists. Existing files will be overridden!)"
	printf " Confirm [yes/no]:"
	read confirm
	if [ "x$confirm" != "xyes" ] && [ "x$confirm" != "xy" ] && [ "x$confirm" != "xY" ] ; then
		exit 0
	fi
else
	mkdir -p "$dstdir"
fi

if [ ! -d "$dstdir" ]; then
    echo "Fail to create dir $dstdir"
    exit 1
fi

##
##  开始安装
##
srcdir="$curdir/builtsrc"
cp -f "$srcdir/filesync" "$dstdir/filesync"
cp -f "$srcdir/filesync.conf" "$dstdir/filesync.conf"
cp -f "$srcdir/filesync使用手册.CHM" "$dstdir/filesync使用手册.CHM"
rm -rf "/usr/bin/filesync"
ln -s "$dstdir/filesync" "/usr/bin/"

echo -e "\033[1m\033[31m filesync 安装成功\033[0m  (filesync install ok!)"
sleep 3

$dstdir/filesync
