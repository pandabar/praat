# praat
Here you can find several scripts that I have used for different purposes. 
<ul>
  <li><b>Klaatcont</b>: this script creates a continuum between two vowels using Klatt grids. The results are not wonderful (the resulting sounds are not very human-like) but if you add more parameters (pitch, more formants, etc) then it should sound a bit better.</li>
  <li><b>Concatenator</b>: unfortunately, when it comes to concatenating sounds, Praat can be a bit annoying since the elements to be concatenated must show in the Objects window in the desired order.</li>
  <li><b>Continuum</b>: this is the same as Klattcont but with resynthesis instead of the Klatt grid. The results are even worse, although I think you can get better results if the source comes from a vowel that is similar to the target vowel. </li>
  <li>The <b>extractor</b> takes a .wav file and a TextGrid and extracts intervals according to a given criterion.</li>
  <li>Both <b>Get_formants</b> and <b>Vowels</b> will give you a table with formant values. The former takes a bunch of .wav files consisting of one single vowel, and <b>Vowels</b> takes a long sound file with its corresponding TextGrid and yields a table with the formant values and duration of all the vowels in it. <b>Vowels</b> needs a TextGrid with two tiers (CV and (IPA), and it does not extract the sounds, so you don't end up with a lot of objects in your Objects window. </li>
  <li>Both <b>move files</b> and <b>scaling</b> do not need too much explanation (respectively, they move files from one folder to another, and scale all files to 70 dB).</li>
  <li><b>textgrid_creator</b> Generates TextGrids for an entire batch of sound files. The assumption is that all the words have the same number of segments (the script assumes 5) so the generated TexGrids have 4 boundaries each. The script <b>semiautoann</b> goes one step further and feeds the TextGrid with the corresponding labels, which come from a Strings list. For this you need the sound files and a plain .txt file with the transcription.</li>
</ul>
