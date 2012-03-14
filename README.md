SixArm.com » Ruby » Gemini is a gem initialization helper

* Docs: <http://sixarm.com/sixarm_ruby_gemini/doc>
* Repo: <http://github.com/sixarm/sixarm_ruby_gemini>
* Email: Joel Parker Henderson, <joel@sixarm.com>


## Introduction

Simple gem management methods.

For docs go to <http://sixarm.com/sixarm_ruby_gemini/doc>

Want to help? We're happy to get pull requests.



## Quickstart

Install:

    gem install sixarm_ruby_gemini

Bundler:

    gem "sixarm_ruby_gemini", "=1.2.4"

Require:

    require "sixarm_ruby_gemini"


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

