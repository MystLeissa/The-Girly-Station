/obj/item/clothing/under/schoolgirl
	name = "blue schoolgirl uniform"
	desc = "It's just like one of my Japanese animes!"
	icon_state = "schoolgirl"
	item_state = "schoolgirl"
	item_color = "schoolgirl"
	body_parts_covered = CHEST|GROIN|ARMS
	fitted = FEMALE_UNIFORM_TOP
	can_adjust = FALSE

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
	random_sensor = FALSE
	pocket_storage_component_path = /datum/component/storage/concrete/pockets/schoolgirl
	custom_price = 100
	var/locked = FALSE
	var/perma = FALSE
	var/mob/wearer = null
	var/slaved = FALSE
	var/mob/slaved_to = null

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
	. = ..()
	wearer = null

/obj/item/clothing/under/schoolgirl/locked/proc/toggle_lock(user)
	locked = !locked
	if(locked)
		lock(user)
	if(!locked)
		unlock(user)

/obj/item/clothing/under/schoolgirl/locked/proc/lock(mob/user)
	var/mob/living/carbon/human/M = user
	ADD_TRAIT(src,TRAIT_NODROP, CLOTHING_TRAIT)
	ADD_TRAIT(user,TRAIT_DITZ, CLOTHING_TRAIT)
	ADD_TRAIT(user,TRAIT_NOSUIT, CLOTHING_TRAIT)
	locked = TRUE
	to_chat(wearer,"<span class='notice'>The Lock Snaps Shut. It seems you will be wearing this for a quite while")
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
	/*if(perma)
		return
	if(I == /obj/item/locks/perma)
		to_chat(user,"You swap out the lock for a permanent type")
		perma = TRUE
		return
	if(I == /obj/item/locks/slave)
		to_chat(user,"You swap out the standard lock for a slave lock")
		slaved = TRUE
		slaved_to = user
		return
	if(slaved)
		if(user==slaved_to)
			toggle_lock(user)
		return
	*/
	if(user.is_holding_item_of_type(/obj/item/card/girls) && !perma)
		unlock()
		return
	to_chat(user,"It's locked.")

/obj/item/clothing/under/schoolgirl/locked/examine(mob/user)
	. = ..()
	if(locked)
		. += "<span class='notice'>It's locked..</span>"
	if(perma)
		. += "<span class='notice'>It's impossible to unlock.</span>"
	if(slaved)
		. += "<span class-'notice'>They belong to [slaved_to].</span>"

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

/obj/item/clothing/mask/muzzle/schoolgirl
	name = "deprieciated"
	desc = "defunct item"

/obj/item/clothing/mask/schoolgirl
	name = "schoolgirl mask"
	desc = "To stop that awful noise."
	icon_state = "sexyclown"
	flags_inv = HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDEEARS
	clothing_flags = VOICEBOX_TOGGLABLE
	modifies_speech = TRUE
	flags_cover = MASKCOVERSMOUTH
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/mask/schoolgirl/handle_speech(datum/source, list/speech_args) //whenever you speak
	..()
	if(!CHECK_BITFIELD(clothing_flags, VOICEBOX_DISABLED))
		speech_args[SPEECH_MESSAGE] = pick("I'm such a sissy!", "I'm a good girl..really!","So Soft - I just wanna wear this forever.")
