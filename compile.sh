#!/bin/bash


build() {
	export CPLUS_INCLUDE_PATH=$PWD/slog
	export LD_LIBRARY_PATH=$PWD/slog
	export LIBRARY_PATH=$PWD/slog:$LIBRARY_PATH


#    apt-get -y install cmake
#    apt-get -y install libuu-dev 
#    apt-get -y install libcurl4-openssl-dev
#    apt-get -y install openssl-devel
#    apt-get -y  install libcurl-dev 
#    apt-get -y  install liblog4cxx10-dev libprotobuf-lite8 libhiredis-dev protobuf-compiler cmake g++  libprotobuf-dev

	echo "#ifndef __VERSION_H__" > base/version.h
	echo "#define __VERSION_H__" >> base/version.h
	echo "#define VERSION \"$1\"" >> base/version.h
	echo "#endif" >> base/version.h

    if [ ! -d lib ]
    then
        mkdir lib
    fi

CURPWD=$PWD	


	 for i in base slog  route_server msg_server http_msg_server file_server push_server tools db_proxy_server msfs login_server; do     
		cd $CURPWD/$i
		cmake .
		make
    		if [ $? -eq 0 ]; then
    		    echo "make msfs successed";
  		  else
       		 echo "make msfs failed";
       		 exit;
    		fi
		


	done
	
	cd $CURPWD

        cp base/libbase.a lib/
	 
    	mkdir base/slog/lib
        cp slog/slog_api.h base/slog/
        cp slog/libslog.so base/slog/lib/


    rm -rf $build_version
} 

clean() {
	cd base
	make clean
	cd ../login_server
	make clean
	cd ../route_server
	make clean
	cd ../msg_server
	make clean
	cd ../http_msg_server
    make clean
	cd ../file_server
    make clean
    cd ../push_server
    make clean
	cd ../db_proxy_server
	make clean
    cd ../push_server
    make clean
}

print_help() {
	echo "Usage: "
	echo "  $0 clean --- clean all build"
	echo "  $0 version version_str --- build a version"
}

case $1 in
	clean)
		echo "clean all build..."
		clean
		;;
	version)
		if [ $# != 2 ]; then 
			echo $#
			print_help
			exit
		fi

		echo $2
		echo "build..."
		build $2
		;;
	*)
		print_help
		;;
esac
