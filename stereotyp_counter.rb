#!/usr/bin/env ruby

# Stefan Huska <stefan.huska@gmail.com> (c) 2010

class Stereotyp
  REPLACE_STR = "***"
  
  def initialize(row="row", num_1=2, num_2=7)
    @row = row
    @num_1 = num_1
    @num_2 = num_2
  end
  
  def multi_replace
    rows=[]
    if @num_2 > @num_1
      for i in 0..@num_2-@num_1
        rows << @row.gsub(REPLACE_STR, (i+@num_1).to_s)
      end
    else
      for i in 0..@num_1-@num_2
        rows << @row.gsub(REPLACE_STR, (i+@num_2).to_s)
      end
      rows = rows.reverse
    end
    puts rows
  end
end

if ARGV.empty? or ARGV[0] == "-h" or ARGV[0] == "--help" then
  43.times do print "=" end
  puts "\nUSAGE:\n\n"
  puts "  ruby ./stereotyp.rb \"image_***.jpg\" 2 5"
  puts "\n"
  puts "  image_2.jpg\n  image_3.jpg\n  image_4.jpg\n  image_5.jpg"
  43.times do print "=" end
  puts ""
else
  row = ARGV[0].to_s
  num_1 = ARGV[1].to_i
  num_2 = ARGV[2].to_i

  st = Stereotyp.new(row, num_1, num_2)
  st.multi_replace
end

