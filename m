From: tharbaugh@lnxi.com (Thayne Harbaugh)
Date: 19 Feb 2003 13:11:31 -0700
Subject: Wacky JEDEC probes
In-Reply-To: <1045671999.2672.28.camel@tubarao>
References: <1045671999.2672.28.camel@tubarao>
Message-ID: <1045685491.2666.36.camel@tubarao>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

--=-DqHuHgQtXNUygxv8aCoG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-02-19 at 09:26, Thayne Harbaugh wrote:
> I have been experiencing wacky JEDEC probes which have the following
> symptoms:
>=20

<snip>

>=20
> There are some significant things to note about the provided patch:
>=20

I forgot to mention something else that is notable about the patch:

- The patch deletes an extra (and possibly incorrect) listing for the
AMD AM29LV800BB device and reworks Top and Bottom variations of the ST
M29W800D device.

--=20
Thayne Harbaugh
Linux Networx

--=-DqHuHgQtXNUygxv8aCoG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+U+TzfsBPTKE6HMkRAnxYAJ9jqNRjDRBYUkTuQyNu235mYx/hrwCfbdnq
uJjz55mo6iMZO95MHOl9sfQ=
=tGF5
-----END PGP SIGNATURE-----

--=-DqHuHgQtXNUygxv8aCoG--
