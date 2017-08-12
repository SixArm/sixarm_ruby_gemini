SixArm.com → Ruby → <br> Gemini is a gem initialization helper

* Doc: <http://sixarm.com/sixarm_ruby_gemini/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_gemini>
* Repo: <http://github.com/sixarm/sixarm_ruby_gemini>
<!--HEADER-SHUT-->


## Introduction

Simple gem management methods.

For docs go to <http://sixarm.com/sixarm_ruby_gemini/doc>

Want to help? We're happy to get pull requests.



<!--INSTALL-OPEN-->

## Install

To install using a Gemfile, add this:

    gem "sixarm_ruby_gemini", ">= 1.2.5", "< 2"

To install using the command line, run this:

    gem install sixarm_ruby_gemini -v ">= 1.2.5, < 2"

To install using the command line with high security, run this:

    wget http://sixarm.com/sixarm.pem
    gem cert --add sixarm.pem && gem sources --add http://sixarm.com
    gem install sixarm_ruby_gemini -v ">= 1.2.5, < 2" --trust-policy HighSecurity

To require the gem in your code:

    require "sixarm_ruby_gemini"

<!--INSTALL-SHUT-->


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
