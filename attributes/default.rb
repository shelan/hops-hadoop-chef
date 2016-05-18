default.hops.version                   = "2.4.0"

include_attribute "kagent"
include_attribute "apache_hadoop"
include_attribute "ndb"


default.hops.download_url              = "#{node.download_url}/hops-#{node.apache_hadoop.version}.tgz"
default.hops.hadoop_src_url            = "#{node.download_url}/hadoop-#{node.hadoop.version}-src.tar.gz"

default.hops.dir                       = "/srv"


default.hops.leader_check_interval_ms  = 1000
default.hops.missed_hb                 = 1
default.hops.db                        = "hops"
default.hops.max_retries               = 0

# set the location of libndbclient.so. set-env.sh sets LD_LIBRARY_PATH to find this library.
default.ndb.libndb                     = "#{default.mysql.version_dir}/lib"
default.mysql.port                     = default.ndb.mysql_port
default.hadoop.mysql_url               = "jdbc:mysql://#{default.ndb.mysql_ip}:#{default.ndb.mysql_port}/"

default.hops.log_level                 = "DEBUG"

default.dal.download_url               = "#{node.download_url}/ndb-dal-#{node.hadoop.version}-#{node.ndb.version}.jar"
default.dal.lib_url                    = "#{node.download_url}/libhopsyarn-#{node.hadoop.version}-#{node.ndb.version}.so"
default.dal.schema_url                 = "#{node.download_url}/hops.sql"

default.hops.recipes                   = %w{ nn dn rm nm jhs ps } 

# limits.d settings
default.hops.limits.nofile           = '32768'
default.hops.limits.nproc            = '65536'

#default.hops.hadoop_env.hadoop_opts  = '-Djava.net.preferIPv4Stack=true ${HADOOP_OPTS}'
#default.hops.mapred_env.hadoop_opts  = '-Djava.net.preferIPv4Stack=true ${HADOOP_OPTS}'

default.hops.nn.direct_memory_size   = 50
default.hops.nn.heap_size            = 100

default.hops.nn.public_ips           = ['10.0.2.15']
default.hops.nn.private_ips          = ['10.0.2.15']
default.hops.dn.public_ips           = ['10.0.2.15']
default.hops.dn.private_ips          = ['10.0.2.15']
default.hops.rm.public_ips           = ['10.0.2.15']
default.hops.rm.private_ips          = ['10.0.2.15']
default.hops.nm.public_ips           = ['10.0.2.15']
default.hops.nm.private_ips          = ['10.0.2.15']
default.hops.jhs.public_ips          = ['10.0.2.15']
default.hops.jhs.private_ips         = ['10.0.2.15']
default.hops.ps.public_ips           = ['10.0.2.15']
default.hops.ps.private_ips          = ['10.0.2.15'] 

default.hops.jhs.https.port 		 = "19443"
default.hops.rm.https.port 			 = "8090"
default.hops.nm.https.port  		 = "45443"

default.hops.yarn.resource_tracker   = "false"

default.hops.use_hopsworks             = "false"

# Blocksize given in Bytes. 134217728 = 128MB
node.normal.apache_hadoop.hdfs.blocksize    = 134217728 

default.hops.erasure_coding            = "false"

default.hops.nn.cache                = "true"
default.hops.nn.partition_key        = "true"

default.vagrant                          = "false"

node.normal.mysql.user                 = node.mysql.user
node.normal.mysql.password             = node.mysql.password

default.hops.reverse_dns_lookup_supported = "false"

default.hops.use_systemd               = "false"
node.normal.apache_hadoop.use_systemd  = node.hops.use_systemd


                                                          
default.hops.yarn.nodemanager_ha_enabled            = "true"
default.hops.yarn.nodemanager_auto_failover_enabled = "true"
default.hops.yarn.nodemanager_recovery_enabled      = "true"
# NM heartbeats need to be at least twice as long as NDB transaction timeouts
#default.hops.yarn.rm_heartbeat                     = node.ndb.TransactionInactiveTimeout * 2
default.hops.yarn.rm_heartbeat                      = 2000
default.hops.yarn.nodemanager_rpc_batch_max_size    = 60
default.hops.yarn.nodemanager_rpc_batch_max_duration= 60
default.hops.yarn.rm_distributed                    = "false"
default.hops.yarn.nodemanager_rm_streaming_enabled  = "true"
default.hops.yarn.client_failover_sleep_base_ms     = 100
default.hops.yarn.client_failover_sleep_max_ms      = 1000
default.hops.yarn.quota_enabled                     = "true"
default.hops.yarn.quota_monitor_interval            = 1000
default.hops.yarn.quota_ticks_per_credit            = 60
default.hops.yarn.quota_min_ticks_charge            = 600
default.hops.yarn.quota_checkpoint_nbticks          = 600

node.default.apache_hadoop.yarn.log_aggregation     = "true"

## SSL Config Attributes##

#hdfs-site.xml 
default.hops.dfs.https.enable 							= "true"
default.hops.dfs.http.policy   							= "HTTPS_ONLY"
default.hops.dfs.datanode.https.address 			    = "0.0.0.0:50475"
default.hops.dfs.namenode.https-address   				= "0.0.0.0:50470"

#mapred-site.xml 
default.hops.mapreduce.jobhistory.http.policy 			= "HTTPS_ONLY"
default.hops.mapreduce.jobhistory.webapp.https.address  = "#{default.hops.jhs.public_ips}:#{default.hops.jhs.https.port}"

#yarn-site.xml 
default.hops.yarn.http.policy							= "HTTPS_ONLY"
default.hops.yarn.log.server.url                        = "https://#{default.hops.jhs.private_ips}:#{default.hops.jhs.https.port}/jobhistory/logs"
default.hops.yarn.resourcemanager.webapp.https.address  = "#{default.hops.rm.private_ips}:#{default.hops.rm.https.port}"
default.hops.yarn.nodemanager.webapp.https.address 		= "0.0.0.0:#{default.hops.nm.https.port}"

#ssl-server.xml 
default.hops.ssl.server.keystore.password   			= "password"
default.hops.ssl.server.keystore.keypassword   			= "password"
default.hops.ssl.server.keystore.location 				= "node_server_keystore.jks"
default.hops.ssl.server.truststore.location   			= "node_server_truststore.jks"
default.hops.ssl.server.truststore.password     	 	= "changeit"

#ssl-client.xml 
default.hops.ssl.client.truststore.password  			= "changeit"
default.hops.ssl.client.truststore.location   			= "node_client_truststore.jks"
