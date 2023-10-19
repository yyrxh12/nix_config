{

inputs = {
	nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
	helix.url = "github:helix-editor/helix/23.05";
	nix-doom-emacs.url = "github:vlaci/nix-doom-emacs";
    home-manager = {
      url = "github:nix-community/home-manager";
      # The `follows` keyword in inputs is used for inheritance.
      # Here, `inputs.nixpkgs` of home-manager is kept consistent with
      # the `inputs.nixpkgs` of the current flake,
      # to avoid problems caused by different versions of nixpkgs.
      inputs.nixpkgs.follows = "nixpkgs";
    };
};

outputs = {self, nixpkgs, home-manager,nix-doom-emacs, ...}@inputs: {
	nixosConfigurations = {
		"nixxyd" = nixpkgs.lib.nixosSystem {
			system = "x86_64-linux";
			specialArgs = inputs;
			modules = [
			./configuration.nix

			home-manager.nixosModules.home-manager {
				
				home-manager.useGlobalPkgs = true;
				home-manager.useUserPackages = true;

				home-manager.users.nixxyd = import ./home.nix;
			

			}
			];
		};
	};
};

}
