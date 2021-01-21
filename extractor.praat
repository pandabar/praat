
#Extractor - By Fernanda Barrientos (UoM), after some shameless copy-pasting from a script bt Mauricio Figueroa (UCL)

#We assume two folders, one called "extract" where the words and corresponding textgrids are.
#The second folder is called "extracted" and it's the one where you want them to land. 

writeInfoLine: "This script is starting..."

#directories

input_directory$ = "/home/fernanda/afolder/extract"
out_directory$ = "/home/fernanda/afolder/extracted"

#Creating a list that will contain the names of the WAV files. Calculating the length of this list.
wav_list_ID = Create Strings as file list: "list", input_directory$ + "/*.wav"
total_strings_wav = Get number of strings

#Same thing (a list) but for the TextGrid files.
tgd_list_ID = Create Strings as file list: "list", input_directory$ + "/*.TextGrid"
total_strings_tgd = Get number of strings

	#Checking that each WAV has its correspondent TextGrid file
	if total_strings_wav > total_strings_tgd
	elsif total_strings_wav < total_strings_tgd
		exit You don't have the same number of Wav and TextGrid files.
	endif

#Loop: opening WAV files and respective TextGrids.
for ifile from 1 to total_strings_wav
	select wav_list_ID
	
	#Obtaining the name of the WAV file and opening it.
	particular_wav_string$ = Get string: ifile
	appendInfoLine: "Dealing with <" + "'particular_wav_string$'" + ">."
	wav_file_ID = Read from file: input_directory$ + "/" + particular_wav_string$
		
	#Accessing list and opening TextGrid file.
	select tgd_list_ID
	particular_tgd_string$ = Get string: ifile
	tgd_file_ID = Read from file: input_directory$ + "/" + particular_tgd_string$
	
#Extracting vowels. Replace the "\" after "starts with" to extract the vowel you want. 
#If you want to extract the same particular vowel from every file, try replacing "matches (regex)" with "equals to" and then just put the vowel you're interesed in (e.g. "a" instead of "e|a|o").
	select tgd_file_ID
	plus wav_file_ID
	Extract intervals where: 1, "no", "matches (regex)",  "e|a|o"
#Saving extracted vowels
clean$ = replace_regex$ (particular_wav_string$, ".wav", "", 0)
Write to WAV file... 'out_directory$'/'clean$'_ext.wav
	Remove
echo Done! Taking next...
	select Strings list
endfor
select all
Remove
appendInfoLine: "Done."

