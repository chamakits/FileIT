require 'fileutils'

def makeAllNonExistentDirectories(path)
  path =File.expand_path(path)
  
  if not File.exist? path
    top = File.dirname(path)
    makeAllNonExistentDirectories(top)
    Dir.mkdir(path)  
  end
end

def isFileType(file, extension)
  return ("."+extension).eql? File.extname(file)
end

def getFilesOfTypeRecursively(directory,extension,recurse)
  directory= File.expand_path(directory)
  arrayOfFiles = Array.new
  files = Dir.entries(directory)
  files.delete(".")
  files.delete("..")
  files.each do 
  |file|
  
  file = File.join(directory,file)
  
    if File.directory?(file)
      arrayFromRecursion = getFilesOfTypeRecursively(file,extension,recurse)
      arrayFromRecursion.each do 
      |element|
        arrayOfFiles << element
      end
    end
    if isFileType(file, extension)    
      arrayOfFiles << file
    end
    
  end
  
  return arrayOfFiles
end

def moveFilesOfTypeFromTo(directoryFrom,directoryTo,extension,recurse=false)
  arrayOfFiles = getFilesOfTypeRecursively(directoryFrom,extension,recurse)
  makeAllNonExistentDirectories(directoryTo)
  arrayOfFiles.each do |file|
    fileName = File.basename(file)
    FileUtils.mv(file,File.join(directoryTo,fileName))
  end
end

def actOnMode(from,to,mode)
  if mode.eql? "m"
    FileUtils.mv(from,to)
  elsif mode.eql? "c"
    FileUtils.cp(from,to)
  elsif mode.eql? "s"
    puts from + " >> " + to
  end
end

def moveOrCopyFilesOfType(directoryFrom,directoryTo,extension,recurse,mode)
  arrayOfFiles = getFilesOfTypeRecursively(directoryFrom,extension,recurse)
  makeAllNonExistentDirectories(directoryTo)
  arrayOfFiles.each do 
  |file|
    fileName = File.basename(file)
    actOnMode(file,File.join(directoryTo,fileName),mode)
  end
end

def moveToExtensionBasedFolder(directoryFrom,extension,moveToMoveItFolder,recurse,mode="s")
  appName = "moveIT"
  appBasedDir = appName+"_folder"
  if moveToMoveItFolder
    directoryTo = File.join(directoryFrom,appBasedDir)
    makeAllNonExistentDirectories(directoryTo)
  end
#  moveFilesOfTypeFromTo(directoryFrom, File.join(directoryTo,extension), extension,recurse)
  moveOrCopyFilesOfType(directoryFrom, File.join(directoryTo,extension), extension, recurse, mode)
end

def moveFromTo(from,to,extension,moveToMoveItFolder,recurse,mode="s")
  appName = "moveIT"
  appBasedDir = appName+"_folder"
  if to.eql? "DEFAULT"
    to = from
  end
  if moveToMoveItFolder
    to = File.join(to,appBasedDir)
    makeAllNonExistentDirectories(to)
  end
  moveOrCopyFilesOfType(from, File.join(to,extension), extension, recurse, mode)
end
