Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1ACiCG-0001zu-Gl
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 17:20:24 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: ch@hpl.hp.com
In-Reply-To: <000001c398ec$81bc7020$d203b60f@duckduck>
References: <000001c398ec$81bc7020$d203b60f@duckduck>
Message-Id: <1066925625.6281.211.camel@tubarao>
Mime-Version: 1.0
Date: 23 Oct 2003 10:13:45 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-eAUtaftr9GgcB6M0+/Ii"
cc: ch@murgatroid.com
cc: 'mtd list' <linux-mtd@lists.infradead.org>
Subject: RE: Regression of mtd/chips/jedec_probe.c in 2.6.0-test7
Reply-To: tharbaugh@lnxi.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-eAUtaftr9GgcB6M0+/Ii
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

Now that I've been unhelpful, if not confusing, I figure I should look
at your emails a bit closer.

On Wed, 2003-10-22 at 16:33, Christopher Hoover wrote:

> Search for id:(01 225b) interleave(1) type(2)
> Search for id:(01 225b) interleave(1) type(2)

This is the manufacturer and device id for the AM29LV800BB.

01 =3D AMD
225b =3D AM29LV800BB in x16 mode.

If that's correct, why doesn't it find it?  Have you tried turning on
debug and setting it to 3?

> Search for id:(70 e3a0) interleave(1) type(2)
> Search for id:(01 5b) interleave(2) type(1)
> Search for id:(01 5b) interleave(2) type(1)

01 =3D AMD
5b =3D AM29LV800BB in x8 mode.

Once again, why isn't the chip found?

> Search for id:(70 a0) interleave(2) type(1)
> Search for id:(70 f10) interleave(2) type(2)
> Search for id:(70 f10) interleave(2) type(2)
> Search for id:(70 f10) interleave(2) type(2)
> JEDEC: Found no ceiva flash device at location zero
                  ^^^^^
Looks like a Polaroid camera?

> clps_setup_mtd: do_map_probe failed to find flash

We nee the debug verbosity turned up for jedec_probe.  Hopefully that
will tell us why jedec_match() (I believe) is failing.

--=20
Thayne Harbaugh
Linux Networx

--=-eAUtaftr9GgcB6M0+/Ii
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/l/45fsBPTKE6HMkRAh6DAJ9HCXOwXE4ic8UsGkhWHWwsie8ecQCeNH6P
X6ZSVtxgqXFye1mioYsr/o8=
=UoKp
-----END PGP SIGNATURE-----

--=-eAUtaftr9GgcB6M0+/Ii--
