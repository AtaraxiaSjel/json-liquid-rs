{ lib, rustPlatform }:
rustPlatform.buildRustPackage {
  pname = "json-liquid-rs";
  version = "1.0.2";
  src = lib.cleanSource ./.;
  cargoLock.lockFile = ./Cargo.lock;

  meta = with lib; {
    description = "Process structured JSON values for Liquid templates";
    homepage = "https://github.com/AtaraxiaSjel/json-liquid-rs";
    license = licenses.mit;
    maintainers = with maintainers; [ ataraxiasjel ];
    platforms = [ "x86_64-linux" "aarch64-linux" "aarch64-darwin" ];
  };
}