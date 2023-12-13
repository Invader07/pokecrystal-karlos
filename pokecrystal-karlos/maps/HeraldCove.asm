	object_const_def
	const	HERALD_COVE_OAK
	const	HERALD_COVE_BASTIAN
	const HERALD_COVE_SAILOR1
	const HERALD_COVE_SAILOR2
	const HERALD_COVE_SAILOR3
	const HERALD_COVE_YOUNGSTER1
	const HERALD_COVE_LASS1
	const HERALD_COVE_PERCY

HeraldCove_MapScripts:
	def_scene_scripts
	scene_script HeraldCoveOakEscort, SCENE_HERALD_COVE_OAK_ESCORT
	scene_script HeraldCoveGymChallenge, SCENE_HERALD_COVE_GYM_CHALLENGE
	scene_script HeraldCoveNoop1, SCENE_HERALD_COVE_NOOP1

	def_callbacks

	HeraldCoveOakEscort:
	sdefer OakEscortScript
		end

	HeraldCoveGymChallenge:
		end

	HeraldCoveNoop1:
		end

	OakEscortScript:
	applymovement PLAYER, PlayerExitDoorMovement
	turnobject PLAYER, LEFT
	opentext
	writetext OakTalksToPlayerText1
	waitbutton
	closetext
	follow HERALD_COVE_OAK, PLAYER
	applymovement HERALD_COVE_OAK, OakWalksToBastian
	stopfollow
	opentext
	writetext BastianShoutsOutText
	waitbutton
	closetext
	turnobject HERALD_COVE_OAK, LEFT
	showemote EMOTE_SHOCK, HERALD_COVE_OAK, 15
	appear HERALD_COVE_BASTIAN
	applymovement HERALD_COVE_BASTIAN, BastianWalksToOak
	opentext
	writetext BastionAndOakText
	waitbutton
	closetext
	applymovement HERALD_COVE_BASTIAN, BastianWalksToPlayer
	turnobject HERALD_COVE_OAK, DOWN
	pause 5
	turnobject PLAYER, LEFT
	pause 15
	opentext
	writetext BastianTalksToPlayerText
	waitbutton
	closetext
	applymovement HERALD_COVE_BASTIAN, BastianWalksAway
	disappear HERALD_COVE_BASTIAN
	pause 30
	turnobject PLAYER, UP
	opentext
	writetext OakTalksToPlayerText2
	waitbutton
	closetext
	follow HERALD_COVE_OAK, PLAYER
	applymovement HERALD_COVE_OAK, OakWalksToLab
	disappear HERALD_COVE_OAK
	playsound SFX_ENTER_DOOR
	stopfollow
	setscene SCENE_HERALD_COVE_NOOP1
	pause 40
	applymovement PLAYER, PlayerEntersLab
	warpcheck
	end

GymChallengeScript:
	applymovement PLAYER, PlayerExitDoorMovement
	pause 5
	applymovement HERALD_COVE_SAILOR1, SailorBlocksGymEntrance
	opentext
	writetext SailorGoFindTheCoin
	waitbutton
	closetext
	end

Sailor1ScriptGym:
	faceplayer
	opentext
	checkevent EVENT_BEAT_SAILOR_RONALD
	iftrue .Skip
	checkitem BASTIAN_COIN
	iftrue .FightSailorRonaldScript
	writetext SailorGoFindTheCoin
	waitbutton
	closetext
	end
.Skip
	writetext SailorRonaldAfterFight
	waitbutton
	closetext
	end
.FightSailorRonaldScript
	writetext SailorRonaldBeforeFight
	winlosstext SailorRonaldWinText, 0
	setlasttalked HERALD_COVE_SAILOR1
	loadtrainer SAILOR, RONALD
	startbattle
	reloadmapafterbattle
	writetext SailorRonaldAfterFight
	waitbutton
	closetext
	applymovement HERALD_COVE_SAILOR1, SailorMovesFromGymEntrance
	setevent EVENT_BEAT_SAILOR_RONALD
	setmapscene HERALD_GYM, SCENE_HERALD_GYM_NOOP1
	end

Sailor2and3ScriptGym:
	faceplayer
	opentext
	checkitem BASTIAN_COIN
	iftrue .SailorGoBackToGym
	writetext SailorGoFindTheCoin
	waitbutton
	closetext
	end
