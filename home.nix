{config, pkgs, ...}:

{

  home.username = "nixxyd";
  home.homeDirectory = "/home/nixxyd";
  
  
  services.emacs = {
    enable = true;
    startWithUserSession = "graphical";
    extraOptions = ["-fs"];
};
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";
      font = {
        size = 12;
        draw_bold_text_with_bright_colors = true;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
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
