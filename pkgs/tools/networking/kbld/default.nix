{ lib, buildGoModule, fetchFromGitHub }:
buildGoModule rec {
  pname = "kbld";
  version = "0.27.0";

  src = fetchFromGitHub {
    owner = "vmware-tanzu";
    repo = "carvel-kbld";
    rev = "v${version}";
    sha256 = "1grd5b5nisd7j23xwr1ps7w7k3ncfzv2za94c0yigmh8spqwzsgh";
  };

  goPackagePath = "github.com/vmware-tanzu/carvel-kbld";

  vendorSha256 = null;

  subPackages = [ "cmd/kbld" ];

  meta = with lib; {
    description = "CLI tool to seamlessly incorporate image building and image pushing into your development and deployment workflows";
    homepage = "https://get-kbld.io";
    license = licenses.asl20;
    maintainers = with maintainers; [ brodes ];
  };
}
