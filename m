Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P6z3x-0001n1-BI
	for linux-mtd@lists.infradead.org; Sat, 16 Oct 2010 05:12:10 +0000
Date: Sat, 16 Oct 2010 07:12:01 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Maxim Levitsky <maximlevitsky@gmail.com>
Subject: Re: [PATCH 2/5] MTD: blktrans: kill the BKL.
Message-ID: <20101016051201.GA2992@pengutronix.de>
References: <1287156047-17439-1-git-send-email-maximlevitsky@gmail.com>
	<1287156047-17439-3-git-send-email-maximlevitsky@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tKW2IUtsqtDRztdT"
Content-Disposition: inline
In-Reply-To: <1287156047-17439-3-git-send-email-maximlevitsky@gmail.com>
Cc: linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Maciej Rutecki <maciej.rutecki@gmail.com>
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

On Fri, Oct 15, 2010 at 05:20:44PM +0200, Maxim Levitsky wrote:
> It not needed, because I already added locking for all fops
> methods.
>=20
> Signed-off-by: Maxim Levitsky

This SoB got damaged.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--tKW2IUtsqtDRztdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAky5NCEACgkQD27XaX1/VRtArgCgqJJncYxkof0QEGOSg0vMgFX3
xREAnRyU0Pkqm2Ux+KZmg3RG6CdXVV41
=K/i1
-----END PGP SIGNATURE-----

--tKW2IUtsqtDRztdT--
