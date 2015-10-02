Exec {
  path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

exec { 'apt-update':
  command => '/usr/bin/apt-get update';
}

Exec["apt-update"] -> Package <| |>

node default {
    apt::ppa { "http://packages.cor-lab.de/ubuntu": key => "http://packages.cor-lab.de/keys/cor-lab.asc"; }

    $rsbdeps = ['librsb0.12', 'cl-rsb', 'rsb-tools-cpp0.12', 'rsb-tools-cl0.12', 'rst0.12', 'rsbvideoreceiver0.12', 'python-pip']

    package {
        'wget': ensure => latest;
        'python-software-properties': ensure => latest;
        'vim': ensure => latest;
        'git': ensure => latest;
        'dpkg': ensure => latest;
        'tmux': ensure => latest;    
        $rsbdeps: ensure => "latest",
            require => Apt::Ppa['http://packages.cor-lab.de/ubuntu'];
    }
}


file {"/home/vagrant/.bashrc":
  source => "puppet:///modules/user/bashrc",
  mode   => 644,
  owner => 'vagrant',
  group => 'vagrant';
  #require => Package['ros-indigo-desktop'];
}

file {"/home/vagrant/.gitconfig":
  source => "puppet:///modules/user/dot.gitconfig",
  mode   => 644,
  owner => 'vagrant',
  group => 'vagrant',
  require => Package['git'];
}