#! /bin/sh
#

yay -Syyu
yay -S --needed base base-devel gnome flatpak papirus-icon-theme ttf-overpass ttf-cascadia-code ttf-fantasque-sans-mono ttf-fira-code ttf-lato ttf-iosevka-nerd ttf-jetbrains-mono ttf-ibm-plex ttf-ubuntu-font-family ttf-roboto ttf-roboto-mono ttf-font-awesome steam syncthing gnome-software gnome-software-packagekit-plugin jellyfin-bin piper adw-gtk3  

flatpak install flathub org.gnome.World.Secrets com.discordapp.Discord net.davidotek.pupgui2 com.brave.Browser com.github.tchx84.Flatseal com.obsproject.Studio com.heroicgameslauncher.hgl org.onlyoffice.desktopeditors md.obsidian.Obsidian io.bassi.Amberol org.gnome.gitlab.somas.Apostrophe com.rafaelmardojai.Blanket dev.Cogitri.Health org.gnome.Solanum com.stremio.Stremio com.mattjakeman.ExtensionManager com.github.unrud.VideoDownloader com.github.wwmm.easyeffects org.gnome.World.Secrets com.belmoussaoui.Obfuscate 

sudo pacman -Rns gnome-builder gnome-tetravex gnome-taquin gnome-sudoku gnome-robots gnome-recipes gnome-nibbles gnome-multi-writer gnome-mahjongg gnome-klotski gnome-games gnome-chess four-in-a-row evolution accerciser 

flatpak uninstall --unused



sudo systemctl enable jellyfin.service
sudo systemctl start jellyfin.service
sudo systemctl enable syncthing@swarnim.service
sudo systemctl start syncthing@swarnim.service

