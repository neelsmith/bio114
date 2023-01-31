using Downloads
using PlotlyJS


"Download content of `url` and read it into a string value."
function string_dl(url)
	Downloads.download(url) |> read |> String
end

"True if `c` is not a punctuation character in the Unicode specification."
function notpunct(c)
	! ispunct(c)
end

"Break up `s` into a list of words, and sort the list."
function wordlist(s)
	tidier = filter(notpunct,s)
	words = map(lowercase, tidier) |> split |> unique
	sort(words)
end

"Draw a bar graph from tuples of word lengths."
function plot_tuples(data_pairs, title )
	xlabels = map(pair -> pair[1], data_pairs)
	yvalues = map(pair -> pair[2], data_pairs)
	bardata = bar(x = xlabels, y = yvalues)
	layout = Layout(title = title)
	Plot(bardata, layout)
end

"Split text into clauses, and find their length in words."
function clause_lens(txt)
	oneline = replace(txt, "\n" => " ")
	clauses = split(oneline, ['.', '?', '!', ';', ':'])
	prs = collect(enumerate(clauses))

	map( pr -> (string(pr[1]), length(split(pr[2]))), prs)
end

"Report observations about text found at `src_url`."
function style_report(src_url)
	txt  = string_dl(src_url)
	vocab = wordlist(txt)
	wordlens = map(vocab) do w 
		(w, length(w)) 
	end
	sorted_word_lens = sort(wordlens, by=pair -> pair[2], rev=true)
	clausetuples = clause_lens(txt)
	richness  = length(split(oneline)) / length(vocab) 
	println("""
	Three observations:

	1. Richness of vocabulary (words in text / size of lexicon): $(richness)
	2. Lengths of words in characters (see plot)
	3. Lengths of sentences in words (see plot)


	
	""")
	plot_tuples(sorted_word_lens, "Lengths of words")
	plot_tuples(clausetuples, "Syntactic shape")

end

gburgurl = "https://raw.githubusercontent.com/neelsmith/why_we_code/main/data/lincoln/hay.txt"
roosevelturl = "https://raw.githubusercontent.com/neelsmith/why_we_code/main/data/roosevelt/roosevelt.txt"

style_report(gburgurl)
style_report(roosevelturl)








textlist = [(gburgurl, "Gettysburg Address"), (roosevelturl, "Roosevelt's  'Day of Infamy' speech")]
for text in textlist
	println("Report on $(textlist[2])")
	style_report(text[1])
	println("\n\n")
end

#= Factors contributing to style:

 1. Sentence length  (long sentences!)
 2. Richness of vocabulary (lots of words!)
 3. Vocabulary items' length (big words!)
 =#



#sentencebars = bar(y = sentencelens, x = collect(1:11))
#Plot(sentencebars)


# Richness of vocabulary
#richness  = length(vocab) / length(split(oneline))

#  Vocabulary size
#wordlens



