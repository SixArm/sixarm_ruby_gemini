# SixArm.com → Ruby → <br> Gemini is a gem initialization helper

* Doc: <http://sixarm.com/sixarm_ruby_gemini/doc>
* Gem: <http://rubygems.org/gems/sixarm_ruby_gemini>
* Repo: <http://github.com/sixarm/sixarm_ruby_gemini>
<!--header-shut-->


## Introduction

Simple gem management methods.

For docs go to <http://sixarm.com/sixarm_ruby_gemini/doc>

Want to help? We're happy to get pull requests.



<!--install-open-->

## Install

### Gem

To install this gem in your shell or terminal:

    gem install sixarm_ruby_gemini

### Gemfile

To add this gem to your Gemfile:

    gem 'sixarm_ruby_gemini'

### Require

To require the gem in your code:

    require 'sixarm_ruby_gemini'

<!--install-shut-->


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
