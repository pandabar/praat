# Open grid with values
tb=Read Table from whitespace-separated file: "grid.txt" # path to the grid file goes here

# Start looping through the Table rows to get values
selectObject: tb
nrows= Get number of rows
for irow to nrows
selectObject: tb
f1hz= Get value: irow, "f1herz"
f1bwhz= Get value: irow, "f1herzbw"
f2hz= Get value: irow, "f2herz"
f2bwhz= Get value: irow, "f2herzbw"
f3hz= Get value: irow, "f3herz"
f3bwhz= Get value: irow, "f3herzbw"
f4hz= Get value: irow, "f4herz"
f4bwhz= Get value: irow, "f4herzbw"

# Create KG
Create KlattGrid... "bao" 0 0.4 4 0 0 0 0 0 0

#add formant loci for /b/, from 0 to 0.03s is closure

Add oral formant frequency point... 1 0.03 220
Add oral formant bandwidth point... 1 0.03 89
Add oral formant frequency point... 2 0.03 720
Add oral formant bandwidth point... 2 0.03 49

#add voicing amplitude, vowel formants, and pitch targets

Add voicing amplitude point... 0.0 60
Add voicing amplitude point... 0.03 90
Add voicing amplitude point... 0.35 90
Add voicing amplitude point... 0.4 60

Add pitch point... 0.0 220
Add pitch point... 0.15 240
Add pitch point... 0.4 180

Add oral formant frequency point... 1 0.05 f1hz
Add oral formant frequency point... 1 0.05 f1bwhz
Add oral formant frequency point... 2 0.05 f2hz
Add oral formant frequency point... 2 0.05 f2bwhz
Add oral formant frequency point... 3 0.03 f3hz
Add oral formant frequency point... 3 0.03 f3bwhz
Add oral formant frequency point... 4 0.03 f4hz
Add oral formant frequency point... 4 0.03 f4bwhz

#synthesis

To Sound
Save as WAV file: "stimuli/" + string$(irow)+ ".wav"
selectObject: tb
endfor
