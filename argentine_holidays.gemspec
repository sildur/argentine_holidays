Gem::Specification.new do |s|
  s.name        = 'argentine_holidays'
  s.version     = '0.1'
  s.authors     = ['Roberto Romero']
  s.email       = 'sildurin@gmail.com'
  s.homepage    = 'http://rubygems.org/gems/argentine_holidays'
  s.date        = '2014-02-12'
  s.summary     = 'A library to fetch argentine holidays from the official source'
  s.description = 'A library to fetch argentine holidays from the official source'
  s.files       = ['lib/argentine_holidays.rb']
  s.license       = 'MIT'
  s.add_runtime_dependency 'nokogiri', ">= 1.6.1"
end
