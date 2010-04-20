Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1O49NK-0003Z4-Ts
	for linux-mtd@lists.infradead.org; Tue, 20 Apr 2010 09:04:12 +0000
Date: Tue, 20 Apr 2010 11:04:08 +0200
From: Wolfram Sang <w.sang@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: Can PYSMAP_COMPAT go?
Message-ID: <20100420090408.GM19957@pengutronix.de>
References: <20100420063547.GH19957@pengutronix.de>
	<20100420073503.GL4586@mail.wantstofly.org>
	<1271750733.14748.1580.camel@macbook.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lRF4gxo9Z9M++D0O"
Content-Disposition: inline
In-Reply-To: <1271750733.14748.1580.camel@macbook.infradead.org>
Cc: linux-mtd@lists.infradead.org, Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--lRF4gxo9Z9M++D0O
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable


> And this was i386, which unfortunately doesn't use the device-tree yet,
> although on these embedded SoC devices it really _should_ be doing so.
> And it doesn't have 'platform code' either.

Okay, so unless i386 gets device-tree support ;), how about at least this?

=46rom: Wolfram Sang <w.sang@pengutronix.de>
Subject: [PATCH] mtd/physmap: Use sensible default value for MTD_PHYSMAP_LEN

Commit 73566edf9b91dd085ddb12033d0ea7288979dd10 made it necessary to be
0, but commit dcb3e137ce9be1dfc86e306182b23e3ae5e239c4 obsoleted that
requirement. Restore the old value to get a meaningful default.

Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>
---
 drivers/mtd/maps/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/maps/Kconfig b/drivers/mtd/maps/Kconfig
index aa2807d..213c615 100644
--- a/drivers/mtd/maps/Kconfig
+++ b/drivers/mtd/maps/Kconfig
@@ -47,7 +47,7 @@ config MTD_PHYSMAP_START
 config MTD_PHYSMAP_LEN
 	hex "Physical length of flash mapping"
 	depends on MTD_PHYSMAP_COMPAT
-	default "0"
+	default "0x4000000"
 	help
 	  This is the total length of the mapping of the flash chips on
 	  your particular board. If there is space, or aliases, in the
--=20
1.7.0


--=20
Pengutronix e.K.                           | Wolfram Sang                |
Industrial Linux Solutions                 | http://www.pengutronix.de/  |

--lRF4gxo9Z9M++D0O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkvNbggACgkQD27XaX1/VRvSoQCgleToHaoDJvs5sKi+mM71Z8WV
uL4AoK9iNZrSOhqTQMiP1WDlKTW90iVg
=swI5
-----END PGP SIGNATURE-----

--lRF4gxo9Z9M++D0O--
