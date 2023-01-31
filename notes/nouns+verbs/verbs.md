
# Verbs in Julia: Functions

A machine that takes something(s) and produces another object.  Saw example with `typeof`




```julia
length(s)
```

Thing in parens is a *parameter*


ALTERNATE FUNCTION NOTATION when 1 parameter: `|>`


```julia
length(s) |> typeof
typeof(length(s))
```
So: String -> int

uppercase(s)
String -> String


string("There are ", books, " books in the ", title)

#### Write your own

short form:

exclaim = s -> string(s, "!!")


longer form: more normal for writing functions (more normally more than one line) but important to recognize the short form

function exam(s)
    string(s, "!!")
end

ASSIGNMENT:
write a function `shout` that takes one string parameter, and creates a new string all upper case and with exclamation marks afterwards.

