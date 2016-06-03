Received: from shadbolt.e.decadent.org.uk ([88.96.1.126])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8cdY-00070b-M6
 for linux-mtd@lists.infradead.org; Fri, 03 Jun 2016 00:06:53 +0000
Date: Fri, 3 Jun 2016 01:06:27 +0100
From: Ben Hutchings <ben@decadent.org.uk>
To: linux-mtd@lists.infradead.org
Cc: linux-cris-kernel@axis.com
Message-ID: <20160603000627.GN7555@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature"; boundary="IihjUyvzd0n5Ehsu"
Content-Disposition: inline
Subject: [PATCH] mtd: Remove unused symbol CONFIG_MTDRAM_ABS_POS
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--IihjUyvzd0n5Ehsu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

This has been unused, except as the condition for a fatal error, since
commit c13cbf3b5086 ("[MTD] mtdram: Quick cleanup of the driver:") in
2.6.13 (!).

Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
---
 arch/cris/arch-v10/drivers/axisflashmap.c |  2 +-
 drivers/mtd/devices/Kconfig               | 12 ------------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/arch/cris/arch-v10/drivers/axisflashmap.c b/arch/cris/arch-v10=
/drivers/axisflashmap.c
index 60d57c590032..bdc25aa43468 100644
--- a/arch/cris/arch-v10/drivers/axisflashmap.c
+++ b/arch/cris/arch-v10/drivers/axisflashmap.c
@@ -397,7 +397,7 @@ static int __init init_axis_flash(void)
 	if (!romfs_in_flash) {
 		/* Create an RAM device for the root partition (romfs). */
=20
-#if !defined(CONFIG_MTD_MTDRAM) || (CONFIG_MTDRAM_TOTAL_SIZE !=3D 0) || (C=
ONFIG_MTDRAM_ABS_POS !=3D 0)
+#if !defined(CONFIG_MTD_MTDRAM) || (CONFIG_MTDRAM_TOTAL_SIZE !=3D 0)
 		/* No use trying to boot this kernel from RAM. Panic! */
 		printk(KERN_EMERG "axisflashmap: Cannot create an MTD RAM "
 		       "device due to kernel (mis)configuration!\n");
diff --git a/drivers/mtd/devices/Kconfig b/drivers/mtd/devices/Kconfig
index f73c41697a00..5a1d0dc71495 100644
--- a/drivers/mtd/devices/Kconfig
+++ b/drivers/mtd/devices/Kconfig
@@ -171,18 +171,6 @@ config MTDRAM_ERASE_SIZE
 	  as a module, it is also possible to specify this as a parameter when
 	  loading the module.
=20
-#If not a module (I don't want to test it as a module)
-config MTDRAM_ABS_POS
-	hex "SRAM Hexadecimal Absolute position or 0"
-	depends on MTD_MTDRAM=3Dy
-	default "0"
-	help
-	  If you have system RAM accessible by the CPU but not used by Linux
-	  in normal operation, you can give the physical address at which the
-	  available RAM starts, and the MTDRAM driver will use it instead of
-	  allocating space from Linux's available memory. Otherwise, leave
-	  this set to zero. Most people will want to leave this as zero.
-
 config MTD_BLOCK2MTD
 	tristate "MTD using block device"
 	depends on BLOCK

--IihjUyvzd0n5Ehsu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIVAwUBV1DKA+e/yOyVhhEJAQr0mg/+OHtVS6MXfCpEJ3KUEclIoc0BT/CFXbcy
RsEJntTFkHRYBEmHS3czIuo3uQD0emLPhIy0SUVfAxIWME1pSIA+OUeJdcaLqKat
D/J1kxpD6FT9xy8FScjZ0uQ8k3bwI2sPRKusVUNPD3kjp9e+gaoQVQeZI1H6OiDj
vuDUW0+SQVpf6bLZT9E1QLb7lpUf1CTzqgU1Sfu3MpVtM6BytIhJv8LL64rssjXf
3UGPkabgQsSKMtUZ4zl6Krrq+D41KO7qPxoaPd92wuZJlUmQtOmjFV0rRdWN48Md
PR3yy+tOj0ml/bZsmlPEaIgFPATXMVrkChhH7Fo7ysgy2Fja7y4PbcSMbiHWlrq3
Lx6W22xr9FdTX5PiJioH4TqzJ/YZ65DPZH6oGDxD/uTtk5HsR7+WIywy/DjZKeOw
R80Z4EavSB+Sz2L1Mi+myuWRUz/JUuSDB5frgweKHlasxCwQ2FxivC5wajQBERz9
VzKMgtuNqTUoxfsdzNFsRkC3Mw3Xy6EuwuORT98WZ+e+JVS7aWG3aSRR2vH8YILr
IWHlI2PSoIEGpWzLLYO2AxvdbFzwyZx2QOgafVQhlBkiyLRKwrp14Zyn39SkJIys
TjqycpAOP7guqDAaHYMs/w/tuPnhYndNUOksKg+BCDa7eJDNLiIL3CUaY46Npzsu
dgH4sY6uiIU=
=Vlt3
-----END PGP SIGNATURE-----

--IihjUyvzd0n5Ehsu--
