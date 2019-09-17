# linux

## information

- linux 方向

[到什么程度才叫精通Linux]https://www.zhihu.com/question/23834032/answer/695582133


## ref

[Linux就该这么学](https://www.linuxprobe.com/chapter-00.html)

[Linux-tutorial_runoob](https://www.runoob.com/linux/linux-tutorial.html)

[Linux command_zh](https://man.linuxde.net/)

[Linux和shell回炉复习](https://www.cnblogs.com/f-ck-need-u/p/7048359.html)

- booklist

<Linux从入门到精通>

<鸟哥的Linux私房菜>  
[鸟哥的Linux私房菜简体首页](https://link.zhihu.com/?target=http%3A//cn.linux.vbird.org/)

<Linux命令行与shell脚本编程大全(第3版)>

其他书单: https://www.zhihu.com/question/36869538



## install

### windows linux 双系统

Disk arrangement:
```bash
120G
  |-50G     # windows ntfs
  |-500M    # linux /boot ext4
  |-30G     # linux /     ext4
  |-8G      # linux swap  swap
500G
  |-30G     # linux /home ext4
  |-xxG     # windows disk D
  |-xxG     # windows disk E
```

![](../pics/190916-175234.png)

1. BIOS boot model
2. install win7
3. install linux
   
   a. 引导位置

   ![](../pics/190916-172920.png)


## vi/vim

[vim简明教程](https://www.cnblogs.com/harry335/p/5886405.html)

[vim 操作命令大全](https://blog.csdn.net/weixin_37657720/article/details/80645991)

[史上最全Vim快捷键键位图 — 入门到进阶](https://www.runoob.com/w3cnote/all-vim-cheatsheat.html)

[vim/vi 如何高效使用(键盘图打印版)](https://blog.csdn.net/zhlh_xt/article/details/52458672)



三种模式:



command mode 命令

用户刚刚启动 vi/vim，便进入了命令模式。

此状态下敲击键盘动作会被Vim识别为命令，而非输入字符。



insert mode 输入

在命令模式下按下i就进入了输入模式。

ESC，退出输入模式，切换到命令模式



last line mode 底线命令

在命令模式下按下:（英文冒号）就进入了底线命令模式。

底线命令模式可以输入单个或多个字符的命令，可用的命令非常多。

在底线命令模式中，基本的命令有（已经省略了冒号）：

q 退出程序
w 保存文件
按ESC键可随时退出底线命令模式。



![img](pic/vim-vi-workmodel.png)

![img](pic/078207F0-B204-4464-AAEF-982F45EDDAE9.jpg)



按键说明:

https://www.runoob.com/linux/linux-vim.html

https://www.cnblogs.com/uncle-qi/p/9356465.html

















# ubuntu

## config

    

- hostname 主机名

    https://www.jianshu.com/p/33fd110a0047	

    I only do this, and work:

    ```
    sudo vi /etc/hostname
    ```

- 更新源

    https://blog.csdn.net/xiangxianghehe/article/details/80112149

    https://blog.csdn.net/zhangjiahao14/article/details/80554616

    https://blog.csdn.net/beckeyloveyou/article/details/51352426

    ```bash
    # 备份
    sudo cp /etc/apt/sources.list /etc/apt/sources_init.list
    
    # 更换源
    sudo gedit /etc/apt/sources.list
    
    # 更新源
    sudo apt-get update
    
    # 更新软件
    # sudo apt-get upgrade
    ```

    阿里云:

    **在文件最前面添加**

```
deb http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-security main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-updates main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-proposed main restricted universe multiverse
deb-src http://mirrors.aliyun.com/ubuntu/ bionic-backports main restricted universe multiverse
```


- mac os theme

    [Ubuntu18.04(Gnome)环境，十分钟配置Mac OS主题](https://zhuanlan.zhihu.com/p/71588449)

    https://www.cnblogs.com/feipeng8848/p/8970556.html

    bing: gnome-look
        



# 系统相关

### Linux 桌面系统对比

https://www.lulinux.com/archives/3614

### centOS与windows双系统

> 1. 安装win10
> 1. 安装centOS7

- 添加启动项

    ubuntu: `/boot/grub/grub.cfg`
    centOS: `/boot/grub2/grub.cfg`

    添加:
    ```bash
    menuentry 'Windows 10' {
    insmod ntfs
    set root='hd0,1'
    chainloader +1
    }
    ```
    > 一般来说参见前面的配置.
    > 'hd0,1' 代表第1块硬盘,第一个分区

- 修改默认启动顺序

    默认启动centOS, 要修改成windows的话才做更改.

    ```bash
    # 修改配置
    vim /etc/default/grub

    # 生成启动文件
    sudo update-grub
    ```
### win10 安装 linux 子系统

- turn on the develop option

  ![1536807955940](assets/1536807955940.png)

- turn on the windows function.  

  > win + R
  >
  > `appwiz.cpl`

![1536808036047](assets/1536808036047.png)

- use the `Microsoft Store` install `Ubuntu`

  ![1536884514790](assets/1536884514790.png)

- type `bash` at the startmenu

  ![turn1536884313507](assets/1536884313507.png)

- done.

  ![1536884356209](assets/1536884356209.png)

### centOS换源

```bash
# 查看当前源
yum repolist

# 安装base reop源
cd /etc/yum.repos.d

# 接着备份旧的配置文件
sudo mv CentOS-Base.repo CentOS-Base.repo.bak

# 下载阿里源的文件
sudo wget -O CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo

# 安装epel repo源：
#epel(RHEL 7)
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-7.repo
epel(RHEL 6)
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-6.repo
epel(RHEL 5)
wget -O /etc/yum.repos.d/epel.repo http://mirrors.aliyun.com/repo/epel-5.repo

# 清理缓存
yum clean all

# 重新生成缓存
yum makecache
```

### 安装搜狗输入法

1. 搜狗官网下载 Linux安装包

    ![](assets/2018-09-25-15-53-10.png)

2. 安装

    `sudo dpkg -i sogouXXX.deb`

3. setting language

    ![](assets/2018-09-25-16-05-24.png)
    ![](assets/2018-09-25-16-06-11.png)

4. `reboot`

    > logout do not work

5. config Sogou Pinyin

    ![](assets/2018-09-25-16-09-30.png)
    ![](assets/2018-09-25-16-09-15.png)
    ![](assets/2018-09-25-16-09-59.png)


### ubuntu root 不能登录

1. 修改 root 密码
   
   `sudo passwd root`
   
> 此时终端可以登录

1. 配置 root 直接登录

    /etc/pam.d/gdm-autologin
    ![](assets/2018-09-25-16-35-16.png)

    /etc/pam.d/gpm-password
    ![](assets/2018-09-25-16-35-46.png)

    /root/.profile
    ![](assets/2018-09-25-16-37-10.png)

1. `reboot`

### 键盘不能持续输入

1. 在 ubuntu software 中安装 `keyboard`
   
   ![](assets/2018-09-25-17-14-08.png)

2. reboot

### ubuntu AMD 双显卡

参考:
https://blog.csdn.net/u013480667/article/details/43854487

用`lspci`查看VGA, amd的状态为 (rev ff)

![](assets/2018-09-25-17-16-26.png)


### 屏保

1. settings – power
2. Power Saving
   
    Blank screen : Never


### Mint 楷体问题

1. open `software manager`
2. choose `font`
3. search `ukai`
4. double click it, and click `remove`

## VM Tool

### Ubuntu

https://www.cnblogs.com/DA799422035/p/9058210.html

### CentOS

https://www.linuxidc.com/Linux/2017-05/143323.htm

# 软件安装方法

软件仓库

> 软件仓库，顾名思义就是存放软件包的地方，指的是一个网站或者一个目录，Ubuntu  Linux系统下通过特定的命令就能完成软件包的索引、软件的更新、安装等操作，固定的仓库使得软件更为规范，安装操作步骤更为简单，不类似Windows下的软件，极为散乱，存在各种不安全性。
>
> 主要的软件仓库有：Main、Restricted、Universe、Multiverse这4个。

## apt-get

```bash
apt-get update          #更新安装列表
apt-get upgrade         #升级软件

apt-get install xxx     #安装软件
apt-get remove XXXX　　　#卸载软件（删除软件包）
apt-get autoremove XXXX     #自动卸载软件但保留其配置文件
apt-get autoremove --purge  XXXX        #自动卸载软件其删除其配置文件

apt-get --reinstall install XXXX        #重装同一软件

dpkg --list:罗列已安装软件
```

## .tar.gz

1.首先，使用tar -xzvf来解开这个包，如：
```bash
tar -xvf apache_1_3_6_tar.gz
```
这样就会在当前目录中创建了一个新目录(目录名与.tat.gz包的文件名类似），用来存放解压了的内容。如本例中就是apache_1.3.6

2.进入这个目录，再用ls命令查看一下所包含的文件，如：

```bash
#拟定cd apache_1.3.6
ls
```

你观察一下这个目录中包含了以下哪一个文件：configure、Makefile还是Imake。

如果是configure文件,就执行：
```bash
./configure 
make
make install
```

如果是Makefile文件,就执行：
```bash
make
make install
```

如果是Imake文件,就执行：
```bash
xmkmf
make
make install
```

3.如果没有出现什么错误提示的话，就搞定了。至于软件安装到什么地方，通常会在安装时出现。否则就只能查阅一下README，或者问问我，:-)

如果遇到错误提示，也别急，通常是十分简单的问题：

1）没有安装C或C++编译器；
确诊方法：执行命令gcc（C++则为g++），提示找不到这个命令。
解决方法：将Linux安装光盘mount上来，然后进入RPMS目录，执行命令：

```bash
#rpm -ivh gcc* （哈哈，我们用到了第二种安装方式）

```

2）没有安装make工具；
确诊方法：执行命令make，提示找不到这个命令。
解决方法：将Linux安装光盘mount上来，然后进入RPMS目录，执行命令：
```bash
rpm -ivh make*

```

3）没有安装autoconf工具；
确诊方法：执行命令make，提示找不到这个命令。
解决方法：将Linux安装光盘mount上来，然后进入RPMS目录，执行命令：

```bash
#rpm -ivh autoconf*

```

4）缺少某些链接库；
确诊方法：在make时，提示需要某些文件。
解决方法：安装包含这个文件的包，这就需要积累了。


## .rpm

RPM是Red Hat公司随Redhat Linux推出了一个软件包管理器，通过它能够更加轻松容易地实现软件的安装。

1. 安装软件：执行 `rpm -ivh rpm包名`，如：#rpm -ivh apache-1.3.6.i386.rpm
2. 升级软件：执行 `rpm -Uvh rpm包名`。
3. 反安装：执行 `rpm -e rpm包名`。
4. 查询软件包的详细信息：执行 `rpm -qpi rpm包名`
5. 查询某个文件是属于那个rpm包的：执行 `rpm -qf rpm包名`
6. 查该软件包会向系统里面写入哪些文件：执行 `rpm -qpl rpm包名`

## .deb

Ubuntu软件包格式为deb，

```bash
dpkg -i package.deb	    #安装包
dpkg -r package	        #删除包
dpkg -P package	        #删除包（包括配置文件）
dpkg -L package	        #列出与该包关联的文件
dpkg -l package	        #显示该包的版本
dpkg –unpack package.deb	#解开 deb 包的内容
dpkg -S keyword	        #搜索所属的包内容
dpkg -l	                #列出当前已安装的包
dpkg -c package.deb	    #列出 deb 包的内容
dpkg –configure package	#配置包
```

使用apt-get方法安装的软件，所有下载的deb包都缓存到了/var/cache/apt/archives目录下


## yum

```bash
yum repolist all	        # 列出所有仓库
yum list all	            # 列出仓库中所有软件包
yum info 软件包名称	          # 查看软件包信息
yum install 软件包名称	      # 安装软件包
yum reinstall 软件包名称	  # 重新安装软件包
yum update 软件包名称	      # 升级软件包
yum remove 软件包名称	      # 移除软件包
yum clean all	            # 清除所有仓库缓存
yum check-update	        # 检查可更新的软件包
yum grouplist	            # 查看系统中已经安装的软件包组
yum groupinstall 软件包组	 # 安装指定的软件包组
yum groupremove 软件包组	 # 移除指定的软件包组
yum groupinfo 软件包组	     # 查询指定的软件包组信息

```



## 字体安装

> 作用于整个系统

```bash
# mkdir
mkdir /usr/share/fonts/winFonts

# 复制字体文件到该文件下
cp ...

# 改变字体文件的权限
chmod 644 *.ttf or *.ttc

# 更新系统缓存
sudo mkfontscale  
sudo mkfontdir  
sudo fc-cache -fv  
```

# 配置网卡

```bash
nmtui
```

# SMB | 与windows文件共享

```bash
sudo apt install cifs-utils 
sudo mount -t cifs //ip/文件夹 /mnt/文件夹 -o username=用户名,password=密码,vers=1.0,iocharset=utf8
```







# manjaro

## ref

tks:

https://www.jianshu.com/p/333cf36d0914





## INSTALL

- 分区

    BOOT     2G        ---启动文件

    /              40G      ---manjaro系统安装+程序安装

    SWAP     20G     ---一般为内存2倍，我硬盘富裕，所以给了20g

    /HOME   剩余硬盘  ---个人电脑文件

    

    

    

## 换源

```bash
sudu pacman-mirrors -i -c China -m rank
```

![1567830523791](pic/1567830523791.png)



刷新缓存

```
sudo pacman -Syy
```



添加 ArchLinuxCN 的源，编辑这个文件 /etc/pacman.conf 

在末尾添加:



[archlinuxcn]

SigLevel = Optional TrustedOnly

Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch





