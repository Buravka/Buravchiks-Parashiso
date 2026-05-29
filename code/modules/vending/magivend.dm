/obj/machinery/vending/magivend
	name = "MagiVend"
	desc = "Волшебный торговый автомат."
	icon_state = "magivend_off"
	panel_overlay = "magivend_panel"
	screen_overlay = "magivend"
	lightmask_overlay = "magivend_lightmask"
	broken_overlay = "magivend_broken"
	broken_lightmask_overlay = "magivend_broken_lightmask"
	slogan_list = list(
		"MagiVend превращ+ает произнош+ение заклин+аний в с+ущий пуст+як!",
		"Стань сам себ+е Гуд+ини! Исп+ользуй MagiVend!",
		"FJKLFJSD",
		"AJKFLBJAKL",
		"1234 LOONIES LOL!",
		"БАМП!",
		"Уб+ей +этих убл+юдков!",
		"ДА ГДЕ +ЭТОТ Ч+ЁРТОВ ДИСК?!",
		"ХОНК!",
		"EI NATH",
		"Разнес+ите всё к черт+ям!",
		"Адм+инские з+аговоры стар+ы как сам+о вр+емя!",
		"Обор+удование для изг+иба простр+анства и вр+емени!",
		"АБРАКАД+АБРА!",
	)
	vend_reply = "Жел+аю вам чуд+есного в+ечера!"
	all_products_free = TRUE

	products = list(
		// MARK: ROBES START

		/// STANDART
		/obj/item/clothing/head/wizard = 5,
		/obj/item/clothing/suit/wizrobe = 5,
		/// RED
		/obj/item/clothing/head/wizard/red = 5,
		/obj/item/clothing/suit/wizrobe/red = 5,
		/// CLOWN
		/obj/item/clothing/suit/wizrobe/clown = 5,
		/obj/item/clothing/head/wizard/clown = 5,
		/obj/item/clothing/mask/gas/clownwiz = 5,
		/obj/item/clothing/shoes/clown_shoes/magical = 5,
		/// MIME
		/obj/item/clothing/suit/wizrobe/mime = 5,
		/obj/item/clothing/head/wizard/mime = 5,
		/obj/item/clothing/mask/gas/mime/wizard = 5,
		/// MARISA
		/obj/item/clothing/head/wizard/marisa = 5,
		/obj/item/clothing/suit/wizrobe/marisa = 5,
		/obj/item/clothing/shoes/sandal/marisa = 5,
		/// NECROMAGE
		/obj/item/clothing/head/wizard/necromage = 5,
		/obj/item/clothing/suit/wizrobe/necromage = 5,
		/// ARTMAGE
		/obj/item/clothing/head/wizard/artmage = 5,
		/obj/item/clothing/suit/wizrobe/artmage = 5,
		/// VISIONMAGE
		/obj/item/clothing/head/wizard/visionmage = 5,
		/obj/item/clothing/suit/wizrobe/visionmage = 5,
		/// HEALMAGE
		/obj/item/clothing/head/wizard/healmage = 5,
		/obj/item/clothing/suit/wizrobe/healmage = 5,
		/// PSYMAGE
		/obj/item/clothing/head/wizard/amp = 5,
		/obj/item/clothing/suit/wizrobe/psypurple = 5,
		/// SABOTEUR
		/obj/item/clothing/head/fedora/head/saboteur = 5,
		/obj/item/clothing/suit/storage/blacktrenchcoat/suit/saboteur = 5,
		/// GUARDIAN
		/obj/item/clothing/head/wizard/magusdefender = 5,
		/obj/item/clothing/suit/wizrobe/magusdefender = 5,
		/// SINGULOTH
		/obj/item/clothing/head/wizard/magus/singulo = 5,
		/obj/item/clothing/suit/wizrobe/singulo = 5,
		/// BLOODMAGE
		/obj/item/clothing/suit/hooded/cultrobes/suit/sacrificial_robe = 5,
		/// ASHMAGE
		/obj/item/clothing/under/ash_walker = 5,
		/obj/item/clothing/suit/hooded/goliath/wizard = 5,

		// MARK: ROBES OVER

		/obj/item/clothing/shoes/sandal = 5,
		/obj/item/twohanded/staff/broom = 5,
		/obj/item/clothing/head/wizard/black = 5,
		/obj/item/clothing/head/wizard/fluff/dreamy = 5,
		/obj/item/twohanded/staff = 10,
		/obj/item/clothing/head/helmet/space/plasmaman/wizard = 5,
		/obj/item/clothing/under/plasmaman/wizard = 5,
		/obj/item/tank/internals/plasmaman/belt/full = 5,
		/obj/item/clothing/mask/breath = 5,
		/obj/item/tank/internals/emergency_oxygen/double/vox = 5,
		/obj/item/clothing/mask/breath/vox = 5,
	)
	contraband = list(
		/obj/item/reagent_containers/glass/bottle/wizarditis = 1,
	)

	armor = list(melee = 100, bullet = 100, laser = 100, energy = 100, bomb = 0, bio = 0, fire = 100, acid = 50)
	resistance_flags = FIRE_PROOF
	tiltable = FALSE

/obj/machinery/vending/magivend/get_ru_names()
	return list(
		NOMINATIVE = "торговый автомат MagiVend",
		GENITIVE = "торгового автомата MagiVend",
		DATIVE = "торговому автомату MagiVend",
		ACCUSATIVE = "торговый автомат MagiVend",
		INSTRUMENTAL = "торговым автоматом MagiVend",
		PREPOSITIONAL = "торговом автомате MagiVend",
	)
