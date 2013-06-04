# Play! 2.1.1 w/ Vagrant

A Ubuntu 10.04 Vagrant setup with [Play! 2.1.1](http://www.playframework.com/documentation/2.1.1/ScalaHome) and [Scala 2.10.1](http://docs.scala-lang.org/).

## Requirements

* VirtualBox - Free virtualization software [Downloads](https://www.virtualbox.org/wiki/Downloads)
* Vagrant - Tool for working with virtualbox images [Vagrant Home](https://www.vagrantup.com), click on 'download now link'
* Git - Source Control Management [Downloads](http://git-scm.com/downloads)

## Setup

* Clone this repository `git clone {git://github.com/SegFaultx64/vagrant-play.git}`
* Modify `Vagrantfile` to set it's git address to be that of you app if you would like
* run `vagrant up` inside the newly created directory
* (the first time you run vagrant it will need to fetch the virtual box image which is ~300mb so depending on your download speed this could take some time)
* Vagrant will then use Chef Solo to provision the base virtual box with the Typesafe stack (this could take a few minutes, the JDK is big and Ubuntu's mirrors are slow)
* You can verify that everything was successful by opening http://localhost:9000 in a browser
* **NOTE: The first time you hit the Play! application it will have to compile which takes a long time. Also it takes a while for the Play! framework to load the project file so if you try to hit the address in the first 1 minute or so after the box comes up you will get an error.**

## What Else is on Here?

* zsh       - Because I am far too used to it to switch back to bash
* oh_my_zsh - Otherwise zsh is a pain to configure especially from Chef
* git		- Used for pulling down oh_my_zsh and your projects
* screen	- Used to run Play! in interactive mode in the background

## Usage

Some basic information on interacting with the vagrant box

### Port Forwards

* 9000 - Play

### Custom Commands

* `play_console`: This will connect you to the GNU screen on which the play console is running. To disconnect without exiting Play! do `ctrl + a + d`. To stop play do `ctrl + d` as normal. 

### Vagrant

Vagrant is [very well documented](http://vagrantup.com/docs/index.html) but here are a few common commands:

* `vagrant up` starts the virtual machine and provisions it
* `vagrant suspend` will essentially put the machine to 'sleep' with `vagrant resume` waking it back up
* `vagrant halt` attempts a graceful shutdown of the machine and will need to be brought back with `vagrant up`
* `vagrant ssh` gives you shell access to the virtual machine

## Support?

Hit me up on Twitter @ReluctantHipstr

----
##### Virtual Machine Specifications #####

* OS     - Ubuntu 10.04
* Play	 - 2.1.1
* Scala  - 2.10.1
* JDK	 - OpenJDK 1.6.0_27