# Retim


Estimate the reading time of a text or a text file

## Installation

You can donwload retim or you can install it as package to use it in your projects.
You can found it at [https://hexdocs.pm/retim](https://hexdocs.pm/retim).
Also you can add `retim` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:retim, "~> 0.1.5"}]
end
```

## Hot to use it

Estimate the reading time of a setence:
```elixir
iex> Retim.count("Hello World")
"1 minute"
```
The average reading time per minute is 180 words. If you want to change it you can pass a second argument:
```elixir
iex> Retim.count("Hello World", 140)
"1 minute"
```

Read a file:
```elixir
iex> Retim.count_file("hello.md")
"4 minutes
```

Read a file and change the reading time:
```elixir
iex> Retim.count_file("hello.md", 120)
"7 minutes
```

### To-do

- [ ] Add new print format (3 minutes and 10 seconds)
