class { 'puppetdb':
#  ssl_set_cert_paths => true,
#  ssl_deploy_certs   => true,
  }
class { 'puppetdb::master::config': }

class {'::puppetexplorer':
  vhost_options => {
    rewrites  => [ { rewrite_rule => ['^/api/metrics/v1/mbeans/puppetlabs.puppetdb.query.population:type=default,name=(.*)$  https://%{HTTP_HOST}/api/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=$1 [R=301,L]'] } ] }
  }
#class { 'foreman': }
