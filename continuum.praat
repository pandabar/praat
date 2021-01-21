#Vowel continuum maker#
#By Fernanda Barrientos #
#University of Manchester- University of Konstanz#

#Description: creates a 7-step continuum from a source original vowel sound
#and the values of a target vowel sound
#Use with caution! Resynthesis does not sound very well either...


#Directories

#We assume that you have a "vowels_original" folder with 3 .wav files (say, Spanish i, a, u) with original vowels.
#Your script is outside the "vowels_original" folder. 
#Their file names are vocali.wav , vocala.wav, vocalu.wav
#We want to convert these three vowels into other vowels (say, English lax i, ae, wedge).
#You need the formant values for the latter; we will calculate the values for the former here. 
#You also need an empty folder called "vowels_resynthesis", which is where your synthesized files will land.
#It has to be in the same folder as "vowel_original" and this script. 

sound_directory$ = "vowels_original"
out_directory$ = "vowels_resynthesis"

#Formant values. Enter F1 and F2 of target vowels here.

	#English vowels
	laxi_f1 = 480
	laxi_f2 = 2400
	ae_f1 = 750
	ae_f2 = 2350
	wedge_f1 = 780
	wedge_f2 = 1500
	
#Reading files

strings = Create Strings as file list: "list", sound_directory$ + "/*.wav" 
numberOfFiles = Get number of strings

for ifile to numberOfFiles
	selectObject: strings
	filename$ = Get string... ifile
	wav_file = Read from file: sound_directory$ + "/" + filename$
	vowel$ = replace_regex$ (filename$, ".wav", "", 0)

	#Preliminary tasks: resample and peak scaling
	wav_file_resampled = Resample... 11000 50
	Scale peak... 0.99
	
	#LPC to get source
	lpc= To LPC (burg): 16, 0.025, 0.005, 50
	selectObject: wav_file_resampled
	formant_id = To Formant (burg): 0, 5, 5500, 0.015, 50
	selectObject: wav_file_resampled
	plus lpc
	Filter (inverse)
	Rename... Source
	selectObject: formant_id
	f1_vowel = Get mean: 1, 0, 0, "hertz"
	f2_vowel = Get mean: 2, 0, 0, "hertz"
	appendInfoLine: vowel$, tab$, 0, tab$, 0, f1_vowel, tab$, f2_vowel
#Define the difference in formant values

for i from 1 to 7
	selectObject: wav_file_resampled
	formant_id = To Formant (burg): 0, 5, 5500, 0.015, 50
Rename: vowel$
if selected$ ("Formant") == "vocala"
		dif_f1 = f1_vowel - ae_f1
		dif_f2 = f2_vowel - ae_f2
		targetname$ = "ae"
elsif selected$ ("Formant") == "vocali"
		dif_f1 = f1_vowel - laxi_f1
		dif_f2 = f2_vowel - laxi_f2
		targetname$ = "laxi"
else
		dif_f1 = f1_vowel - wedge_f1
		dif_f2 = f2_vowel - wedge_f2
		targetname$ = "wedge"
endif
	
		Formula (frequencies): "if row = 1 then self + (-(dif_f1/6) * (i-1)) else self fi"
		Formula (frequencies): "if row = 2 then self + (-(dif_f2/6) * (i-1)) else self fi"
		appendInfoLine: vowel$, tab$, targetname$, tab$, (dif_f1/6) * (i-1), tab$, (dif_f2/6) * (i-1)
		selectObject: "Sound Source"
		plus formant_id
		Filter
		selectObject: "Sound Source_filt"
		Rename... 'i'
		Write to WAV file: out_directory$ + "/" + vowel$ + "_" + targetname$ + string$(i)  + ".wav"
	endfor

endfor
	
