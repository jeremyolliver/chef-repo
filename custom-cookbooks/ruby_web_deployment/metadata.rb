maintainer       "Jeremy Olliver"
maintainer_email "jeremy.olliver@gmail.com"
license          "MIT"
description      "Installs/Configures ruby_web_deployment"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.1.0"

depends "rbenv"
depends "ohai"

depends "apache2"
# recommends "apache2" # Change to recommends when multiple deployment options are available
