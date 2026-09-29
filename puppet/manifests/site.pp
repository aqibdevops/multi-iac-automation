package { ['curl','unzip']:
  ensure => installed,
}
file { '/etc/motd':
  ensure => file,
  content => "Managed by Puppet\n",
}
