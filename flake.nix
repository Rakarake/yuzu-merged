{
  description = "Unofficial yuzu flake";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };
  outputs = { nixpkgs, ... }:
  let
    # TODO: make a "forEachSystem"
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
    };
  in
  rec {
    packages.${system} = {
      yuzu = pkgs.callPackage ./nix { };
      default = packages.${system}.yuzu;
    };
  };
}
