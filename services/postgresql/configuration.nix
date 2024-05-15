{
  # Enable the postgresql service
  services.postgresql.enable = true;
  
  # Check the syntax of the configuration file at compile time
  # services.postgresql.checkConfig = true;
  
  # The data directory for PostgreSQL. If left as the default value
  # this directory will automatically be created before the PostgreSQL server starts, otherwise
  # the sysadmin is responsible for ensuring the directory exists with appropriate ownership
  # and permissions.
  #
  services.postgresql.dataDir = "/var/lib/postgresql/${config.services.postgresql.package.psqlSchema}";
  
  # Whether to enable JIT support.
  # services.postgresql.enableJIT = false;
  
  # Whether PostgreSQL should listen on all network interfaces.
  #
  # If disabled, the database can only be accessed via its Unix
  # domain socket or via TCP connections to localhost.
  #
  # services.postgresql.enableTCPIP = false;
  
  # Ensures that the specified databases exist.
  #
  # This option will never delete existing databases, especially not when the value of this
  # option is changed. This means that databases created once through this option or
  # otherwise have to be removed manually.
  #
  # services.postgresql.ensureDatabases = [ ];
  
  # Ensures that the specified users exist.
  #
  # The PostgreSQL users will be identified using peer authentication. This authenticates the Unix user with the
  # same name only, and that without the need for a password.
  #
  # This option will never delete existing users or remove DB ownership of databases
  # once granted with `ensureDBOwnership = true;`. This means that this must be
  # cleaned up manually when changing after changing the config in here.
  #
  # services.postgresql.ensureUsers = [ ];
  
  # An attrset of clauses to grant to the user. Under the hood this uses the
  # [ALTER USER syntax](https://www.postgresql.org/docs/current/sql-alteruser.html) for each attrName where
  # the attrValue is true in the attrSet:
  # `ALTER USER user.name WITH attrName`
  # services.postgresql.ensureUsers.*.ensureClauses = The default, `null`, means that the user created will have the default permissions assigned by PostgreSQL. Subsequent server starts will not set or unset the clause, so imperative changes are preserved.;
  
  # Additional arguments passed to `initdb` during data dir
  # initialisation.
  #
  # services.postgresql.initdbArgs = [ ];
  
  # A file containing SQL statements to execute on first startup.
  # services.postgresql.initialScript = null;
  
  # Grants the user, created by the ensureUser attr, createdb permissions. From the postgres docs:
  # A role must be explicitly given permission to create
  # databases (except for superusers, since those bypass all
  # permission checks). To create such a role, use CREATE
  # ROLE name CREATEDB.
  #
  # More information on postgres roles can be found [here](https://www.postgresql.org/docs/current/role-attributes.html)
  # services.postgresql.ensureUsers.*.ensureClauses.createdb = `null`: do not set. For newly created roles, use PostgreSQL's default. For existing roles, do not touch this clause.;
  
  # Grants the user created inherit permissions. From the postgres docs:
  # A role is given permission to inherit the privileges of
  # roles it is a member of, by default. However, to create a
  # role without the permission, use CREATE ROLE name
  # NOINHERIT.
  #
  # More information on postgres roles can be found [here](https://www.postgresql.org/docs/current/role-attributes.html)
  # services.postgresql.ensureUsers.*.ensureClauses.inherit = `null`: do not set. For newly created roles, use PostgreSQL's default. For existing roles, do not touch this clause.;
  
  # Grants the user, created by the ensureUser attr, login permissions. From the postgres docs:
  # Only roles that have the LOGIN attribute can be used as
  # the initial role name for a database connection. A role
  # with the LOGIN attribute can be considered the same as a
  # “database user”. To create a role with login privilege,
  # use either:
  # CREATE ROLE name LOGIN; CREATE USER name;
  # (CREATE USER is equivalent to CREATE ROLE except that
  # CREATE USER includes LOGIN by default, while CREATE ROLE
  # does not.)
  # More information on postgres roles can be found [here](https://www.postgresql.org/docs/current/role-attributes.html)
  # services.postgresql.ensureUsers.*.ensureClauses.login = `null`: do not set. For newly created roles, use PostgreSQL's default. For existing roles, do not touch this clause.;
  
  # Grants the user, created by the ensureUser attr, superuser permissions. From the postgres docs:
  # A database superuser bypasses all permission checks,
  # except the right to log in. This is a dangerous privilege
  # and should not be used carelessly; it is best to do most
  # of your work as a role that is not a superuser. To create
  # a new database superuser, use CREATE ROLE name SUPERUSER.
  #
  # You must do this as a role that is already a superuser.
  #
  # More information on postgres roles can be found [here](https://www.postgresql.org/docs/current/role-attributes.html)
  # services.postgresql.ensureUsers.*.ensureClauses.superuser = `null`: do not set. For newly created roles, use PostgreSQL's default. For existing roles, do not touch this clause.;
  
  # Grants the user ownership to a database with the same name.
  #
  # This database must be defined manually in
  # [](#opt-services.postgresql.ensureDatabases).
  #
  # services.postgresql.ensureUsers.*.ensureDBOwnership = false;
  
  # Name of the user to ensure.
  # Type: string
  # services.postgresql.ensureUsers.*.name = "";
  
  # List of PostgreSQL plugins. PostgreSQL version for each plugin should
  # match version for `services.postgresql.package` value.
  #
  # services.postgresql.extraPlugins = [ ];
  
  # Defines the mapping from system users to database users.
  #
  # See the [auth doc](https://postgresql.org/docs/current/auth-username-maps.html).
  #
  # services.postgresql.identMap = "";
  
  # PostgreSQL package to use.
  # Type: package
  # services.postgresql.package = null;
  
  # The port on which PostgreSQL listens.
  services.postgresql.port = 5432;
  
  # Contents of the {file}`recovery.conf` file.
  # services.postgresql.recoveryConfig = null;
  
  # Grants the user, created by the ensureUser attr, replication permissions. From the postgres docs:
  # A role must be explicitly given permission to bypass
  # every row-level security (RLS) policy (except for
  # superusers, since those bypass all permission checks). To
  # create such a role, use CREATE ROLE name BYPASSRLS as a
  # superuser.
  #
  # More information on postgres roles can be found [here](https://www.postgresql.org/docs/current/role-attributes.html)
  # services.postgresql.ensureUsers.*.ensureClauses.bypassrls = `null`: do not set. For newly created roles, use PostgreSQL's default. For existing roles, do not touch this clause.;
  
  # A printf-style string that is output at the beginning of each log line.
  #
  # Upstream default is `'%m [%p] '`, i.e. it includes the timestamp. We do
  # not include the timestamp, because journal has it anyway.
  #
  # services.postgresql.logLinePrefix = "[%p] ";
  
  # PostgreSQL configuration. Refer to
  # <https://www.postgresql.org/docs/15/config-setting.html#CONFIG-SETTING-CONFIGURATION-FILE>
  # for an overview of `postgresql.conf`.
  #
  # ::: {.note}
  # String values will automatically be enclosed in single quotes. Single quotes will be
  # escaped with two single quotes as described by the upstream documentation linked above.
  #
  # :::
  # services.postgresql.settings = { };
  
  # Defines how users authenticate themselves to the server. See the
  # [PostgreSQL documentation for pg_hba.conf](https://www.postgresql.org/docs/current/auth-pg-hba-conf.html)
  # for details on the expected format of this option. By default,
  # peer based authentication will be used for users connecting
  # via the Unix socket, and md5 password authentication will be
  # used for users connecting via TCP. Any added rules will be
  # inserted above the default rules. If you'd like to replace the
  # default rules entirely, you can use `lib.mkForce` in your
  # module.
  #
  # services.postgresql.authentication = "";
  
  # Grants the user, created by the ensureUser attr, createrole permissions. From the postgres docs:
  # A role must be explicitly given permission to create more
  # roles (except for superusers, since those bypass all
  # permission checks). To create such a role, use CREATE
  # ROLE name CREATEROLE. A role with CREATEROLE privilege
  # can alter and drop other roles, too, as well as grant or
  # revoke membership in them. However, to create, alter,
  # drop, or change membership of a superuser role, superuser
  # status is required; CREATEROLE is insufficient for that.
  #
  # More information on postgres roles can be found [here](https://www.postgresql.org/docs/current/role-attributes.html)
  # services.postgresql.ensureUsers.*.ensureClauses.createrole = `null`: do not set. For newly created roles, use PostgreSQL's default. For existing roles, do not touch this clause.;
  
  # Grants the user, created by the ensureUser attr, replication permissions. From the postgres docs:
  # A role must explicitly be given permission to initiate
  # streaming replication (except for superusers, since those
  # bypass all permission checks). A role used for streaming
  # replication must have LOGIN permission as well. To create
  # such a role, use CREATE ROLE name REPLICATION LOGIN.
  #
  # More information on postgres roles can be found [here](https://www.postgresql.org/docs/current/role-attributes.html)
  # services.postgresql.ensureUsers.*.ensureClauses.replication = `null`: do not set. For newly created roles, use PostgreSQL's default. For existing roles, do not touch this clause.;
}