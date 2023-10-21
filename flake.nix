{

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	helix.url = "github:helix-editor/helix/23.05";
	nix-doom-emacs.url = "github:nix-community/nix-doom-emacs";
	utils.url = "github:numtide/flake-utils";
    home-manager = {
      url = "github:nix-community/home-manager";
      
      inputs.nixpkgs.follows = "nixpkgs";
    };
};

outputs = {self, nixpkgs, home-manager,nix-doom-emacs, utils, ...}@inputs: let
	inherit (self) outputs;
	systems = ["x86_64-linux"];
	forAllSystems = nixpkgs.lib.genAttrs systems;
		in
			{
	nixosConfigurations.nixxyd = nixpkgs.lib.nixosSystem rec  {
			system = "x86_64-linux";
			specialArgs = inputs;
			packages = forAllSystems (system: import ./pkgs nixpkgs.legacyPackages.${system});
			modules = [
				./configuration.nix
				home-manager.nixosModules.home-manager {
				
					
					home-manager.useGlobalPkgs = true;
					home-manager.useUserPackages = true;

					home-manager.users.nixxyd = {...}: {
						imports = [nix-doom-emacs.hmModule ./home.nix ];
						programs.doom-emacs = {
							enable = true;
							doomPrivateDir = ./doom.d;
			

						};
					};
				}
			];
	};
};


}
