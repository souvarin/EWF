note
	description: "Summary description for {WSF_NAVLIST_ITEM}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WSF_NAVLIST_ITEM_CONTROL

inherit

	WSF_BUTTON_CONTROL
		rename
			make as make_button
		redefine
			set_state,
			state
		end

create
	make

feature {NONE} -- Initialization

	make ( link, t: STRING)
		do
			make_control ("a")
			text := t
			attributes := "href=%"" + link + "%"";
			add_class ("list-group-item")
		end
feature {WSF_PAGE_CONTROL, WSF_CONTROL} -- State management

	set_state (new_state: JSON_OBJECT)
			-- Restore text from json
		do
			Precursor {WSF_BUTTON_CONTROL}(new_state)
			if attached {JSON_BOOLEAN} new_state.item ("active") as new_active then
				active := new_active.item
			end
		end

	state: WSF_JSON_OBJECT
			-- Return state which contains the current text and if there is an event handle attached
		do
			Result := Precursor {WSF_BUTTON_CONTROL}
			Result.put_boolean (true, "active")
		end

feature -- Change

	set_active (a: BOOLEAN)
			-- Set text of that button
		do
				active := a
				state_changes.replace (create {JSON_BOOLEAN}.make_boolean (a), "active")
		end
feature -- Properties

	active: BOOLEAN

end
