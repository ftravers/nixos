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
