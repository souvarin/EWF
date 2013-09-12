note
	description: "Summary description for {WSF_CHECKBOX_LIST_CONTROL}."
	author: ""
	date: "$Date$"
	revision: "$Revision$"

class
	WSF_CHECKBOX_LIST_CONTROL

inherit

	WSF_VALUE_CONTROL [LIST [STRING]]
		undefine
			load_state,
			read_state,
			read_state_changes
		end

	WSF_MULTI_CONTROL [WSF_CHECKBOX_CONTROL]

create
	make_checkbox_list_control

feature {NONE}

	make_checkbox_list_control (n: STRING)
		do
			make_multi_control (n)
		end

feature

	value: LIST [STRING]
		local
			l: LINKED_LIST [STRING]
		do
			create l.make
			across
				controls as c
			loop
				if c.item.value then
					l.extend (c.item.checked_value)
				end
			end
			Result := l
		end

end