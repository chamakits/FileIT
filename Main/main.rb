#!/usr/bin/ruby
require '/home/chamakits/dev/sources/ruby/workspace/beginners/FileIT/Functions/movingFile'


def getDirFrom
  return ARGV.to_a[0]
end

def getExtension
  return ARGV.to_a[1]
end

def getToAppFolder?
  return ARGV.to_a[2]
end

def getRecurse?
  return ARGV.to_a[3]
end

def getMode?
  return ARGV.to_a[4]
end

from = File.expand_path(getDirFrom)
ext = getExtension
toAppFolder = getToAppFolder?.eql? "t"
recurse = getRecurse?.eql? "t"
mode = getMode?

moveToExtensionBasedFolder(from,ext,toAppFolder,recurse,mode)