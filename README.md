# Retim

[![Build Status](https://travis-ci.org/nikkos/retim.svg?branch=master)](https://travis-ci.org/nikkos/retim)

Estimate the reading time of a text or a text file

## Installation

You can donwload retim or you can install it as package to use it in your projects.
You can found it at [https://hex.pm/packages/retim](https://hexdocs.pm/retim).
Also you can add `retim` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [{:retim, "~> 0.2.0"}]
end
```

## How to use it

Estimate the reading time of a setence:
```elixir
iex> Retim.count("Hello World")
"1 minute"
```
The average reading time per minute is 180 words. If you want to change it you can pass a second argument:
```elixir
iex> Retim.count("Hello World", "en",140)
"1 minute"
```

Read words from a  file:
```elixir
iex> Retim.count_file("hello.md")
"4 minutes"
```

Read a file and change the average reading time to 120 words / per minute:
```elixir
iex> Retim.count_file("hello.md", "en", 120)
"7 minutes"
```

## Use Retim on Phoenix
Add retim on your dependencies:
```elixir
 defp deps do
    [{:phoenix, "~> 1.2.1"},
      ........
      ........
     {:cowboy, "~> 1.0"},
     {:retim, "~> 0.2.0"}]
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

  To count the reading time of the body text, add count(@post.body) on your templates(post/show.html.eex):
  ```elixir
  <%= Retim.count(@post.body) %>
  ```
  ### Result
  ![alt tag](https://github.com/nikkos/retim/blob/master/example-phoenix.png)



### To-do

- [ ] Add new print format (Example: 3 minutes and 10 seconds)
- [ ] Add other languages
