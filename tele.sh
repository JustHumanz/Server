#!/bin/sh
date="$(date "+%F %T")"
if [ -n "$SSH_CLIENT" ] ; then
	ip_address=$(echo $SSH_CLIENT | awk '{print $1}')
	
	reverse_dns=`dig -x $ip_address +short`
	
	if [ -z "$reverse_dns" ] ; then
		reverse_dns=$ip_address
	fi
        curl -s "https://api.telegram.org/<<Your Token>>/sendMessage?chat_id=<<your chat id>>&text=(Server 2) Niichan "$USER"@"$(hostname)" login via ssh $ip_address $date " > /dev/null 2>&1
        curl -s "https://api.telegram.org/<<Your Token>>/sendSticker?chat_id=<<your chat id>>&sticker=CAADBQADIwADTesNF3ympoOPmJhYAg" > /dev/null 2>&1
fi
