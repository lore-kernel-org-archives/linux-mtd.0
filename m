Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ALkcY-0005Ts-FX
	for <linux-mtd@lists.infradead.org>; Mon, 17 Nov 2003 14:44:54 +0000
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: philwil@earthlink.net
In-Reply-To: <3FB6E4AA.27A7AAE1@earthlink.net>
References: <3FA7AB8B.A287F4@earthlink.net>
	<3FB6E4AA.27A7AAE1@earthlink.net>
Message-Id: <1069079731.14277.71.camel@tubarao>
Mime-Version: 1.0
Date: 17 Nov 2003 07:35:32 -0700
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-dicfb8MiVYGe0IDBXEaS"
cc: Russ.Dill@asu.edu
cc: linux-mtd@lists.infradead.org
Subject: Re: Jffs2 write Error
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-dicfb8MiVYGe0IDBXEaS
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Sat, 2003-11-15 at 19:44, Phil Wilshire wrote:
> I have found my original problem.
>=20
> The=20
>    do_write_oneword=20
> routine in=20
>   cfi_cmdset_0002.c=20
>=20
> was being given values for datum wider than the 16 bits
> we are allowed to write to the device.
> The readback being limited to 16 bits, of course , failed to match
>=20
>=20
> The data was being given to do_write_oneword by gc.c=20

Why is gc.c passing values that aren't appropriate?

> Here is the error output
>=20
> Last[3] is 66, datum is 8000066 addr 3028c
> Write of 49 bytes at 0x00030264 failed. returned -5, retlen 40
> jffs2_write_dirent in garbage_collect_dirent failed: -5
>=20
> As you can see 8000066 is impossible to write to a 16 bit device.

Quite obvious.

> I put an extra check on the word size in do_write_oneword and the error j=
ust went away.

What check did you put in?  What do you mean by "the error just went
away?"  That sounds like a Heisenbug (race) more than a real solution.

--=20
Thayne Harbaugh
Linux Networx

--=-dicfb8MiVYGe0IDBXEaS
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/uNyzfsBPTKE6HMkRAiaxAJwNiwTOzzQ+EVUhL+d2ilvOkkDOpgCfQFa4
ud/Abfn0iukighNyVpJelqo=
=VZwC
-----END PGP SIGNATURE-----

--=-dicfb8MiVYGe0IDBXEaS--
