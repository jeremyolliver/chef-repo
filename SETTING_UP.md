Setting Up
==========

Chef self hosted server install

    # /etc/apt/sources.list.d/opscode.list
    deb http://apt.opscode.com/ <codename> main

The codename should be appended by -0.10 so for example on Ubuntu 10.X use lucid-0.10 for Ubuntu 12.X use precise-0.10

    echo "deb http://apt.opscode.com/ `lsb_release -cs`-0.10 main" | sudo tee /etc/apt/sources.list.d/opscode.list

Add the opscode keys

    sudo mkdir -p /etc/apt/trusted.gpg.d
    gpg --keyserver keys.gnupg.net --recv-keys 83EF826A
    gpg --export packages@opscode.com | sudo tee /etc/apt/trusted.gpg.d/opscode-keyring.gpg > /dev/null

    sudo apt-get update
    sudo apt-get install opscode-keyring chef chef-server

Now go make a coffee, this could take a few minutes

(optional):

    sudo apt-get upgrade

Configuration

Enter passwords when prompted, can be changed later in /etc/chef/server.rb (or /etc/chef/webui.rb)

    sudo knife configure -i

enter your local user workstation name for the new username. The chef server url must be accessible from your workstation
copy the generated `~/.chef/<username>.pem` into your repository `.chef/` directory. You now have a configured chef client on your workstation able to interact with the chef rest api.

    knife client list # prints a list of all validated clients as a test
