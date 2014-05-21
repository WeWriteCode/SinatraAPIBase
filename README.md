WeWriteCode SinatraAPIBase
==========

The SinatraAPIBase project is a very simple, self contained, template project that we use to create APIs in Sinatra. This will evolve over time, and we would love additional base features / fixes to submitted by you.

### What This Project Includes

This repository is intended to be a "pull and run" project. As such, we have implemented a complete Vagrant setup. Vagrant itself will require that you have a few things in place, and for the purposes of this readme, we are going to assume you are already familiar with Vagrant. That said, the Vagrant box runs:

- Apache2
- MySQL
- Passenger
- rbenv
- ruby-build

The SinatraAPIBase project inclues

- A multi-file Sinatra application
- ActiveRecord support via sinatra-activerecord (migrations and general rake commands)
- Auto-generated functional documentation via source2swagger ```rake swagger```
- MySQL data storage (although ActiveRecord allows for most any database)
- Automatic file reloading via sinatra-reloader

### Planned Additions

- Fully functional oAuth server support (via songkick-oauth2-provider ideally)
- Test templates
- Your feature here...

Getting Started
==========

### (Important) Git Submodules
There are git submodules at play for the Vagrant setup. To get them, run:

```git submodule init && git submodule update```

Note: Don't update the submodule repositories.


### Connect Vagrant MySQL Via MySQL Workbench

First, ssh into your vagrant edit /etc/mysql/my.cnf and comment out the "bind" line. roughly line 63

Then you can do this:

http://www.vmichnowicz.com/blog/entry/get_mysql_workbench_to_connect_to_mysql_running_with_vagrant