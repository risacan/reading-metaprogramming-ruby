require 'minitest/autorun'
require 'minitest/emoji'
Dir.glob(File.expand_path("../../[0-9]*", __FILE__)).each { |path| $LOAD_PATH.unshift(path) }
