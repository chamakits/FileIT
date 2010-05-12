#!/usr/bin/ruby
require '/home/chamakits/dev/sources/ruby/workspace/beginners/FileIT/Functions/movingFile'


def getDirFrom
  return ARGV.to_a[0]
end

def getDirTo
  return ARGV.to_a[1]
end

def getExtension
  return ARGV.to_a[2]
end

def toAppFolder?
  return ARGV.to_a[3].eql? "t"
end

def recurse?
  return ARGV.to_a[4].eql? "t"
end

def getMode
  return ARGV.to_a[5]
end

from = File.expand_path(getDirFrom)
to = File.expand_path(getDirTo)
ext = getExtension
toAppFolder = toAppFolder?
recurse = recurse?
mode = getMode

moveFromTo(from,to,ext,toAppFolder,recurse,mode)