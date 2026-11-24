{
  description = "black hole raytracer";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
  };

  outputs =
    { self, nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      devShells.${system}.default = pkgs.mkShell {
        packages = with pkgs; [
          # build tools
          cmake
          ninja
          pkg-config

          # dev tools
          clang-tools # clangd for helix
          gdb

          feh
          # libraries
          glm # vectors and matrices
          openexr # multi-layer HDR output
          fmt # logging and formatting
          zlib

          # viewer
          tev # HDR/EXR viewer, lets you flip through render layers
        ];

        # writes compile_commands.json on every cmake configure, for clangd
        CMAKE_EXPORT_COMPILE_COMMANDS = "1";
      };
    };
}
