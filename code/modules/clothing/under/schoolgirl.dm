/obj/item/clothing/under/schoolgirl
	name = "blue schoolgirl uniform"
	desc = "It's just like one of my Japanese animes!"
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	item_color = "schoolgirl"
	body_parts_covered = CHEST|GROIN
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

/obj/item/clothing/under/schoolgirl/magical
	name = "magical girl uniform"
	desc = "It's a magical girl uniform. It seems to be cute."
	icon_state = "magicalgirl"
	item_state = "magicalgirl"
	item_color = "magicalgirl"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	has_sensor = LOCKED_SENSORS
	sensor_mode = SENSOR_COORDS
	random_sensor = FALSE
	body_parts_covered = 0
	clothing_flags = SHOWEROKAY
	locked_string = "is bonded to you."
	var/obj/item/clothing/mask/mask_type = /obj/item/clothing/mask/superheroine
	var/obj/item/clothing/mask/superheroine/facemask = null
	var/mask_toggled = FALSE
	actions_types = list(/datum/action/item_action/toggle_mask)

/obj/item/clothing/under/schoolgirl/magical/proc/MakeMask()
	if(!facemask)
		var/obj/item/clothing/mask/superheroine/W = new mask_type(src)
		W.uniform = src
		facemask = W

/obj/item/clothing/under/schoolgirl/magical/item_action_slot_check(slot, mob/user)
	if(slot == SLOT_W_UNIFORM)
		return 1


/obj/item/clothing/under/schoolgirl/magical/Initialize(mapload)
	..()
	MakeMask()

/obj/item/clothing/under/schoolgirl/magical/Destroy()
	..()
	qdel(facemask)
	facemask = null

/obj/item/clothing/under/schoolgirl/magical/AltClick(mob/user)
	..()
	if(user == src.loc)
		ToggleMask()

/obj/item/clothing/under/schoolgirl/magical/proc/ToggleMask()
	if(!mask_toggled)
		if(ishuman(src.loc))
			var/mob/living/carbon/human/H = src.loc
			if(H.w_uniform != src)
				to_chat(H,"You must wear it to use the mask!")
				return
			if(H.wear_mask)
				to_chat(H,"You are already wearing a mask!")
				return
			else
				H.equip_to_slot_if_possible(facemask,SLOT_WEAR_MASK,0,0,1)
				mask_toggled = TRUE
				to_chat(H,"You wear the [facemask]")

	else
		RemoveMask()

/obj/item/clothing/under/schoolgirl/magical/proc/RemoveMask()
	mask_toggled = FALSE
	if(ishuman(src.loc))
		var/mob/living/carbon/H = facemask.loc
		H.transferItemToLoc(facemask, src, TRUE)
		to_chat(H,"You remvoe the [facemask]")
	else
		facemask.forceMove(src)

/obj/item/clothing/mask/superheroine
	name = "Super Heroine Mask"
	desc = "It's a magical girl mask!"
	icon_state = "heroinemask"
	item_state = "heroinemask"
	item_color = "heroinemask"
	var/obj/item/clothing/under/schoolgirl/magical/uniform = null
	flags_cover = MASKCOVERSEYES
	flags_inv = HIDEFACE

/obj/item/clothing/mask/superheroine/Destroy()
	uniform = null
	return ..()

/obj/item/clothing/mask/superheroine/dropped()
	..()
	uniform.RemoveMask()

/obj/item/clothing/mask/superheroine/equipped(mob/user,slot)
	..()
	if(slot != SLOT_WEAR_MASK)
		if(uniform)
			src.forceMove(uniform)
		else
			qdel(src)

/obj/item/clothing/under/schoolgirl/magical/equipped(mob/user,slot)
	var/mob/living/carbon/human/M = user
	if(slot == SLOT_W_UNIFORM)
		ADD_TRAIT(src,TRAIT_NODROP, CLOTHING_TRAIT)
		to_chat(M,"<span class='notice'>The [src] bonds to your body forming an unbreakable connection.</span>")

