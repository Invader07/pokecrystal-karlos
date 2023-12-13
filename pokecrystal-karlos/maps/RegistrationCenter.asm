	object_const_def
	const REGISTRATION_CENTER_OFFICER

RegistrationCenter_MapScripts:
	def_scene_scripts

	def_callbacks

RegistrationCenterOfficerScript:
	faceplayer
	opentext
	checkitem ID_CARD
	iftrue .Skip
	writetext RegistrationText
	yesorno
	iffalse .No
	writetext RegistrationSignUp
	verbosegiveitem ID_CARD
	waitbutton
	writetext RegistrationStarterKit
	waitbutton
	verbosegiveitem POTION
	waitbutton
	verbosegiveitem EXP_SHARE
	promptbutton
	writetext RegistrationGoodLuck
	waitbutton
	closetext
	end

.No
	writetext ComeBackLater
	waitbutton
	closetext
	end

.Skip
	writetext RegistrationGoodLuck
	waitbutton
	closetext
	end

RegistrationText:
	text "Hello! Are you"
	line "here to sign up?"
	done

ComeBackLater:
	text "Ah my mistake."
	line "Please come back"
	cont "later if you wish."
	done

RegistrationSignUp:
	text "Great! PROF. OAK"
	line "called ahead with"
	cont "your details."

	para "Your I.D. CARD is"
	line "already made and"
	cont "ready for you."
	done

RegistrationStarterKit:
	text "All participants"
	line "also get a little"
	cont "gift from us!"

	para "Consider it a"
	line "thank you for join"
	cont "-ing us."
	done

RegistrationGoodLuck:
	text "Thank you again,"
	line "and good luck!"
	done

RegistrationCenter_MapEvents:
	db 0, 0 ; filler

	def_warp_events
	warp_event 4,  9, HERALD_ROUTE, 1
	warp_event 5,  9, HERALD_ROUTE, 1

	def_coord_events

	def_bg_events

	def_object_events
	object_event  4,  2, SPRITE_OFFICER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, RegistrationCenterOfficerScript, -1
