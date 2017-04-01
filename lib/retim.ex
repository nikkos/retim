defmodule Retim do

  @moduledoc """
  Provide methods to estimate the reading time of a file or a setence.
  """

  @doc """
  Count the words of a file.

  ## Examples

      iex> Retim.count_file("hello.md")
      "4 minutes"

      iex> Retim.count_file("hello.md", "en", 120)
      "7 minutes"

      iex> Retim.count_file("hello.md", "es", 120)
      "7 minutos"

  """

  def count_file(setence, lang \\ "en", average_reading_time \\ 180) do
    File.read(setence)
    |> Tuple.to_list
    |> Enum.drop(1)
    |> List.first
    |> String.split(~r/[\s_&!?:@$%^,\.]+/)
    |> Enum.count
    |> estimate_reading_time(average_reading_time)
    |> print_reading_time(String.downcase(lang))
  end

  @doc """
  Count the words of a setence

  ## Examples

      iex> Retim.count("Hello World")
      "1 minute"

      iex> Retim.count("Hello World", "en", 120)
      "1 minute"

      iex> Retim.count("Hellow World", "es", 120)
      "1 minuto"

  """
  def count(setence, lang \\ "en", average_reading_time \\ 180) do
    setence
    |> String.split(~r/[\s_&!?:@$%^,\.]+/)
    |> Enum.count
    |> estimate_reading_time(average_reading_time)
    |> print_reading_time(String.downcase(lang))
  end




  defp estimate_reading_time(setence, average_reading_time) do
    setence / average_reading_time
  end

  defp print_reading_time(reading_time, lang) do
    message = choose_language(lang)
    cond do
      reading_time <= 1 ->
       "1 #{message.singular}"
      reading_time > 1  ->
        "#{round(reading_time)} #{message.plural}"
    end
  end

  defp choose_language(lang) do
    case lang do
      "gr" -> %Retim.Language {lang: "gr", singular: "λεπτό",  plural: "λεπτά"}
      "en" -> %Retim.Language {lang: "en", singular: "minute", plural: "minutes"}
      "es" -> %Retim.Language {lang: "es", singular: "minuto", plural: "minutos"}
      "it" -> %Retim.Language {lang: "it", singular: "minuto", plural: "minuti"}
      "no" -> %Retim.Language {lang: "no", singular: "minutt", plural: "minutter"}
      "ru" -> %Retim.Language {lang: "no", singular: "mинута", plural: "mинуты"}
      "ge" -> %Retim.Language {lang: "no", singular: "minute", plural: "minuten"}
      _    -> %Retim.Language {lang: "en", singular: "minute", plural: "minutes"}
    end
  end

end
