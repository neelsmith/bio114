### A Pluto.jl notebook ###
# v0.18.4

using Markdown
using InteractiveUtils

# ╔═╡ a2cb957f-c8eb-4e0f-a1e5-3e37f2b7bd27
begin
	using PlutoUI
	using PlutoTeachingTools
end

# ╔═╡ 3c2dbe8c-363c-4ad8-a862-6a74c45808e0
md"""
> Workshop **session 1a** of [*Why we code*](https://neelsmith.github.io/why_we_code/)
"""

# ╔═╡ 777185cc-b116-11ec-218d-453c13034275
md"""# Basics for humanities research: the nouns and verbs of the Julia language


In our first session, we'll introduce some essential ideas for computational study in the humanities.  Working in the Julia REPL (Julia's interactive Read-Evaluate-Print Loop), we'll start by getting familiar with the expressing ideas in Julia using the "nouns and verbs" of the Julia language, *objects* and *functions*.

Using the interactive REPL is one of the best ways to get familiar with Julia, and we'll do that in our workshop, but you can use this  Pluto notebook to review, and to experiment with some self-correcting examples.

!!! note "Summary of content in this notebook"

    1. Objects, values, types, and variables
    2. Functions for working with objects


"""

# ╔═╡ 7f8af184-9753-47de-8660-f07990f247d9
md"""
## 1. Objects, values, types, and variables

*Objects* are the nouns of the Julia language.  Consider the following cell. Its body contains the characters `"Why code?"`.  This is  a valid *expression* in Julia: it defines a single object. Immediately above the cell body, the Pluto notebook server displays the *value* of that expression.
"""


# ╔═╡ efe0e3ed-0c14-48d3-a0fd-d65dba74ee2f
"Why code?"

# ╔═╡ 45f22493-7e17-4bab-bd4c-8dca46a15c01
md"""
So the expression `"Why code?"` has the value  `"Why code?"`? So what?  Look at the next cell.
"""

# ╔═╡ 729b6e3a-8305-4de4-bd46-7a7e951eb718
typeof("Why code?")

# ╔═╡ ca929bdf-dff1-4211-8415-80f69e50b4ef
md"""
The body of this cell is also a valid Julia expression.  We'll look at the pieces of that expression a little later, but for now, let's notice that this expression tells that the *type*  of the expression `"Why code?"` is `String` -- that is, a "string" of characters.

This illustrates an important general point, namely:
"""

# ╔═╡ 04f46f9a-e261-4529-a5a2-91991fdb85d3
md"""
!!! alert "Important"
    ☞ Objects are the nouns of the Julia language; they belong to a specific *type*, and have a specific *value*.
"""

# ╔═╡ 45d123c3-d4e1-4559-8d89-9e3eea0b23ef
md"""Let's look at some further examples. Compare the following two cells.
"""

# ╔═╡ 01320907-7796-4d47-b89b-65a57ec560b1
"12"

# ╔═╡ 7585bac1-7b0d-475a-9e78-29550279fc89
typeof("12")

# ╔═╡ f8516e15-e59e-4cf9-9fe6-739e1c9ef42d
md"Nothing new here: another object with a value of `String` type. But the next cell is different."

# ╔═╡ 73390200-8116-42e2-884f-f456ced5aac7
12

# ╔═╡ c77c0518-75f4-418e-ae5c-209d4485f39e
typeof(12)

# ╔═╡ a3836cbc-4027-4e2a-ac1c-b10cc8de8af4
md"""Here, the expression `12` has a value of another type.  `Int64` is a type for *integer* values.
"""

# ╔═╡ c083fd97-eea8-404a-a18f-8632cefae08c
md"""

!!! warning "？ Question"
    Strings and integers are different types of objects.  How does Julia visually make that difference clear when it displays their values?
"""

# ╔═╡ 893e13dd-ed27-41af-b697-e06a9890b027
md"""
In Julia, we can create a name for an object, called a *variable*, in an *assignment* expression.  An assignment has a three parts: the name, the assignment function `=` and the object, as illustrated here.
"""

# ╔═╡ 0e873f49-a0ee-4d53-a1dd-722316f22c86
poem = "Iliad"

