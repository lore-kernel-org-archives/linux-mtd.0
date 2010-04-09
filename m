Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O0A0F-0004Fu-Rk
	for linux-mtd@lists.infradead.org; Fri, 09 Apr 2010 08:55:53 +0000
Date: Fri, 9 Apr 2010 10:55:48 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v2 6/7] mtd: cfi_cmdset_0002: add CFI detection for SST
	39VF{16, 32}xx chips
Message-ID: <20100409085548.GF14430@pengutronix.de>
References: <20100330133448.20107.1077.stgit@shiryu.yomgui.biz>
	<20100330133513.20107.72328.stgit@shiryu.yomgui.biz>
	<20100408152138.GA13059@pengutronix.de>
	<r2hb8e9195f1004080832v76cc8f20x941d6d2eb697850f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+jhVVhN62yS6hEJ8"
Content-Disposition: inline
In-Reply-To: <r2hb8e9195f1004080832v76cc8f20x941d6d2eb697850f@mail.gmail.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--+jhVVhN62yS6hEJ8
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 08, 2010 at 05:32:08PM +0200, Guillaume LECERF wrote:
> 2010/4/8 Wolfram Sang <w.sang@pengutronix.de>:
> >> +/* Used to fix CFI-Tables of chips without Extended Query Tables
> >> + */
> >> +static struct cfi_fixup cfi_nopri_fixup_table[] =3D {
> >> + =A0 =A0 { CFI_MFR_SST, 0x234A, fixup_sst39vf, NULL, }, // SST39VF1602
> >
> > I got a build error. CFI_MFR_SST is missing.
>=20
> This patch depends on this commit
> http://git.infradead.org/mtd-2.6.git/commit/f3e69c6584be2db1ccd5292d6a1d7=
c566d265701.
> Your personnal repo must be outdated.

Thanks. I was unaware that there are pending patches below the v2.6.34-rc2 =
tag.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--+jhVVhN62yS6hEJ8
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAku+65QACgkQD27XaX1/VRu/VgCeOB0kxs9rCBb6MN8UlO2Eyn5B
DmIAn0/LBpNBMF65g6nqpUSP/9vQ5ubL
=3Cwo
-----END PGP SIGNATURE-----

--+jhVVhN62yS6hEJ8--
