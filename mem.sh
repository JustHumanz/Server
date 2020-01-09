#!/usr/bin/env bash

#free=$(free -mt | grep Total | awk '{print $4}')
now=$(date +'%D %T')
logg="/var/log/costume_script.log"
#lo=$(systemctl is-active mariadb)
#lo1=$(systemctl is-active nginx)
#lo2=$(systemctl is-active httpd)
function memmm() {
  ## check if free memory is less or equals to  100MB
  if [[ $(free -mt | grep Total | awk '{print $4}') -le 100  ]]; then
          echo "$now Server down lol" >> $logg
          ## get top processes consuming system memory and save to temporary file
          ps -eo pid,ppid,cmd,%mem,%cpu --sort=-%mem | head > /opt/.hiden/top_proccesses_consuming_memory.txt
          curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendMessage?chat_id=386788173&text=wiu wiu wiu memory leak niichan" > /dev/null 2>&1
          sleep 1
          curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendSticker?chat_id=386788173&sticker=CAADBQADRAADTesNF66j3TlHno3lFgQ" > /dev/null 2>&1
          sleep 5
          cek

  fi
  echo "$now Server Ok" >> $logg
  exit 0
}




function cek() {
  curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendMessage?chat_id=386788173&text=try clean cache niichan and check lampp" > /dev/null 2>&1
  sleep 1
  curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendSticker?chat_id=386788173&sticker=CAADBQADRgADTesNF7aWUpsENDStFgQ" > /dev/null 2>&1
  echo 1 > /proc/sys/vm/drop_caches &
  array=( "nginx" "mariadb" "httpd")
  for i in "${array[@]}"
    do
      systemctl is-active $i >/dev/null 2>&1 && {
        echo "$now $i up" >> $logg;
      } || {
        echo "$now $i dead lol" >> $logg;
        curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendMessage?chat_id=386788173&text= wiu wiu "$i" mati niichan" > /dev/null 2>&1 &
        sleep 1
        curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendSticker?chat_id=386788173&sticker=CAADBQADRAADTesNF66j3TlHno3lFgQ" > /dev/null 2>&1
        sudo systemctl start $i
        sleep 2
  }
  done
  sleep 5
  curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendMessage?chat_id=386788173&text= Recheck lampp service niichan" > /dev/null 2>&1 &
  recek
}

function recek() {
  array=( "nginx" "mariadb" "httpd")
  for i in "${array[@]}"
    do
      systemctl is-active $i >/dev/null 2>&1 || {
        echo "$now $i still dead lol" >> $logg;
        curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendMessage?chat_id=386788173&text= wiu wiu "$i" still down niichan" > /dev/null 2>&1 &
        sleep 1
        curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendSticker?chat_id=386788173&sticker=CAADBQADSAADTesNF-Dh-Xh19H_QFgQ" > /dev/null 2>&1
        sudo systemctl start $i
        sleep 2
  }
  done
  curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendMessage?chat_id=386788173&text=All checked niichan" > /dev/null 2>&1
  sleep 3
  curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendMessage?chat_id=386788173&text=Done~ UwU" > /dev/null 2>&1
  sleep 1
  curl -s "https://api.telegram.org/bot725295845:AAHsEoRjWgtFi0GACKX-r3JOSpZeKp_1hXU/sendSticker?chat_id=386788173&sticker=CAADBQADOAADTesNF1E8S1h3wglEFgQ" > /dev/null 2>&1
  exit 0
}

memmm
