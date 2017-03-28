class { 'puppetdb':
#  ssl_set_cert_paths => true,
#  ssl_deploy_certs   => true,
  }
class { 'puppetdb::master::config': }

class {'::puppetexplorer':
  vhost_options => {
    rewrites  => [ { rewrite_rule => ['^/api/metrics/v1/mbeans/puppetlabs.puppetdb.query.population:type=default,name=(.*)$  https://%{HTTP_HOST}/api/metrics/v1/mbeans/puppetlabs.puppetdb.population:name=$1 [R=301,L]'] } ] }
  }

exec { 'start puppet':
  command => '/opt/puppetlabs/bin/puppet resource service puppet ensure=running enable=true',
 }
exec { 'start puppetserver':
  command => '/opt/puppetlabs/bin/puppet resource service puppetserver ensure=running enable=true',
 }
exec { 'start puppetdb':
  command => '/opt/puppetlabs/bin/puppet resource service puppetdb ensure=running enable=true',
 }
exec { 'start postgresql':
  command => '/opt/puppetlabs/bin/puppet resource service postgresql ensure=running enable=true',
 }

#class { 'foreman': }