# ╔═╡ 54eb0cab-c557-45fa-9a6a-9edb0f461083
md"""You can read the preceding in cell in English as "*Assign the value* `"Iliad"` *to the variable name* `poem`." """

# ╔═╡ 9ee09c3d-0301-46e5-8bf3-65a895528580
md"""We have in effect added the expression `poem` to the Julia language, and can use it like any other expression.  For example, let's check what type it is."""

# ╔═╡ 26b46878-cded-44a3-8cbe-737c1f761512
typeof(poem)

# ╔═╡ 8225fb68-6e33-40b5-9415-71a5e631412e
md"""
!!! alert "Important"
    ☞ *Variables* are names for an object.  Use  `=` to *assign* an object to a variable.
"""

# ╔═╡ d5cadcdb-85e3-4a66-980d-2ef936d26746
md"""Note that the equals sign means *assignment* in Julia.  Two equals signs create different kind of expression meaning *equality*, as we see in the following cell.
"""

# ╔═╡ 288cf4a9-6f87-4c10-884f-7c44d8d73e27
poem == "Iliad"

# ╔═╡ 08c2184b-631b-4aa4-9c43-cc7f0446a709
md"""### Self quiz

The value of the preceding expression `poem == "Iliad"` is `true`.  Note that it is *not* a quoted String.  In the following cell, replace `missing` with a Julia expression to find out the type of the value `true`"""

# ╔═╡ 61f6a990-31ab-4e38-bb91-372a60dbe5e4
truthy = missing

# ╔═╡ aae31cae-a87c-4479-a7fc-b942d2d7dff2
if !@isdefined(truthy)
	not_defined(:truthy)
elseif ismissing(truthy)
	still_missing()
elseif truthy == typeof(true)
	correct()
else
	keep_working(md"Compare the example above where we found out the type of the value `12`. ")

end

# ╔═╡ 8d437fee-bbb5-437c-9bb2-08edd35c5afc
md"""### A note on using Strings

In Julia, you can compose a String that includes data from other expressions that you identify by surrounding them with parentheses preceded by `$` as the next cell illustrates.  This is called *interpolation*.
"""

# ╔═╡ 3fdcf2d8-8ace-41dc-bb30-54306fe1d8d0
"The $(poem) is my favorite poem."

# ╔═╡ 72ec26e1-7c46-4cac-9fb1-a541ac2604d0
md"""Julia will do its best to represent any kind of expression you interpolate, not just strings.  For example, integers are perfectly readable when they are interpolated."""

# ╔═╡ b22ced73-d044-4c66-b027-6d6f024ca0cc
books = 24

# ╔═╡ c8ffd88d-1883-4791-93b9-9ef1e6b67a0f
"The $(poem) consists of $(books) books."

# ╔═╡ 3aba8b75-b444-429e-837a-f0c59dfec056
md"""To compose a string that stretches over more than one line, you can surround it with triple quotes ."""

# ╔═╡ ceaa9687-8ec8-45d2-ba82-15da1bd38168
longstring = """The $(poem) consists of $(books) books.

So does the Odyssey.
"""

# ╔═╡ 509f113b-97f9-4678-a768-42f4a87f0ac6
md"""## 2. Functions  for working with objects

Functions are the verbs of the Julia language. To use a function, you follow its name with parentheses.

You've already seen an example with the function `typeof`. You include between parentheses any Julia object, and the function produces a Julia type.  The objects you list in parentheses are called *arguments* or *parameters* to the function.  Here, `poem` is the *argument* to the function `typeof`.  The object it produces is called the *result* or the *return value* of the function.

"""

# ╔═╡ 933484a6-85dc-4dfc-896d-ccfbd25108fa
typeof(poem)

# ╔═╡ d957d071-05d6-4cf1-a42c-92bbcfa69c28
md"""
!!! alert "Important"
    ☞ Use *functions* to create a new object; list *arguments* between parentheses.
"""

# ╔═╡ 848ca6e5-05e0-4a22-9ddf-2eb4e27edc1e
md"""
We'll see a few of Julia's many functions for working with textual data in this workshop.  One example is the function `length`. What do you think its result represents?
"""

