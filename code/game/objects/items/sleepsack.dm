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
	foldedbag_path = /obj/item/bodybag/sleepsack
	foldedbag_instance = null

/obj/structure/closet/body_bag/sleepsack/can_open(mob/living/user)
	. = ..()
	if(. && !user.loc==src)
		to_chat(user, "<span class='notice'>You can't open it from inside...</span>")
		return FALSE
	return TRUE
/obj/structure/closet/bodybag/sleepsack/update_icon()
	if(opened) icon_state = "sleepsack_open"
	if(!opened) icon_state = "sleepsack"

/obj/item/bodybag/sleepsack
	name = "sleep sack"
	desc = "A Pink Sleep Sack"
	icon_state = "sleepsack_folded"
	custom_price = 500
	unfoldedbag_path = /obj/structure/closet/body_bag/sleepsack

		.
/obj/item/bodybag/sleepsack/Destroy()
	for(var/atom/movable/A in contents)
		A.forceMove(get_turf(src))
		if(isliving(A))
			REMOVE_TRAIT(A,TRAIT_NO_BREATHING,STATUS_EFFECT_TRAIT)
			to_chat(A, "<span class='notice'>You suddenly feel the space around you torn apart! You're free!</span>")
	return ..()