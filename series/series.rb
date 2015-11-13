class Series
  def initialize(digit_string)
    @digits = digit_string
  end

  def to_s
    @digits
  end

  def digits_array
    @digits.chars.map(&:to_i)
  end

  def slices(size)
    error_msg = "Slice is too big"
    raise ArgumentError, error_msg  if size > @digits.size
    digits_array.each_cons(size).to_a
  end
end
