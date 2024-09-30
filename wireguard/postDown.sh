# close ip forward
echo 0 > /proc/sys/net/ipv4/ip_forward

nft delete chain ip filter forward
nft delete chain ip nat postrouting
