# Retim

**TODO: Add description**

Estimate the reading time of a text or a text file

## Installation

You can donwload retim or you can install it as package to use it in your projects.
If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `retim` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:retim, "~> 0.1.0"}]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/retim](https://hexdocs.pm/retim).

## Hot to use it

Estimate the reading time of a setence
```elixir
iex> Retim.count("Hello World")
"1 minute"
```
The average reading time per minute is 180 words. If you want to change it you can pass a second argument
```elixir
iex> Retim.count("Hello World", 140)
"1 minute"
```

Read a file
```elixir
iex> Retim.count_file("hello.md")
"10 minutes
```