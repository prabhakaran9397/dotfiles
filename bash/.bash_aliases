alias ls='ls -aF --color=auto'
alias ll='ls -althF'
alias alert='notify-send -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

alias apt-all="sudo apt update && sudo apt upgrade && sudo apt-get autoremove && sudo apt-get autoclean" 
alias tor="~/Tor/Browser/start-tor-browser --detach"
alias html2pdf="wkhtmltopdf"
alias marp="~/Marp/Marp"
alias power='echo "`cat /sys/class/power_supply/BAT0/energy_now` * 100 / `cat /sys/class/power_supply/BAT0/energy_full`" | bc'
alias c="gcc -x c - && echo '\n\n' && ./a.out; rm -f ./a.out"
alias vpn="sudo openvpn --config ~/VPN/laptop.ovpn"
alias matrix="tr -c '0-9a-z[]{}' ' ' < /dev/urandom | dd cbs=171 conv=unblock | GREP_COLOR='1;32' grep --color '[^ ]'"

alias socks_status='ps aux | grep fqCN | grep -v grep > /dev/null && echo "socks5 running in $(ps aux | grep fqCN | grep -v grep | awk "{print \$2}")"'
alias socks_start="ssh root@pk9397.co -p 443 -D 8000 -fqCN && socks_status"
alias socks_stop='kill -9 $(ps aux | grep fqCN | grep -v grep | awk "{print \$2}") && echo "socks5 stopped"'
