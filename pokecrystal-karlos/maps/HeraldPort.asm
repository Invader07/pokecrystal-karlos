	object_const_def
	const HERALD_PORT_SAILOR1
	const HERALD_PORT_SAILOR2
	const HERALD_PORT_OAK
	const HERALD_PORT_PERCY
	const HERALD_PORT_BLAIRE

HeraldPort_MapScripts:
	def_scene_scripts
	scene_script HeraldPortIntroScene, SCENE_HERALD_PORT_INTRO
	scene_script HeraldPortNoop1Scene, SCENE_HERALD_PORT_NOOP1

	def_callbacks

	HeraldPortIntroScene:
		sdefer PlayerOakIntroScript
		end

	HeraldPortNoop1Scene:
		end

	PlayerOakIntroScript:
		disappear HERALD_PORT_OAK
		disappear HERALD_PORT_BLAIRE
		disappear HERALD_PORT_PERCY
		moveobject HERALD_PORT_OAK, 9, 6
		moveobject HERALD_PORT_PERCY, 9, 6
		moveobject HERALD_PORT_BLAIRE, 9, 6
		playsound SFX_ENTER_DOOR
		applymovement HERALD_PORT_SAILOR1, SailorStepsAwayMovement
		applymovement PLAYER , PlayerExitShipMovement
		pause 30
		playsound SFX_ENTER_DOOR
		appear HERALD_PORT_OAK
		applymovement HERALD_PORT_OAK, OakWalksToPlayerMovement
		opentext
		writetext OakTalksToPlayer1Text
		waitbutton
		closetext
		playsound SFX_BUMP
		playsound SFX_BUMP
		showemote EMOTE_SHOCK, HERALD_PORT_OAK, 15
		turnobject HERALD_PORT_OAK, UP
		pause 15
		turnobject HERALD_PORT_OAK, DOWN
		opentext
		writetext OakTalksToPlayer2Text
		waitbutton
		closetext
		turnobject HERALD_PORT_OAK, UP
		pause 10
		playsound SFX_ENTER_DOOR
		appear HERALD_PORT_PERCY
		applymovement HERALD_PORT_PERCY, PercyRunsToOakMovement
		turnobject HERALD_PORT_OAK, LEFT
		turnobject PLAYER, LEFT
		opentext
		writetext PercyTalksToOakText
		waitbutton
		closetext
		pause 10
		turnobject HERALD_PORT_OAK, DOWN
		opentext
		writetext OakPercyTalkPlayerText
		waitbutton
		closetext
		pause 6
		turnobject HERALD_PORT_PERCY, DOWN
		opentext
		writetext PercyTalksToPlayerText
		waitbutton
		closetext
		turnobject HERALD_PORT_OAK, DOWN
		turnobject PLAYER, DOWN
		applymovement HERALD_PORT_PERCY, PercyRunsToDoorMovement
		playsound SFX_EXIT_BUILDING
		disappear HERALD_PORT_PERCY
		pause 30
		playsound SFX_BUMP
		playsound SFX_BUMP
		pause 15
		turnobject HERALD_PORT_OAK, UP
		turnobject PLAYER, UP
		playsound SFX_ENTER_DOOR
		appear HERALD_PORT_BLAIRE
		applymovement HERALD_PORT_BLAIRE, BlaireWalksToOakMovement
		turnobject HERALD_PORT_OAK, LEFT
		turnobject PLAYER, LEFT
		opentext
		writetext BlaireTalksToOakText
		waitbutton
		closetext
		pause 15
		turnobject HERALD_PORT_BLAIRE, DOWN
		opentext
		writetext BlaireTalksToPlayerText
		waitbutton
		closetext
		turnobject HERALD_PORT_OAK, DOWN
		turnobject PLAYER, DOWN
		applymovement HERALD_PORT_BLAIRE, BlaireWalksToDoorMovement
		playsound SFX_EXIT_BUILDING
		disappear HERALD_PORT_BLAIRE
		pause 15
		turnobject PLAYER, UP
		opentext
		writetext OakTalksToPlayer3Text
		waitbutton
		closetext
		applymovement HERALD_PORT_OAK, OakWalksToDoorMovement
		playsound SFX_EXIT_BUILDING
		disappear HERALD_PORT_OAK
		applymovement HERALD_PORT_SAILOR1, SailorStepsBackMovement
		setscene SCENE_HERALD_PORT_NOOP1
		setevent EVENT_GYM_TRAINERS_IN_HERALD_COVE
		end

	Sailor1Script:
		faceplayer
		opentext
		writetext SailorBlocksPortText
		waitbutton
		closetext
		end

	Sailor2Script:
		faceplayer
		opentext
		writetext Sailor2Text
		waitbutton
		closetext
		end

	SailorStepsAwayMovement:
		step LEFT
		turn_head RIGHT
		step_end

	SailorStepsBackMovement:
		step RIGHT
		turn_head DOWN
		step_end

	PlayerExitShipMovement:
		step DOWN
		step DOWN
		step RIGHT
		turn_head UP
		step_end

	OakWalksToPlayerMovement:
		step DOWN
		step DOWN
		step RIGHT
		turn_head DOWN
		step_end

	PercyRunsToOakMovement:
		big_step DOWN
		big_step DOWN
		turn_head RIGHT
		step_end

	PercyRunsToDoorMovement:
		big_step DOWN
		big_step DOWN
		big_step DOWN
		step_end

	BlaireWalksToOakMovement:
		step DOWN
		step DOWN
		turn_head RIGHT
		step_end

	BlaireWalksToDoorMovement:
		step DOWN
		step DOWN
		step DOWN
		step_end

	OakWalksToDoorMovement:
		step LEFT
		step DOWN
		step DOWN
		step DOWN
		step_end

	OakTalksToPlayer1Text:
		text "OAK: Well <PLAYER>,"
		line "we have arrived!"

		para "Welcome to the"
		line "MONEGO ISLES!"

		para "These beautiful"
		line "islands have been"

		para "closed for awhile,"
		line "but are reopening"
		cont "now for everyone!"

		para "HERALD COVE is"
		line "where we will be"

		para "residing while we"
		line "are here."

		para "Now, the others"
		line "should be..."
		done

	OakTalksToPlayer2Text:
		text "Ah, there we are."
		line "You haven't met"

		para "the others yet"
		line "have you?"

		para "They will be your"
		line "fellow aides while"
		cont "we study here."
		done

	OakTalksToPlayer3Text:
		text "OAK: She will come"
		line "around, just give"
		cont "her some space."

		para "Now, lets go see"
		line "where we will be"

		para "staying! I'll meet"
		line "you outside!"
		done

	PercyTalksToOakText:
		text "PERCY: PROF. OAK!"
		line "That boat ride was"
		cont "a lot of fun!"

		para "Thanks for taking"
		line "all of us here!"

		para "I can't wait to"
		line "get started!"

		para "OAK: I'm glad you"
		line "are so excited."

		para "This will be a"
		line "great experience"
		cont "for you all!"
		done

	OakPercyTalkPlayerText:
		text "OAK: <PLAYER>, this"
		line "is PERCY! He joins"
		cont "us from SINNOH."
		done

	PercyTalksToPlayerText:
		text "PERCY: It's good to"
		line "meet you <PLAYER>!"

		para "I'll see you soon,"
		line "I'm going to go"
		cont "explore the town!"
		done

	BlaireTalksToOakText:
		text "BLAIRE: Finally"
		line "we're at the port."

		para "PERCY couldn't be"
		line "quiet until he saw"
		cont "we were close."

		para "OAK: You can't"
		line "blame him for that"
		cont "too much."

		para "He knows this is"
		line "a fantastic chance"

		para "to adventure and"
		line "make new friends!"
		done

	BlaireTalksToPlayerText:
		text "BLAIRE: I won't"
		line "need them, I'll be"
		cont "studying alone."

		para "Just try not to be"
		line "a nuisance."
		done

	SailorBlocksPortText:
		text "We're getting the"
		line "ship ready now."

		para "Please come back"
		line "later."
		done

	Sailor2Text:
		text "This port isn't"
		line "busy most of the"

		para "time. PROF. OAK"
		line "being here might"
		cont "change that now."
		done


HeraldPort_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 8,  11, HERALD_COVE, 1
	warp_event 9,  11, HERALD_COVE, 1
	warp_event 9,  6, PLAYERS_HOUSE_2F, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  9, 	 8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Sailor1Script, -1
	object_event  14,  8, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Sailor2Script, -1
	object_event  15,  0, SPRITE_OAK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_START_HERALD_PORT
	object_event  15,  0, SPRITE_GOOD_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_START_HERALD_PORT
	object_event  15,  0, SPRITE_BAD_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_START_HERALD_PORT