/obj/item/clothing/under/schoolgirl/magical/on_mob_death(mob/living/L, gibbed)
	if(L==src.loc)
		REMOVE_TRAIT(src,TRAIT_NODROP, CLOTHING_TRAIT)
		if(HAS_TRAIT(L,TRAIT_SUPERHEROINE))
			var/mob/living/carbon/human/H = L
			new /obj/item/card/girls/superheroine(get_turf(src.loc))
			H.delete_equipment()

/obj/item/clothing/under/schoolgirl/locked/on_mob_death(mob/living/L, gibbed)
	if(L==src.loc)
		REMOVE_TRAIT(src,TRAIT_NODROP, CLOTHING_TRAIT)
		REMOVE_TRAIT(wearer,TRAIT_DITZ, CLOTHING_TRAIT)
		REMOVE_TRAIT(wearer,TRAIT_NOSUIT, CLOTHING_TRAIT)

/obj/item/clothing/under/schoolgirl/red
	name = "red schoolgirl uniform"
	icon_state = "schoolgirlred"
	item_state = "schoolgirlred"
	item_color = "schoolgirlred"

/obj/item/clothing/under/schoolgirl/green
	name = "green schoolgirl uniform"
	icon_state = "schoolgirlgreen"
	item_state = "schoolgirlgreen"
	item_color = "schoolgirlgreen"

/obj/item/clothing/under/schoolgirl/orange
	name = "orange schoolgirl uniform"
	icon_state = "schoolgirlorange"
	item_state = "schoolgirlorange"
	item_color = "schoolgirlorange"

/obj/item/clothing/under/schoolgirl/locked
	name = "pink schoolgirl uniform"
	desc = "It has a little lock inside. It's also super cute."
	icon_state = "schoolgirlpink"
	item_state = "schoolgirlpink"
	item_color = "schoolgirlpink"
	resistance_flags = LAVA_PROOF | FIRE_PROOF | ACID_PROOF
	has_sensor = NO_SENSORS
	sensor_mode = SENSOR_COORDS
	clothing_flags = SHOWEROKAY
	random_sensor = FALSE
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/schoolgirl
	custom_price = 100
	var/locked = FALSE
	var/perma = FALSE
	var/mob/wearer = null
	locked_string = "is locked."

/obj/item/clothing/under/schoolgirl/locked/traitor
	pocket_storage_component_path = null
	no_changes = TRUE

/obj/item/clothing/under/schoolgirl/locked/traitor/Initialize()
	. = ..()
	var/obj/item/clothing/accessory/sailorfuku/A = new (src)
	attach_accessory(A)

/obj/item/clothing/under/schoolgirl/locked/traitor/attackby(obj/item/I, mob/user, params)
	if(user.is_holding_item_of_type(/obj/item/card/emag))
		unlock()
		return
	to_chat(user,"It's locked.")

/obj/item/clothing/under/schoolgirl/locked/fake
	custom_price = 25
	locked_string = "is not removable by wearer"

/obj/item/clothing/under/schoolgirl/locked/fake/lock(mob/user)
	var/mob/living/carbon/human/M = user
	ADD_TRAIT(src,TRAIT_NODROP,CLOTHING_TRAIT)
	ADD_TRAIT(src,TRAIT_NO_SS, CLOTHING_TRAIT)
	ADD_TRAIT(user,TRAIT_DITZ, CLOTHING_TRAIT)
	ADD_TRAIT(user,TRAIT_NOSUIT, CLOTHING_TRAIT)
	locked = TRUE
	perma = TRUE
	to_chat(wearer,"<span class='notice'>The Lock Snaps Shut. It seems you will be wearing this until someone relieves you of it.")
	if(M.wear_suit)
		to_chat(wearer,"<span class='warning'>Your armor falls off...</span>")
		M.dropItemToGround(M.wear_suit)

