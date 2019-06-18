FROM archlinux/base

RUN sed -i '1iServer = http://ftp.jaist.ac.jp/pub/Linux/ArchLinux/$repo/os/$arch' /etc/pacman.d/mirrorlist && \
    pacman -Syu --noconfirm && \
    pacman -S --needed base-devel --noconfirm && \
    pacman -S git noto-fonts-cjk noto-fonts-emoji libpulse --noconfirm && \
    chmod +w /etc/sudoers && \
    echo "%wheel ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers && \
    chmod -w /etc/sudoers && \
    useradd -m -g wheel discord && \
    sudo -H -u discord bash -c 'git clone https://aur.archlinux.org/discord.git /home/discord/discord && cd /home/discord/discord && makepkg -si --noconfirm' 

CMD ["discord"]
