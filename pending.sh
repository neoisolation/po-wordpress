# !/usr/bin/sh

ADMIN_EMAIL='info@mydiscountoffert.ml'
DATE_TIME=`date +%Y-%m-%d_%H:%M:%S`

pending=`mysql -u postal --password=LFr37rG3r -h 127.0.0.1 -e "select count(*) as pending from messages where status = 'Pending'" --vertical postal-server-1 | grep pending | sed -e 's/pending: //g'`
echo "[$DATE_TIME] Pending: $pending"

if [ $pending -gt 10 ]; then
    echo 'Restarting...'
    status=`/usr/sbin/service postal status`
    /usr/sbin/service postal restart
    echo -e $status | mail -s "[Postal] Restart" $ADMIN_EMAIL
fi
