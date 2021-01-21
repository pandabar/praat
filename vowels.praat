##Vowel Formant and Duration measurement						##
##By Fernanda Barrientos - University of Manchester				##
##This script takes a .WAV file and .Textgrid file from a folder. 		##
##Both files are called "test".										##
##TextGrid must be previously annotated in the  following way:		##
##- A first tier where every vowel is marked as "v"					## 
## -A second tier where each vowel has its corresponding IPA.		##
## This script prints a table to your Info window,					##
## which you can save afterwards by clicking on File > Save as.		##

##Opening files

	wav_file = Read from file... afolder/test.wav
	tg_file = Read from file... afolder/test.TextGrid

appendInfoLine: "Vowel", tab$, "F1_mean", tab$, "F1_mid", tab$, "F2_mean", tab$, "F2_mid", tab$, "Duration"

selectObject: "Sound carta_wav_scaled"
formants= To Formant (burg): 0, 5, 5500, 0.025, 50
selectObject: "TextGrid carta_wav_scaled"
nint= Get number of intervals: 1
for i to nint
label$ = Get label of interval: 1, i
if label$ == "v"
selectObject:  "TextGrid carta_wav_scaled"
	start= Get start time of interval: 1, i
	end= Get end time of interval: 1, i
	total= end-start
	mid= total/2
	ipa$= Get label of interval: 2, i
selectObject: "Formant carta_wav_scaled"
f1mean= Get mean: 1, start, end, "hertz"
f1mid= Get value at time: 1, mid, "hertz", "linear"
f2mean= Get mean: 2, start, end, "hertz"
f2mid= Get value at time: 2, mid, "hertz", "linear"
appendInfoLine: ipa$, tab$, f1mean, tab$, f1mid, tab$, f2mean, tab$, f2mid, tab$, total
endif
selectObject: "TextGrid carta_wav_scaled"
endfor


