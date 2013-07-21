default[:syslog_ng][:user]          = "root"
default[:syslog_ng][:group]         = "root"
default[:syslog_ng][:log_dir]       = "/var/log/syslog-ng"
default[:syslog_ng][:config_dir]    = "/etc/syslog-ng"
default[:loggly][:host] = "logs.loggly.com"
default[:loggly][:application][:port]   = 12345
default[:loggly][:system][:port]   = 23456
default[:loggly][:security][:port]   = 34567

