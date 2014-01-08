require 'rubygems'
require 'bundler/setup'
require 'vcr'
require 'logger'

require_relative '../lib/kublai'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/fixtures/vcr_cassettes'
  c.hook_into :webmock
end


