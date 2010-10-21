Received: from metis.ext.pengutronix.de ([92.198.50.35])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8yfh-0000ip-79
	for linux-mtd@lists.infradead.org; Thu, 21 Oct 2010 17:11:25 +0000
Date: Thu, 21 Oct 2010 19:10:45 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: zhangyd <zhangyd6@gmail.com>
Subject: Re: [PATCH] mtd: chips: add SST38VF640x nor-flashes
Message-ID: <20101021171045.GE11131@pengutronix.de>
References: <1287716022-2792-1-git-send-email-zhangyd6@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="KuLpqunXa7jZSBt+"
Content-Disposition: inline
In-Reply-To: <1287716022-2792-1-git-send-email-zhangyd6@gmail.com>
Cc: dwmw2@infradead.org, glecerf@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--KuLpqunXa7jZSBt+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 21, 2010 at 10:53:42PM -0400, zhangyd wrote:
> Due to broken CFI, these flashes should be operated in jedec probe mode.
> When you operate them in the CFI probe mode, you will get the wrong sector
> size.And it will fail to set up the flash during the probe(CFI mode).
> And i have tested it on my platform.
>=20
> Signed-off-by: yidong zhang <zhangyd6@gmail.com>

Still NACK. Unless Guillaume doesn't come to the conclusion that JEDEC is
better, supporting him is the preferred option IMO.

--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--KuLpqunXa7jZSBt+
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkzAdBUACgkQD27XaX1/VRu1xQCeM56/hUv2iMcQ0JnwdY9iFjEw
HSkAoIsk79geAC2EeM2/6vwrbH4eEyT2
=4wio
-----END PGP SIGNATURE-----

--KuLpqunXa7jZSBt+--
