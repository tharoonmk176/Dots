hl.on("hyprland.start", function()
	hl.exec_cmd("/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1")
	hl.exec_cmd("swaync")
	hl.exec_cmd("nm-applet")
	hl.exec_cmd("awww-daemon")
	-- for live wallpaper
	-- hl.exec_cmd("mpvpaper -o 'no-audio loop hwdec=auto' '*'/home/tharoon/Videos/LiveWallpapers/Batman.mp4")
end)