# ╔═╡ b6cf2be0-0382-4cc2-8a82-8a58b4197ffc
length(poem)

# ╔═╡ c4520790-5fe4-48a4-9f5d-940c04790c61
md"""Since the `length` function created a new object, we can use that directly as an argument to `typeof`, and see that `length` creates an integer object.
"""

# ╔═╡ 5711bc1a-eef7-4beb-8514-665b797c8bb0
typeof(length(poem))

# ╔═╡ 118a9480-f537-4474-b2b2-5d496abe67cc
md"""Because it can become hard to read code when parentheses are nested like the previous cell, Julia also permits an alternative syntax.  If a function has only one argument, you can feed that argument to the function using the "pipe" symbol `|>`.  In this syntax, you do not use parentheses with the function name since the single argument is identified as coming from the `|>` operator.

"""

# ╔═╡ 43e34a4f-9d13-4953-9eca-010ef3ec8815
poem |> typeof

# ╔═╡ ccd4fe6a-f3d4-405d-a077-9ad5b96e16ae
length(poem) |> typeof

# ╔═╡ 30d20326-1008-4885-837c-c335e1e0cd71
md"""By way of examples, we'll just mention a couple of functions now that produce new strings. The `lowercase` and `uppercase `functions take a single argument and produce a String object with all letters converted to lower or upper case, respecitvely.  (These are very handy if you want to do case-insensitive comparisons of string values.)
"""

# ╔═╡ 215e0ca7-7b87-45b1-a3f9-e1da766a2fe1
lowercase(poem)

# ╔═╡ a4c323da-b89e-4d9e-8806-872f86697cc3
uppercase(poem)

# ╔═╡ 5d80a880-2a13-45ec-844e-3c2434978ee7
md"""The `string` function takes an arbitrary number of arguments -- as many as you like! -- and creates a single String value from them. It can be a practical alternative to interpolating values in a long string.  When a function has more than one argument, separate them with commas.

"""

# ╔═╡ 809beaba-e01b-411e-a77c-0ef767346757
string("There are ", books, " books in the ", poem)

# ╔═╡ 2e59d1c7-8d1f-4c83-9010-f63c1d627266
md"""### Writing your own functions


Of course for many everyday tasks (such as converting a String to lower case), the perfect function already exists, but part of the power of writing your own code is that you can create your own functions when you need something just a little bit different.

Let's take a toy example.  Suppose we want a function that emphatically adds exclamation  points to a String value.  The simplest syntax for defining a function connects a list of parameters with an action to perform on them using the arrow `->`.  This notation reinforces the idea that a function is a kind of machine that takes some input and creates something new from it.  The following cell says "Take one object (which here we'll call `s`) : use the `string` function to join `s` with two exclamation points. `s` is just the name of a variable:  when we invoke the function, `s` will be assigned the value of the parameter we supply.

As you see in the next cell, Julia identifies this as a function.
"""

# ╔═╡ 7cf3e82e-c692-40e6-96a0-b2d2dd600f14
s -> string(s,"!!")

# ╔═╡ d6539b59-6159-49fb-9620-22ea18abcd60
md"""We can assign functions to names using `=`, just as we did with other objects.  Let's call our new function `exclaim`.
"""

# ╔═╡ cc7ec4d3-8a85-4146-8d6a-cf3efff09f91
exclaim = s -> string(s,"!!")

# ╔═╡ ecb38d7c-18e3-4c48-90e5-27cb414e2af5
md"""In the same way that assigning an object to a variable effectively adds that variable name to the Julia language available to you, we have assigned a function to the name `exclaim`, and can now use it as we would any function.
"""

# ╔═╡ 74e6ea39-5e27-4c8a-b106-d81dc8c69a1d
exclaim("Why code? Is that a question?")

# ╔═╡ f5af2a50-5127-4a35-ae61-ac8ea3978e4b
md"""Let's improve our function. Sometimes you might want to be more or less emphatic.  Let's add a second parameter giving the number of exclamation points we want to include.

We can use this parameter with a Julia function called `repeat` that will, as you might guess, repeats a string a given number of times, as you can see here:
"""

