### A Pluto.jl notebook ###
# v0.19.19

using Markdown
using InteractiveUtils

# ╔═╡ a2cb957f-c8eb-4e0f-a1e5-3e37f2b7bd27
begin
	using PlutoUI
	using PlutoTeachingTools
end

# ╔═╡ 57ab0ed2-01fe-42f1-9d49-19215acaf616
using Downloads

# ╔═╡ 777185cc-b116-11ec-218d-453c13034275
md"""# Basics for research: collections of data


We'll continue to work in the Julia REPL in this exercise. Use this  Pluto notebook to review, or to experiment with some self-correcting examples.

!!! note "Summary of content in this notebook"

	1. Collections of data, conditions and loops
	2. Filtering and mapping collections


"""

# ╔═╡ 7f697e14-3ad9-4961-bb73-95944f51a429
md"""## 1. Collections of data, conditions and loops

Let's review the function we wrote in [the notebook on nouns and verbs of Julia](https://neelsmith.github.io/why_we_code/notebooks/session1/session1anb.html).  Recall that we provide one string parameter, and get back an alphabetized list of words.
"""

# ╔═╡ 8987603f-7a1f-411d-a1d8-28ab2fe10d23
"Break up `s` into a list of words, and sort the list."
function wordlist(s)
	words = split(s) |> unique
	sort(words)
end

# ╔═╡ c523cfe0-d986-44d6-81d7-5e07dacd5107
wordlist("I have miles to go before I sleep.")

# ╔═╡ 506ab751-3df3-4231-8267-8b15af4567a3
md"""
Creating an alphabetized wordlist for a text is a useful scholarly function that is *not* built in to the Julia language.  Even the short example we just wrote should be prompting some questions.  Should we distinguish upper and lower case?  Should we include punctuation characters like the period in `sleep.` in the above example?  We'll consider some of these questions in session 2.  In this notebook, we'll learn more about working with collections of data.

### Downloading from the internet

Before we do, let's see how to download content from the internet so that we aren't limited to what we can type at the keyboard! We'll use the `Downloads` package that is part of the Julia language but not loaded by default until you include it with the `using` keyword.

"""

# ╔═╡ 7378c4bb-9303-4201-830d-ac3c8a09fb78
md"""
You can use the function `Downloads.download` with one parameter: a URL to download.

Let's get an early look at the text of the Gettysburg Address that our next session will focus on.
"""

# ╔═╡ 335de2a3-730c-48d0-bbaa-87183291680c
url = "https://raw.githubusercontent.com/neelsmith/why_we_code/main/data/lincoln/hay.txt"

# ╔═╡ e40b98bf-1aa5-402f-8cfd-8b603ed11e48
Downloads.download(url)

# ╔═╡ 4617a47e-a8d6-4a0f-afa3-99e6a6a64eda
md"""As you can probably tell, the function has given us the name of the file where it downloaded our content.  We next need to use the `read` function to read the contents of the donwloaded file.
"""

# ╔═╡ 14c91157-c923-4eb9-8df7-087bab3b4d92
Downloads.download(url) |> read

# ╔═╡ 895d5f0e-d78b-406f-abc5-50f065e526a5
md"""Hmmm.  Those results are not quite what we want yet: `read` actually creates a Vector of bytes (which are integer values in Julia), not text.  So one more function: `String` (with a capital S) will convert those bytes for us.
"""

# ╔═╡ a83976a1-bf57-4350-8138-f46cf34a983f
Downloads.download(url) |> read |> String

# ╔═╡ e53ee8d2-4e6a-4de7-833d-d8f4710535d2
md"""That looks more like what we want!

Note that we have easily strung three basic functions together and gone from a URL to a String value with the contents of the remote file.  That's great -- but again, a common enough task for us that we may as well encapsulate the idea of reading String data from a URL in a new function of our own.  The following creates a function named `string_dl` (for "string download").

"""

# ╔═╡ e61b5a71-6a76-4715-bf76-647afecd8c91
"Download content of `url` and read it into a string value."
function string_dl(url)
	Downloads.download(url) |> read |> String
end

# ╔═╡ 059a032b-7452-4f6b-a6c0-cab9ba314042
md"""It's natural and easy to use our two functions together.  Conceptually, we want to (1) download the Gettsyburg Address, and (2) create an alphabetized word list from it.  Now we can express that directly in Julia:
"""

# ╔═╡ 0f5058fe-ffc3-43c5-a6c0-868ff72ae149
vocablist = string_dl(url) |> wordlist

