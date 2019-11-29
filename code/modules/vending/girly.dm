/obj/machinery/vending/girly
	name = "Girly Stuffs"
	desc = "A Girl-thing dispensor, who knew?"
	icon_state = "girly"
	product_slogans = "Forever Kawaii!!"
	products = list(/obj/item/storage/lockbox/girlkey = 1,
					/obj/item/clothing/under/schoolgirl/locked = 4,
					/obj/item/clothing/under/schoolgirl/locked/blue = 4,
					/obj/item/clothing/under/schoolgirl/locked/red = 4,
					/obj/item/clothing/under/schoolgirl/locked/orange = 4,
					/obj/item/clothing/under/schoolgirl/locked/green = 4,
					/obj/item/firing_pin/girl = 4,
					/obj/item/bodybag/sleepsack = 1,
					/obj/item/sleepsack_new = 1,
					/obj/item/radio/girl = 5,
					/obj/item/clothing/accessory/sailorfuku = 4,
					/obj/item/clothing/gloves/color/pink = 2,
					/obj/item/clothing/under/schoolgirl/magical = 2)
	contraband = list (/obj/item/encryptionkey/girl = 2)
	refill_canister = /obj/item/vending_refill/girly
	product_ads = "Pretty Princess Power!"
	default_price = 10000
	extra_price = 5000
	payment_department = NO_FREEBIES
	girl_locked = TRUE

/obj/machinery/vending/girly/pink
	name = "Pink Stuffz"
	desc = "A Knock-off Girl-thing dispensor..."
	icon_state = "pgirly"
	products = list(/obj/item/clothing/under/schoolgirl/locked/fake = 1,
					/obj/item/clothing/under/schoolgirl = 2,
					/obj/item/clothing/under/schoolgirl/orange = 2,
					/obj/item/clothing/under/schoolgirl/green = 2,
					/obj/item/clothing/under/schoolgirl/orange = 2,
					/obj/item/clothing/accessory/sailorfuku = 2,
					/obj/item/clothing/gloves/color/pink = 1,
					/obj/item/clothing/under/pinkdress = 2,
					/obj/item/clothing/under/maid = 1,
					/obj/item/clothing/under/janimaid = 1,
					/obj/item/clothing/under/skirt/bimbo = 2,
					/obj/item/clothing/under/schoolgirl/magical = 1,
					/obj/item/storage/backpack/duffelbag/girly_conscript = 1)
	contraband = list(/obj/item/firing_pin/girl = 1,
					  /obj/item/radio/girl = 1)
	girl_locked = FALSE
	default_price = 100
	extra_price = 4900

/obj/machinery/vending/girly/emag_act(mob/user)
	to_chat(user, "<span class='notice'>You cannot Emag [src].</span>")
	return

/obj/item/vending_refill/girly
	machine_name = "Girly Stuffs"
	icon_state = "refill_girly"

/obj/item/storage/backpack/duffelbag/girly_conscript
	name = "Knock-off Mining Kit"
	desc = "A kit containing (almost) everything a girl needs to support a shaft miner in the field."

/obj/item/storage/backpack/duffelbag/girly_conscript/PopulateContents()
	new /obj/item/card/mining_access_card(src)
	new /obj/item/kitchen/knife/combat/survival(src)
	new /obj/item/firing_pin/girl(src)