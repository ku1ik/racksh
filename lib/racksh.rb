#!/usr/bin/env ruby

def use(*args, &blk); end
def run(*args, &blk); end
def map(*args, &blk); end

ENV['RACK_ENV'] ||= 'development'

custom_config = ARGV.include?("-c")
config_ru = custom_config ? ARGV[custom_config+1] : 'config.ru'

load config_ru

