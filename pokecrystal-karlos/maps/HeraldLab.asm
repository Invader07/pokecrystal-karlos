	object_const_def
	const HERALD_LAB_CELIO
	const HERALD_LAB_GOOD_RIVAL
	const HERALD_LAB_BAD_RIVAL
	const HERALD_LAB_POKE_BALL_1
	const HERALD_LAB_POKE_BALL_2
	const HERALD_LAB_POKE_BALL_3

HeraldLab_MapScripts:
	def_scene_scripts
	scene_script HeraldLabMeetCelioScene, SCENE_HERALDLAB_MEET_CELIO
	scene_script HeraldLabCantLeave, CENE_HERALDCOVE_CANT_LEAVE
	scene_script HeraldLabNoop1Scene, SCENE_HERALDLAB_NOOP1

	def_callbacks
	callback MAPCALLBACK_OBJECTS, HeraldLabCelioCallback

	HeraldLabMeetCelioScene:
		sdefer PlayerTalkToCelioScript
		end

	HeraldLabCantLeave:
		end

	HeraldLabNoop1Scene:
		end

	HeraldLabCelioCallback:
		checkscene
		iftrue .Skip ; not SCENE_HERALDLAB_MEET_CELIO
		moveobject HERALD_LAB_CELIO, 4, 9
	.Skip:
		endcallback

	PlayerTalkToCelioScript:
		opentext
		writetext CelioThereYouAre
		waitbutton
		closetext
		applymovement HERALD_LAB_CELIO, CelioWalksDownMovement
		opentext
		writetext CelioComeHere
		waitbutton
		closetext
		follow HERALD_LAB_CELIO, PLAYER
		applymovement HERALD_LAB_CELIO, CelioWalksBackMovement
		stopfollow
		turnobject HERALD_LAB_CELIO, DOWN
		turnobject PLAYER, LEFT
		opentext
		writetext GoodRivalWelcome
		waitbutton
		writetext BadRivalWelcome
		waitbutton
		closetext
		turnobject PLAYER, UP
		opentext
		writetext CelioWelcome
		waitbutton
		closetext
		setscene CENE_HERALDCOVE_CANT_LEAVE
		end

	AfterPokemonScript:
		turnobject PLAYER, LEFT
		opentext
		writetext CelioLeaving
		closetext
		setevent EVENT_GOT_A_POKEMON_FROM_CELIO
		setscene SCENE_HERALDLAB_NOOP1
		end

	EkansPokeballScript:
		checkevent EVENT_GOT_A_POKEMON_FROM_CELIO
		iftrue LookAtPokeBallScript
		refreshscreen
		pokepic EKANS
		cry EKANS
		waitbutton
		closepokepic
		opentext
		writetext TakeEkansText
		yesorno
		iffalse DidntChooseStarterScript
		disappear HERALD_LAB_POKE_BALL_1
		setevent EVENT_GOT_EKANS_FROM_CELIO
		writetext GetStarter
		playsound SFX_CAUGHT_MON
		waitsfx
		promptbutton
		givepoke EKANS, 5, BERRY
		closetext
		sjump AfterPokemonScript

	HoundourPokeballScript:
		checkevent EVENT_GOT_A_POKEMON_FROM_CELIO
		iftrue LookAtPokeBallScript
		refreshscreen
		pokepic HOUNDOUR
		cry HOUNDOUR
		waitbutton
		closepokepic
		opentext
		writetext TakeHoundourText
		yesorno
		iffalse DidntChooseStarterScript
		disappear HERALD_LAB_POKE_BALL_2
		setevent EVENT_GOT_HOUNDOUR_FROM_CELIO
		writetext GetStarter
		playsound SFX_CAUGHT_MON
		waitsfx
		promptbutton
		givepoke HOUNDOUR, 5, BERRY
		closetext
		sjump AfterPokemonScript

	BaltoyPokeballScript:
		checkevent EVENT_GOT_A_POKEMON_FROM_CELIO
		iftrue LookAtPokeBallScript
		refreshscreen
		pokepic BALTOY
		cry BALTOY
		waitbutton
		closepokepic
		opentext
		writetext TakeBaltoyText
		yesorno
		iffalse DidntChooseStarterScript
		disappear HERALD_LAB_POKE_BALL_3
		setevent EVENT_GOT_BALTOY_FROM_CELIO
		writetext GetStarter
		playsound SFX_CAUGHT_MON
		waitsfx
		promptbutton
		givepoke BALTOY, 5, BERRY
		closetext
		sjump AfterPokemonScript

	LookAtPokeBallScript:
		opentext
		writetext LookAtPokeBallText
		waitbutton
		closetext

	LabTryToLeaveScript:
		opentext
		writetext LabTryToLeaveText
		waitbutton
		closetext
		applymovement PLAYER, CantLeaveMovement
		end

	DidntChooseStarterScript:
		opentext
		writetext DidntChooseStarterText
		waitbutton
		closetext

	ProfCelioScript:
		faceplayer
		end

	CelioWalksDownMovement:
		step DOWN
		step DOWN
		step DOWN
		step_end

	CelioWalksBackMovement:
		step UP
		step UP
		step UP
		step RIGHT
		step UP
		step UP
		step UP
		step UP
		step UP
		step_end

	CantLeaveMovement:
		step UP
		step_end

	CelioThereYouAre:
		text "CELIO: <PLAYER>!"
		line "There you are!"
		done

	CelioComeHere:
		text "You're just in"
		line "time. Come in!"

		para "I have something"
		line "to show you!"
		done

	GoodRivalWelcome:
		text "TEST BOY"
		done

	BadRivalWelcome:
		text "TEST GIRL"
		done

	CelioWelcome:
		text "Pick one."
		done

	TakeEkansText:
		text "EKANS?"
		done

	TakeHoundourText:
		text "HOUNDOUR?"
		done

	TakeBaltoyText:
		text "BALTOY?"
		done

	LookAtPokeBallText:
		text "A PokeBall"
		done

	DidntChooseStarterText:
		text "OK."
		done

	LabTryToLeaveText:
		text "Wait! Don't go!"
		done

	GetStarter:
		text "Great!"
		done

	CelioLeaving:
		text "Have fun!"
		done

HeraldLab_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4,  13, HERALD_COVE, 2
	warp_event 5,  13, HERALD_COVE, 2

	def_coord_events
	coord_event 4,  8, CENE_HERALDCOVE_CANT_LEAVE, LabTryToLeaveScript
	coord_event 5,  8, CENE_HERALDCOVE_CANT_LEAVE, LabTryToLeaveScript

	def_bg_events

	def_object_events
	object_event  5, 	 4, SPRITE_CELIO, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfCelioScript, -1
	object_event  4, 	 5, SPRITE_GOOD_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfCelioScript, -1
	object_event  3, 	 4, SPRITE_BAD_RIVAL, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ProfCelioScript, -1
	object_event  6, 	 5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, EkansPokeballScript, -1
	object_event  7, 	 5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, HoundourPokeballScript, -1
	object_event  8, 	 5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BaltoyPokeballScript, -1
