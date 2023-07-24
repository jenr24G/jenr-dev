{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  buildInputs = with pkgs; [
    opam
    pkg-config
    libev openssl
    darwin.apple_sdk.frameworks.CoreServices
  ];

  shellHook = ''
    opam switch import ./switch.export
    eval $(opam env)
  '';
}