#!/usr/bin/lua
require 'getopt'

--getopt.usage();
opts = getopt.getopt( arg)
for k, v in pairs(opts) do
  print( k, v )
end
