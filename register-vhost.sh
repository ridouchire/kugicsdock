#!/usr/bin/env sh

# env
host=$1;
ip=127.0.0.1;
local_available=$(pwd)/etc;
cert_dir=$(pwd)/ssl;

# local: copy
echo '[~] Copying template config to destination dir...'
cp "${local_available}/template.conf" "${local_available}/nginx/${host}.conf";

# local: replace
echo '[~] Replacing hostnames in new config...'
sed -e "s/template/${host}/g" "${local_available}/nginx/${host}.conf" > "${local_available}/nginx/${host}.conf.tmp";
mv "${local_available}/nginx/${host}.conf.tmp" "${local_available}/nginx/${host}.conf";

#  remote: generate cer
echo '[~] Generating certs...'
openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout ${cert_dir}/${host}.key -out ${cert_dir}/${host}.crt -subj '/C=AU/CN=${host}'

# restart docker
echo '[!] Restarting services...'
make halt && make up

# local: add host
echo '[!] Adding host into your /etc/hosts [You can skip, if you are stupid]'
sudo sh -c "echo '${ip} ${host}' >> /etc/hosts"

echo '[~] Done!'
