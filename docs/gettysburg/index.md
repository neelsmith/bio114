---
layout: page
title: "Data models and data structures"
nav_order: 4
has_children: true
has_toc: false
---

# Data models and data structures


## Background: the Gettysburg Address

Our first hands-on exercise will look at Abraham Lincoln's Gettysburg Address. 

> {: .new }
> **Side note**: evolution in the Gettysburg Address?
>
> Five versions of the text exist in Lincoln's handwriting: you might wonder if they suggest an evolution. (You can learn about the five extant versions [here](https://www.abrahamlincolnonline.org/lincoln/speeches/gettysburg.htm).) We'll have an option to compare the different versions of Lincon's speech later in the semester.
>


Lincoln was not the featured speaker at Gettsyburg in 1863.  That honor belonged to [Edward Everett](https://en.wikipedia.org/wiki/Edward_Everett), a remarkable scholar, diplomat and public servant.

Why do we remember Lincoln's speech rather than Everett's?  Everett himself highlighted the conciseness of Lincoln's speech when he later wrote to Lincoln, "I should be glad if I could flatter myself that I came as near to the central idea of the occasion, in two hours, as you did in two minutes."  ([source](https://en.wikipedia.org/wiki/Edward_Everett#cite_note-102)) Others have suggested that in addition to its brevity, Lincoln's speech is memorable for its direct, plain style, in contrast to Everett's florid language.

How could we compare the two speeches? What observations would you make to characterize the rhetorical style of Lincoln or Everett?  Simply looking at the length of each text certainly tells us something about Lincoln's ability to address his topic concisely. 

Please draw up a list of specific observations you would make to evaluate the suggestion that Lincoln's style is simpler, more direct or more accessible than Everett's.  For each observation, explain how it might help us understand Lincoln's rhetorical style.




## Data models

What you are doing when you compile this list is an example of *data modelling*: you are defining features that can help us understand the material we are studying.  All scholars do this, although we may not always talk about this part of our work in the same terms.  Read this wikipedia article on the aphorism "[All models are wrong](https://en.wikipedia.org/wiki/All_models_are_wrong)".

Review your list of proposed observations.  Append to it a paragraph identifying ways that your model of an oration is wrong.


## Homework to submit

By 3:00 pm the day before class, submit on Canvas your data model: that is, the annotated list of observations you want to collect, and your thoughts on ways that your model is wrong.



## Data structures

How should we collect those observations?  We could simply read Lincoln and Everett's speeches, and take notes.

But what if we wanted to apply our model more widely?  Would if we wanted to compare each of Lincoln's and Everett's speeches to a large corpus of nineteenth-century rhetoric? That change of scale might further suggest whether one or the other speaker at Gettysburg was more or less typical of contemporary oratory.  At some point, manually collecting observations is no longer feasible, and we need to learn how to automate that part of our work.  We need to write code that will collect our observations from a digital corpus.

At this point, we are translating *data models* into digital *data structures*.  In our first hands-on exercise in class, we will learn how to do that, and will begin to apply our digital implementation of your models to Linconln and Everett's speeches.