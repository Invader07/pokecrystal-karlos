	db FLETCHINDR ; 010

	db  60,  70,  55,  80,  60,  55
	;   hp  atk  def  spd  sat  sdf

	db FIRE, FLYING ; type
	db 255 ; catch rate
	db 134 ; base exp
	db NO_ITEM, NO_ITEM ; items
	db GENDER_F50 ; gender ratio
	db 100 ; unknown 1
	db 15 ; step cycles to hatch
	db 5 ; unknown 2
	INCBIN "gfx/pokemon/charmander/front.dimensions"
	dw NULL, NULL ; unused (beta front/back pics)
	db GROWTH_MEDIUM_SLOW ; growth rate
	dn EGG_GROUND, EGG_GROUND ; egg groups

	; tm/hm learnset
	tmhm CURSE
		; end
