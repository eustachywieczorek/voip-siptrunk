#! /bin/bash

echo """
<configuration name=\"acl.conf\" description=\"Network Lists\">
  <network-lists>
    <!--
	 These ACL's are automatically created on startup.

	 rfc1918.auto  - RFC1918 Space
	 nat.auto      - RFC1918 Excluding your local lan.
	 localnet.auto - ACL for your local lan.
	 loopback.auto - ACL for your local lan.
    -->

    <list name=\"lan\" default=\"allow\">
      <node type=\"deny\" cidr=\"192.168.42.0/24\"/>
      <node type=\"allow\" cidr=\"192.168.42.42/32\"/>
    </list>

    <!--
	This will traverse the directory adding all users
	with the cidr= tag to this ACL, when this ACL matches
	the users variables and params apply as if they
	digest authenticated.
    -->
    <list name=\"domains\" default=\"deny\">
      <!-- domain= is special it scans the domain from the directory to build the ACL -->
      <node type=\"allow\" domain=\"$${domain}\"/>
      <!-- use cidr= if you wish to allow ip ranges to this domains acl. -->
      <!-- <node type=\"allow\" cidr=\"192.168.0.0/24\"/> -->
      <node type=\"allow\" cidr=\"$ACCEPT_IP\"/>
    </list>

  </network-lists>
</configuration>
""" > /etc/freeswitch/autoload_configs/acl.conf.xml
