gem_files = [:lib]
  .inject([]) { |t, el| t + `find ./#{el}`.split($/) }
  .push './.version'

Gem::Specification.new 'lux-url' do |gem|
  gem.version     = File.read('.version')
  gem.summary     = 'URL object with extra features'
  gem.description = 'URL object used in Lux framework, allows path attributes and path params'
  gem.homepage    = 'http://github.com/dux/lux-url'
  gem.license     = 'MIT'
  gem.author      = 'Dino Reic'
  gem.email       = 'rejotl@gmail.com'
  gem.files       = gem_files

  gem.executables = []

  # gem.add_runtime_dependency ''
end
