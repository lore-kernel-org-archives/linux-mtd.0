Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RKFVm-0007wz-2a
	for linux-mtd@lists.infradead.org; Sat, 29 Oct 2011 20:28:15 +0000
Date: Sat, 29 Oct 2011 22:28:09 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 1/2] mtd: tests: don't use mtd0 as a default
Message-ID: <20111029202809.GA26851@pengutronix.de>
References: <1319533791-32605-1-git-send-email-w.sang@pengutronix.de>
	<1319919909.2126.15.camel@koala>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="liOOAslEiF7prFVr"
Content-Disposition: inline
In-Reply-To: <1319919909.2126.15.camel@koala>
Cc: Roland Kletzing <devzero@web.de>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--liOOAslEiF7prFVr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 29, 2011 at 11:25:07PM +0300, Artem Bityutskiy wrote:
> On Tue, 2011-10-25 at 11:09 +0200, Wolfram Sang wrote:
> > mtd tests may erase the mtd device, so force the user to specify which
> > mtd device to test by using the module parameter. Disable the default
> > (using mtd0) since this may destroy a vital part of the flash if the
> > module is inserted accidently or carelessly.
> >=20
> > Reported-by: Roland Kletzing <devzero@web.de>
> > Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
>=20
> Note, I've pushed this patch to l2-mtd-2.6.git, thanks!

Ah, I am just about to test V2 of this patch :)

You didn't like PATCH 2/2?

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--liOOAslEiF7prFVr
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iEYEARECAAYFAk6sYdkACgkQD27XaX1/VRuDGQCgonq/eSmEV0SuoXFGQ2mKzBiP
9k0AniPYCRz5yHs5qYOci6nEu37hoYmw
=JB1b
-----END PGP SIGNATURE-----

--liOOAslEiF7prFVr--
