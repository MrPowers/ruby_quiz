class LcdNumbers

  attr_reader :size, :number

  def initialize(number:, size: 1)
    @size = size
    @number = number
  end

  def result
    to_array[0].zip(*to_array[1..-1]).inject("") do |memo, arr|
      #arr[1] = arr[1] * 2
      memo + arr.join(" ") + "\n"
    end
  end

  def to_array
    number.split("").map do |n|
      number_mapping(n)
    end
  end

  def number_mapping(n)
    make_adjustments({
      "6" => six
    }[n])
  end

  def six
    [" - ", "|  ", " - ", "| |", " - "]
  end

  def make_adjustments(arr)
    width_adjustment(arr)
    height_adjustment(arr)
  end

  def width_adjustment(arr)
    arr.map do |e|
      e[1] = e[1] * size
      e
    end
  end

  def height_adjustment(arr)
    arr[3, 1] = [arr[3]] * size
    arr[1, 1] = [arr[1]] * size
    arr
  end


end

lcd = LcdNumbers.new(number: "66", size: 2)
puts lcd.result


