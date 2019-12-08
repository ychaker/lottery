defmodule Lottery.RandomLotteryPicker do
  def pick_number(numbers, max) do
    n = Enum.random(Enum.to_list(1..max))

    if Enum.member?(numbers, n),
      do: pick_number(numbers, max),
      else: numbers ++ [n]
  end

  def pick_multiple_times(numbers, max, n) when n <= 1 do
    pick_number(numbers, max)
  end

  def pick_multiple_times(numbers, max, n) do
    numbers = pick_number(numbers, max)
    numbers = pick_multiple_times(numbers, max, n - 1)
    numbers
  end

  def pick_numbers do
    pick_multiple_times([], 75, 5)
  end

  def pick_megaball do
    pick_multiple_times([], 15, 1)
  end
end
