Description
===========
** This cookbook is been modifies to make it compatible wiht loggly, and multiple environments.  ***

The Syslog NG cookbook installs and configures syslog-ng service. There is folowing base recipe

* syslog-ng enables syslog-ng.  Adds systm and security log forwarding to loggly

There are also three definitions

* syslog_ng_source configures syslog-ng to listen on a udp port
(optional)* syslog_ng_filter configures a filter
* syslog_ng_forwarder configures syslog-ng to forward logs it receives to another syslog server

The path to logfiles is provided by logpath parameter to syslog_ng_source.

The cookbook has been written for and tested on Ubuntu 12.04 LTS with syslog-ng 2.1.4.
Syslog NG can be obtained [here: balabit.com](http://www.balabit.com/downloads/files?path=/syslog-ng/sources/2.1.4). 

Requirements
============

* Chef 0.8+
* Syslog-NG 2.x package

Usage
=====

### In a environment file, define the following attributes, 
  node[:loggly][:application][:port]
  node[:loggly][:system][:port]
  node[:loggly][:security][:port]

### In a run list:
    "run_list": [
        "recipe[syslog-ng]"
    ]

### In a cookbook:
    include_recipe "syslog-ng"
    
    syslog_ng_source "source_foo" do
      index "02"
      logpath "/var/log/foo.log"
    end

    syslog_ng_filter "warnings" do
      index  "04"
      filter "level(warning)"
    end

    syslog_ng_forwarder "application_foo_warnings" do
      index "05"
      source_name "source_foo"
    end


License and Author
==================

Author:: Gourav Shah (<gs@initcron.org>)
Author:: Artem Veremey (<artem@veremey.net>)

Copyright 2012, Artem Veremey

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.

Changes
=======

### v 1.3.0

* Create filter definition and have file and forwarder optionally take a filter

### v 1.2.0

* Break source out into its own definition

### v 1.1.0

* adding a new definition for configuring forwarding
* renaming the defintion that writes files to make that clearer in the name
* in the definition for writing files, allow specifying file name
* in the definition for writing files, compress old log files
* moving system logging configuration from the default recipe to a new recipe


### v 1.0.0

* Initial public release
