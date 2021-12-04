defmodule Day1Part2 do
  # https://adventofcode.com/2021/day/1#part2
  def get_result() do
    stream = File.stream!("/Users/gishajames/elixir-snippets/sample.txt")

    stream
    |> Stream.map(fn x -> String.trim(x, "\n") |> String.to_integer() end)
    |> Stream.chunk_every(3, 1, :discard)
    |> Enum.map(fn x -> Enum.sum(x) end)
    |> Enum.chunk_every(2, 1, :discard)
    |> Enum.count(fn [left, right] -> left < right end)
  end
end
