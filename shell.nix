{ pkgs ? import <nixpkgs> {}}:

pkgs.mkShell {
  nativeBuildInputs = with pkgs; [
    opam nodePackages.tailwindcss
    pkg-config
    libev openssl
  ] ++ lib.optionals stdenv.isDarwin
  [
    darwin.apple_sdk.frameworks.Security
    darwin.apple_sdk.frameworks.CoreServices
  ];
}