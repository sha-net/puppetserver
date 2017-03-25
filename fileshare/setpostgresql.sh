sudo -u postgres sh
createuser -DRSP puppetdb
createdb -E UTF8 -O puppetdb puppetdb
sudo -u postgres sh
psql puppetdb -c 'create extension pg_trgm'
exit
