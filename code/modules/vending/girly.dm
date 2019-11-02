/obj/machinery/vending/girly
	name = "Girly Stuffs"
	desc = "A Girl-thing dispensor, who knew?"
	icon_state = "girly"
	product_slogans = "Forever Kawaii!!"
	products = list(/obj/item/storage/lockbox/girlkey = 1,
					/obj/item/clothing/under/schoolgirl/locked = 2,
					/obj/item/clothing/under/schoolgirl/locked/blue = 2,
					/obj/item/clothing/under/schoolgirl/locked/red = 2,
					/obj/item/clothing/under/schoolgirl/locked/orange = 2,
					/obj/item/clothing/under/schoolgirl/locked/green = 2,
					/obj/item/firing_pin/girl = 5,
					/obj/item/bodybag/sleepsack = 3,
					/obj/item/sleepsack_new = 1,
					/obj/item/radio/girl = 10,
					/obj/item/clothing/accessory/sailorfuku = 2,
					/obj/item/clothing/gloves/color/pink = 4,
					/obj/item/clothing/under/schoolgirl/magical = 3)
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
	products = list(/obj/item/clothing/under/schoolgirl = 1,
					/obj/item/clothing/under/schoolgirl/orange = 1,
					/obj/item/clothing/under/schoolgirl/green = 1,
					/obj/item/clothing/under/schoolgirl/orange = 1,
					/obj/item/clothing/accessory/sailorfuku = 4,
					/obj/item/clothing/gloves/color/pink = 3,
					/obj/item/clothing/under/pinkdress = 2,
					/obj/item/clothing/under/maid = 1,
					/obj/item/clothing/under/janimaid = 1,
					/obj/item/clothing/under/schoolgirl/magical = 1)
	contraband = list(/obj/item/firing_pin/girl = 3,
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