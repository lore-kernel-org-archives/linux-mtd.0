Received: from 208.177.141.226.ptr.us.xo.net ([208.177.141.226]
	helo=ash.lnxi.com)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AChvq-0001xr-2m
	for <linux-mtd@lists.infradead.org>; Thu, 23 Oct 2003 17:03:26 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: ch@hpl.hp.com
In-Reply-To: <001201c398fe$b6d567a0$d203b60f@duckduck>
References: <001201c398fe$b6d567a0$d203b60f@duckduck>
Message-Id: <1066924604.6281.205.camel@tubarao>
Mime-Version: 1.0
Date: 23 Oct 2003 09:56:44 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-hKDfH3Iy11B+S2SyHOsb"
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


--=-hKDfH3Iy11B+S2SyHOsb
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-10-22 at 18:43, Christopher Hoover wrote:
> > There's one more fragment where cfi->device_type should
> > revert back to CFI_DEVICETYPE_X8
>=20
> OK, now I'm confused.  Revert *back* to CFI_DEVICETYPE_X8?
>=20
> I though we were going the other direction.

Okay, I didn't read the patch hunks very closely.  We really want to
move *from* cfi->device_type *to* CFI_DEVICETYPE_X8.  Do me a favor,
check out jedec_probe.c v1.36 from CVS and try that - yes, I know,
you've already mentioned that v1.32 worked, but trying 1.36 will be
helpful.

--=20
Thayne Harbaugh
Linux Networx

--=-hKDfH3Iy11B+S2SyHOsb
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.1 (GNU/Linux)

iD8DBQA/l/o8fsBPTKE6HMkRAr3AAJ90t32/D12Er1puh8ej34dnNcDmVACeKVmy
aIhBVtIruzAucTpGfj58pCs=
=G+fV
-----END PGP SIGNATURE-----

--=-hKDfH3Iy11B+S2SyHOsb--
