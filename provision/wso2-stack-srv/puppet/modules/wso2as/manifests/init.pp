class wso2as (
  $wso2as_bundle_name = undef,
  $wso2as_server_name = undef,
  $wso2_user_name     = undef,
  $wso2_group_name    = undef
  ) {

  if $wso2as_bundle_name {
    fail ("Parameter wso2esb_bundle_name is mandatory.")
  }
  if $wso2as_server_name {
    fail ("Parameter wso2esb_server_name is mandatory.")
  }
  if $wso2_user_name {
    fail ("Parameter wso2_user_name is mandatory.")
  }
  if $wso2_group_name {
    fail ("Parameter wso2_group_name is mandatory.")
  }
  
}