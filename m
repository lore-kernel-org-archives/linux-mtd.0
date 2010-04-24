Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O5bm2-0005kJ-Hy
	for linux-mtd@lists.infradead.org; Sat, 24 Apr 2010 09:35:43 +0000
Date: Sat, 24 Apr 2010 11:35:35 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v4 1/2] [MTD] remove bogus warning about missing boot
	bank location
Message-ID: <20100424093535.GA7199@pengutronix.de>
References: <20100423133347.27001.99171.stgit@shiryu.yomgui.biz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="mYCpIKhGyMATD0i+"
Content-Disposition: inline
In-Reply-To: <20100423133347.27001.99171.stgit@shiryu.yomgui.biz>
Cc: David Woodhouse <dwmw2@infradead.org>,
	linux-mtd <linux-mtd@lists.infradead.org>, Chris Moore <moore@free.fr>,
	Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--mYCpIKhGyMATD0i+
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2010 at 03:33:47PM +0200, Guillaume LECERF wrote:
> From: Uwe Kleine-K=F6nig <Uwe.Kleine-Koenigi@digi.com>
>=20
> After the deleted block bootloc is only used once as follows:
>=20
> 	if (bootloc =3D=3D 3 && something_else) {
> 		...
>=20
> So setting bootloc =3D 2 doesn't change anything.  Taking that the warnin=
g is
> wrong and missleading.
>=20
> Signed-off-by: Uwe Kleine-K=F6nig <Uwe.Kleine-Koenig@digi.com>

I think you need to sign it off as well (as you are sending it upstream).

And although I am not the one picking the patches up, I could imagine it he=
lps
David if you respin the whole patch-series with all the latest updates and
adding all the Acked-by and Reviewed-by tags you got. This should speed thi=
ngs
up and help merging.

Regards,

   Wolfram

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--mYCpIKhGyMATD0i+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvSu2cACgkQD27XaX1/VRuI/ACbBfFPKY1LNCOXvj6HMD4C7zfT
NvAAmwU1s/O+mNUH8810mwwK9bkIWzsz
=Tod6
-----END PGP SIGNATURE-----

--mYCpIKhGyMATD0i+--
