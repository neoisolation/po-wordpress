#!/bin/sh
domaine=$1;
frenomlogin=$2;
frenompass=$3;

login: $2
password: $3
# list here the records you want to add/update
record:
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
      # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
  # the following will update your subdomain's A record with your current ip (v4)
  - domain: $1
    name: $RANDOM
    type: CNAME
    target: $1 # you can omit this line
"> /etc/cnamefreenom.yml;
fdu process -c -i -t 3600 /etc/cnamefreenom.yml&
