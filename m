From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 03 Mar 2003 13:49:27 -0700
Subject: [PATCH] C99 initializers for drivers/mtd files
In-Reply-To: <20030302185616.GC10681@wohnheim.fh-wedel.de>
References: <20030226205334.GB8966@debian>
 <20030227194424.GC29233@wohnheim.fh-wedel.de>
 <20030227214646.GD8116@debian>
 <20030302185616.GC10681@wohnheim.fh-wedel.de>
Message-ID: <1046724566.2672.634.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-UIgGkC/XGO+JaNvyNuOE
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

I like the C99 initialization.  I was tempted to make these changes
myself, but I had a concern so I never did anything.

What does Marcelo think about the C99 initialization syntax?  GCC 2.95
does not understand C99 and will fail to compile kernels that require
this syntax.  Is Marcelo willing to break 2.95 and require newer
compilers?  Is the MTD community willing to maintain two patch sets: one
with GCC initializers and one with C99 initializers? (granted the old
GCC way is deprecated).


On Sun, 2003-03-02 at 11:56, J=F6rn Engel wrote:
> On Thu, 27 February 2003 15:46:46 -0600, Art Haas wrote:
> >=20
> > No, I don't have cvs access, so I can't commit any of the patches I've
> > mailed.
>=20
> Patch 1 and 4 are committed, 2 and 3 don't apply cleanly and will
> follow later...
>=20
> J=F6rn
--=20
Thayne Harbaugh
Linux Networx

--=-UIgGkC/XGO+JaNvyNuOE
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+Y7/WfsBPTKE6HMkRArz5AJ9tfjUesiCmDcgec1pJN+NBixeZbwCdFgqn
Ig0FGZ3p2atYKuxNHTi7J/o=
=UWXZ
-----END PGP SIGNATURE-----

--=-UIgGkC/XGO+JaNvyNuOE--
