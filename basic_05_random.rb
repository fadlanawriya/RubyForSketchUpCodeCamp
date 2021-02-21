puts "this is 10 random decimal number"
for i in 0..9 # must use an interger since ruby can't iterate from float
  random=rand #random float between 0 and 1
  puts(random)
end

puts "this is 10 random interger number from 1..15"
for i in 0..9 # must use an interger since ruby can't iterate from float
  random=rand(1..15) #random interger between 1 and 15
  puts(random)
end

puts "this is random decimal number from 1.5..2.0"
for i in 0..9 # must use an interger since ruby can't iterate from float
  random=rand(1.5..2.0) #random float between 1.5 and 2.0
  puts(random)
end
