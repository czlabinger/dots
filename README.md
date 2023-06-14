# README

My current Dotfiles

# dots

Based on [end-4s dots](https://github.com/end-4/dots-hyprland/tree/summer-gruv)
Nvim config by me

Create folder cache in .conf/eww/scripts for overview icons to work.

For light to work add user to `video` group.

On arch:
````
sudo usermod -a -G video $USER
````


Swap display not working because I don't have Swap and so i can not try it and I'm to lazy to fix it.


## Dependencies

These are all the 

Assuming you are using pacman and yay
````    
sudo pacman -S code btop plasma-integration fwl-clipboard xdg-desktop-portal-hyprland playerctl  bc blueberry bluez coreutils dunst findutils gawk imagemagick light networkmanager pavucontrol procps pulseaudio ripgrep socat udev upower util-linux wget wireplumber wofi libqalculate sox nlohmann-json boost boost-libs baobab grim slurp wlroots notify-osd
````

````
yay -S webcord swaybg waybar swayidle fuzzel eww-wayland wlogout gojq networkmanagerapplet python-material-color-utilities geticons gtklock-runshell-module gtklock-playerctl-module gtklock-powerbar-module gtklock-userinfo-module cava nwg-look wps-office
````

````
pip install pywal desktop_entry_lib
````
````
cargo install asm-lsp
```` 
