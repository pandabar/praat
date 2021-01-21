# praat
Here you can find several scripts that I have used for different purposes. 
<ul>
  <li><b>Klaatcont</b>: this script creates a continuum between two vowels using Klatt grids. The results are not wonderful (the resulting sounds are not very human-like) but if you add more parameters (pitch, more formants, etc) then it should sound a bit better.</li>
  <li><b>Concatenator</b>: unfortunately, when it comes to concatenating sounds, Praat can be a bit annoying since the elements to be concatenated must show in the Objects window in the desired order.</li>
  <li><b>Continuum</b>: this is the same as Klattcont but with resynthesis instead of the Klatt grid. The results are even worse, although I think you can get better results if the source comes from a vowel that is similar to the target vowel. </li>
  <li>The <b>extractor</b> takes a .wav file and a TextGrid and extracts intervals according to a given criterion.</li>
  <li>Both <b>Get_formants</b> and <b>Vowels</b> will give you a table with formant values. The former takes a bunch of .wav files consisting of one single vowel, and <b>Vowels</b> takes a long sound file with its corresponding TextGrid and yields a table with the formant values and duration of all the vowels in it. It needs a TextGrid with two tiers (CV and (IPA)</li>
  <li>Both <b>move files</b> and <b>scaling</b> do not need too much explanation. 
  
</ul>