/obj/item/clothing/under/schoolgirl/locked/fake/dropped(mob/user)
	REMOVE_TRAIT(src,TRAIT_NODROP, CLOTHING_TRAIT)
	REMOVE_TRAIT(src,TRAIT_NO_SS,CLOTHING_TRAIT)
	REMOVE_TRAIT(wearer,TRAIT_DITZ, CLOTHING_TRAIT)
	REMOVE_TRAIT(wearer,TRAIT_NOSUIT, CLOTHING_TRAIT)
	locked = FALSE
	wearer = null
	. = ..()

/obj/item/clothing/under/schoolgirl/locked/equipped(mob/user, slot)
	. = ..()
	if(HAS_TRAIT(user,TRAIT_EXOSKELETON))
		user.dropItemToGround(src)
		to_chat(user,"<span='warning'>You cannot wear this as it would not fit over your exoskeleton</span>")
		return
	if(slot == SLOT_W_UNIFORM)
		wearer = user
		lock(user)

/obj/item/clothing/under/schoolgirl/locked/dropped(mob/user)
	wearer = null
	. = ..()

/obj/item/clothing/under/schoolgirl/locked/proc/lock(mob/user)
	var/mob/living/carbon/human/M = user
	ADD_TRAIT(src,TRAIT_NODROP, CLOTHING_TRAIT)
	ADD_TRAIT(user,TRAIT_DITZ, CLOTHING_TRAIT)
	ADD_TRAIT(user,TRAIT_NOSUIT, CLOTHING_TRAIT)
	locked = TRUE
	to_chat(wearer,"<span class='notice'>The Lock Snaps Shut. It seems you will be wearing this for a quite while.</span>")
	if(M.wear_suit)
		to_chat(wearer,"<span class='warning'>Your armor falls off...</span>")
		M.dropItemToGround(M.wear_suit)

/obj/item/clothing/under/schoolgirl/locked/proc/unlock(mob/user)
	if(HAS_TRAIT_FROM(src, TRAIT_NODROP, CLOTHING_TRAIT))
		locked = FALSE
		to_chat(user, "<span class='notice'>You unlock the outfit.</span>")
		//to_chat(wearer,"<span class='notice'>[user] unlocks your outfit!")
		REMOVE_TRAIT(src,TRAIT_NODROP, CLOTHING_TRAIT)
		REMOVE_TRAIT(wearer,TRAIT_DITZ, CLOTHING_TRAIT)
		REMOVE_TRAIT(wearer,TRAIT_NOSUIT, CLOTHING_TRAIT)
	return

/obj/item/clothing/under/schoolgirl/locked/attackby(obj/item/I, mob/user, params)
	if(user.is_holding_item_of_type(/obj/item/card/girls) && !perma)
		unlock()
		return
	to_chat(user,"It's locked.")

/obj/item/clothing/under/schoolgirl/locked/blue
	name = "blue schoolgirl uniform"
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	item_color = "schoolgirl"

/obj/item/clothing/under/schoolgirl/locked/red
	name = "red schoolgirl uniform"
	icon_state = "schoolgirlred"
	item_state = "schoolgirlred"
	item_color = "schoolgirlred"

/obj/item/clothing/under/schoolgirl/locked/orange
	name = "orange schoolgirl uniform"
	icon_state = "schoolgirlorange"
	item_state = "schoolgirlorange"
	item_color = "schoolgirlorange"

/obj/item/clothing/under/schoolgirl/locked/green
	name = "green schoolgirl uniform"
	icon_state = "schoolgirlgreen"
	item_state = "schoolgirlgreen"
	item_color = "schoolgirlgreen"

/obj/item/clothing/mask/schoolgirl
	name = "schoolgirl mask"
	desc = "To stop that awful noise."
	icon_state = "sexyclown"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEEARS
	clothing_flags = NONE
	modifies_speech = TRUE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/schoolgirl/handle_speech(datum/source, list/speech_args) //whenever you speak
	..()
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		speech_args[SPEECH_MESSAGE] = pick("I'm such a sissy!", "I'm a good girl..really!","So Soft - I just wanna wear this forever.")
