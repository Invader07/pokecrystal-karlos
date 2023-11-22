	object_const_def
	const HERALD_ROUTE_YOUNGSTER1
	const HERALD_ROUTE_YOUNGSTER2
	const HERALD_ROUTE_LASS1
	const HERALD_ROUTE_COOLTRAINERF1

HeraldRoute_MapScripts:
	def_scene_scripts

	def_callbacks

TrainerYoungsterKevin:
	trainer YOUNGSTER, KEVIN, EVENT_BEAT_YOUNGSTER_KEVIN, YoungsterKevinSeenText, YoungsterKevinBeatenText, 0, .Script

	.Script:
		endifjustbattled
		opentext
		writetext YoungsterKevinAfterText
		waitbutton
		closetext
		end

TrainerYoungsterJames:
	trainer YOUNGSTER, JAMES, EVENT_BEAT_YOUNGSTER_JAMES, YoungsterJamesSeenText, YoungsterJamesBeatenText, 0, .Script

	.Script:
		endifjustbattled
		opentext
		writetext YoungsterJamesAfterText
		waitbutton
		closetext
		end

TrainerLassAlexis:
	trainer LASS, ALEXIS, EVENT_BEAT_LASS_ALEXIS, LassAlexisSeenText, LassAlexisBeatenText, 0, .Script

	.Script:
		endifjustbattled
		opentext
		writetext LassAlexisAfterText
		waitbutton
		closetext
		end

TrainerCoolTrainerFStacy:
	trainer COOLTRAINERF, STACY, EVENT_BEAT_COOLTRAINERF_STACY, CoolTrainerFStacySeenText, CoolTrainerFStacyBeatenText, 0, .Script

	.Script:
		endifjustbattled
		opentext
		writetext CoolTrainerFStacyAfterText
		waitbutton
		closetext
		end

HeraldRouteSignScript:
	opentext
	writetext HeraldRouteSignText
	waitbutton
	closetext
	end

YoungsterKevinSeenText:
	text "Hey, I haven't"
	line "seen you here"

	para "before. You must"
	line "be new here, but"

	para "that won't stop"
	line "me from beating"
	cont "you! Come on!"
	done

YoungsterKevinBeatenText:
	text "Aww. You're"
	line "pretty good!"
	done

YoungsterKevinAfterText:
	text "I caught my"
	line "#MON right"
	cont "here!"

	para "But I need money"
	line "to get more..."
	done

YoungsterJamesSeenText:
	text "Go FLETCHLING!"
	line "We will win this"
	cont "time!"
	done

YoungsterJamesBeatenText:
	text "Darn, not again..."
	done

YoungsterJamesAfterText:
	text "I just got beat by"
	line "some girl. She was"
	cont "really tough."

LassAlexisSeenText:
	text "There's so many "
	line "cute #MON!"

	para "Here, let me show"
	line "you mine!"
	done

LassAlexisBeatenText:
	text "I really like"
	line "yours too!"
	done

LassAlexisAfterText:
	text "I caught a lot"
	line "of #MON."

	para "But I keep seeing"
	line "different ones"
	cont "sometimes."

	para "I think one comes"
	line "out at night too!"

CoolTrainerFStacySeenText:
	text "Oh good. I could"
	line "use a warm up!"
	done

CoolTrainerFStacyBeatenText:
	text "What?!"

CoolTrainerFStacyAfterText:
	text "You're good. Are"
	line "you signing up?"

HeraldRouteSignText:
	text "Sign!"

	done

HeraldRoute_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 26,  5, REGISTRATION_CENTER, 1

	def_coord_events

	def_bg_events
	bg_event 50,  9, BGEVENT_READ, HeraldRouteSignScript

	def_object_events
	object_event 48,  9, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerYoungsterKevin, -1
	object_event 26, 12, SPRITE_YOUNGSTER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterJames, -1
	object_event  8, 12, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 4, TrainerLassAlexis, -1
	object_event 19,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCoolTrainerFStacy, -1