.SailorGoBackToGym:
	writetext Sailor2and3GoToGymText
	waitbutton
	closetext
	end

TrainerYoungsterAlex:
	trainer YOUNGSTER, ALEX, EVENT_BEAT_YOUNGSTER_ALEX, YoungsterAlexSeenText, YoungsterAlexBeatenText, 0, .Script

	.Script:
		endifjustbattled
		opentext
		writetext YoungsterAlexAfterText
		waitbutton
		closetext
		end

TrainerLassCandice:
	trainer LASS, CANDICE, EVENT_BEAT_LASS_CANDICE, LassCandiceSeenText, LassCandiceBeatenText, 0, .Script

	.Script:
		endifjustbattled
		opentext
		writetext LassCandiceAfterText
		waitbutton
		closetext
		end

	HeraldCoveRivalGymBattle:
		checkitem BASTIAN_COIN
		iftrue .Skip
		opentext
		writetext PlayerFoundGymCoin
		playsound SFX_ITEM
		waitsfx
		giveitem BASTIAN_COIN
		promptbutton
		closetext
		pause 5
		opentext
		writetext PercyShoutsDowntoPlayer
		waitbutton
		closetext
		showemote	EMOTE_SHOCK, PLAYER, 15
		turnobject PLAYER, UP
		disappear HERALD_COVE_PERCY
		moveobject HERALD_COVE_PERCY, 23, 12
		appear HERALD_COVE_PERCY
		applymovement HERALD_COVE_PERCY, PercyRunsToLedge
		playsound SFX_JUMP_OVER_LEDGE
		applymovement HERALD_COVE_PERCY, PercyJumpsDownLedge
		pause 15
		opentext
		writetext PercyChallengesPlayer
		waitbutton
		closetext
		checkevent EVENT_GOT_EKANS_FROM_OAK
		iftrue .Baltoy
		checkevent EVENT_GOT_HOUNDOUR_FROM_OAK
		iftrue .Ekans
		winlosstext PercyWinText, 0
		setlasttalked HERALD_COVE_PERCY
		loadtrainer PERCY, PERCY_1_HOUNDOUR
		startbattle
		reloadmapafterbattle
		sjump .AfterPercyBattle
	.Baltoy:
		winlosstext PercyWinText, 0
		setlasttalked HERALD_COVE_PERCY
		loadtrainer PERCY, PERCY_1_BALTOY
		startbattle
		reloadmapafterbattle
		sjump .AfterPercyBattle
	.Ekans:
		winlosstext PercyWinText, 0
		setlasttalked HERALD_COVE_PERCY
		loadtrainer PERCY, PERCY_1_EKANS
		startbattle
		reloadmapafterbattle
		sjump .AfterPercyBattle
	.AfterPercyBattle:
		opentext
		writetext PercyAfterBattleText
		waitbutton
		closetext
		applymovement HERALD_COVE_PERCY, PercyLeavesAfterFight
		disappear HERALD_COVE_PERCY
	.Skip
		end

	PlayerExitDoorMovement:
	step DOWN
	step_end

	OakWalksToBastian:
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step LEFT
	step UP
	step LEFT
	step LEFT
	step LEFT
	step UP
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

	BastianWalksToOak:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step_end

	BastianWalksToPlayer:
	step DOWN
	turn_head RIGHT
	step_end

	BastianWalksAway:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

	OakWalksToLab:
	step RIGHT
	step RIGHT
	step RIGHT
	step RIGHT
	step UP
	step UP
	step UP
	step_end

	PlayerEntersLab:
	step UP
	step_end

	SailorBlocksGymEntrance:
	step RIGHT
	turn_head DOWN
	step_end

	SailorMovesFromGymEntrance:
	step LEFT
	turn_head RIGHT
	step_end

	PercyRunsToLedge:
		big_step DOWN
		big_step DOWN
		step_end

	PercyJumpsDownLedge:
		jump_step DOWN
		step_end

	PercyLeavesAfterFight:
		step LEFT
		step DOWN
		step DOWN
		step LEFT
		step LEFT
		step LEFT
		step LEFT
		step_end

	OakTalksToPlayerText1:
	text "Our lab and rooms"
	line "should be up here."

	para "Let's go and get"
	line "settled in."
	done

	BastianShoutsOutText:
	text "???: OAK! I knew"
	line "I saw your ship"
	cont "pull in!"
	done

	BastionAndOakText:
	text "OAK: BASTIAN! It's"
	line "good to see you!"

	para "How are things now"
	line "that the islands"
	cont "have reopened?"

	para "BASTIAN: Busier"
	line "than I'm used to."

	para "With the BATTLE"
	line "CONFERENCE openin'"

	para "soon, there's been"
	line "alot o' trainers"
	cont "lookin' to enter."
	done

	BastianTalksToPlayerText:
	text "And who-er you? A"
	line "new trainer goin'"
	cont "to join in?"

	para "OAK: No, <PLAYER>"
	line "isn't a trainer."

	para "Not yet anyways,"
	line "they're one of my"
	cont "aides helping me."

	para "BASTIAN: Shame,"
	line "you look like"
	cont "you'd be a good'n."

	para "OAK, send him by"
	line "later. I'll get"
	cont "that map for you."
	done

	OakTalksToPlayerText2:
	text "OAK: BASTIAN is"
	line "the local GYM"
	cont "LEADER."

	para "He's also sailed"
	line "everywhere you can"
	cont "around here, so"

	para "he has a map that"
	line "I asked him to get"

	para "me. We can worry"
	line "about that later."

	para "For now, I've got"
	line "something to show"
	cont "you all! Let's go!"
	done

	SailorGoFindTheCoin:
		text "TEST"
		done

	SailorRonaldBeforeFight:
		text "TEST"
		done

	SailorRonaldWinText:
		text "TEST"
		done

	SailorRonaldLossText:
		text "TEST"
		done

	SailorRonaldAfterFight:
		text "TEST"
		done

	Sailor2and3GoToGymText:
		text "TEST"
		done

	YoungsterAlexSeenText:
		text "TEST"
		done

	YoungsterAlexBeatenText:
		text "TEST"
		done

	YoungsterAlexAfterText:
		text "TEST"
		done

	LassCandiceSeenText:
		text "TEST"
		done

	LassCandiceBeatenText:
		text "TEST"
		done

	LassCandiceAfterText:
		text "TEST"
		done

	PlayerFoundGymCoin:
		text "TEST"
		done
	PercyShoutsDowntoPlayer:
		text "TEST"
		done
	PercyChallengesPlayer:
		text "TEST"
		done
	PercyWinText:
		text "TEST"
		done
	PercyLoseText:
		text "TEST"
		done
	PercyAfterBattleText:
		text "TEST"
		done

