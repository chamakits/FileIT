#!/usr/bin/ruby
require '../Functions/movingFile'

array = getFilesOfTypeRecursively("/home/chamakits/dev/ground/test/ruby","pdf",true)
#puts File.directory? "/home/chamakits/dev/sources/ruby/workspace/beginners/FileIT/Testing/one/"
puts array
