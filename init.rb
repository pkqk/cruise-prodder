$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'net/http'
require 'cruise_prodder'

Project.plugin :cruise_prodder