# ╔═╡ 1945f586-54e4-4ecb-bb3a-defd84da4986
repeat("!", 5)

# ╔═╡ 7e40d192-dd70-4cef-838d-4b0d0edcde8d
md"""The body of our function can then just string together our first parameter and the repeated exclamation points, like this:
"""

# ╔═╡ 96d8349d-dbf4-4c6d-9b10-890785a937a5
string("Hey", repeat("!", 4))

# ╔═╡ 0562ac6e-45f2-41c6-8016-bfdcd91899fc
md"""We'll call the new two-parameter function `exclaim_n`.
Julia allows us to assign a default value to parameters in the parameter left on the left hand side of the arrow, so let's keep 2  as the default number of exclamation points to append.
"""

# ╔═╡ e7ad33f7-bf2f-4024-bef0-98987499b1b3
exclaim_n = (s, n = 2) -> string(s, repeat("!", n))

# ╔═╡ 59f02fb7-73ea-4594-a262-f43f1ded2b40
md"""Now we can call our function with two parameters to include a specified number of exclamation points, or, if we include only one parameter, we'll see the default behavior."""

# ╔═╡ a42fb141-6a21-4893-b64f-d50fd30b8c44
exclaim_n("What?", 4)

# ╔═╡ e77fdcfd-e501-46ac-b567-7fbfe97e0092
exclaim_n("What?")

# ╔═╡ 5eeb5462-75d1-458c-997e-999f1c3d4c35
md"""### Self quiz

Replace `missing` in the definition of the `screaming` function so that it

1. makes the parameter `s` entirely uppercase
2. appends `n` exclamation points to the uppercase version of `s`

When you've got the definition right, the value of `screaming(poem)` should be `ILIAD!!`.
"""

# ╔═╡ 8931b0c5-9794-4909-ad18-03a390ffc832
screaming = (s, n = 2) -> missing


# ╔═╡ c97a3107-a218-4f7b-9128-bbac0a9b639d
loud_iliad = screaming(poem)

# ╔═╡ bf68f654-8b24-426a-bb21-b9d8c9ec0879
if !@isdefined(loud_iliad)
	not_defined(:loud_iliad)
elseif ismissing(loud_iliad)
	still_missing()
elseif ! (loud_iliad isa String)
	keep_working(md"The object your function creates should be a String.  Do you need to use the `string` function?")
elseif loud_iliad == "ILIAD!!"
	correct()
else
	keep_working(md"Check your function.  Your final answer should have a default of two exclamation points after the word `ILIAD`.")
end

# ╔═╡ 26713ec0-a5a1-4eb1-ab99-6211dcbd5bbe
md"""### Defining functions: longer-form syntax
The arrow syntax is handy for defining a one-line function, but Julia offers a longer form for writing more complex named functions.  This form begins with the key word `function` followed by the function name and a list of any parameters in parentheses.  You can then write as many lines as you want until the key word `end` appears on a separate line.  The last line before `end` is the value of the function.

One nice feature of the long-form syntax is that you can precede the line with the `function` keyword with a string value, and Julia will treat that as documentation for the function.  Not only can you add functions to your personal Julia: you can add to its automatically compiled documentation!  This is a good practice to follow, and we'll do so regularly.

```
"String explaining what the function does."
function MY_FUNCTION(ARGUMENT1, ARGUMENT2)
	EXPRESSION
end
```

Let's use the long-form syntax to create a simple new function.  We'll draw on three common Julia functions, and pacakge them up to create an alphabetized word list of all the words in a text. The three functions are:

**1**. `split`  splits up a string of characters into a list of strings;  by default, it splits on whitespace, so if whitespace separates words in your text, you have converted your text to a list of words.
"""

# ╔═╡ 78fba101-b57a-4895-9ea3-33800708bd89
split("I have miles to go before I sleep.")

# ╔═╡ 4d0e763e-9cd9-4d5a-91e4-1b5a4ae75fc3
md"""
**2** `unique` takes one parameter, a list, and reduces it to a list of unique values.  Let's use the pipe syntax to feed in our list of words and come up with a unique word list.
"""

