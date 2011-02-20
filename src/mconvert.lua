#!/usr/bin/lua
require 'getopt'

--getopt.usage();
opts = getopt.getopt(arg,getopt.s_options)
for k, v in pairs(opts) do
  print( k, v )
end