HeraldCove_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 34, 17, HERALD_PORT, 1
	warp_event 30,  5, HERALD_LAB, 1
	warp_event 19, 17, HERALD_POKECENTER, 1
	warp_event  6, 15, HERALD_GYM, 1
	warp_event 19,  5, HERALD_HOUSE, 1

	def_coord_events
	coord_event 23, 17, SCENE_HERALD_COVE_GYM_CHALLENGE, HeraldCoveRivalGymBattle
	coord_event 6,  16, SCENE_HERALD_COVE_GYM_CHALLENGE, GymChallengeScript

	def_bg_events

	def_object_events
	object_event  33, 18, SPRITE_OAK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OAK_HERALD_COVE
	object_event  21,  8, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_OAK_HERALD_COVE
	object_event  5,  16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Sailor1ScriptGym, EVENT_GYM_TRAINERS_IN_HERALD_COVE
	object_event  13, 14, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Sailor2and3ScriptGym, EVENT_GYM_TRAINERS_IN_HERALD_COVE
	object_event  25, 16, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Sailor2and3ScriptGym, EVENT_GYM_TRAINERS_IN_HERALD_COVE
	object_event  10, 18, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerYoungsterAlex, EVENT_GYM_TRAINERS_IN_HERALD_COVE
	object_event  17, 19, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerLassCandice, EVENT_GYM_TRAINERS_IN_HERALD_COVE
	object_event  35,  0, SPRITE_GOOD_RIVAL, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_GYM_TRAINERS_IN_HERALD_COVE
