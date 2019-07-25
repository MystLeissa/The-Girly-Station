/obj/machinery/vending/assist
	products = list(/obj/item/assembly/prox_sensor = 5,
					/obj/item/assembly/igniter = 3,
					/obj/item/assembly/signaler = 4,
					/obj/item/wirecutters = 1,
					/obj/item/cartridge/signal = 4)
	contraband = list(/obj/item/assembly/timer = 2,
					  /obj/item/assembly/voice = 2,
					  /obj/item/assembly/health = 2)
	refill_canister = /obj/item/vending_refill/assist
	product_ads = "Only the finest!;Have some tools.;The most robust equipment.;The finest gear in space!"
	default_price = 10
	extra_price = 50
	payment_department = NO_FREEBIES

/obj/machinery/vending/pmining
	name = "Public Mining Vendor"
	desc = "Everyday Tools for aspiring miners."
	icon = 'icons/obj/machines/mining_machines.dmi'
	icon_state = "mining"
	product_ads = "Everyday tools for aspiring wanna-be miners,"
	products = list(/obj/item/rope = 5,
					/obj/item/stack/marker_beacon = 30,
					/obj/item/survivalcapsule = 2,
					/obj/item/fulton_core = 4)
	contraband = list(/obj/item/storage/backpack/duffelbag/mining_conscript = 1)
	premium = list(/obj/item/clothing/shoes/bhop = 1)
	refill_canister = /obj/item/vending_refill/assist
	default_price = 500
	extra_price = 2500
	set_obj_flags = "NODECONSTRUCT_1"
	payment_department = NO_FREEBIES

/obj/item/vending_refill/assist
	machine_name = "Vendomat"
	icon_state = "refill_engi"