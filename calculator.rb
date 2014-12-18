BEGIN{

 def commify( number )  #input number, output string with commas
   temp = number.round(2)
   in_str = temp.to_s
   if  (number  - number.to_i) == 0
     in_str.chop!
     in_str.chop!
   end
   return in_str.reverse.gsub(/(\d\d\d)(?=\d)(?!\d*\.)/, '\1,').reverse
 end

  def add(in_str)
    sum = 0.0
    in_str.split(/\W+/).each_with_index do |x|
      sum = sum + in_str[x].to_f
    end
    return commify(sum)
  end

  def subtract(in_str)
    temp = in_str.split(",")
    return commify( (temp.first.to_f) - (temp.last.to_f) )
  end

  def multiply(in_str)
    temp = in_str.split( " ")
    return commify( (temp.first.to_f) * (temp.last.to_f) )
  end

  def power (in_str)#    it "raises one number to the power of another number"
    temp = in_str.split(",")
    return commify( (temp.first.to_f) ** (temp.last.to_f) )
  end

  def factorial(in_str) #
    sum = 1
    loops = in_str.to_i
      return "INVALID INPUT" if loops < 1
    #puts "fac #{in_str}"
    for i in 1..loops
       sum = sum * i
       i = i + 1
    end
    return (commify (sum))
  end


  while 1  # break from loop on input == q
    print "Enter add sum sub mult fac or pow (q=quit) and comma seperated numbers )==>"
    instring = gets
   break if instring[0].downcase == "q"
    if instring.length < 3
      puts "Invalid input"
    else
      args = instring.split(/\W+/)
      switch = args.shift.downcase
      switch = instring.split(" ")
      in_num_str = switch[1]
    end

    case switch[0]
      when "add"
        #puts "the sum of #{in_num_str} is #{add(in_num_str.commify)}"
        ret_val = add(in_num_str)
        puts "the add of #{in_num_str} is #{ret_val}"
      when "sum"
        ret_val = add(in_num_str)
        puts "the sum of #{in_num_str} is #{ret_val}"
      when "sub"
        puts "the diff of #{in_num_str} is #{subtract(in_num_str)}"
      when "mult"
        puts "the product of #{in_num_str} is #{multiply(in_num_str)}"
      when "fac"
        puts "the factorial of #{in_num_str} is #{factorial(in_num_str[0])}"
      when "pow"
        puts "the pwer of #{in_num_str} is #{power(in_num_str)}"
      else
        puts "Invalid key word"
    end
  end
}
