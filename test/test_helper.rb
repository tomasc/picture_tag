require 'rails'
require 'action_view'
require 'action_view/helpers'
require 'bundler/setup'
require 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'picture_tag'
require 'rubygems'

if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end
