#!/usr/bin/env ruby

def factorial(x)
	i=0
	t=1
	p=1
	while i<x
		p=p*(t+i)
		i=i+1
	end
	return p	
end

def c(n,k)
	return (factorial(n))/(factorial(n-k)*factorial(k))
end

def compute_row(n)
	if n.class.eql?(Fixnum)
		t=0
		i=0
		a=[]
		while t==0
			a << c(n-1,i)
			i=i+1
			if(i>n-1)
				t=1;
			end
		end
		return a
	else
		return nil
	end
end


