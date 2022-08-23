with import <nixpkgs> { };

let
  args = {
    pname = "req";
    version = "0.0.0";
    src = ./.;
    vendorSha256 = null;
  };

  one = buildGo117Module args;
  two = buildGo118Module args;

  runner = req: stdenv.mkDerivation {
    name = "req-runner";

    outputHashMode = "flat";
    outputHashAlgo = "sha256";
    outputHash = lib.fakeHash;

    buildCommand = ''
      ${req}/bin/req
    '';

    nativeBuildInputs = [ cacert ];
  };
in
{
  go_1_17 = runner one;
  go_1_18 = runner two;
}
