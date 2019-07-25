/obj/machinery/lavaland/hole
	name = "hole"
	desc = "Improper Hole"
	icon = 'icons/obj/lavaland/holes.dmi'
	icon_state = "X"
	var/list/linked = list()
	var/to_level = "Error"
	var/linked_hole
	var/ready = FALSE
	var/list/destinations = list()
	anchored = TRUE

/obj/machinery/lavaland/hole/proc/climb(atom/movable/AM)
	playsound(src, 'sound/misc/slip.ogg', 30, TRUE)
	if (ismovableatom(AM))
		if(!ready)
			if(to_level=="one")
				destinations = GLOB.lavaland_holes_one
				linked_hole = pick(destinations)
			if(to_level=="two")
				destinations = GLOB.lavaland_holes_two
				linked_hole = pick(destinations);
			ready = TRUE
		AM.forceMove(get_turf(linked_hole))

/obj/machinery/lavaland/hole/down
	name = "hole down"
	desc = "a hole leading further down"
	icon_state = "dn"
	density = TRUE

/obj/machinery/lavaland/hole/down/Bumped(atom/movable/AM)
	climb(AM)
	return

/obj/machinery/lavaland/hole/down/one
	desc = "a hole leading to map level 2"
	to_level = "two"

/obj/machinery/lavaland/hole/down/one/Initialize()
	. = ..()
	GLOB.lavaland_holes_one += src

/obj/machinery/lavaland/hole/down/one/Destroy()
	GLOB.lavaland_holes_one.Remove(src)
	return ..()

/obj/machinery/lavaland/hole/up
	name = "hole up"
	desc = "a hole leading up"
	icon_state = "up"
	density = FALSE

/obj/machinery/lavaland/hole/up/two
	to_level = "one"
	desc = "a hole above you leading to map level 1"

/obj/machinery/lavaland/hole/up/two/Initialize()
	. = ..()
	GLOB.lavaland_holes_two += src

/obj/machinery/lavaland/hole/up/attackby(obj/item/W, mob/user, params)
	if(get_turf(user)==get_turf(src))
		if(istype(W,/obj/item/rope))
			climb(user)

/obj/item/rope
	name = "rope"
	desc = "This aids in climbing"
	icon = 'icons/obj/lavaland/holes.dmi'
	icon_state = "rope"
	custom_price = 200