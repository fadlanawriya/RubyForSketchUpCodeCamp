for i in 0..3
  puts "-----------------------------------------------------------"
  puts "the value of i is #{i}"

  for j in 0..4
    puts "the value of j is #{j}"
    puts "the value of [i,j] is [#{i},#{j}]"
  end
end

# Here, we have defined the range 0..3 as i. The statement for i in 0..3 will allow i to take values in the range from 0 to 3 (including 3).
# And then, we also defined the range 0..4 as j. The statement for j in 0..4 will allow j to take values in the range from 0 to 4 (including 4).
# Since the loop on statement j is happen inside the statement i, it will allow us to perform loop in loop
