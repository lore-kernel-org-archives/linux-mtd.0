Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAgf4-0005Af-Nc
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 10:21:47 +0000
Date: Tue, 26 Oct 2010 12:21:40 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: Guillaume LECERF <glecerf@gmail.com>
Subject: Re: [PATCH v3] mtd: cfi_cmdset_0002: make sector erase command
	variable
Message-ID: <20101026102140.GA31843@pengutronix.de>
References: <20101026094523.6578.44863.stgit@dev.siriade.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="y0ulUmNC+osPPQO6"
Content-Disposition: inline
In-Reply-To: <20101026094523.6578.44863.stgit@dev.siriade.com>
Cc: zhangyd6@gmail.com, fggs@terra.com.br, linux-mtd@lists.infradead.org,
	David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--y0ulUmNC+osPPQO6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 26, 2010 at 11:45:23AM +0200, Guillaume LECERF wrote:
> Some old SST chips use 0x50 as sector erase command, instead
> of 0x30. Make this value variable to handle such chips.
>=20
> Signed-off-by: Guillaume LECERF <glecerf@gmail.com>

I like that :)

Acked-by: Wolfram Sang <w.sang@pengutronix.de>

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--y0ulUmNC+osPPQO6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkzGq7QACgkQD27XaX1/VRtCGgCfap5hHo35ubW01Exn2qxKo3vU
InEAoKznUJTP60UOrKZordMVK2sVx/Vi
=krQZ
-----END PGP SIGNATURE-----

--y0ulUmNC+osPPQO6--
