# Retim

[![Build Status](https://travis-ci.org/nikkos/retim.svg?branch=master)](https://travis-ci.org/nikkos/retim)

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
"4 minutes"
```

Read a file and change the reading time:
```elixir
iex> Retim.count_file("hello.md", 120)
"7 minutes"
```

## Use Retim on Phoenix
Add retim on your depencies:
```elixir
 defp deps do
    [{:phoenix, "~> 1.2.1"},
      ........
      ........
     {:cowboy, "~> 1.0"},
     {:retim, "~> 0.1.5"}]
  end
  ```
  Run deps.get on your terminal:
  ```elixir
  mix deps.get
  ```
  ### Example

  Generate a post:
  ```elixir
  mix phoenix.gen.html Post posts title:string body:text
  ```

  To count the reading time of the body, add count(@post.body) on your templates(post/show.html.eex):
  ```elixir
  <%= Retim.count(@post.body) %>
  ```
  ### Result
  ![alt tag](https://github.com/nikkos/retim/blob/master/example-phoenix.png)



### To-do

- [ ] Add new print format (3 minutes and 10 seconds)
