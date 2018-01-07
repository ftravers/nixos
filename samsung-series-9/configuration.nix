  # Networking #####################################
  networking = {
    # networkmanager.enable = true;

    interfaces.wlp1s0.ip4 = [ { address = "192.168.1.115"; prefixLength = 24; } ];
    defaultGateway = "192.168.1.1";
    nameservers = [ "8.8.8.8" ];
  
    wireless = {
      enable = true;
      interfaces = ["wlp1s0"];
      userControlled.enable = true;
      userControlled.group = "wheel";
      networks = {
      	"Anuttara_2.4G" = {
      	  psk = "Sierra88";
        };
      };
    };

    hostName = "ss9"; 
  };

  users.extraUsers.fenton = {
    isNormalUser = true;
    uid = 1000;
    hashedPassword = "$6$/pK0lFCWLEBBWMJ$S9vMo8Qd2YL1jRuw4S8O7xdB/S4bBaPUVgWQOCkfUK19fJAD2cVGwRKG3017YnbjzFbMkVG5Xe3RuNhWY6zZY/";
    extraGroups = [ "wheel" ];
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAG5wvPKRrqqiOBKZ5dUqF5oK7vd1zNuVsrrAAQCcEkVC2SBXVy5yiCiO7xPz7Wk6oSl+5nvkitYQ4HVuNO+mroUcmbge/e344sfyOytrV2BqFTuijlc+BkBTMk55piHKBgl50l4gIdtTdKk1b0iiTxc5gdhlUr4LUF+mPc5NnuKgMEJLApoFeNKrzbR+Z5ZsLypeFNxzkaAw8mjqRoDoi1lab7tDN/KrVKZ46AYXm9Tix64MdxXI6T+p6Z+2rAQQ0ieexVtVUJBiifaKrvqgr57v8WPFk8VIYb9MbtlxtHdHz/regzZA4L6K+46QpSFeBX29esx1/tuihv/hU8ndf fenton@ss9" ];
  };

  users.extraUsers.root = {
    openssh.authorizedKeys.keys = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDAG5wvPKRrqqiOBKZ5dUqF5oK7vd1zNuVsrrAAQCcEkVC2SBXVy5yiCiO7xPz7Wk6oSl+5nvkitYQ4HVuNO+mroUcmbge/e344sfyOytrV2BqFTuijlc+BkBTMk55piHKBgl50l4gIdtTdKk1b0iiTxc5gdhlUr4LUF+mPc5NnuKgMEJLApoFeNKrzbR+Z5ZsLypeFNxzkaAw8mjqRoDoi1lab7tDN/KrVKZ46AYXm9Tix64MdxXI6T+p6Z+2rAQQ0ieexVtVUJBiifaKrvqgr57v8WPFk8VIYb9MbtlxtHdHz/regzZA4L6K+46QpSFeBX29esx1/tuihv/hU8ndf fenton@ss9" ];
  };

  # users.defaultUserShell = "/var/run/current-system/sw/bin/zsh";
  
  users.mutableUsers = false;

  # Enabled Services ##################################
  services.openssh.enable = true;


  networking.firewall.enable = false;


  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.layout = "us";
  # services.xserver.xkbOptions = "eurosign:e";


  # Enable the KDE Desktop Environment.
  services.xserver.displayManager.sddm.enable = true;
  services.xserver.desktopManager.plasma5.enable = true;
    