class wso2as::setup_carbon (
  $wso2as_server_name_array = $wso2as_server_name_array
  ) {

  Exec {
    path => ['/usr/bin', '/bin', '/usr/sbin']
  }

 $wso2as_server_name_array.each |$value| {

    file { "COPY_WSO2AS_INITD_IN_${value}": 
      path => "/etc/init.d/${value}",
      owner  => root,
      group  => root,
      mode   => 755,
      source => "/vagrant/provision/wso2-stack-srv/puppet/modules/wso2as/files/${value}/${value}"
    } ~>

    file { "COPY_WSO2AS_LIB_IN_${value}": 
      path => "/opt/${value}/repository/components/lib/postgresql-9.4-1201.jdbc41.jar",
      source => "/vagrant/_downloads/postgresql-9.4-1201.jdbc41.jar"
    } -> 

    file { "COPY_WSO2AS_CARBONXML_IN_${value}": 
      path => "/opt/${value}/repository/conf/carbon.xml",
      source  => "/vagrant/provision/wso2-stack-srv/puppet/modules/wso2as/files/${value}/repository/conf/carbon.xml"
    } -> 

    file { "COPY_WSO2AS_WEBXML_IN_${value}": 
      path => "/opt/${value}/repository/conf/tomcat/carbon/WEB-INF/web.xml",
      source  => "/vagrant/provision/wso2-stack-srv/puppet/modules/wso2as/files/${value}/repository/conf/tomcat/carbon/WEB-INF/web.xml"
    } 

  }

}