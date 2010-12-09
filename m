Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PQhVr-0004v5-UW
	for linux-mtd@lists.infradead.org; Thu, 09 Dec 2010 14:30:29 +0000
Date: Thu, 9 Dec 2010 15:30:25 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D6x16UxM NOR chips
Message-ID: <20101209143025.GE3383@pengutronix.de>
References: <20101209140410.26049.51539.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="8vCeF2GUdMpe9ZbK"
Content-Disposition: inline
In-Reply-To: <20101209140410.26049.51539.stgit@dev.siriade.com>
Cc: Matthias Buecher / Germany <mail@maddes.net>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--8vCeF2GUdMpe9ZbK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 09, 2010 at 03:04:11PM +0100, Guillaume LECERF wrote:
> These chips report CFI v0.0 [1], so extend cfi_fixup_major_minor()
> to patch all Samsung chips from 0.0 to 1.0.
> Discussed and tested by the OpenWRT people [2].
>=20
> [1] http://www.samsung.com/global/system/business/semiconductor/product/2=
007/6/11/NORFlash/64Mbit/K8D6316UTM/ds_K8D6x16UxM_rev16.pdf
> [2] https://dev.openwrt.org/ticket/7348
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--8vCeF2GUdMpe9ZbK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAk0A6AEACgkQD27XaX1/VRv6AwCgpWb1D35t/UQNsODPQ4U5dS6A
+0sAn2jbsQEEOouSARwW3KRQQ9XM9Pho
=yLXL
-----END PGP SIGNATURE-----

--8vCeF2GUdMpe9ZbK--
