{ pkgs, ... }: {
  packages = [
    pkgs.nodejs
  ];
  bootstrap = ''
    npm create svelte@latest $WS_NAME -- --template skeleton --typescript --eslint --prettier

    mkdir -p "$WS_NAME/.idx/"
    cp -rf ${./dev.nix} "$WS_NAME/.idx/dev.nix"
    chmod -R +w "$WS_NAME"

    mv "$WS_NAME" "$out"
    cd "$out"; npm install --package-lock-only --ignore-scripts
  '';
}