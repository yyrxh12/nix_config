{config, pkgs, ...}:

{

  home.username = "nixxyd";
  home.homeDirectory = "/home/nixxyd";
  
  
  services.emacs = {
    enable = true;
    startWithUserSession = "graphical";
    extraOptions = ["-fs"];
};
  
  home.packages = with pkgs; [
	neofetch
	
	zip
	xz
	unzip
	p7zip
	
  ];
  
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
    };
  #shellAliases = {
    
 #};

  home.stateVersion = "23.05";

  programs.home-manager.enable = true;
}
