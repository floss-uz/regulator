{
  description = "floss-bot";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs =
    {
      self,
      nixpkgs,
      flake-utils,
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        pkgs = import nixpkgs { localSystem = { inherit system; }; };
        hlib = pkgs.haskell.lib;
        hpkgs = pkgs.haskell.packages."ghc912".override {
          overrides = self: super: {
            tasty-wai = hlib.dontCheck (hlib.doJailbreak super.tasty-wai);
            servant-client = hlib.dontCheck (hlib.doJailbreak super.servant-client);
          };
        };

        floss-bot = pkgs.haskell.lib.overrideCabal (hpkgs.callCabal2nix "floss-bot" ./. { }) (old: {
          doCheck = true;
          doHaddock = false;
          enableLibraryProfiling = false;
          enableExecutableProfiling = false;
        });
      in
      {
        packages.default = floss-bot;

        devShells.default = pkgs.mkShell {
          buildInputs = [
            hpkgs.cabal-install
            hpkgs.cabal-add
            hpkgs.haskell-language-server
            hpkgs.fourmolu
            hpkgs.hlint
            hpkgs.hpack
            
            pkgs.just
            pkgs.alejandra
            pkgs.zlib
          ];
        };
      }
    );
}

