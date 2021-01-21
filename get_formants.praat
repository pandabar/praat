#Get formants from vowel files
#This means that your files are just a single vowel, nothing else.

#Directories

sound_directory$ = "/home/fernanda/afolder"

#Creates table
table_ID = Create Table with column names: "data", 0, "vowel F1 F2"

#Opening files
strings = Create Strings as file list: "list", sound_directory$ + "/*.wav"
numberOfFiles = Get number of strings

for ifile to numberOfFiles
	selectObject: strings
	fileName$ = Get string: ifile
	wav_file_ID = Read from file: sound_directory$ + "/" + fileName$

#Creates formant objects to get values
formant_ID = To Formant (burg): 0.0, 5, 5500, 0.025, 50

selectObject: formant_ID
f1 = Get value at time: 1, 0.05, "Hertz", "Linear"
f2 = Get value at time: 2, 0.05, "Hertz", "Linear"

#Filling out the table with corresponding values
selectObject: table_ID
Append row
Set string value: ifile, "vowel", fileName$
Set numeric value: ifile, "F1", f1
Set numeric value: ifile, "F2", f2
endfor

#Saving table as file (it will land on the same folder). 
selectObject: table_ID
Save as comma-separated file: sound_directory$ + "/voweldata.csv"

