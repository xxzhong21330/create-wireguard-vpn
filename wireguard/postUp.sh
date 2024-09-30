# open ip forward
echo 1 > /proc/sys/net/ipv4/ip_forward

# 创建表
nft 'add table ip filter'
nft 'add table ip nat'

# 创建链
nft 'add chain ip filter forward { type filter hook forward priority 0; }'
nft 'add chain ip nat postrouting { type nat hook postrouting priority 100; }'

# 添加规则
nft add 'rule ip filter forward iif wg0 accept'
nft add 'rule ip nat postrouting oif eth0 masquerade'
