Path = {}

function Path:ext(p)
	return p:sub(#p-3) -- change to regex
end

return Path
