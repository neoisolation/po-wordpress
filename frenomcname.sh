#!/bin/sh

domaine=$1;
frenomlogin=$2;
frenompass=$3;
pmta=$4
RANDOM=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 8 | head -n 1)

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
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $4 # you can omit this line
"> /etc/cnamefreenom.yml;
fdu process -c -i -t 3600 /etc/cnamefreenom.yml&