# ╔═╡ 6ce0474d-4240-4294-8bc2-50376dfd76d9
md""" ### Looking at items in a collection

We might like to know how many any items are in our collection.  The `length` function that you have already encountered works with any kind of list.  (That's actually why it works with strings:  under the hood, a String is just a list of characters!) 
"""

# ╔═╡ 255e94bc-4dd5-4168-8296-3c9f9cecdee6
length(vocablist)

# ╔═╡ ea830b21-c035-4b4a-92d9-c987c0617697
md"""We have just answered the question, "How big is the vocabulary of the Gettysburg Address?"  -- a meaningful question for us to think about in our second session.


You can refer to individual items in a list using a numeric index value between square brackets.  The next cell, for example, first the alphabetically first word in the text:
"""

# ╔═╡ 7ea880b7-fdaa-4009-b9d7-704203b1bac3
vocablist[1]

# ╔═╡ 82812e47-8f3b-4f91-a874-dac2154574ed
md"""The second alphabetized word is just `vocablist[2]`, and so forth.  Julia includes a handy short-hand for referring to the last item in a list.
"""

# ╔═╡ 788a2138-1569-4933-871e-5d68159b8dd5
vocablist[end]

# ╔═╡ 5a7d0145-267f-4f7d-9956-0489be8ce6fd
md"""### Testing conditions

One question we'll consider in our next session is whether word length helps us define stylistic habits.  In simplest terms: does an author use big words?

We answer that question for a particular word by asking if a word is longer than some threshhold or cutoff point.  In Julia, we can express that with the `>` function.

"""

# ╔═╡ ea8ab664-2fe2-4cdf-a1d9-6d8d77fe7c61
threshhold = 9

# ╔═╡ 7c8a9cf3-9892-4734-8aae-5e48199fff46
>(length(vocablist[1]), threshhold)

# ╔═╡ 31943c2b-ae63-4a9c-8387-52a21dba2414
md"""Recall that `vocablist[1]` is `"But"` -- way shorter than 9 characters!

But again the parentheses may make this function awkward to read.  Let's take advantage of another Julia formatting option:  when a function has *two* parameters, say 'A' and 'B', we can invoke as `A function B`.  This is exactly equivalent to `function(A,B)`, as you can see in the more readable following cell:
"""

# ╔═╡ 0a53480b-35f7-41f8-9e23-799d623ac474
length(vocablist[1]) >  threshhold

# ╔═╡ f81bd4bf-4b08-4390-a228-bdc1b81aec22
md"""And let's note what kind of value the `>` returns."""

# ╔═╡ d58f915a-4ed3-4f5f-8454-931e30c0155c
typeof(length(vocablist[1]) >  threshhold )

# ╔═╡ 1e568f29-bf32-4fbb-a143-2505649cf658
md"""`Bool` (short for "Boolean", in honor of the mathematician [George Boole](https://en.wikipedia.org/wiki/George_Boole))) is a type that can only have two possible values:  `true` or `false`.  Note that these are *not* Strings!
"""

# ╔═╡ 44e45c95-2dbb-4086-8326-4df802bf06b3
md"""### `for` loops

It's common to process every item in a collection.  In the second half of this notebook, we'll look at two important functions, `filter` and `map`, that work on entire collections, but there are times when you will want to process each item in  a collection.  Julia meets this need with the `for` loop. The general form is

```
for VARIABLE_NAME in COLLECTION
	EXPRESSION
end
```

The `for` loop cycles through every item in your collection, and assigns it to the variable name you supply.  Let's see how we can use a `for` to find the *longest* word in our vocabulary list from the Gettysburg Address.

"""

# ╔═╡ 535de6fb-d0df-4ca9-8565-f149657cf8f1
md"""
We'll define a function called `longest` that will look at every item in a list and return the length of longest term in the lexicon.   

We'll start by creating two variables:  `maxlength` records the length of the longest word we have encountered;  to start with, it will be `0`;  `longestseen` is the longest string we have seen so far; to start with, it will be the empty string `""`.  We can then use a `for` loop to consider every word in the list successively.  If it is longer than the longest seen so far, we will assign the word to our `longestseen` variable, record its length in the variable `maxlength`.

Finally, we'll remember to put the answer to our question, "What is the longest word in the list?" on the last line of our function so that will be returned as the value of the function.
"""

