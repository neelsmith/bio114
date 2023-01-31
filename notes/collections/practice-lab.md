

using Downloads



"Find length of longest string in `words`"
function longest(words)
    longestseen = 0
    for wrd in words
        if length(wrd) > longestseen
            longestseen = length(wrd)
        end
    end
    longestseen
end


"Download `url` and read its contents into a String"
function string_dl(url)
    Downloads.download(url) |> read |> String
end

"Find alphabetized vocabulary list for `str`."
function wordlist(str)
    split(str) |> unique  |> sort
end

frost = "I have miles to go before I sleep, miles to go before I sleep"

wordlist(frost)


"True if `c` is a non-punctuation character."
notpunct = c -> ! ispunct(c)

gburg_nopunctuation = filter(notpunct, gburg)
normalized = map(lowercase, gburg_nopunctuation)
gburg_vocab = wordlist(normalized)
