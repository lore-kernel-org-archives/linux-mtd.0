Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OCjZm-00064f-6R
	for linux-mtd@lists.infradead.org; Fri, 14 May 2010 01:20:31 +0000
Date: Fri, 14 May 2010 03:20:23 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/2] mtd/chips: add SST39WF160x NOR-flashes
Message-ID: <20100514012023.GA30794@pengutronix.de>
References: <1272334774-17019-1-git-send-email-w.sang@pengutronix.de>
	<1273797888.9999.591.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <1273797888.9999.591.camel@macbook.infradead.org>
Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>,
	Guillaume LECERF <glecerf@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--tKW2IUtsqtDRztdT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 14, 2010 at 01:44:48AM +0100, David Woodhouse wrote:
> On Tue, 2010-04-27 at 04:19 +0200, Wolfram Sang wrote:
> > Due to a broken CFI, they have to be added to jedec_probe.
> >=20
> > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
> > Cc: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
> > Cc: David Woodhouse <David.Woodhouse@intel.com>
> > ---
> >=20
> > Sadly, those two cannot be detected using Guillaume's SST-patchset.
>=20
> Why not? Guillaume has patches which add quirks for specific SST chips;
> what is fundamentally different about these chips that means you can't
> take the same approach?

See his patch 3/8. He introduces:

+#define P_ID_SST_OLD            0x0701

so, he can then do:

+       if (cfi->cfiq->P_ID =3D=3D P_ID_SST_OLD) {
+               addr_unlock1 =3D 0x5555;
+               addr_unlock2 =3D 0x2AAA;
+       }
+

Only after that, he can query for more CFI-information/product ID and apply=
 the
quirks.

My flashes don't have P_ID_SST_OLD, sadly, but P_ID_AMD_STD. Still, unlike
other AMD_STD-flashes, my flashes need their custom unlock address. I could=
n't
find a way to distinguish this from the standard case with the regular unlo=
ck
addresses.

Kind regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvspVcACgkQD27XaX1/VRsmQQCeLiRjGJ2DJJxZOx/Mx6aBSMpa
PfwAoKP41Lrz6uDjSGsNz5AGH9+K5Q0m
=hL+x
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
