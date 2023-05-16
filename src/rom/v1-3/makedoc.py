#Extract Inline Documentation from Assembly Language files

import glob
import sys

source = "*.asm"
docname = "readme.md"

doc = ["# MX BASIC Documentation #", "", "Generated by %s" % sys.argv[0], ""]
blank = True

for filename in glob.glob(source):
    print("Reading %s" % filename)

    line_no = 0
    for line in open(filename):
        line = line.rstrip()
        if len(line) < 3: next
        if line[:3] == ";;;": 
            line = line[4:]
            doc.append(line)
            blank = False
            next
        if line[:3] == ";--" and not blank: 
            doc.append("")
            doc.append("")
            blank = True
            
text = "\n".join(doc)
docfile = open(docname,"w")
print("Writing %s" % docname)
docfile.write(text)
