PCRE_CMD=`which pcre`
echo $PCRE_CMD

if test -e "$PCRE_CMD"; then
  echo 'pcre installed at ' $PCRE_CMD
else
  echo 'Need to install pcre...';
  brew install pcre
fi

NGINX_CMD=`which nginx`
echo $NGINX_CMD

if test -e "$NGINX_CMD"; then
  echo 'nginx installed at ' $NGINX_CMD
else
  echo 'Need to install nginx...';
  wget http://nginx.org/download/nginx-1.2.3.tar.gz
  wget http://labs.frickle.com/files/ngx_cache_purge-1.6.tar.gz
  tar xvzf nginx-1.2.3.tar.gz
  tar xvzf ngx_cache_purge-1.6.tar.gz
  cd nginx-1.2.3
  ./configure --add-module=../ngx_cache_purge-1.6 --with-cc-opt="-I/usr/local/Cellar/pcre/8.31/include"  --with-ld-opt="-L/usr/local/Cellar/pcre/8.31/lib"
  make
  make install
fi

PATH_USR_LOCAL_SBIN_CHECK=`echo $PATH | grep  "/usr/local/nginx/sbin"`
echo $PATH_USR_LOCAL_SBIN_CHECK
if [ -z "$PATH_USR_LOCAL_SBIN_CHECK" ]; then
  echo "Path doesn't contain /usr/local/nginx/sbin so I am adding it"
  echo "PATH=\$PATH:/usr/local/nginx/sbin" >> ~/.profile
  source ~/.profile
else
  echo "Path has /usr/local/nginx/sbin"
fi

