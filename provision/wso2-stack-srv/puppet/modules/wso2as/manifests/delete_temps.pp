class wso2as::delete_temps (
  $wso2as_bundle_name = $wso2as_bundle_name,
  $wso2_user_name      = $wso2_user_name,
  $wso2_group_name     = $wso2_group_name  
  ) {

  Exec {
    path => ['/usr/bin', '/bin', '/usr/sbin']
  }
 
  exec { "DELETE_TMP_${wso2as_bundle_name}":
    command => "rm -rf /tmp/${wso2as_bundle_name}*",
    cwd     => '/tmp',
    creates => "/tmp/${wso2as_bundle_name}.deleted.ok",
    user  => "${wso2_user_name}",
    group  => "${wso2_group_name}",
    timeout => 0,
  }

}