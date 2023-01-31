

# Collections: Vectors and Matrices


split text content of gburg

## More on types and hierarchy

s```
julia> "Four score" |> split
2-element Vector{SubString{String}}:
 "Four"
 "score"

julia> s1 = "score"
"score"

julia> s2 = split("four score")[2]
"score"

julia> s1 == s2
true

julia> typeof(s1) == typeof(s2)
false
```

To see why: functions


`split`



### Packages



using Downloads
https://raw.githubusercontent.com/neelsmith/julia_workshop/main/hay.txt
wds = split(gburg)



## VS CODE AND REPL

Copy/paste -- easier with multiline content


**for** looping
**conditions**


function longest(wordlist)
    maxlength = 0
    longestword  = ""
    for word in wordlist
        if length(word) > maxlength
            maxlength = length(word)
            longestword = word
        end
    end
    longestword
end


(LATER: HOW TO REPLACE CHARACTERS MATCHING REG EXP)


LOGIC PROBLEM: what if more than 1 longest word?

"Find words in wordlist longer than length `n`."
function longerthan(wordlist, n)
    longwords  = []
    for word in wordlist
        if length(word) > n
            push!(longwords, word)
        end
    end
    longwords
end



"Find words in wordlist longer than length `n`."
function longerthan(wordlist, n)
    longwords  = []
    for word in wordlist
        if length(word) > n
            push!(longwords, word)
        end
    end
    longwords
end


Now what if we want longest `n` words?

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