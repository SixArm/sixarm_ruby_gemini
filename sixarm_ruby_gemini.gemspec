Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_gemini"
  s.summary           = "SixArm Ruby Gem: Gemini provides gem initial setup method to see if a gem is installed"
  s.version           = "1.2.4"
  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.signing_key       = '/home/sixarm/keys/certs/sixarm.com.rsa.private.key.and.certificate.pem'
  s.cert_chain        = ['/home/sixarm/keys/certs/sixarm.pem']

  s.platform          = Gem::Platform::RUBY
  s.files             = ['README.rdoc','LICENSE.txt','lib/sixarm_ruby_gemini.rb']
  s.test_files        = ['test/sixarm_ruby_gemini_test.rb']
  s.has_rdoc          = true

  s.add_dependency('open4', '>= 0.9.6')
  s.add_dependency('sixarm_ruby_commander', '>= 1.0.2')

end
