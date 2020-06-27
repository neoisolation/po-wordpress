#!/bin/sh

domaine=$1;
frenomlogin=$2;
frenompass=$3;
pmta=$4
RANDOM=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM1=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM2=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM3=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM4=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM5=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM6=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM7=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM8=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM9=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM10=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)
RANDOM11=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

echo "
login: $2
password: $3
# list here the records you want to add/update
record:
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM1
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM2
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM3
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM4
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM5
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM6
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM7
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM8
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM9
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM10
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM11
    type: CNAME
    target: $4 # you can omit this line
"> /etc/cnamefreenom.yml;
fdu process -c -i -t 3600 /etc/cnamefreenom.yml&
