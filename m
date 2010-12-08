Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PQMt8-00085W-HT
	for linux-mtd@lists.infradead.org; Wed, 08 Dec 2010 16:29:07 +0000
Date: Wed, 8 Dec 2010 17:29:03 +0100
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: cfi_cmdset_0002: add support for Samsung
	K8D3x16UxC NOR chips
Message-ID: <20101208162903.GF4641@pengutronix.de>
References: <20101208160018.22017.8779.stgit@dev.siriade.com>
	<20101208160023.22017.21978.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y1L3PTX8QE8cb2T+"
Content-Disposition: inline
In-Reply-To: <20101208160023.22017.21978.stgit@dev.siriade.com>
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


--Y1L3PTX8QE8cb2T+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 08, 2010 at 05:00:23PM +0100, Guillaume LECERF wrote:
> These chips report CFI v3.3 [1], so patch them on the fly to the more
> correct v1.3.
> Discussed and tested by the OpenWRT people [2].
>=20
> [1] http://www.samsung.com/global/system/business/semiconductor/product/2=
007/6/11/NORFlash/32Mbit/K8D3216UBC/ds_K8D3x16UxC_rev17.pdf
> [2] https://dev.openwrt.org/ticket/866
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--Y1L3PTX8QE8cb2T+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAkz/sk8ACgkQD27XaX1/VRvgwgCeKva4QHRjQ//9GrauVaKD6A2/
fP4AoIX3sAQFiJ7orVjsfusEHLqP4hqt
=5Pzo
-----END PGP SIGNATURE-----

--Y1L3PTX8QE8cb2T+--
