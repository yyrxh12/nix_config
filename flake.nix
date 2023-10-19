{

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	helix.url = "github:helix-editor/helix/23.05";
	nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
    home-manager = {
      url = "github:nix-community/home-manager";
      
      inputs.nixpkgs.follows = "nixpkgs";
    };
};

outputs = {self, nixpkgs, home-manager,nix-doom-emacs, ...}@inputs: {
	nixosConfigurations.nixxyd = nixpkgs.lib.nixosSystem rec  {
			system = "x86_64-linux";
			specialArgs = inputs;
			modules = [
			./configuration.nix

			home-manager.nixosModules.home-manager {
				
					
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;

				home-manager.users.nixxyd = {...}: {
					imports = [nix-doom-emacs.hmModule ./home.nix];
					programs.doom-emacs = {
					enable = true;
					doomPrivateDir = /home/nixxyd/nix_config/doom.d;
			

			};
			};
			}
			];
		};
	};


}