# ╔═╡ bff18092-41e9-40c9-9e84-6358832677df
md"""When we try it on the Gettysburg Address, we can see that the longest term is 11 characters long."""

# ╔═╡ 038a02ae-24db-4185-8bca-2e0ebea580a4
"Find length of longest string in `wordlist`."
function longest(wordlist)
    longestseen = 0
    for word in wordlist
        if length(word) > longestseen
            longestseen = length(word)
        end
    end
    longestseen
end

# ╔═╡ b8a93192-60a1-4700-989e-bb07be35b66b
longest(vocablist)

# ╔═╡ 6b15e51d-8f27-4a4f-a179-027ed7aa6821
md"""## 2. Filtering and mapping collections



"""

# ╔═╡ 4002b30b-7b8a-4fc4-b924-820a46238e26
md"""
Maybe filter chars!

Map words to lower case

"""

# ╔═╡ 64769358-4854-4161-b4a0-d17877c91181
gburg = string_dl(url)

# ╔═╡ 7308ed18-1283-489a-ba9c-b89ff3f3e838
filter(c -> ! ispunct(c), gburg) |> length

# ╔═╡ 6d462a7d-67fd-40ea-972d-3fc25c5ff1c9
lowercase(gburg) |> wordlist |> length

# ╔═╡ 1f8b636c-3c57-46f8-802a-30de44b7ee37
lcwords = lowercase(gburg) |> wordlist

# ╔═╡ 3e320b9b-f961-42e6-8380-73ddd544d829
lenn = map(wd -> length(wd), lcwords) |> maximum

# ╔═╡ eff606c2-3572-48ce-890b-3d37fdb0ae4a
filter(wd -> length(wd) == 11, vocablist)

