import System
import System.IO
import System.Linq.Enumerable

path = argv[0]
files = DirectoryInfo(path).GetFiles("*.cs", SearchOption.AllDirectories)
sortedFiles = files.GroupBy({fi | fi.Directory.FullName}).OrderBy({gf | gf.Key})
for g in sortedFiles :
  print string("-".ToCharArray()[0], 79)
  print g.Key
  for f in g :
    print f.Name + ":"
    print /[^{};]/.Replace(File.ReadAllText(f.FullName), string.Empty)