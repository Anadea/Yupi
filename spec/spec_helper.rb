require 'capybara/rspec'
require 'bundler/setup'

Bundler.require(:default, :test)

require (Pathname.new(__FILE__).dirname + '../lib/yupi').expand_path

Dir['./spec/support/**/*.rb'].each { |file| require file }

RSpec.configure do |config|
  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.include YupiTestHelpers

  config.before(:all) do
    recreate_tmp_directory
  end

  config.before(:each) do
    drop_dummy_database
    remove_project_directory
  end

end
