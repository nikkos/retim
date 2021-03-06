defmodule Retim.Mixfile do
  use Mix.Project

  def project do
    [
      app: :retim,
      version: "0.2.3",
      elixir: "~> 1.4",
      build_embedded: Mix.env() == :prod,
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  # Configuration for the OTP application
  #
  # Type "mix help compile.app" for more information
  def application do
    # Specify extra applications you'll use from Erlang/Elixir
    [extra_applications: [:logger]]
  end

  # Dependencies can be Hex packages:
  #
  #   {:my_dep, "~> 0.3.0"}
  #
  # Or git/path repositories:
  #
  #   {:my_dep, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
  #
  # Type "mix help deps" for more examples and options

  defp description do
    """
    Estimate the reading time of a text or a text file.
    """
  end

  defp package do
    [
      name: :retim,
      files: ["lib", "mix.exs", "README*"],
      maintainers: ["Nikos Lamprakakis"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/nikkos/retim"}
    ]
  end

  defp deps do
    [{:ex_doc, "~> 0.14"}]
  end
end
