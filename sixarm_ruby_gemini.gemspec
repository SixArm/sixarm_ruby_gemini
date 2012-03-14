Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_gemini"
  s.summary           = "SixArm Ruby Gem: Gemini provides gem initial setup method to see if a gem is installed"
  s.version           = "1.2.4"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm-rsa1024-x509-private.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm-rsa1024-x509-public.pem']

  s.platform          = Gem::Platform::RUBY

  top_files           = [".gemtest", "CHANGELOG.txt", "INSTALL.txt", "LICENSE.txt", "Rakefile", "README.md", "VERSION"]
  lib_files           = ["lib/#{s.name}.rb"]
  test_files          = ["test/#{s.name}_test.rb"]

  s.files             = top_files + lib_files + test_files
  s.test_files        = test_files

  s.add_dependency('open4', '>= 0.9.6')
  s.add_dependency('sixarm_ruby_commander', '>= 1.0.2')

end
