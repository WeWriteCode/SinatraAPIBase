WeWriteCode SinatraAPIBase
==========

The SinatraAPIBase project is a very simple, self contained, template project that we use to create APIs in [Sinatra](http://www.sinatrarb.com/). This will evolve over time, and we would love additional base features / fixes to submitted by you.

### What This Project Includes

This repository is intended to be a "pull and run" project. As such, we have implemented a complete Vagrant setup. Vagrant itself will require that you have a few things in place, and for the purposes of this readme, we are going to assume you are already familiar with Vagrant. That said, the Vagrant box runs:

- Apache2
- MySQL
- Passenger
- [rbenv](https://github.com/sstephenson/rbenv)
- [ruby-build](https://github.com/sstephenson/ruby-build)

The SinatraAPIBase project includes:

- A multi-file [Sinatra](http://www.sinatrarb.com/) application
- ActiveRecord support via [sinatra-activerecord](https://github.com/janko-m/sinatra-activerecord) (migrations and general rake commands)
- Auto-generated functional documentation via [source2swagger](https://github.com/mkrogemann/source2swagger)
- MySQL data storage (although ActiveRecord allows for most any database)
- Automatic file reloading via sinatra-reloader

### Planned Additions

- Fully functional oAuth server support (via [songkick-oauth2-provider](https://github.com/songkick/oauth2-provider) ideally)
- Test templates
- Your feature here...

Getting Started
==========

Start by pulling *a copy* of this project down to your local machine. If you are intending to use this project for its purpose, and not planning to submit a pull request, you will be best off downloading a zip file of this repo instead of doing a normal ```git clone```. This way you can easily add the project to your own git repo.

### Git Submodules
There are git submodules at play for the Vagrant setup. To get them, run:

```git submodule init && git submodule update```

Note: Don't update the submodule repositories.

### Configs
The next step is a bit of configuration. There are two files you will want to focus on. 

First, create a ```/config/db.yml``` file using the template provided in ```/config/db.yml_example```. Go ahead and create whatever database name, user name, and password you want. Do keep in mind that this project is using MySQL, so don't change the adapter value.

Second, using those same values, go update the ```bootstrap.sh``` file. What this file does is drives the creation of your database when vagrant spins up.

Now, start your vagrant box (this will take a while. Go brew some coffee, or beer in some cases...):

```vagrant up```

That's it! Load up [http://localhost:8888/](http://localhost:8888/) in your favorite browser, and have fun!

### Not Your Mamma's Sinatra Index page...

When you go to [http://localhost:8888/](http://localhost:8888/), you aren't going to see the standard "Sinatra doesn't know this diddy" message. Rest assured that it's still there, but just not for index.html. This project uses source2swagger for all documentation. Go check out their docs for a 'how to', and take note that we've already stubbed in the root in ```/routes/main.rb```. Once you have an end-point documented, all you need to do is run:

```rake swagger```

And then reload the index. Pretty slick huh?


### Connect Vagrant MySQL Via MySQL Workbench

First, ssh into your vagrant edit /etc/mysql/my.cnf and comment out the "bind" line. roughly line 63

Then you can do [this](http://www.vmichnowicz.com/blog/entry/get_mysql_workbench_to_connect_to_mysql_running_with_vagrant)
