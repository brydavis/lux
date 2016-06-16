http = require("socket.http") -- requires Lua Socket

Request = {}

function Request:get(url)
	body, code, head, status = http.request(url)
	return {
		body = body, 
		code = code, 
		head = head, 
		status = status
	}
end

function Request:post(url, data)
	return {
		url = url, 
		body = data
	}
end

return Request
