#!/usr/bin/env ruby
def classify_poker_hand(poker_hand)

	min=poker_hand.min
	max=poker_hand.max
	j=max-min
	t1=0
	i=0
	while j>i do
		if(poker_hand.include?(min+i) && poker_hand.include?(min+i+1) && poker_hand.include?(min+i+2))
			t1=1
		end
		i=i+1   
	end
	maxcount=0
	poker_hand.each do |i|
		if(poker_hand.count(i)>maxcount)
			maxcount=poker_hand.count(i)

		end
	end

	c2=poker_hand.select{|i| poker_hand.count(i) == 2 }.uniq.size

	c1=poker_hand.select{|i| poker_hand}.uniq.size
	#puts "ci = #{c1}"
	if(c1==4)
		return :one_pair
	elsif(t1==1 && !(poker_hand.include?(min) && poker_hand.include?(min+1) && poker_hand.include?(min+2) && poker_hand.include?(min+3) && poker_hand.include?(min+4)))
		return :high_card
	elsif(t1==1 && (poker_hand.include?(min) && poker_hand.include?(min+1) && poker_hand.include?(min+2) && poker_hand.include?(min+3) && poker_hand.include?(min+4)))
		return :straight
	elsif( (poker_hand.count(min)==3 && poker_hand.count(max)==2) || (poker_hand.count(min)==2 && poker_hand.count(max)==3) )
		return :full_house
	elsif( (poker_hand.count(min)==4 && poker_hand.count(max)==1) || (poker_hand.count(min)==1 && poker_hand.count(max)==4) )
		return :four_of_a_kind
	elsif( maxcount==3 )
		return :three_of_a_kind
	elsif(c2==2)
		return :two_pairs
	elsif(c1==1)
		return :impossible_hand
	else
		return :valid_but_nothing_special
	end
	
	
end


