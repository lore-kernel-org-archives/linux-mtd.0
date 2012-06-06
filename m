Message-ID: <1338993547.6875.65.camel@sauron.fi.intel.com>
Subject: Re:
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Sascha Hauer <s.hauer@pengutronix.de>
Date: Wed, 06 Jun 2012 17:39:07 +0300
In-Reply-To: <1338978796-26129-1-git-send-email-s.hauer@pengutronix.de>
References: <1338978796-26129-1-git-send-email-s.hauer@pengutronix.de>
Content-Type: multipart/signed; micalg="pgp-sha1";
 protocol="application/pgp-signature";
 boundary="=-aRJL0oNoNpZLqmIr80GX"
Mime-Version: 1.0
Cc: Shawn Guo <shawn.guo@linaro.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-aRJL0oNoNpZLqmIr80GX
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, 2012-06-06 at 12:33 +0200, Sascha Hauer wrote:
> The following adds i.MX53 nand support and generally devicetree
> based probing for i.MX5 boards. The first three patches should go
> via mtd, the last patch optionally aswell if all agree.
>=20
> Sascha
>=20
> The following changes since commit f8f5701bdaf9134b1f90e5044a82c66324d207=
3f:
>=20
>   Linux 3.5-rc1 (2012-06-02 18:29:26 -0700)
>=20
> are available in the git repository at:
>=20
>   git://git.pengutronix.de/git/imx/linux-2.6.git imx/nand-mx53
>=20
> for you to fetch changes up to d55d1479a3bfaedbb9f0c6c956f4dff6bb6d6d61:
>=20
>   ARM i.MX5: Add nand oftree support (2012-06-06 12:20:24 +0200)

Do you want this to go via the MTD tree? Would you be able to collect
acks for the arch/arm bits? Meanwhile, please, take a look at these
sparse warnings added by this patch-set and detected by aiaiai:

---------------------------------------------------------------------------=
-----

Successfully built configuration "arm-mxc-imx_defconfig,arm,arm-unknown-lin=
ux-gnueabi-", results:

--- before_patching.log
+++ after_patching.log
@@ @@
+drivers/mtd/nand/mxc_nand.c:1289:26: warning: incorrect type in initialize=
r (different modifiers) [sparse]
+drivers/mtd/nand/mxc_nand.c:1289:26:    expected void *data [sparse]
+drivers/mtd/nand/mxc_nand.c:1289:26:    got struct mxc_nand_devtype_data s=
tatic const [toplevel] *<noident> [sparse]
+drivers/mtd/nand/mxc_nand.c:1289:3: warning: initialization discards 'cons=
t' qualifier from pointer target type [enabled by default]

---------------------------------------------------------------------------=
-----


--=20
Best Regards,
Artem Bityutskiy

--=-aRJL0oNoNpZLqmIr80GX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAABAgAGBQJPz2uMAAoJECmIfjd9wqK0W+wQAIhI9jYil7zZG3GI8D1c1pfL
UFHFYGLiAIKUUkmvwoJ4m2k1SQhedDMvJTV68o3Wl5h/bCu2aldQjeT+pl0Dv/BS
srv0ddaC96t6BR8qx0bTZExMrweK6uoGrqgI8DDB3sLLdWp4Ro1hwgN4PShDWpdq
SuXgXfJDj+9NyF94cRAhaXbFjHpStpBoWPEn/P7zvR8b/3Gbrt6B7L7PmcCIfe4w
aAPpiqC9v8G4+HtlSyYFlVaAACXm5fTD96wOh+3elQ5k0OjKfFWjLgW/KzP4ttN6
eQdZ0peRCrkduv6CLtOceOFbczXI8+e/v7HodqIDMMfB0UU1rVdNPSwwgVQhR5XI
5PT2adBx+1kFUI/st2305mUBF08oFR4W0M769f56BE4hK9NZC9FkPQDCl/aJOFqc
XnkdYIRJBcdYxmioTv1ZB+WpgWXRQV0O/pS9IwrS0OMIxeMGpxJo6F81PgllcCLy
+K0NczvJ2+j14rnT2PsuIsXTKbV+GG/WM/8LQSyQJ5Z0o3l9m0qLTQNG40tDRV6h
tBu63YUTiF2chC8jAnkQCGdHgzadNMHxG/F8kQhJDCKlhI9bYR2wdbL74FJ8SHB/
e8GBNFnegJ9rSM4EVEbq+CfmEDmbiuBXti4fCgZE1O37UXzGwNDKTSSmmObFO95r
MW2IR/zNySp653Kd6TfH
=lsjR
-----END PGP SIGNATURE-----

--=-aRJL0oNoNpZLqmIr80GX--
