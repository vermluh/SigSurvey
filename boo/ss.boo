import System
import System.IO

path = argv[0]
dir = string.Empty
files = DirectoryInfo(path).GetFiles("*.cs", SearchOption.AllDirectories)
Array.Reverse(files)
for fi in files :
  localDir = fi.DirectoryName
  if localDir != dir :
    print string("-".ToCharArray()[0], 79)
    dir = localDir
    print dir
  
  print fi.Name + ":"
  print /[^{};]/.Replace(File.ReadAllText(fi.FullName), string.Empty)  