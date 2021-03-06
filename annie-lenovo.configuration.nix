{ config, pkgs, ... }:
{
  imports = [ ./hardware-configuration.nix ];

  boot.loader.grub = {
    enable = true;
		version = 2;
		device = "/dev/sda";
  };

  networking = {
    firewall.enable = false;
    networkmanager.enable = true;
 	  hostName = "alen";
  };

  users = {
    defaultUserShell = "/var/run/current-system/sw/bin/zsh";
    mutableUsers = false;
    extraUsers = {
      root = {
        openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAG5wvPKRrqqiOBKZ5dUqF5oK7vd1zNuVsrrAAQCcEkVC2SBXVy5yiCiO7xPz7Wk6oSl+5nvkitYQ4HVuNO+mroUcmbge/e344sfyOytrV2BqFTuijlc+BkBTMk55piHKBgl50l4gIdtTdKk1b0iiTxc5gdhlUr4LUF+mPc5NnuKgMEJLApoFeNKrzbR+Z5ZsLypeFNxzkaAw8mjqRoDoi1lab7tDN/KrVKZ46AYXm9Tix64MdxXI6T+p6Z+2rAQQ0ieexVtVUJBiifaKrvqgr57v8WPFk8VIYb9MbtlxtHdHz/regzZA4L6K+46QpSFeBX29esx1/tuihv/hU8ndf fenton@ss9" ];
      };
      annie = {
        isNormalUser = true;
        uid = 1000;
        hashedPassword = "$6$/pK0lFCWLEBBWMJ$S9vMo8Qd2YL1jRuw4S8O7xdB/S4bBaPUVgWQOCkfUK19fJAD2cVGwRKG3017YnbjzFbMkVG5Xe3RuNhWY6zZY/";
        extraGroups = [ "wheel" ];
        openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAG5wvPKRrqqiOBKZ5dUqF5oK7vd1zNuVsrrAAQCcEkVC2SBXVy5yiCiO7xPz7Wk6oSl+5nvkitYQ4HVuNO+mroUcmbge/e344sfyOytrV2BqFTuijlc+BkBTMk55piHKBgl50l4gIdtTdKk1b0iiTxc5gdhlUr4LUF+mPc5NnuKgMEJLApoFeNKrzbR+Z5ZsLypeFNxzkaAw8mjqRoDoi1lab7tDN/KrVKZ46AYXm9Tix64MdxXI6T+p6Z+2rAQQ0ieexVtVUJBiifaKrvqgr57v8WPFk8VIYb9MbtlxtHdHz/regzZA4L6K+46QpSFeBX29esx1/tuihv/hU8ndf fenton@ss9" ];
      };
    };
  };


  i18n = {
    consoleFont = "Lat2-Terminus16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";};

  time.timeZone = "Asia/Bangkok";

  environment = {
    sessionVariables = {TERMINFO_DIRS = "/run/current-system/sw/share/terminfo";};
    systemPackages = with pkgs; [
      wget vim dhcpcd emacs firefox chromium git mkpasswd zsh rxvt_unicode
      autoconf gnumake tree ncurses rxvt_unicode wpa_supplicant
    ];
  };

  programs.bash.enableCompletion = true;

  services = {
    openssh.enable = true;
    xserver = {
      enable = true;
      layout = "us";
      displayManager.sddm.enable = true;
      desktopManager.plasma5.enable = true;
      synaptics.enable = true;
    };    
  };

  system.stateVersion = "17.09";
}

