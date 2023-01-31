# Nouns in Julia

- objects, values, types, variables
- functions
- pacakges and environments in Julia


## REPL 1: objects, values, types, variables

OBJECTS HAVE TYPES and VALUES

```julia
"hello"
typeof("hello")
12
typeof(12)
true
typeof(true)
```

VARIABLES NAME AN OBJECT
*assignment* not *equality*

```julia
s = "Iliad"
typeof(s)
```


### REPL HELP

Use help with named objects 

- help: `?s`

Types are in a hierarchy

For strings, you're interested in `AbstractString`.  More a little later...



### String interpolation

Longquotes: `"""..."""`

books = 24
title = Iliad
"There are $(books) books in the $(title)"

markdown!  `md`
