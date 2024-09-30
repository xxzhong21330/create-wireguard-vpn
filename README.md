# create-wireguard-vpn
在 debian 12 部署 [wireguard](https://www.wireguard.com/) vpn

## 解决问题
海外用户访问微信音乐（或其他中国大陆音乐软件）时，由于地区版权限制无法播放，所以需要vpn绕过地区限制

## 环境准备
* 中国大陆境内服务器一台（腾讯云、阿里云等云服务器）

## 操作步骤
* 登录远程服务器 (例如： ssh，需提前配置好公钥)  
  `ssh <your userName>@<your IP address>`


* 安装 wireguard（debian）  
  `apt install wireguard`


* 创建公钥和私钥  
  `cd /etc/wireguard`  
  `umask 077; wg genkey | tee privatekey | wg pubkey > publickey`


* 创建配置文件  
  * `vim postUp.sh` 并粘入 [postUp.sh](wireguard%2FpostUp.sh) 中的配置
  * `vim postDown.sh` 并粘入 [postDown.sh](wireguard%2FpostDown.sh) 中的配置
  * `vim wg0.conf` 并粘入 [wg0.conf](wireguard%2Fwg0.conf) 中的配置并修改


* 启动 wireguard    
    `wg-quick up wg0`  


* 确认使用端口不被防火墙屏蔽（不止服务器的防火墙，还有云服务的防火墙）  


*  下载对应的 wireguard 客户端并配置
