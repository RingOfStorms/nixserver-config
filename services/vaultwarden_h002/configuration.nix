{ lib, ...}: {
    services.vaultwarden = {
        enable = true;
        config = {
            ROCKET_PORT = 8222;
        };
    };

    systemd.services."vaultwarden" = {
        serviceConfig = {
            User = lib.mkForce "nixserver-service";
            Group = lib.mkForce "nixserver-service";
        };
    };
}