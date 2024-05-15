{ lib, ... }:
{
  services.prowlarr.enable = true;

  systemd.services."prowlarr".serviceConfig = {
    DynamicUser = lib.mkForce false;
    User = "nixserver-service";
    Group = "nixserver-service";
  };
}