
module("luci.controller.oray", package.seeall)

function index()
	if not nixio.fs.access("/etc/config/oray") then
		return
	end
	entry({"admin", "services", "oray"}, cbi("oray"), _("Oray  DDns"), 86).dependent = true
end
