ENV['RACK_ENV'] ||= 'development'

def use(*args, &blk); end
def run(*args, &blk); end
def map(*args, &blk); end

load ENV['CONFIG_RU']
