
m = Map("oray", translate("Dynamic DNS  ( Oray )"),translate("Dynamic DNS allows that your router can be reached with a fixed hostname while having a dynamically changing IP address."))

s = m:section(NamedSection, "config", "oray", translate("config"))

enable = s:option(Flag, "enabled", translate("Enable"))
enable.default = false
enable.optional = false
enable.rmempty = false

restart_interval = s:option(Value, "restart_interval", translate("restart_interval"),translate("Oray restart interval."))
restart_interval:value("4", "4")
restart_interval:value("6", "6")
restart_interval:value("8", "8")
restart_interval:value("10", "10")
restart_interval:value("15", "15")

restart_interval.default = "10"
restart_interval.optional = true
restart_interval.rmempty = true


s = m:section(TypedSection, "service", translate("services"))
s.addremove = true
s.anonymous = false

enable = s:option(Flag, "enabled", translate("Enable"))
enable.default = false
enable.optional = false
enable.rmempty = false

s:option(Value, "hostname", translate("domain name")).rmempty = true

s:option(Value, "username", translate("Username")).rmempty = true

pw = s:option(Value, "password", translate("Password"))
pw.rmempty = true
pw.password = true

iface = s:option(ListValue, "network", translate("Network"))
iface.rmempty = true
iface:value("auto","auto")
require("luci.tools.webadmin")
luci.tools.webadmin.cbi_add_networks(iface)


return m,f
