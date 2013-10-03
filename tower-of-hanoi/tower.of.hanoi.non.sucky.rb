a = [1,2,3,4]
b = []
c = []

def move_disc(num_discs, from_peg, via_peg, to_peg)
  watch_hannoi(from_peg, via_peg, to_peg)
  sleep(1)
  if num_discs == 1
    to_peg.unshift(from_peg.shift)
  else
    via_peg.unshift(from_peg.shift)
    move_disc(num_discs-1, from_peg, via_peg, to_peg)
    to_peg.unshift(via_peg.shift)
  end
  watch_hannoi(from_peg, via_peg, to_peg)
  sleep(1)
  to_peg
end

def watch_hannoi(from_peg, via_peg, to_peg)
  system('clear')
  puts from_peg.inspect
  puts via_peg.inspect
  puts to_peg.inspect
end

move_disc(4,a,b,c)