WeWriteCode SinatraAPIBase
==========

### (Important) Git Submodules
There are git submodules at play for the Vagrant setup. To get them, run:

```git submodule init && git submodule update```

Note: Don't update the submodule repositories.


Connect to MySQL Via MySQL Workbench
====================================

ssh into your vagrant edit /etc/mysql/my.cnf and comment out the "bind" line. roughly line 63

then you can do this:

http://www.vmichnowicz.com/blog/entry/get_mysql_workbench_to_connect_to_mysql_running_with_vagrant