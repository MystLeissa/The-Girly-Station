/obj/machinery/vending/wallmed
	name = "\improper NanoMed"
	desc = "Wall-mounted Medical Equipment dispenser."
	icon_state = "wallmed"
	icon_deny = "wallmed-deny"
	density = FALSE
	products = list(/obj/item/reagent_containers/syringe = 3,
		            /obj/item/reagent_containers/pill/patch/styptic = 5,
					/obj/item/reagent_containers/pill/patch/silver_sulf = 5,
					/obj/item/reagent_containers/pill/charcoal = 2,
					/obj/item/reagent_containers/medigel/styptic = 2,
					/obj/item/reagent_containers/medigel/silver_sulf = 2,
					/obj/item/reagent_containers/medigel/sterilizine = 1)
	contraband = list(/obj/item/reagent_containers/pill/tox = 2,
	                  /obj/item/reagent_containers/pill/morphine = 2)
	armor = list("melee" = 100, "bullet" = 100, "laser" = 100, "energy" = 100, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 50)
	resistance_flags = FIRE_PROOF
	refill_canister = /obj/item/vending_refill/wallmed
	default_price = 25
	extra_price = 100
	payment_department = ACCOUNT_MED

/obj/item/vending_refill/wallmed
	machine_name = "NanoMed"
	icon_state = "refill_medical"

/obj/machinery/vending/wallmed/pubby
	products = list(/obj/item/reagent_containers/syringe = 3,
					/obj/item/reagent_containers/pill/patch/styptic = 1,
					/obj/item/reagent_containers/pill/patch/silver_sulf = 1,
					/obj/item/reagent_containers/medigel/sterilizine = 1)

/obj/machinery/vending/wallmed/public
	name = "Public MediStore"
	desc = "This device sells medicine to the public."
	default_price = 50
	extra_price = 150
	products = list(/obj/item/reagent_containers/syringe = 5,
					/obj/item/reagent_containers/pill/patch/styptic = 2,
					/obj/item/reagent_containers/pill/patch/silver_sulf = 2,
					/obj/item/reagent_containers/medigel/sterilizine = 2,
					/obj/item/reagent_containers/glass/bottle/epinephrine = 3,
					/obj/item/healthanalyzer = 10,
					/obj/item/stack/medical/gauze = 20,
					/obj/item/storage/pill_bottle/charcoal = 2,
					/obj/item/storage/pill_bottle/salglu = 2)
	contraband = list(/obj/item/reagent_containers/hypospray/medipen = 3)
	premium = list(/obj/item/reagent_containers/medigel/synthflesh = 2,
				   /obj/item/storage/belt/medical = 1,
				   /obj/item/storage/firstaid/advanced = 1)
