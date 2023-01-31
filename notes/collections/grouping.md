using SplitApplyCombine
s = "The quick brown fox jumps over the lazy dog. Sphinx of black quartz judge my vow."
letters = split(s, "")
# This is a Dictionary:
letters_grouped = group(letters)

letters_grouped["a"]


keylist = collect(keys(letters_grouped))

counts = map(k -> length(letters_grouped[k]), keylist)