=begin rdoc

= SixArm Ruby Gem: Gemini is a gem initialization helper

Author:: Joel Parker Henderson, joelparkerhenderson@gmail.com
Copyright:: Copyright (c) 2008-2010 Joel Parker Henderson
License:: CreativeCommons License, Non-commercial Share Alike
License:: LGPL, GNU Lesser General Public License

Simple gem methods.

Example:
  require 'gemini'

  Gemini.installed?(:name=>'passenger',:version=>'2.0.0')
  => true

  Gemini.install(:name=>'passenger',:version=>'2.0.0')
  => install passenger 2.0.0 if necessary

  Gemini.find(:name=>'passenger')
   => all gemspecs with name 'passenger'

  Gemini.find(:name=>'passenger',:version=>version_requiremens)
  => all gemspecs with name 'passenger' that match the requirments

=end

require 'rexml/document'
require 'sixarm_ruby_commander'

class Gemini

  TRUST_POLICY_NICKNAME={'no'=>'NoSecurity','low'=>'LowSecurity','medium'=>'MediumSecurity','high'=>'HighSecurity'}

  # Return true iff a given name is installed
  #
  # Options
  # - name e.g. "foo" [required]
  # - version string e.g. ">=1.2.3"

  def self.installed?(ops)
    name,version = [:name,:version].map{|k| ops[k]||ops[k.to_s]}
    dep = Gem::Dependency.new name, (version||Gem::Requirement.default)
    !Gem.source_index.search(dep).empty?
  end


  # Return an array of all gemspecs that match the name and version requirements
  # 
  # Options:
  # - name e.g. "foo" [required]
  # - version: version requirements as defined in Gem.source_index.find_name

  def self.find(ops)
    name,version = [:name,:version].map{|k| ops[k]||ops[k.to_s]}
    return Gem.source_index.find_name(name,version||[])
  end


  # Install a gem, if needed, by running a system command.
  #
  # This dispatches on the first parameter:
  # - nil: install_from_rails_root_cofig_gems_xml
  # - File: install_from_xml_file
  # - String: install_from_xml_text
  # - REXML::Document: install_from_xml_doc
  # - Array: install_from_array
  # - Hash: install_from_options
  #
  # Return status, stdout, stderr

  def self.install(x=nil)
    if x.class==NilClass         then return self.install_from_rails_root_config_gems_xml end
    if x.class==File             then return self.install_from_file(x) end
    if x.class==String           then return self.install_from_xml_text(x) end
    if x.class==REXML::Document  then return self.install_from_xml_doc(x) end
    if x.class==Array            then return self.install_from_array(x) end
    return self.install_from_options(x)
  end

  def self.install_from_rails_root_config_gems_xml
    return self.install_from_xml_file(File.new(RAILS_ROOT+'/config/gems.xml'))
  end

  def self.install_from_xml_file(file)
    return self.install_from_xml_text(File.read(x))
  end

  def self.install_from_xml_text
    return self.install_from_xml_doc(REXML::Document.new(x))
  end

  def self.install_from_xml_doc
    return self.install_from_array(x.elements.each('gems/gem'){}.map{|e| e.attributes})
  end

  def self.install_from_array(array)
    return x.map{|options| self.install(options)}
  end


  public

  # Install a gem, if needed, by running a system command.
  #
  # Options
  # - name e.g. "foo" [required]
  # - version e.g. ">=1.2.3"
  # - trust: no|low|medium|high (same as NoSecurity|LowSecurity|MediumSecurity|HighSecurity)
  # - append: anything to append to the gem command e.g. " --no-ri --no-rdoc --no-user-install"
  #

  def self.install_from_options(options)
    return installed?(options) \
    ? [nil,nil,nil] \
    : commander(self.install_command(options))
  end


  # Create the system command to do a gem install
  #
  # Options
  # - name e.g. "foo" [required]
  # - version e.g. ">=1.2.3"
  # - trust: no|low|medium|high (aka NoSecurity|LowSecurity|MediumSecurity|HighSecurity)
  # - append (aka installing): anything to append to the gem install command e.g. " --no-ri --no-rdoc --no-user-install"
  #
  # Return the command as a string

  def self.install_command(ops)
    name,version,trust,source,append,installing = [:name,:version,:trust,:source,:append,:installing].map{|k| ops[k]||ops[k.to_s]}
    append||=installing
    return "sudo gem install #{name}" +
      (version ? " --version \"#{version}\"" : '' ) +
      (trust ? " --trust-policy #{TRUST_POLICY_NICKNAME[trust]||trust}" : '') +
      (source ? [*source].map{|x| " --source \"#{x}\""}.join : '') +
      (append ? (' '+append) : '')
  end



  # Return a lookup hash of all the gems installed on the system,
  # by running the system command 'sudo gem list'.
  #
  # - hash key is a gem name.
  # - hash value is an array of the gem's installed version numbers.

  def self.sudo_gem_list
    @sudo_gem_list=`sudo gem list`.split(/\n/).map{|line| line.split(/[ \,\(\)]+/)}.inject({}){|h,v| h[v[0]]=v[1,v.length]; h}
  end


  # Return true iff the sudo_gem_list hash shows a given gem is installed.

  def self.sudo_gem_list_installed?(ops)
    name,version = [:name,:version].map{|k| ops[k]||ops[k.to_s]}
    self.sudo_gem_list[name] and (!version or self.sudo_gem_list[name].include?(version))
  end
  
end