# ╔═╡ 1a56e5a8-9623-4f84-b042-b96cd65026b3
split("I have miles to go before I sleep.") |> unique

# ╔═╡ 59d27edd-aeef-4def-9e50-c2fef577b81f
md"""
**3** `sort` (surprise!) sorts a list of values.  For Strings, the default is to sort them alphabetically.  Notice that in Julia, all upper case values sort before lower case values!
"""

# ╔═╡ c279d031-fdaf-4de7-9ceb-de29363260a5
split("I have miles to go before I sleep.") |> unique |> sort

# ╔═╡ 8b954d2f-1dbb-493c-b568-92f713600fa5
md"""
In the previous cell, we used the pipe syntax to combine all three functions on a single line, and we could, if we chose, do that whenever we wanted to compile a word list for a text.  When we're working with texts, however, the idea of an alphabetized word list is a natural one: far better to encapsulate that in a single function we will name `wordlist`, and be able to use very naturally with a single string parameter.
"""

# ╔═╡ 8987603f-7a1f-411d-a1d8-28ab2fe10d23
"Break up `s` into a list of words, and sort the list."
function wordlist(s)
	words = split(s) |> unique
	sort(words)
end

# ╔═╡ c523cfe0-d986-44d6-81d7-5e07dacd5107
wordlist("I have miles to go before I sleep.")

# ╔═╡ 64b1e42b-f6c0-43e1-b0f5-a6cb3304ab98
md""" ## Recap

This notebook introduced you to the nouns and verbs of the Julia language  You saw that objects have a type and value, and learned how to write your own functions that can work with parameters to create new objects.

In the final cell above, our `wordlist` function produced a type we have not seen before: a `Vector`, which is Julia's term for a one-dimensional list.

"""

# ╔═╡ 464525bf-3c44-4577-b8ec-d7af60cd86a8
wordlist("I have miles to go before I sleep.") |> typeof

# ╔═╡ 86034c4d-0a34-4580-a3d5-737eba514d1b
md"""Much of your scholarly work will involve working with lists like Vectors.  The Pluto [notebook for session 1b](https://neelsmith.github.io/why_we_code/notebooks/session1/session1bnb.html) will take introduce you to the basics of working with collections of data in Julia.


"""

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
PlutoTeachingTools = "661c6b06-c737-4d37-b85c-46df65de6f69"
PlutoUI = "7f904dfe-b85e-4ff6-b463-dae2292396a8"

[compat]
PlutoTeachingTools = "~0.1.4"
PlutoUI = "~0.7.38"
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.2"
manifest_format = "2.0"

[[deps.AbstractPlutoDingetjes]]
deps = ["Pkg"]
git-tree-sha1 = "8eaf9f1b4921132a4cff3f36a1d9ba923b14a481"
uuid = "6e696c72-6542-2067-7265-42206c756150"
version = "1.1.4"

[[deps.ArgTools]]
uuid = "0dad84c5-d112-42e6-8d28-ef12dabb789f"

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

[[deps.Dates]]
deps = ["Printf"]
uuid = "ade2ca70-3891-5945-98fb-dc099432e06a"

[[deps.Downloads]]
deps = ["ArgTools", "LibCURL", "NetworkOptions"]
uuid = "f43a241f-c20a-4ad4-852c-f6b1247861c6"

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

[[deps.LibCURL_jll]]
deps = ["Artifacts", "LibSSH2_jll", "Libdl", "MbedTLS_jll", "Zlib_jll", "nghttp2_jll"]
uuid = "deac9b47-8bc7-5906-a0fe-35ac56dc84c0"

[[deps.LibGit2]]
deps = ["Base64", "NetworkOptions", "Printf", "SHA"]
uuid = "76f85450-5226-5b5a-8eaa-529ad045b433"

[[deps.LibSSH2_jll]]
deps = ["Artifacts", "Libdl", "MbedTLS_jll"]
uuid = "29816b5a-b9ab-546f-933c-edad1886dfa8"

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

[[deps.Mmap]]
uuid = "a63ad114-7e13-5084-954f-fe012c677804"

[[deps.MozillaCACerts_jll]]
uuid = "14a3606d-f60d-562e-9121-12d972cd8159"

