	object_const_def
	const HERALD_GYM_BASTIAN

HeraldGym_MapScripts:
	def_scene_scripts
	scene_script HeraldGymBastianFront, SCENE_HERALD_GYM_BASTIAN_FRONT
	scene_script HeraldGymNoop1Scene, SCENE_HERALD_GYM_NOOP1

	def_callbacks

	HeraldGymBastianFront:
		end

	HeraldGymNoop1Scene:
		end

	BastianScript:
		faceplayer
		opentext
		checkevent ENGINE_ANCHORBADGE
		iftrue .SpeechAfterTM
		checkitem BASTIAN_COIN
		iftrue .HeraldGymBattle
		checkitem ID_CARD
		iftrue BastianStartGymChallengeScript
		checkevent EVENT_GOT_MAP_FROM_BASTIAN
		iftrue BastianComeBackLaterScript
		checkevent EVENT_GOT_A_POKEMON_FROM_OAK
		iftrue BastianMapScript
		writetext BastianHowDidYouGetHereScript
		waitbutton
		closetext
		end
	.HeraldGymBattle:
		writetext BastianGymBattleIntro
		waitbutton
		closetext
		winlosstext BastianGymBattleWin, 0
		loadtrainer BASTIAN, BASTIAN1
		startbattle
		reloadmapafterbattle
		setevent EVENT_BEAT_BASTIAN
		opentext
		writetext ReceivedAnchorBadgeText
		playsound SFX_GET_BADGE
		waitsfx
		setflag ENGINE_ANCHORBADGE
		readvar VAR_BADGES
		setevent EVENT_GYM_TRAINERS_IN_HERALD_COVE
	.FightDone:
		writetext BastianBeatenText
		waitbutton
		closetext
		end
	.SpeechAfterTM:
		writetext BastianFightOverText
		waitbutton
		closetext
		end

	BastianStartGymChallengeScript:
		writetext BastianExplainsGymChallenge
		yesorno
		iffalse .No
		writetext BastianGivesGymChallenge
		waitbutton
		closetext
		setmapscene HERALD_COVE, SCENE_HERALD_COVE_GYM_CHALLENGE
		clearevent EVENT_GYM_TRAINERS_IN_HERALD_COVE
		end

	.No
		writetext BastianNoGymChallenge
		waitbutton
		closetext
		end

	BastianComeBackLaterScript:
		writetext BastianComeBackLaterText
		waitbutton
		closetext
		end

	BastianMapScript:
		writetext BastianGivesMapText
		verbosegiveitem SEALED_MAP
		setevent EVENT_GOT_MAP_FROM_BASTIAN
		writetext PlayerShouldJoinConference
		waitbutton
		closetext
		setmapscene HERALD_LAB, SCENE_HERALD_LAB_POKEDEX
		end

	BastianHowDidYouGetHereScript:
		writetext BastianHowDidYouGetHereText
		waitbutton
		closetext
		end

	BastianComeBackLaterText:
		text "Come back once"
		line "you're all regis-"
		cont "tered up."
		done

	BastianGivesMapText:
		text "BASTIAN: There you"
		line "are <PLAYER>!"

		para "Here's that map he"
		line "was lookin' fer."
		done

	PlayerShouldJoinConference:
		text "That should keep"
		line "'im busy for a"
		cont "little while."

		para "...Ah, I see you"
		line "have a #MON!"

		para "Why don't you go"
		line "on and get signed"
		cont "up to battle?"

		para "There's a BATTLE"
		line "CONFERENCE open on"
		cont "the islands now."

		para "It's a great way"
		line "to travel and bond"
		cont "with your #MON!"

		para "Give that MAP to"
		line "OAK, and then go"
		cont "sign up."

		para "I'll be here when"
		line "you're ready!"
		done

	BastianHowDidYouGetHereText:
		text "Cheatn mutherfuckr"
		done

	BastianExplainsGymChallenge:
		text "TEST"
		done

	BastianGivesGymChallenge:
		text "TEST"
		done

	BastianNoGymChallenge:
		text "TEST"
		done

	BastianGymBattleIntro:
		text "TEST"
		done
	BastianGymBattleWin:
		text "TEST"
		done
	ReceivedAnchorBadgeText:
		text "<PLAYER> received"
		line "ANCHOR BADGE!"
		done
	BastianBeatenText:
		text "TEST"
		done
	BastianFightOverText:
		text "TEST"
		done

HeraldGym_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event  4,  7, HERALD_COVE, 4
	warp_event  5,  7, HERALD_COVE, 4

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_SAILOR, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BastianScript, -1
