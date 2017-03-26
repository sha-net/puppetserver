exec { 'apt update':
  command => '/usr/bin/apt-get update',
 }

package { 'puppetserver':
  ensure => 'installed',
  require  => Exec['apt update'],
 }

file { '/etc/puppetlabs/puppet/fileserver.conf':
 ensure  => file,
 content => template('/root/fileshare/fileshare.conf.erb'),
}

file { '/etc/puppetlabs/code/environments/production/files/':
  ensure => directory,
}

exec { 'install puppetdb':
  command => '/opt/puppetlabs/bin/puppet module install puppetlabs-puppetdb --version 5.1.2',
 }

exec { 'install postgresql':
  command => '/opt/puppetlabs/bin/puppet module install puppetlabs-postgresql --version 4.9.0',
 }

exec { 'install puppetexplorer':
  command => '/opt/puppetlabs/bin/puppet module install spotify-puppetexplorer --version 1.1.1',
 }

exec { 'install apache':
  command => '/opt/puppetlabs/bin/puppet module install puppetlabs-apache --version 1.11.0',
 }

#exec { 'install foreman':
#  command => '/opt/puppetlabs/bin/puppet module install theforeman-foreman --version 7.1.0',
# }

