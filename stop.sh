#/bin/sh
#start or stop the im-server
rm msg_server/Debug/log/default.log
rm route_server/Debug/log/default.log
rm db_proxy_server/Debug/log/default.log
rm login_server/Debug/log/default.log
./stoped.sh msg_server
./stoped.sh login_server

./stoped.sh route_server

./stoped.sh file_server
./stoped.sh push_server
./stoped.sh http_msg_server
./stoped.sh db_proxy_server
