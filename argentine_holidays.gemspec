Gem::Specification.new do |s|
  s.name        = 'argentine_holidays'
  s.version     = '0.6'
  s.authors     = ['Roberto Romero']
  s.email       = 'sildurin@gmail.com'
  s.homepage    = 'https://github.com/sildur/argentine_holidays'
  s.date        = '2015-03-13'
  s.summary     = 'A library to fetch argentine holidays from the official source'
  s.description = 'A library to fetch argentine holidays from the official source. It takes movable holidays into account'
  s.files       = ['LICENSE', 'lib/argentine_holidays.rb']
  s.license       = 'MIT'
  s.add_runtime_dependency 'nokogiri', '~> 1.6', '>= 1.6.6'
  s.require_paths = ["lib"]
end
