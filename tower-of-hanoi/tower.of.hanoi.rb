a = [1,2,3,4]
b = []
c = []

def make_legal_move(peg1,peg2,peg3)
  puts "Entering legal move: peg1: #{peg1}, peg2: #{peg2}, peg3: #{peg3}"
  if peg1.first == nil
    slot_1 = 0
  else
    slot_1 = peg1.first
  end

  if peg2.first == nil
    slot_2 = 0
  else
    slot_2 = peg2.first
  end

  if peg3.first == nil
    slot_3 = 0
  else
    slot_3 = peg3.first
  end

  pieces = [slot_1, slot_2, slot_3]

  zero_count = pieces.count(0)
  if zero_count > 0
    biggest_peg = pieces.index(pieces.max)
  else
    biggest_peg = pieces.index(pieces.select { |piece| piece != 1 && piece != pieces.max })
  end

  puts "Exiting legal move: peg1: #{peg1}, peg2: #{peg2}, peg3: #{peg3}"

  puts "biggest_peg: #{biggest_peg}"
  case biggest_peg
  when 0
    peg1
  when 1
    peg2
  when 2
    peg3
  end
end

def where_is_little(peg1,peg2,peg3)
  if peg1.first == 1
    peg1
  elsif peg2.first == 1
    peg2
  else
    peg3
  end
end

def move_disc(number_of_discs, initial_peg, via_peg, ending_peg, move_number, last_little_position)
  puts "Entering #move_disc: initial_peg: #{initial_peg}, via_peg: #{via_peg}, ending_peg: #{ending_peg}"
  puts initial_peg.inspect
  puts via_peg.inspect
  puts ending_peg.inspect
  puts ""
  if move_number == 1
    little = last_little_position.shift
    if last_little_position == initial_peg
      via_peg.unshift(little)
      last_little_position = via_peg
    elsif last_little_position == via_peg
      ending_peg.unshift(little)
      last_little_position = ending_peg
    else
      initial_peg.unshift(little)
      last_little_position = initial_peg
    end
  else
    peg_to_move_from = make_legal_move(initial_peg, ending_peg, via_peg)
    puts "peg_to_move_from: #{peg_to_move_from} "
    little_peg = where_is_little(initial_peg, ending_peg, via_peg)
    if peg_to_move_from == initial_peg
      if little_peg == via_peg
        peg_to_move_to = ending_peg
      else
        peg_to_move_to = via_peg
      end
    elsif peg_to_move_from == via_peg
      if little_peg == initial_peg
        peg_to_move_to = ending_peg
      else
        peg_to_move_to = initial_peg
      end
    else
      if little_peg == initial_peg
        peg_to_move_to = via_peg
      else
        peg_to_move_to = initial_peg
      end
    end
    puts "Exiting #move_disc: initial_peg: #{initial_peg}, via_peg: #{via_peg}, ending_peg: #{ending_peg}"
    peg_to_move_to.unshift(peg_to_move_from.shift)
  end

  next_move = (move_number + 1) % 2
  return "game over" if ending_peg == [1,2,3,4]

  move_disc(4, initial_peg, via_peg, ending_peg, next_move, last_little_position)

end

move_disc(4, a, b, c, 1, a)
puts a.inspect
puts b.inspect
puts c.inspect

 # if initial_peg.first > via_peg.first && initial_peg.first > ending_peg.first
    #   piece_to_move = initial_peg.shift
    #   if via_peg.first >= ending_peg.first
    #     via_peg.unshift(piece_to_move)
    #   else
    #     ending_peg.unshift(piece_to_move)
    #   end
    # elsif via_peg.first > initial_peg.first && via_peg.first > ending_peg.first
    #   piece_to_move = via_peg.shift
    #   if initial_peg.first >= ending_peg.first
    #     initial_peg.unshift(piece_to_move)
    #   else
    #     ending_peg.unshift(piece_to_move)
    #   end
    # else
    #   piece_to_move = ending_peg.shift
    #   if via_peg.first >= initial_peg.first
    #     via_peg.unshift(piece_to_move)
    #   else
    #     initial_peg.unshift(piece_to_move)
    #   end
    # end