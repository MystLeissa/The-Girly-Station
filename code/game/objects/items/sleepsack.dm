/obj/structure/closet/body_bag/sleepsack
	name = "sleep sack"
	desc = "A Pink Sleep Sack"
	icon_state = "sleepsack_open"
	opened = TRUE
	horizontal = TRUE
	allow_objects = FALSE
	allow_dense = FALSE
	dense_when_open = FALSE //if it's dense when open or not
	max_mob_size = MOB_SIZE_HUMAN //Biggest mob_size accepted by the container
	mob_storage_capacity = 1 // how many human sized mob/living can fit together inside a closet.
	storage_capacity = 30 //This is so that someone can't pack hundreds of items in a locker/crate then open it in a populated area to crash clients
	//w_class = WEIGHT_CLASS_SMALL
/*
/obj/item/bodybag/proc/deploy_bodybag(mob/user, atom/location)
	var/obj/structure/closet/body_bag/R = new unfoldedbag_path(location)
	R.open(user)
	R.add_fingerprint(user)
	R.foldedbag_instance = src

*/
/obj/structure/closet/body_bag/sleepsack/can_open(mob/living/user)
	. = ..()
	if(. && !user.loc==src)
		to_chat(user, "<span class='notice'>You can't open it from inside...</span>")
		return FALSE
	return TRUE

/obj/structure/closet/body_bag/sleepsack/update_icon()
	if(opened) icon_state = "sleepsack_open"
	if(!opened) icon_state = "sleepsack"

/obj/structure/closet/body_bag/sleepsack/container_resist(mob/living/user)
	return

/obj/structure/closet/body_bag/MouseDrop(over_object, src_location, over_location)
	. = ..()
	if(over_object == usr && Adjacent(usr) && (in_range(src, usr) || usr.contents.Find(src)))
		if(!ishuman(usr))
			return

		if(opened)
			to_chat(usr, "<span class='warning'>You wrestle with [src], but it won't fold while unzipped.</span>")
			return
		if(contents.len)
			to_chat(usr, "<span class='warning'>There are too many things inside of [src] to fold it up!</span>")
			return
		visible_message("<span class='notice'>[usr] folds up [src].</span>")
		var/obj/item/bodybag/B = foldedbag_instance || new foldedbag_path
		for(var/atom/movable/A in contents)
			if(isliving(A))
				//ADD_TRAIT(A,TRAIT_NO_BREATHING,STATUS_EFFECT_TRAIT)
				to_chat(A, "<span class='userdanger'>You're suddenly forced into a tiny space!</span>")
			A.forceMove(B)
		usr.put_in_hands(B)
		qdel(src)

/obj/item/bodybag/sleepsack
	name = "sleep sack"
	desc = "A Pink Sleep Sack"
	icon_state = "sleepsack_folded"
	custom_price = 500
	unfoldedbag_path = /obj/structure/closet/body_bag/sleepsack

/obj/item/bodybag/sleepsack/Initialize()
	. = ..()
	assume_air(get_turf(src))

/obj/item/bodybag/sleepsack/container_resist(mob/living/user)
	return

/obj/item/bodybag/sleepsack/suicide_act(mob/user)
	return


/obj/item/bodybag/sleepsack/Destroy()
	for(var/atom/movable/A in contents)
		A.forceMove(get_turf(src))
		if(isliving(A))
			//REMOVE_TRAIT(A,TRAIT_NO_BREATHING,STATUS_EFFECT_TRAIT)
			to_chat(A, "<span class='notice'>You suddenly feel the space around you torn apart! You're free!</span>")
	return ..()

/obj/item/sleepsack_new
	name = "sleepy sack"
	desc = "A Cursed Pillow...this can't be good."
	icon = 'icons/obj/bodybag.dmi'
	icon_state = "sleepsack_open"
	custom_price = 200
	force = 3
	attack_verb = list("fluffed","played","dolled","pushed")
	hitsound = 'sound/items/zip.ogg'
	w_class = WEIGHT_CLASS_SMALL
	var/obj/item/sleepsack_new/power_level = 0

/obj/item/sleepsack_new/attack(mob/living/target, mob/living/carbon/human/user)
	if(power_level>=3)
		return
	if(!target)
		return
	if(target==user)
		return
	if(!iscarbon(target))
		return
	var/atom/movable/target_mob = target
	target_mob.forceMove(src.loc)
	power_level++
	icon_state = "sleepsack"
	to_chat(target,"<span class='userdanger'>You have been absorbed into [src]!</span>")
	to_chat(user,"<span class='notice'>Your [src] asbored [target]</span>")

/obj/item/sleepsack_new/examine(mob/user)
	. = ..()
	. += "It has [!power_level ? "nothing" : "[power_level] buttons lit up."]"

/obj/item/sleepsack_new/attackby(obj/item/I, mob/user, params)
	if(user.is_holding_item_of_type(/obj/item/card/girls))
		for(var/atom/movable/A in contents)
			A.forceMove(get_turf(src))
			to_chat(user,"<span class='warning'>You released [A]</span>")
			to_chat(A,"<span class='notice'>You were released from [src]</span>")
			icon_state = "sleepsack_open"
			power_level--
	. = ..()