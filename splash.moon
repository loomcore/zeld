export rdcol=(n)->
	{
		b0:(peek (0x03fc0+(3*n))),
		b1:(peek (0x03fc0+(3*n)+1)),
		b2:(peek (0x03fc0+(3*n)+2))
	}

export wrcol=(n,b0,b1,b2)->
	poke 0x03fc0+(3*n),b0
	poke 0x03fc0+(3*n)+1,b1
	poke 0x03fc0+(3*n)+2,b2

export splash=->
	cs={
		0,1,12,8,13,9,2,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,3,3,3,3,3,3,3,
		3,2,9,13,8,12,1,0
	}
	if time!<1500
		cls 0
		wrcol 3,0,0,0
	else
		if time!<6250
				for i,c in pairs cs
					if time!>1500+i*60
						col=rdcol c
						if c==3
							wrcol 3,0xff,0xff,0xff
						else
							wrcol 3,col.b0,col.b1,col.b2
						spr 1,64,52,14,2,0,0,7,2
		else
			cls 0
			wrcol 3,0xff,0xff,0xff
			return true
