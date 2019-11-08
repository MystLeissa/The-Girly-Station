/datum/job/detective
	title = "Detective"
	flag = DETECTIVE
	auto_deadmin_role_flags = DEADMIN_POSITION_SECURITY
	department_head = list("Head of Security")
	department_flag = ENGSEC
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	supervisors = "the head of security"
	selection_color = "#ffeeee"
	minimal_player_age = 7
	exp_requirements = 300
	exp_type = EXP_TYPE_CREW

	outfit = /datum/outfit/job/detective

	access = list(ACCESS_SEC_DOORS, ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_MECH_SECURITY, ACCESS_COURT, ACCESS_BRIG, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM)
	minimal_access = list(ACCESS_SEC_DOORS, ACCESS_FORENSICS_LOCKERS, ACCESS_MORGUE, ACCESS_MAINT_TUNNELS, ACCESS_MECH_SECURITY, ACCESS_COURT, ACCESS_BRIG, ACCESS_WEAPONS, ACCESS_MINERAL_STOREROOM)
	paycheck = PAYCHECK_MEDIUM
	paycheck_department = ACCOUNT_SEC
	mind_traits = list(TRAIT_LAW_ENFORCEMENT_METABOLISM)
	display_order = JOB_DISPLAY_ORDER_DETECTIVE

/datum/job/detective/superheroine
	title = "Superheroine"
	supervisors = "Truth, love and Justice (and space law)"
	minimal_player_age = 2
	exp_requirements = 120
	exp_type = EXP_TYPE_CREW
	flag = ASSISTANT
	department_flag = CIVILIAN
	total_positions = 1
	spawn_positions = 1
	outfit = /datum/outfit/job/superheroineuntransformed
	access = list(ACCESS_MAINT_TUNNELS)
	minimal_access = list(ACCESS_MAINT_TUNNELS)
	paycheck = PAYCHECK_ASSISTANT
	paycheck_department = ACCOUNT_CIV
	selection_color = "#ffccdd"
	display_order = JOB_DISPLAY_ORDER_DEFAULT

/datum/outfit/job/superheroine
	name = "Superheroine"
	jobtype = /datum/job/detective/superheroine
	uniform = /obj/item/clothing/under/schoolgirl/magical
	id = /obj/item/card/id/superheroine
	shoes = /obj/item/clothing/shoes/winterboots
	belt = /obj/item/melee/classic_baton
	ears = /obj/item/radio/headset/superheroine
	implants = list(/obj/item/implant/mindshield)
	pda_slot = SLOT_L_STORE
	l_pocket = /obj/item/pda/clear
	r_pocket = /obj/item/detective_scanner
	backpack_contents = list(/obj/item/storage/box/evidence=1,/obj/item/shadowcloak=1)

/datum/outfit/job/superheroine/pre_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	H.delete_equipment()
	..()

/datum/outfit/job/superheroine/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	var/old_name = H.real_name
	H.fully_replace_character_name(old_name,"[pick("Station Girl","Pink Mask","Selfie Pro","Doll Woman","Dolly Drastic","Lynette Twist","Runtime Girl","Weaving Window","Smeared Painting")]")
	H.gender = FEMALE //Girls Only
	..()

/datum/outfit/job/superheroineuntransformed
	name = "Superheroine (Untransformed)"
	jobtype = /datum/job/assistant
	id = /obj/item/card/id
	uniform = /obj/item/clothing/under/color/grey
	belt = /obj/item/pda
	shoes = /obj/item/clothing/shoes/sneakers/black
	l_pocket = null
	r_pocket = /obj/item/card/girls/superheroine
	ears = /obj/item/radio/headset
	backpack_contents = list()
	implants = list()
	pda_slot = SLOT_BELT

/datum/outfit/job/detective
	name = "Detective"
	jobtype = /datum/job/detective

	belt = /obj/item/pda/detective
	ears = /obj/item/radio/headset/headset_sec/alt
	uniform = /obj/item/clothing/under/rank/det/skirt
	neck = /obj/item/clothing/neck/tie/detective
	shoes = /obj/item/clothing/shoes/sneakers/brown
	suit = /obj/item/clothing/suit/det_suit
	gloves = /obj/item/clothing/gloves/color/black
	head = /obj/item/clothing/head/fedora/det_hat
	l_pocket = /obj/item/toy/crayon/white
	r_pocket = /obj/item/lighter
	backpack_contents = list(/obj/item/storage/box/evidence=1,\
		/obj/item/detective_scanner=1,\
		/obj/item/melee/classic_baton=1)
	mask = /obj/item/clothing/mask/cigarette

	implants = list(/obj/item/implant/mindshield)

	chameleon_extras = list(/obj/item/gun/ballistic/revolver/detective, /obj/item/clothing/glasses/sunglasses)

/datum/outfit/job/detective/post_equip(mob/living/carbon/human/H, visualsOnly = FALSE)
	..()
	var/obj/item/clothing/mask/cigarette/cig = H.wear_mask
	if(istype(cig)) //Some species specfic changes can mess this up (plasmamen)
		cig.light("")
	if(visualsOnly)
		return

