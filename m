From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 19 Mar 2003 12:38:30 -0700
Subject: DQ5 & DQ6 in chips/cfi_cmdset_0002.c (Dairy Queen 5 warning)
In-Reply-To: <20030319095638.V1745@brecis.com>
References: <1047428715.11517.50.camel@tubarao>
 <20030312102735.U1745@brecis.com> <1047915630.11512.81.camel@tubarao>
 <1047926318.11517.235.camel@tubarao> <1048033423.11512.1657.camel@tubarao>
 <20030319095638.V1745@brecis.com>
Message-ID: <1048102710.11512.1663.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-kZtkePRDB816W7SZVvFx
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-03-19 at 08:56, Steve Wahl wrote:

> Still thinking about the rest of what you wrote.  My initial thoughts
> are this shouldn't really need a whole separate command set file.

Yeah, I don't like making a new driver either.  The concerns are knowing
_not_ to check DQ5 and other status bits as well as knowing that a
device does not support suspend/resume.  That could be described in
another field of the jedec_table[] - unless we can come up with a
_reliable_ way of probing that functionality.

I'm still thinking, too.  I just wanted a starting point - sometimes
it's hard to get going without some sample code.

> --> Steve
>=20
>=20
>=20
>=20
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
--=20
Thayne Harbaugh
Linux Networx

--=-kZtkePRDB816W7SZVvFx
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+eMc2fsBPTKE6HMkRAiw2AJsFNarjJ6p1730Lv8MaTSKiHbJcOwCggltp
MIcGi2FJjqSPg6efEAnLYjY=
=Wb2R
-----END PGP SIGNATURE-----

--=-kZtkePRDB816W7SZVvFx--
