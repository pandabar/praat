#Concatenator#
#By Fernanda Barrientos - University of Manchester#
#Description: it creates stimuli for AX experiments where  we have only vowel sounds.
#We get stimuli with 1500 ISI
#The wav files are called "vocala.wav", "vocali.wav", "vocalu.wav"

# Directories: sound_directory$ has the vowels in question; out_directory$ is where the new stimuli will be saved.
sound_directory$ = "/home/fernanda/afolder/vowels_original"
out_directory$ = "/home/fernanda/afolder/test"

# String list
Create Strings as file list: "list", sound_directory$ + "/*.wav"
noFiles = Get number of strings

# Main loop
for ifile to noFiles
select Strings list
filename$ = Get string... ifile

vowel$ = mid$ (filename$, 6, 1)

#for loop to open the vowel files

stim1= Read from file: sound_directory$ + "/"  + filename$
#if loop: here we define which vowel goes with which. Let's assume that we only want a to be compared against the other vowels
#and itself

if vowel$ == "a"

#we create an ISI of 1500 ms
isi1500= Create Sound from formula: "1500", 1, 0, 1.5, 44100, "0"

#we open the files
stim2a= Read from file: sound_directory$ + "/"  + "vocali.wav"
Rename: "i"
name2a$= selected$ ("Sound")

stim2b=Read from file: sound_directory$ + "/"  + "vocalu.wav"
Rename: "u"
name2b$= selected$ ("Sound")

selectObject: stim1
stim2c= Copy: "a"
name2c$ = selected$("Sound")

# Concatenate 
selectObject: stim1, isi1500, stim2a
Concatenate
Write to WAV file: out_directory$ + "/" + vowel$ + "1500" + name2a$ + ".wav"

selectObject: stim1, isi1500, stim2b
Concatenate
Write to WAV file: out_directory$ + "/" + vowel$ + "1500" + name2b$ + ".wav"

selectObject: stim1, isi1500, stim2c
Concatenate
Write to WAV file: out_directory$ + "/" + vowel$ + "1500" + name2c$ + ".wav"

endif

# Remove before next iteration of for loop
select all
minus Strings list
Remove
endfor