[[deps.NetworkOptions]]
uuid = "ca575930-c2e3-43a9-ace4-1e988b2c1908"

[[deps.OpenBLAS_jll]]
deps = ["Artifacts", "CompilerSupportLibraries_jll", "Libdl"]
uuid = "4536629a-c528-5b80-bd46-f80d51c5b363"

[[deps.Parsers]]
deps = ["Dates"]
git-tree-sha1 = "621f4f3b4977325b9128d5fae7a8b4829a0c2222"
uuid = "69de0a69-1ddd-5017-9359-2bf0b02dc9f0"
version = "2.2.4"

[[deps.Pkg]]
deps = ["Artifacts", "Dates", "Downloads", "LibGit2", "Libdl", "Logging", "Markdown", "Printf", "REPL", "Random", "SHA", "Serialization", "TOML", "Tar", "UUIDs", "p7zip_jll"]
uuid = "44cfe95a-1eb2-52ea-b672-e2afdf69b78f"

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

[[deps.Tar]]
deps = ["ArgTools", "SHA"]
uuid = "a4e569a6-e804-4fa4-b0f3-eef7a1d5b13e"

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

[[deps.libblastrampoline_jll]]
deps = ["Artifacts", "Libdl", "OpenBLAS_jll"]
uuid = "8e850b90-86db-534c-a0d3-1478176c7d93"