# ╔═╡ 9e5793e4-d22f-4229-be58-cddf94b57c98
md"""



## The two functions that do most of your scholarship

map(w -> length(w), wds) 

Expanded form:

counts = map(wds) do w
       (w, length(w))
       end

maximum(counts)       
using Statistics
mean(counts)


wordcounts = map(wds) do w
       (w, length(w)))
end

function longestn(wordlist, n)
    wordcounts = map(wds) do w
       (w, length(w))
    end
    sorted = sort(wordcounts, by = pair -> pair[2]) |> reverse
    sorted[1:n]
end


filter(wordcounts) do (w, c)
    startswith(w, "consecr")
end
"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
Downloads = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoTeachingTools = "~0.1.4"
PlutoUI = "~0.7.38"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.8.4"
manifest_format = "2.0"
project_hash = "0fa8664b3f32988b5dbc6b68c31157836ded4bf5"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"
version = "1.1.1"

[[deps.Artifacts]]
uuid = "56f22d72-fd6d-98f1-02f0-08ddc0907c33"

[[deps.Base64]]
uuid = "2a0f44e3-6c83-55bd-87e4-b1978d98bd5f"

[[deps.ColorTypes]]
deps = ["FixedPointNumbers", "Random"]
git-tree-sha1 = "024fe24d83e4a5bf5fc80501a314ce0d1aa35597"
uuid = "3da002f7-5984-5a60-b8a6-cbb66c0b333f"
version = "0.11.0"

[[deps.CompilerSupportLibraries_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "e66e0078-7015-5450-92f7-15fbd957f2ae"
version = "1.0.1+0"

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "FileWatching", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"
version = "1.6.0"

[[deps.FileWatching]]
uuid = "7b1f6079-737a-58dc-b8bc-7a2ca5c1b5ee"

[[deps.FixedPointNumbers]]
deps = ["Statistics"]
git-tree-sha1 = "335bfdceacc84c5cdf16aadc768aa5ddfc5383cc"
uuid = "53c48c17-4a7d-5ca2-90c5-79b7896eea93"
version = "0.8.4"

[[deps.Hyperscript]]
deps = ["Test"]
git-tree-sha1 = "8d511d5b81240fc8e6802386302675bdf47737b9"
uuid = "47d2ed2b-36de-50cf-bf87-49c2cf4b8b91"
version = "0.0.4"

[[deps.HypertextLiteral]]
git-tree-sha1 = "2b078b5a615c6c0396c77810d92ee8c6f470d238"
uuid = "ac1192a8-f4b3-4bfe-ba22-af5b92cd3ab2"
version = "0.9.3"

[[deps.IOCapture]]
deps = ["Logging", "Random"]
git-tree-sha1 = "f7be53659ab06ddc986428d3a9dcc95f6fa6705a"
uuid = "b5f81e59-6552-4d32-b1f0-c071b021bf89"
version = "0.2.2"

[[deps.InteractiveUtils]]
deps = ["Markdown"]
uuid = "b77e0a4c-d291-57a0-90e8-8db25a27a240"

[[deps.JSON]]
deps = ["Dates", "Mmap", "Parsers", "Unicode"]
git-tree-sha1 = "3c837543ddb02250ef42f4738347454f95079d4e"
uuid = "682c06a0-de6a-54ab-a142-c8b1cf79cde6"
version = "0.21.3"

[[deps.LaTeXStrings]]
git-tree-sha1 = "f2355693d6778a178ade15952b7ac47a4ff97996"
uuid = "b964fa9f-0449-5b57-a5c2-d3ea65f4040f"
version = "1.3.0"

[[deps.LibCURL]]
deps = ["LibCURL_jll", "MozillaCACerts_jll"]
uuid = "b27032c2-a3e7-50c8-80cd-2d36dbcbfd21"
version = "0.6.3"

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"
version = "7.84.0+0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"
version = "1.10.2+0"

[[deps.Libdl]]
uuid = "8f399da3-3557-5675-b5ff-fb832c97cbdb"

[[deps.LinearAlgebra]]
deps = ["Libdl", "libblastrampoline_jll"]
uuid = "37e2e46d-f89d-539d-b4ee-838fcccc9c8e"

[[deps.Logging]]
uuid = "56ddb016-857b-54e1-b83d-db4d58db5568"

[[deps.Markdown]]
deps = ["Base64"]
uuid = "d6f4376e-aef5-505a-96c1-9c027394607a"

[[deps.MbedTLS_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "c8ffd9c3-330d-5841-b78e-0817d7145fa1"
version = "2.28.0+0"

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"
version = "2022.2.1"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"
version = "1.2.0"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"
version = "0.3.20+0"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "621f4f3b4977325b9128d5fae7a8b4829a0c2222"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.4"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"
version = "1.8.0"

[[deps.PlutoTeachingTools]]
deps = ["LaTeXStrings", "Markdown", "PlutoUI", "Random"]
git-tree-sha1 = "e2b63ee022e0b20f43fcd15cda3a9047f449e3b4"
uuid = "661c6b06-c737-4d37-b85c-46df65de6f69"
version = "0.1.4"

[[deps.PlutoUI]]
deps = ["AbstractPlutoDingetjes", "Base64", "ColorTypes", "Dates", "Hyperscript", "HypertextLiteral", "IOCapture", "InteractiveUtils", "JSON", "Logging", "Markdown", "Random", "Reexport", "UUIDs"]
git-tree-sha1 = "670e559e5c8e191ded66fa9ea89c97f10376bb4c"
uuid = "7f904dfe-b85e-4ff6-b463-dae2292396a8"
version = "0.7.38"

[[deps.Printf]]
deps = ["Unicode"]
uuid = "de0858da-6303-5e67-8744-51eddeeeb8d7"

[[deps.REPL]]
deps = ["InteractiveUtils", "Markdown", "Sockets", "Unicode"]
uuid = "3fa0cd96-eef1-5676-8a61-b3b8758bbffb"

[[deps.Random]]
deps = ["SHA", "Serialization"]
uuid = "9a3f8284-a2c9-5f02-9a11-845980a1fd5c"

[[deps.Reexport]]
git-tree-sha1 = "45e428421666073eab6f2da5c9d310d99bb12f9b"
uuid = "189a3867-3050-52da-a836-e630ba90ab69"
version = "1.2.2"

[[deps.SHA]]
uuid = "ea8e919c-243c-51af-8825-aaa63cd721ce"
version = "0.7.0"

[[deps.Serialization]]
uuid = "9e88b42a-f829-5b0c-bbe9-9e923198166b"

[[deps.Sockets]]
uuid = "6462fe0b-24de-5631-8697-dd941f90decc"

[[deps.SparseArrays]]
deps = ["LinearAlgebra", "Random"]
uuid = "2f01184e-e22b-5df5-ae63-d93ebab69eaf"

[[deps.Statistics]]
deps = ["LinearAlgebra", "SparseArrays"]
uuid = "10745b16-79ce-11e8-11f9-7d13ad32a3b2"

[[deps.TOML]]
deps = ["Dates"]
uuid = "fa267f1f-6049-4f14-aa54-33bafae1ed76"
version = "1.0.0"

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"
version = "1.10.1"

[[deps.Test]]
deps = ["InteractiveUtils", "Logging", "Random", "Serialization"]
uuid = "8dfed614-e22c-5e08-85e1-65c5234f0b40"

[[deps.UUIDs]]
deps = ["Random", "SHA"]
uuid = "cf7118a7-6976-5b1a-9a39-7adc72f591a4"

[[deps.Unicode]]
uuid = "4ec0a83e-493e-50e2-b9ac-8f72acf5a8f5"

[[deps.Zlib_jll]]
deps = ["Libdl"]
uuid = "83775a58-1f1d-513f-b197-d71354ab007a"
version = "1.2.12+3"

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"
version = "5.1.1+0"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"
version = "1.48.0+0"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
version = "17.4.0+0"
"""

