# SixArm.com » Ruby » <br> Gemini is a gem initialization helper

* Doc: <http://sixarm.com/sixarm_ruby_gemini/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_gemini>
* Repo: <http://github.com/sixarm/sixarm_ruby_gemini>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Simple gem management methods.

For docs go to <http://sixarm.com/sixarm_ruby_gemini/doc>

Want to help? We're happy to get pull requests.



## Install quickstart

Install:

    gem install sixarm_ruby_gemini

Bundler:

    gem "sixarm_ruby_gemini", "~>1.2.4"

Require:

    require "sixarm_ruby_gemini"


## Install with security (optional)

To enable high security for all our gems:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem
    gem sources --add http://sixarm.com

To install with high security:

    gem install sixarm_ruby_gemini --trust-policy HighSecurity


## Examples

Is a gem installed?

    Gemini.installed?(:name=>'foo',:version=>'2.0.0')
    => true

Install as needed:

    Gemini.install(:name=>'foo',:version=>'2.0.0')
    => install passenger 2.0.0 if necessary

Find matching gems:

    Gemini.find(:name=>'foo')
     => all gemspecs with name 'foo'

    Gemini.find(:name=>'foo',:version=>version_requiremens)
    => all gemspecs with name 'foo' that match the requirments


## Changes

* 2012-03-14 1.2.4 Update docs, tests
## License

You may choose any of these open source licenses:

  * Apache License
  * BSD License
  * CreativeCommons License, Non-commercial Share Alike
  * GNU General Public License Version 2 (GPL 2)
  * GNU Lesser General Public License (LGPL)
  * MIT License
  * Perl Artistic License
  * Ruby License

The software is provided "as is", without warranty of any kind, 
express or implied, including but not limited to the warranties of 
merchantability, fitness for a particular purpose and noninfringement. 

In no event shall the authors or copyright holders be liable for any 
claim, damages or other liability, whether in an action of contract, 
tort or otherwise, arising from, out of or in connection with the 
software or the use or other dealings in the software.

This license is for the included software that is created by SixArm;
some of the included software may have its own licenses, copyrights, 
authors, etc. and these do take precedence over the SixArm license.

Copyright (c) 2013 Joel Parker Henderson
