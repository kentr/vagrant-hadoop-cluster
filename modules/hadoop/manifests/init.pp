class hadoop {

  exec { "download_hadoop":
    command => "wget -O /tmp/hadoop.tar.gz http://apache.claz.org/hadoop/common/hadoop-${hadoop_version}/hadoop-${hadoop_version}.tar.gz",
    path => $path,
    user => $user,
    group => $user,
    unless => "ls ${install_dir} | grep ${hadoop_dir}",
    require => Package["openjdk-7-jdk"]
  }

  file { "${install_dir}":
    ensure => "directory",
    owner => $user,
    group => $user,
  }

  exec { "unpack_hadoop" :
    command => "tar -zxf /tmp/hadoop.tar.gz -C ${install_dir}",
    path => $path,
    user => $user,
    group => $user,
    creates => "${hadoop_home}",
    require => [Exec["download_hadoop"], File["${install_dir}"]],
  }

  file { "${hadoop_tmp_dir}":
    ensure => "directory",
    owner => $user,
    group => $user,
  }

  file { "${hadoop_home}/etc/hadoop/slaves":
    content => template('hadoop/slaves'),
    mode => 644,
    owner => $user,
    group => $user,
    require => Exec["unpack_hadoop"]
  }

#   file { "${hadoop_home}/etc/hadoop/masters":
#     content => template('hadoop/masters'),
#     mode => 644,
#     owner => $user,
#     group => $user,
#     require => Exec["unpack_hadoop"]
#   }

  file { "${hadoop_home}/etc/hadoop/core-site.xml":
    content => template('hadoop/core-site.xml'),
    mode => 644,
    owner => $user,
    group => $user,
    require => Exec["unpack_hadoop"]
  }

#   file { "${hadoop_home}/etc/hadoop/mapred-site.xml":
#     content => template('hadoop/mapred-site.xml'),
#     mode => 644,
#     owner => $user,
#     group => $user,
#     require => Exec["unpack_hadoop"]
#   }

  file { "${hadoop_home}/etc/hadoop/hdfs-site.xml":
    content => template('hadoop/hdfs-site.xml'),
    mode => 644,
    owner => $user,
    group => $user,
    require => Exec["unpack_hadoop"]
  }



  file { "${hadoop_home}/etc/hadoop/hadoop-env.sh":
    content => template('hadoop/hadoop-env.sh'),
    mode => 644,
    owner => $user,
    group => $user,
    require => Exec["unpack_hadoop"]
  }
}
