#/bin/sh
#start or stop the im-server
rm msg_server/log/default.log
rm route_server/log/default.log
rm db_proxy_server/log/default.log
rm login_server/log/default.log
./restart.sh msg_server
./restart.sh login_server

./restart.sh route_server

./restart.sh file_server
./restart.sh push_server
./restart.sh http_msg_server
./restart.sh db_proxy_server

ps 

cat db_proxy_server/log/default.log
