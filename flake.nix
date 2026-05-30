# @path: ~/projects/nixproj/derivations/trae/flake.nix
# @author: redskaber
# @datetime: 2026-05-31
# @description: Production-ready flake for trae
# @directory: https://nix.dev/manual/nix/2.33/command-ref/new-cli/nix3-flake.html


{
  description = "Nix Flake for trae (auto-updated sources)";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
      allowUnfree = system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      sources = import ./sources.nix;
    in {
      packages = forAllSystems (system:
        let pkgs = allowUnfree system;
        in {
          default = pkgs.callPackage ./package.nix {
            inherit pkgs system sources;
          };
        });

      apps = forAllSystems (system:
        let pkgs = allowUnfree system;
        in {
          update-sources = {
            type = "app";
            program = "${pkgs.writeShellScript "update-sources" ''
              exec ${./update.sh}
            ''}";
          };
        });
    };
}
