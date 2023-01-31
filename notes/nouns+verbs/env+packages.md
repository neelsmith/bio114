
### Packages and environments

HOW GET INTO RIGHT DIRECTORY IN VS CODE?

- open julia term, use `cd()` and `pwd()` functions
- use a normal term, start julia from command line
- use term within VS Code


**Pkg** mode

activate -- and watch your VS Code files listing
`status` (empty project)
`add Downloads` - now there's a Project.toml and Manifest.toml in your directory!


OPEN UP VS CODE. ckommand plaette: View menu or command-shift-P

MAke sure it's using same environment as your repl
Julia: Activate This environment



#### Files: download and read

URL = "https://juliabyexample.helpmanual.io"
Julia mode: `using Downloads`
Downloads.download(URL)

Returns a string with path to a file!

Downloads.download(URL) |> read

Vector of bytese...????

Downloads.download(URL) |> read |> String

Downloads.download(URL) |> readlines
