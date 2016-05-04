local path = require("path")

CSV = {}

function CSV:load (filename, headers)
	headers = headers or false
	if path:ext(filename) == ".csv" then


	else
		file = io.open(filename, "r") -- "test.csv"
		linecount = 0 

		panel = {}
		setmetatable(panel, self)
		self.__index = self

		for line in file:lines() do 
			local prev = ""
			local chunk = ""
			local row = {}
			linecount = linecount + 1

			
			for i = 1, #line do
			    local c = line:sub(i,i)
			    if c == "," and prev ~= [[\]] then
			    	-- print(linecount, chunk)
			    	table.insert(row, chunk)
			    	chunk = ""
			    else
			    	prev = c
			    	chunk = string.format("%s%s",chunk,c)
			    end
			end

			-- print(linecount, chunk)
			table.insert(row, chunk)

			table.insert(panel, row)

		end

		file:close()
		return panel
	-- else
	-- 	file = io.open(filename, "r") -- "test.csv"
	-- 	linecount = 0 

	-- 	panel = {}
	-- 	setmetatable(panel, self)
	-- 	self.__index = self


	-- 	local heads = {}

	-- 	for line in file:lines() do
	-- 		if headers do
	-- 			local prev = ""
	-- 			local chunk = ""
	-- 			linecount = linecount + 1

				
	-- 			for i = 1, #line do
	-- 			    local c = line:sub(i,i)
	-- 			    if c == "," and prev ~= [[\]] then
	-- 			    	-- print(linecount, chunk)
	-- 			    	table.insert(heads, chunk)
	-- 			    	chunk = ""
	-- 			    else
	-- 			    	prev = c
	-- 			    	chunk = string.format("%s%s",chunk,c)
	-- 			    end
	-- 			end

	-- 			-- print(linecount, chunk)
	-- 			table.insert(heads, chunk)

	-- 			table.insert(panel, heads)
	-- 		else
	-- 			local prev = ""
	-- 			local chunk = ""
	-- 			local row = {}
	-- 			linecount = linecount + 1

				
	-- 			for i = 1, #line do
	-- 			    local c = line:sub(i,i)
	-- 			    if c == "," and prev ~= [[\]] then
	-- 			    	-- print(linecount, chunk)
	-- 			    	table.insert(row, chunk)
	-- 			    	chunk = ""
	-- 			    else
	-- 			    	prev = c
	-- 			    	chunk = string.format("%s%s",chunk,c)
	-- 			    end
	-- 			end

	-- 			-- print(linecount, chunk)
	-- 			table.insert(row, chunk)

	-- 			table.insert(panel, row)
	-- 		end
	-- 	end

	-- 	file:close()
	-- 	return panel
	end
end




function CSV:rows ( start, finish )
	for i = start, finish do
		row = self[i]
		for j = 1, #row do
			io.write(row[j],"\t")
		end
		io.write("\n")
	end
end


function CSV:length ()
	return #self[1]
end


return CSV

-- for line in io.lines() do
--     -- table.insert(lines, line) -- add the line to the list of lines
--     local chunk = ""

	
-- 	for i = 1, #line do
-- 	    local c = line:sub(i,i)
-- 	    if c == " " or c == "\n" then
-- 	    	print(chunk)
-- 	    	chunk = ""
-- 	    else
-- 	    	chunk = string.format("%s%s",chunk,c)
-- 	    end
-- 	end
-- 	print(chunk)

--     io.write("> ")
-- end