# ╔═╡ Cell order:
# ╟─a2cb957f-c8eb-4e0f-a1e5-3e37f2b7bd27
# ╟─777185cc-b116-11ec-218d-453c13034275
# ╠═7f697e14-3ad9-4961-bb73-95944f51a429
# ╠═8987603f-7a1f-411d-a1d8-28ab2fe10d23
# ╠═c523cfe0-d986-44d6-81d7-5e07dacd5107
# ╟─506ab751-3df3-4231-8267-8b15af4567a3
# ╠═57ab0ed2-01fe-42f1-9d49-19215acaf616
# ╟─7378c4bb-9303-4201-830d-ac3c8a09fb78
# ╠═335de2a3-730c-48d0-bbaa-87183291680c
# ╠═e40b98bf-1aa5-402f-8cfd-8b603ed11e48
# ╟─4617a47e-a8d6-4a0f-afa3-99e6a6a64eda
# ╠═14c91157-c923-4eb9-8df7-087bab3b4d92
# ╟─895d5f0e-d78b-406f-abc5-50f065e526a5
# ╠═a83976a1-bf57-4350-8138-f46cf34a983f
# ╟─e53ee8d2-4e6a-4de7-833d-d8f4710535d2
# ╠═e61b5a71-6a76-4715-bf76-647afecd8c91
# ╟─059a032b-7452-4f6b-a6c0-cab9ba314042
# ╠═0f5058fe-ffc3-43c5-a6c0-868ff72ae149
# ╟─6ce0474d-4240-4294-8bc2-50376dfd76d9
# ╠═255e94bc-4dd5-4168-8296-3c9f9cecdee6
# ╟─ea830b21-c035-4b4a-92d9-c987c0617697
# ╠═7ea880b7-fdaa-4009-b9d7-704203b1bac3
# ╟─82812e47-8f3b-4f91-a874-dac2154574ed
# ╠═788a2138-1569-4933-871e-5d68159b8dd5
# ╟─5a7d0145-267f-4f7d-9956-0489be8ce6fd
# ╠═ea8ab664-2fe2-4cdf-a1d9-6d8d77fe7c61
# ╠═7c8a9cf3-9892-4734-8aae-5e48199fff46
# ╟─31943c2b-ae63-4a9c-8387-52a21dba2414
# ╠═0a53480b-35f7-41f8-9e23-799d623ac474
# ╟─f81bd4bf-4b08-4390-a228-bdc1b81aec22
# ╠═d58f915a-4ed3-4f5f-8454-931e30c0155c
# ╟─1e568f29-bf32-4fbb-a143-2505649cf658
# ╟─44e45c95-2dbb-4086-8326-4df802bf06b3
# ╟─535de6fb-d0df-4ca9-8565-f149657cf8f1
# ╠═bff18092-41e9-40c9-9e84-6358832677df
# ╠═038a02ae-24db-4185-8bca-2e0ebea580a4
# ╠═b8a93192-60a1-4700-989e-bb07be35b66b
# ╠═6b15e51d-8f27-4a4f-a179-027ed7aa6821
# ╠═4002b30b-7b8a-4fc4-b924-820a46238e26
# ╠═64769358-4854-4161-b4a0-d17877c91181
# ╠═7308ed18-1283-489a-ba9c-b89ff3f3e838
# ╠═6d462a7d-67fd-40ea-972d-3fc25c5ff1c9
# ╠═1f8b636c-3c57-46f8-802a-30de44b7ee37
# ╠═3e320b9b-f961-42e6-8380-73ddd544d829
# ╠═eff606c2-3572-48ce-890b-3d37fdb0ae4a
# ╠═9e5793e4-d22f-4229-be58-cddf94b57c98
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
