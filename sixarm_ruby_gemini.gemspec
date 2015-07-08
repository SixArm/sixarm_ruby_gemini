# -*- coding: utf-8 -*-

Gem::Specification.new do |s|

  s.name              = "sixarm_ruby_gemini"
  s.summary           = "SixArm.com » Ruby » Gemini"
  s.description       = "Gemini provides gem initial setup method to see if a gem is installed"
  s.version           = "1.2.5"

  s.author            = "SixArm"
  s.email             = "sixarm@sixarm.com"
  s.homepage          = "http://sixarm.com/"
  s.licenses          = ["BSD", "GPL", "MIT", "PAL", "Various"]

  s.signing_key       = "/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-private.pem"
  s.cert_chain        = ["/opt/keys/sixarm/sixarm-rsa-4096-x509-20150314-public.pem"]

  s.platform          = Gem::Platform::RUBY
  s.require_path      = "lib"
  s.has_rdoc          = true

  s.files = [
    ".gemtest",
    "CHANGES.md",
    "LICENSE.md",
    "Rakefile",
    "README.md",
    "VERSION",
    "lib/sixarm_ruby_gemini.rb"
  ]

  s.test_files = [
    "test/sixarm_ruby_gemini_test.rb"
  ]

  s.add_dependency('open4', '>= 1.3.4', '< 2')
  s.add_dependency('sixarm_ruby_commander', '>= 1.0.2', '< 2')

end
