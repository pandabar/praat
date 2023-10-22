# Move files from one folder to another
#Pretty much the simplest script ever

# Directories
source_directory$ = "/home/fernanda/afolder/extracted"
out_directory$ = "/home/fernanda/afolder/extract"
# String list
Create Strings as file list... list 'source_directory$'\*.wav
noFiles = Get number of strings

# Main loop
for ifile to noFiles
select Strings list
filename$ = Get string... ifile
Read from file... 'source_directory$'\'filename$'
Write to WAV file... 'out_directory$'\'filename$'
endfor