[[deps.nghttp2_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "8e850ede-7688-5339-a07c-302acd2aaf8d"

[[deps.p7zip_jll]]
deps = ["Artifacts", "Libdl"]
uuid = "3f19e933-33d8-53b3-aaab-bd5110c3b7a0"
"""

# ╔═╡ Cell order:
# ╟─a2cb957f-c8eb-4e0f-a1e5-3e37f2b7bd27
# ╟─3c2dbe8c-363c-4ad8-a862-6a74c45808e0
# ╟─777185cc-b116-11ec-218d-453c13034275
# ╟─7f8af184-9753-47de-8660-f07990f247d9
# ╠═efe0e3ed-0c14-48d3-a0fd-d65dba74ee2f
# ╟─45f22493-7e17-4bab-bd4c-8dca46a15c01
# ╠═729b6e3a-8305-4de4-bd46-7a7e951eb718
# ╟─ca929bdf-dff1-4211-8415-80f69e50b4ef
# ╟─04f46f9a-e261-4529-a5a2-91991fdb85d3
# ╟─45d123c3-d4e1-4559-8d89-9e3eea0b23ef
# ╠═01320907-7796-4d47-b89b-65a57ec560b1
# ╠═7585bac1-7b0d-475a-9e78-29550279fc89
# ╟─f8516e15-e59e-4cf9-9fe6-739e1c9ef42d
# ╠═73390200-8116-42e2-884f-f456ced5aac7
# ╠═c77c0518-75f4-418e-ae5c-209d4485f39e
# ╟─a3836cbc-4027-4e2a-ac1c-b10cc8de8af4
# ╟─c083fd97-eea8-404a-a18f-8632cefae08c
# ╟─893e13dd-ed27-41af-b697-e06a9890b027
# ╠═0e873f49-a0ee-4d53-a1dd-722316f22c86
# ╟─54eb0cab-c557-45fa-9a6a-9edb0f461083
# ╟─9ee09c3d-0301-46e5-8bf3-65a895528580
# ╠═26b46878-cded-44a3-8cbe-737c1f761512
# ╟─8225fb68-6e33-40b5-9415-71a5e631412e
# ╟─d5cadcdb-85e3-4a66-980d-2ef936d26746
# ╠═288cf4a9-6f87-4c10-884f-7c44d8d73e27
# ╟─08c2184b-631b-4aa4-9c43-cc7f0446a709
# ╠═61f6a990-31ab-4e38-bb91-372a60dbe5e4
# ╠═aae31cae-a87c-4479-a7fc-b942d2d7dff2
# ╟─8d437fee-bbb5-437c-9bb2-08edd35c5afc
# ╠═3fdcf2d8-8ace-41dc-bb30-54306fe1d8d0
# ╟─72ec26e1-7c46-4cac-9fb1-a541ac2604d0
# ╠═b22ced73-d044-4c66-b027-6d6f024ca0cc
# ╠═c8ffd88d-1883-4791-93b9-9ef1e6b67a0f
# ╟─3aba8b75-b444-429e-837a-f0c59dfec056
# ╠═ceaa9687-8ec8-45d2-ba82-15da1bd38168
# ╟─509f113b-97f9-4678-a768-42f4a87f0ac6
# ╠═933484a6-85dc-4dfc-896d-ccfbd25108fa
# ╟─d957d071-05d6-4cf1-a42c-92bbcfa69c28
# ╟─848ca6e5-05e0-4a22-9ddf-2eb4e27edc1e
# ╠═b6cf2be0-0382-4cc2-8a82-8a58b4197ffc
# ╟─c4520790-5fe4-48a4-9f5d-940c04790c61
# ╠═5711bc1a-eef7-4beb-8514-665b797c8bb0
# ╟─118a9480-f537-4474-b2b2-5d496abe67cc
# ╠═43e34a4f-9d13-4953-9eca-010ef3ec8815
# ╠═ccd4fe6a-f3d4-405d-a077-9ad5b96e16ae
# ╟─30d20326-1008-4885-837c-c335e1e0cd71
# ╠═215e0ca7-7b87-45b1-a3f9-e1da766a2fe1
# ╠═a4c323da-b89e-4d9e-8806-872f86697cc3
# ╟─5d80a880-2a13-45ec-844e-3c2434978ee7
# ╠═809beaba-e01b-411e-a77c-0ef767346757
# ╟─2e59d1c7-8d1f-4c83-9010-f63c1d627266
# ╠═7cf3e82e-c692-40e6-96a0-b2d2dd600f14
# ╟─d6539b59-6159-49fb-9620-22ea18abcd60
# ╠═cc7ec4d3-8a85-4146-8d6a-cf3efff09f91
# ╟─ecb38d7c-18e3-4c48-90e5-27cb414e2af5
# ╠═74e6ea39-5e27-4c8a-b106-d81dc8c69a1d
# ╟─f5af2a50-5127-4a35-ae61-ac8ea3978e4b
# ╠═1945f586-54e4-4ecb-bb3a-defd84da4986
# ╟─7e40d192-dd70-4cef-838d-4b0d0edcde8d
# ╠═96d8349d-dbf4-4c6d-9b10-890785a937a5
# ╟─0562ac6e-45f2-41c6-8016-bfdcd91899fc
# ╠═e7ad33f7-bf2f-4024-bef0-98987499b1b3
# ╟─59f02fb7-73ea-4594-a262-f43f1ded2b40
# ╠═a42fb141-6a21-4893-b64f-d50fd30b8c44
# ╠═e77fdcfd-e501-46ac-b567-7fbfe97e0092
# ╟─5eeb5462-75d1-458c-997e-999f1c3d4c35
# ╠═c97a3107-a218-4f7b-9128-bbac0a9b639d
# ╠═8931b0c5-9794-4909-ad18-03a390ffc832
# ╟─bf68f654-8b24-426a-bb21-b9d8c9ec0879
# ╟─26713ec0-a5a1-4eb1-ab99-6211dcbd5bbe
# ╠═78fba101-b57a-4895-9ea3-33800708bd89
# ╟─4d0e763e-9cd9-4d5a-91e4-1b5a4ae75fc3
# ╠═1a56e5a8-9623-4f84-b042-b96cd65026b3
# ╟─59d27edd-aeef-4def-9e50-c2fef577b81f
# ╠═c279d031-fdaf-4de7-9ceb-de29363260a5
# ╟─8b954d2f-1dbb-493c-b568-92f713600fa5
# ╠═8987603f-7a1f-411d-a1d8-28ab2fe10d23
# ╠═c523cfe0-d986-44d6-81d7-5e07dacd5107
# ╟─64b1e42b-f6c0-43e1-b0f5-a6cb3304ab98
# ╠═464525bf-3c44-4577-b8ec-d7af60cd86a8
# ╟─86034c4d-0a34-4580-a3d5-737eba514d1b
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
