require  'benchmark'

class Sieve
  def initialize(max=0)
    @min, @max = 2, max
  end

  def primes
    nums = (@min..@max).to_a
    return nums if @max <= @min+1
    nums.each do |num|
      next unless num                                     # faster than if
      break if (start = num*num) > @max                   # faster than num**2 or Math.sqrt(@limit)
      (start-@min..@max).step(num) { |i| nums[i] = nil }
    end
    nums.compact!                                         # faster than nums.compact
  end
end

=begin
Benchmark.bm do |bm|
 s = Sieve.new(1_000_000)
 bm.report() do
  10.times do
    s.primes
  end
 end
end

Result
       user     system      total        real
   2.210000   0.020000   2.230000 (  2.230744)
=end
