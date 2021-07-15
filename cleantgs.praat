corpusdir$ = "/media/fernenri/1A46-9D0A/both/speakers_german/"
out$= "/media/fernenri/1A46-9D0A/both/cleantgs/"
tgstrings= Create Strings as file list: "list", corpusdir$+ "/*.TextGrid"
noFiles = Get number of strings
for i to noFiles
	filename$ = Get string... i
	noext$=replace$ (filename$, ".TextGrid", "", 0)
	tg= Read from file: corpusdir$ + "/" + filename$
	ntiers= Get number of tiers
		for itier to ntiers
		tiername$= Get tier name: itier
			if tiername$= "words" or tiername$="vowels"
			Extract one tier: itier
			endif
			selectObject: tg
		endfor
	select all
	minusObject: tg, tgstrings
	new=Merge
	tiername2$= Get tier name: 1
		if not tiername2$ = "words"
		Duplicate tier: 2, 1, "words"
		Remove tier: 3
		endif
	Rename: noext$ + "_clean"
	Save as text file: out$ + "/" + noext$ + "_clean.TextGrid"
	select all
	minusObject: tgstrings
	Remove
	selectObject: tgstrings
endfor
