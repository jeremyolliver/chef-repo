Description
===========

This cookbook sets up a deploy user for the web application, installs the specified (overridable) version of ruby, and
one of several stacks for running the web application.

* ruby\_web\_deployment::passenger - uses apache2 and passenger

Planned:
nginx + unicorn stack

Requirements
============

Attributes
==========

Usage
=====

include ruby\_web\_deployment::passenger (or another recipe provided) in your run_list for the node.
Database installation is not included in this recipe, that should be installed/included as a separate cookbook

This sets up the server prepared for deploying ruby applications via capistrano or a similar tool into:

/var/apps/<application_name>/current/*

For capistrano set the following:

```
set :user, "deploy"

set :application, "applicationname"
set :deploy_to, "/var/apps/#{application}"
```
