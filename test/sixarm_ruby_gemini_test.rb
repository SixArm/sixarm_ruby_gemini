# -*- coding: utf-8 -*-
require 'minitest/autorun'
require 'simplecov'
SimpleCov.start
require 'sixarm_ruby_gemini'

class GeminiTest < Test::Unit::TestCase

 def test_gemini_installed_false
  assert(!Gemini.installed?(:name=>'gem-should-not-exist',:version=>'9.9.9'))
 end

 def test_gemini_install_command
  assert_equal('sudo gem install foo',Gemini.install_command(:name=>'foo'))
  assert_equal('sudo gem install foo --version "9.9.9"',Gemini.install_command(:name=>'foo',:version=>'9.9.9'))
  assert_equal('sudo gem install foo --trust-policy HighSecurity',Gemini.install_command(:name=>'foo',:trust=>'high'))
 end

 def test_gemini_install
  begin
    status,stdout,stderr=Gemini.install(:name=>'gem-should-not-exist',:version=>'9.9.9')
    success=true
  rescue
    success=false
  end
  assert_equal(2,status,'status should be 2')
  assert_equal('',stdout,'stdout should be blank')
  assert_equal(false,success,'success should be false')
  assert_equal('ERROR:  could not find gem gem-should-not-exist locally or in a repository',stderr)
 end

end
