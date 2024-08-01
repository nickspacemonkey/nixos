# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.grub.enable = true;
  boot.loader.grub.device = "/dev/sda";
  boot.loader.grub.useOSProber = true;
  boot.kernelParams = [
    "mitigations=off"
  ];
  networking.hostName = "docker"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/London";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_GB.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_GB.UTF-8";
    LC_IDENTIFICATION = "en_GB.UTF-8";
    LC_MEASUREMENT = "en_GB.UTF-8";
    LC_MONETARY = "en_GB.UTF-8";
    LC_NAME = "en_GB.UTF-8";
    LC_NUMERIC = "en_GB.UTF-8";
    LC_PAPER = "en_GB.UTF-8";
    LC_TELEPHONE = "en_GB.UTF-8";
    LC_TIME = "en_GB.UTF-8";
  };

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "gb";
    xkb.variant = "";
  };

  # Configure console keymap
  console.keyMap = "uk";

  # Sudo no password
  security.sudo.extraConfig = "%nick  ALL=(ALL:ALL)    SETENV:NOPASSWD: ALL" ;

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.nick = {
    uid = 1002;
    isNormalUser = true;
    description = "Nick";
    extraGroups = [ "networkmanager" "wheel" "docker" ];
    openssh.authorizedKeys.keys  = [ "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDU4l0lK2zZhJtIXysij+H+ctCK0w+ThaNl0Ff6L3kFkk4zm3TqbaE+mJ4JBs5FuOdzA3qT3lkS9+9Sv+CyvnhpOiCJeI/2ktDBrAl7b5jMTUCdtEJ1nIUV7bs3IrEIHJw9b2A6R/0uSCHhPsZ2yoPX5ZggGJ6E/X6RlxTzwYi/753ZSKJRvTO2OLm7Zfx648mLn9uqBj3Y0DrC6Ip5r7E9Fn3yCbWwRJkgaRJPBjHWCPzO42D2EkagcXMV7PqSOEhwXWxkcsD+7RAAJdWMQw+AG1JYVSH0Wj2CTDzbKKQnHQDDwHG2ia3vbUm4T2RkgXksLIYKIg7JYdjAolFFJgtT20Tr+uyO7tHCimEJMmHXrqFfr2pYk993/rswfH7rORt0uvgHaZ1nnRhfWjcvyz0f9U52zRo6D/yXvf579O3aQsCcemkrtM4wTDtkfMNfxbzfNAd1gFTIBZAFdjIBgP1jnANo85xxgd75533oAAJETZSSFdETU3dvhbuZlmjjk30= nicke@nick-pc" 
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQCmtS60IYmR6dT0a+SRhitLbPGdvvxaeMcMtWy3I7+py+SwVlG0ImD7y41+HTmAV81THkxkmg3DbVewaWa5pwgQiJ5XKcVzKnLiD9uu/9u3qDfCVtCpMjzSULVWYbILSOY6zF4LW3UGr5rWr1e6M5Mg+HxWesNTvlmXfWb1TSuQ6rgav5ZI9P1bNcEDy05+zpgn1kmvqhVA8s+7Jm3b8YpKm+/1fNG7bcUwwcMCQOgINEBl2ucnRu+jPZ4Qz9dATWGy9rLUQoTdyI8dqIfH9KS/HKYBNBNpXNm6v6h+zELYm+TGed4D1NfX21iLOQJe59BGgnYJI3oFsRr/0FP44mLsmp5AhFtWacxnuh0IXI7w1Hg/rKA1k1Wdx/omGQd+UXRfL2XfU+3QJxVUr0nfoYr9Maf/NmOlqeS1W5uTBp3kqy2LxBn8Agn1BN4zLw2YSWsLgyBMiNsfErS+c53PgDYWGZMvyt9Ip5D3Bfq+OQTxAoVhS7m8/UDNBJHsPEkgzCM= nick@nick-pc"
    "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQC94/ZOYKbKPes3fm+HK8YMzHHk7x4EO0f1v+I8DElUrfcPzdVljAeQCQaeM1o9hnd++6MNsMrXJZfdudS9HEGbNjfwF17PHBEOJaJm7adYo0L/Y2f2f1I39hvzHCq7fvCrziwHU9otToGSwswdVQbQKQaLCbqrPJbAzSNWbi/aE+4l1cAOBQfO0dFzBZPqGns8QmmgFp0D5iUCwo5fSf99yx8QDLo+Rv7Gq/z8um7ejMYyQSiSIPaLb3dygAKMtgKf0O2VJR36hwlx3DW791NeldG/9KUHzV/EnSXbmmwSw3TeNxjGWlitMMjXKvy8RLDXyHFiZXfd2SoshoOQv639sZZT5lKWDg83aI2x1O0gU8Wr3EZav0qvKh18PyYNhtGuL7q5WCIPHeAKeZYo07/NH079wa4dCSEENCYh78SRFCgXwfke43jFO2qQcyZUIxAFFozwm4r0W4OyO+jnSuWsrmdP6qgGmTltgG3kI/Pz8fvds+BgrUXozHeg8GxdDNs= nick@nick-nas.local"
    ];
    packages = with pkgs; [];
  };
  users.groups.nick = {};
  users.groups.nick.gid = 1002;
  users.users.nick.group = "nick";

  # Bash aliases
  programs.bash.shellAliases = {
    ll="ls -la";
    dc="sudo docker compose";
    dcup="sudo docker compose up -d --force-recreate";
    dcdown="sudo docker compose down";
    t="tmux attach || tmux new-session";
    ta="tmux attach -t";
    tn="tmux new-session";
    tl="tmux list-sessions";
  };

  # Bash init
  programs.bash.shellInit =
    ''if [[ -n "$PS1" ]] && [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
      /run/current-system/sw/bin/tmux attach-session -t ssh_tmux || /run/current-system/sw/bin/tmux new-session -s ssh_tmux
    fi'';

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    #vim
    ((vim_configurable.override {  }).customize{
      name = "vim";
      # Install plugins for example for syntax highlighting of nix files
      vimrcConfig.customRC = ''
        set nocompatible
        set backspace=indent,eol,start
        syntax on
        set tabstop=2
        set number
        if has("autocmd")
          au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif
        endif
      '';
      }
    )

		# Other packages
    #pkgs.tmux
    wget
    curl
    rsync
		cifs-utils
  ];

  programs.tmux = {
		enable = true;
		extraConfig = "set -g mouse on";
	};
  programs.git.enable = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # Automatic system upgrades
  system.autoUpgrade.enable = true;
  system.autoUpgrade.allowReboot = true;
  system.autoUpgrade.rebootWindow = {
    lower = "03:00";
    upper = "05:00";
  };

	# Mounts
  fileSystems."/mnt/media" = {
    device = "192.168.0.14:/mnt/my-pool/media";
      fsType = "nfs";
  };

  fileSystems."/mnt/temp" = {
    device = "192.168.0.14:/mnt/io-pool/temp";
      fsType = "nfs";
  };

	fileSystems."/mnt/nick" = {
    device = "//nick-nas.com/nick";
    fsType = "cifs";
		options = let
    	automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

      in ["${automount_opts},credentials=/home/nick/.smblogin,uid=1002,gid=1002"];
  };

	fileSystems."/mnt/miles" = {
    device = "//nick-nas.com/miles";
    fsType = "cifs";
		options = let
    	automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

      in ["${automount_opts},credentials=/home/nick/.smblogin,uid=33,gid=33"];
  };

	fileSystems."/mnt/adelaide" = {
    device = "//nick-nas.com/adelaide";
    fsType = "cifs";
		options = let
    	automount_opts = "x-systemd.automount,noauto,x-systemd.idle-timeout=60,x-systemd.device-timeout=5s,x-systemd.mount-timeout=5s,user,users";

      in ["${automount_opts},credentials=/home/nick/.smblogin,uid=33,gid=33"];
  };

  # Enable cron service
  services.cron = {
    enable = true;
    systemCronJobs = [
      "0 4 * * *    root  cd /home/nick/docker && bash docker_cron.sh >/dev/null 2>&1"
      "0 1 * * *    root  rsync -ax /home/nick/ nick@nick-nas.com:/mnt/my-pool/backups/docker/nick --delete >/dev/null 2>&1"
    ];
  };

  # List services that you want to enable:
  services.rpcbind.enable = true;
  #services.openssh.enable = true;
  services.openssh = {
  enable = true;
  # require public key authentication for better security
  #settings.PasswordAuthentication = false;
  #settings.KbdInteractiveAuthentication = false;
  settings.PermitRootLogin = "no";
  };

  #Docker
  virtualisation.docker.enable = true;
  #virtualisation.docker.storageDriver = "btrfs";

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
