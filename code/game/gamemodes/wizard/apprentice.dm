///////// MARK 1: CORE LOGIC //////////

// MARK: BLOCK 1.1: BASE CONTRACT & UI

/obj/item/apprentice_contract
	name = "contract"
	desc = "A magic contract."
	icon = 'icons/obj/wizard.dmi'
	icon_state ="scroll2"
	throw_speed = 1
	throw_range = 5
	w_class = WEIGHT_CLASS_TINY

/obj/item/apprentice_contract/attack_self(mob/user)
	summon_apprentice(user)

/obj/item/apprentice_contract/proc/summon_apprentice(mob/living/teacher)
	to_chat(teacher, span_notice("Вы отправили запрос на ученика..."))
	var/image/source = image('icons/obj/cardboard_cutout.dmi', "cutout_wizard")
	var/list/candidates = SSghost_spawns.poll_candidates("Желаетел ли вы стать учеником мага [teacher.real_name]?", ROLE_WIZARD, TRUE, source = source)

	if(QDELETED(teacher))
		return

	if(!length(candidates))
		log_game("[teacher] (ckey: [teacher.key]) has failed to spawn aprrentice.")
		to_chat(teacher, span_warning("К сожалению, но вам не удалось найти для себя ученика.\nВы можете вернуть очки маны, затраченные на покупку контракта ученичества, или просто начать поиск ещё раз."))
		return

	var/mob/candidate = pick(candidates)
	new /obj/effect/particle_effect/fluid/smoke(teacher.loc)
	var/mob/living/carbon/human/apprentice = new(teacher.loc)
	apprentice.possess_by_player(candidate.key)

	to_chat(apprentice, span_notice("Теперь вы ученик могущественного мага [teacher.real_name]!\nВаш магический контракт, который вы недавно заключили, обязует вас безприкословно повиноваться [GEND_HIS_HER(teacher)] приказам и помочь [GEND_HIM_HER(teacher)] выполнить свои задачи."))

	SSticker.mode.equip_wizard_apprentice(apprentice)

	var/wizard_name_first = pick(GLOB.wizard_first)
	var/wizard_name_second = pick(GLOB.wizard_second)
	var/randomname = "[wizard_name_first] [wizard_name_second]"
	var/newname = tgui_input_text(apprentice, "Да вы теперь маг-ученик!.\nЖелаете ли вы изменить свое имя?", "Смена имени", randomname, max_length = MAX_NAME_LEN)
	if(!newname)
		newname = randomname
	apprentice.mind.name = newname
	apprentice.real_name = newname
	apprentice.name = newname

	var/datum/objective/protect/new_objective = new /datum/objective/protect
	new_objective.owner = apprentice.mind
	new_objective:target = teacher.mind
	new_objective.explanation_text = "Защитите [teacher.real_name], вашего учителя."
	apprentice.mind.objectives += new_objective
	SSticker.mode.apprentices += apprentice.mind
	apprentice.mind.special_role = SPECIAL_ROLE_WIZARD_APPRENTICE
	SSticker.mode.update_wiz_icons_added(apprentice.mind)
	apprentice.faction = list("wizard")

	log_game("[apprentice.key] has become [teacher]'s (ckey: [teacher.key]) apprentice.")

	qdel()
