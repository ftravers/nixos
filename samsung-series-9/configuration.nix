{ config, pkgs, ... }:
{
  imports = [/etc/nixos/hardware-configuration.nix];
  boot.loader.grub.enable = true;
  boot.loader.grub.version = 2;
  boot.loader.grub.device = "/dev/sda"; # or "nodev" for efi only
  networking = {
    interfaces.wlp1s0.ip4 = [ { address = "192.168.1.115"; prefixLength = 24; } ];
    defaultGateway = "192.168.1.1";
    nameservers = [ "8.8.8.8" ];
    wireless = {
      enable = true;
      interfaces = ["wlp1s0"];
      userControlled.enable = true;
      userControlled.group = "wheel";
      networks = {
      	"Anuttara_2.4G" = { psk = "Sierra88";};};};
    hostName = "ss9";};
  users.extraUsers.fenton = {
    isNormalUser = true;
    uid = 1000;
    hashedPassword = "$6$/pK0lFCWLEBBWMJ$S9vMo8Qd2YL1jRuw4S8O7xdB/S4bBaPUVgWQOCkfUK19fJAD2cVGwRKG3017YnbjzFbMkVG5Xe3RuNhWY6zZY/";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAG5wvPKRrqqiOBKZ5dUqF5oK7vd1zNuVsrrAAQCcEkVC2SBXVy5yiCiO7xPz7Wk6oSl+5nvkitYQ4HVuNO+mroUcmbge/e344sfyOytrV2BqFTuijlc+BkBTMk55piHKBgl50l4gIdtTdKk1b0iiTxc5gdhlUr4LUF+mPc5NnuKgMEJLApoFeNKrzbR+Z5ZsLypeFNxzkaAw8mjqRoDoi1lab7tDN/KrVKZ46AYXm9Tix64MdxXI6T+p6Z+2rAQQ0ieexVtVUJBiifaKrvqgr57v8WPFk8VIYb9MbtlxtHdHz/regzZA4L6K+46QpSFeBX29esx1/tuihv/hU8ndf fenton@ss9" ];};
  users.extraUsers.root = {
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAG5wvPKRrqqiOBKZ5dUqF5oK7vd1zNuVsrrAAQCcEkVC2SBXVy5yiCiO7xPz7Wk6oSl+5nvkitYQ4HVuNO+mroUcmbge/e344sfyOytrV2BqFTuijlc+BkBTMk55piHKBgl50l4gIdtTdKk1b0iiTxc5gdhlUr4LUF+mPc5NnuKgMEJLApoFeNKrzbR+Z5ZsLypeFNxzkaAw8mjqRoDoi1lab7tDN/KrVKZ46AYXm9Tix64MdxXI6T+p6Z+2rAQQ0ieexVtVUJBiifaKrvqgr57v8WPFk8VIYb9MbtlxtHdHz/regzZA4L6K+46QpSFeBX29esx1/tuihv/hU8ndf fenton@ss9" ];};
  users.mutableUsers = false;
  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";};
  time.timeZone = "Asia/Bangkok";
  environment.systemPackages = with pkgs; [
    wget vim dhcpcd emacs firefox chromium git mkpasswd zsh rxvt_unicode
    autoconf gnumake tree ncurses rxvt_unicode wpa_supplicant ];
  programs.bash.enableCompletion = true;
  services.openssh.enable = true;
  networking.firewall.enable = false;
  services.xserver.enable = true;
  services.xserver.layout = "us";
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
  users.defaultUserShell = "/var/run/current-system/sw/bin/zsh";
  environment.sessionVariables = {
    TERMINFO_DIRS = "/run/current-system/sw/share/terminfo";};
  services.xserver.synaptics.enable = true;
  system.stateVersion = "17.09";
}

