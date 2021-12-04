defmodule Day1Part1 do
  # https://adventofcode.com/2021/day/1
  def get_result() do
    stream = File.stream!("sample.txt")

    contents =
      stream
      |> Enum.map(fn x ->
        x
        |> String.trim()
        |> String.to_integer()
      end)

    [prev | next] = contents

    init = %{
      count: 0,
      prev: prev
    }

    next
    |> Enum.reduce(init, fn x, acc ->
      acc =
        if x > acc.prev do
          Map.put(acc, :count, acc.count + 1)
        else
          acc
        end

      Map.put(acc, :prev, x)
    end)
    |> Map.get(:count)
  end
end
