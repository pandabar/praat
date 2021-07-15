#Clean TextGrids#
#Fernanda Barrientos - University of Konstanz#
#This script takes a batch of TextGrid files from a corpus that I downoloaded (Gut's LeaP corpus)
#The problemo was, that the TextGrids were not the same: some have 6 tiers, others have 4. 
#But they all have the TGs with the same name and I needed only 2: one called vowels and another called words
#Hence, this script removes the tiers that I don't need and locates the tier "words" always as the first one.

corpusdir$ = "/myfolder/corpusfiles"
out$= "/myfolder/cleantgs/"
tgstrings= Create Strings as file list: "list", corpusdir$+ "/*.TextGrid"
noFiles = Get number of strings

for i to noFiles
	filename$ = Get string... i
	noext$=replace$ (filename$, ".TextGrid", "", 0)
	tg= Read from file: corpusdir$ + "/" + filename$
	ntiers= Get number of tiers
		#this loop extracts the tiers called "words" and "vowels".
		for itier to ntiers
		tiername$= Get tier name: itier
			if tiername$= "words" or tiername$="vowels"
			Extract one tier: itier
			endif
			selectObject: tg
		endfor
	#now we merge the two tiers into a new textgrid.
	select all
	minusObject: tg, tgstrings
	new=Merge
	#this part rearranges the tiers, so that "words" is always the one on top.
	tiername2$= Get tier name: 1
		if not tiername2$ = "words"
		Duplicate tier: 2, 1, "words"
		Remove tier: 3
		endif
	Rename: noext$ + "_clean"
	#this part saves the clean textgrids into a folder that I defined above as out$
	Save as text file: out$ + "/" + noext$ + "_clean.TextGrid"
	select all
	minusObject: tgstrings
	Remove
	selectObject: tgstrings
endfor
