Date: Tue, 8 Jun 2010 09:48:22 -0400
From: Kyle Spaans <kspaans@uwaterloo.ca>
To: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: [PATCH] MTD: remove redundant dependency checks in Kconfig files
Message-ID: <20100608134822.GA18437@caffeine.csclub.uwaterloo.ca>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Content-Disposition: inline
Cc: kernel-janitors@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Look for dependency checks for "FOO" when inside of an "if FOO" block and r=
emove them.

Signed-off-by: Kyle Spaans <kspaans@uwaterloo.ca>
Reviewed-by: Robert P. J. Day <rpjday@crashcourse.ca>
---

compile-tested on Ubuntu 10.04

 drivers/mtd/Kconfig         |    1 -
 drivers/mtd/nand/Kconfig    |   30 ++++++++++++++----------------
 drivers/mtd/onenand/Kconfig |    4 ++--
 3 files changed, 16 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/Kconfig b/drivers/mtd/Kconfig
index f8210bf..71eda03 100644
--- a/drivers/mtd/Kconfig
+++ b/drivers/mtd/Kconfig
@@ -319,7 +319,6 @@ config SM_FTL
=20
 config MTD_OOPS
 	tristate "Log panic/oops to an MTD buffer"
-	depends on MTD
 	help
 	  This enables panic and oops messages to be logged to a circular
 	  buffer in a flash partition where it can be read back at some
diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index ffc3720..4d4066f 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -37,7 +37,6 @@ config MTD_SM_COMMON
=20
 config MTD_NAND_MUSEUM_IDS
 	bool "Enable chip ids for obsolete ancient NAND devices"
-	depends on MTD_NAND
 	default n
 	help
 	  Enable this option only when your board has first generation
@@ -101,13 +100,13 @@ config MTD_NAND_AMS_DELTA
=20
 config MTD_NAND_OMAP2
 	tristate "NAND Flash device on OMAP2 and OMAP3"
-	depends on ARM && MTD_NAND && (ARCH_OMAP2 || ARCH_OMAP3)
+	depends on ARM && (ARCH_OMAP2 || ARCH_OMAP3)
 	help
           Support for NAND flash on Texas Instruments OMAP2 and OMAP3 plat=
forms.
=20
 config MTD_NAND_OMAP_PREFETCH
 	bool "GPMC prefetch support for NAND Flash device"
-	depends on MTD_NAND && MTD_NAND_OMAP2
+	depends on MTD_NAND_OMAP2
 	default y
 	help
 	 The NAND device can be accessed for Read/Write using GPMC PREFETCH engine
@@ -146,7 +145,7 @@ config MTD_NAND_AU1550
=20
 config MTD_NAND_BF5XX
 	tristate "Blackfin on-chip NAND Flash Controller driver"
-	depends on (BF54x || BF52x) && MTD_NAND
+	depends on BF54x || BF52x
 	help
 	  This enables the Blackfin on-chip NAND flash controller
=20
@@ -236,7 +235,7 @@ config MTD_NAND_S3C2410_CLKSTOP
=20
 config MTD_NAND_BCM_UMI
 	tristate "NAND Flash support for BCM Reference Boards"
-	depends on ARCH_BCMRING && MTD_NAND
+	depends on ARCH_BCMRING
 	help
 	  This enables the NAND flash controller on the BCM UMI block.
=20
@@ -395,7 +394,7 @@ endchoice
=20
 config MTD_NAND_PXA3xx
 	tristate "Support for NAND flash devices on PXA3xx"
-	depends on MTD_NAND && (PXA3xx || ARCH_MMP)
+	depends on PXA3xx || ARCH_MMP
 	help
 	  This enables the driver for the NAND flash device found on
 	  PXA3xx processors
@@ -409,18 +408,18 @@ config MTD_NAND_PXA3xx_BUILTIN
=20
 config MTD_NAND_CM_X270
 	tristate "Support for NAND Flash on CM-X270 modules"
-	depends on MTD_NAND && MACH_ARMCORE
+	depends on MACH_ARMCORE
=20
 config MTD_NAND_PASEMI
 	tristate "NAND support for PA Semi PWRficient"
-	depends on MTD_NAND && PPC_PASEMI
+	depends on PPC_PASEMI
 	help
 	  Enables support for NAND Flash interface on PA Semi PWRficient
 	  based boards
=20
 config MTD_NAND_TMIO
 	tristate "NAND Flash device on Toshiba Mobile IO Controller"
-	depends on MTD_NAND && MFD_TMIO
+	depends on MFD_TMIO
 	help
 	  Support for NAND flash connected to a Toshiba Mobile IO
 	  Controller in some PDAs, including the Sharp SL6000x.
@@ -434,7 +433,6 @@ config MTD_NAND_NANDSIM
=20
 config MTD_NAND_PLATFORM
 	tristate "Support for generic platform NAND driver"
-	depends on MTD_NAND
 	help
 	  This implements a generic NAND driver for on-SOC platform
 	  devices. You will need to provide platform-specific functions
@@ -442,14 +440,14 @@ config MTD_NAND_PLATFORM
=20
 config MTD_ALAUDA
 	tristate "MTD driver for Olympus MAUSB-10 and Fujifilm DPC-R1"
-	depends on MTD_NAND && USB
+	depends on USB
 	help
 	  These two (and possibly other) Alauda-based cardreaders for
 	  SmartMedia and xD allow raw flash access.
=20
 config MTD_NAND_ORION
 	tristate "NAND Flash support for Marvell Orion SoC"
-	depends on PLAT_ORION && MTD_NAND
+	depends on PLAT_ORION
 	help
 	  This enables the NAND flash controller on Orion machines.
=20
@@ -458,7 +456,7 @@ config MTD_NAND_ORION
=20
 config MTD_NAND_FSL_ELBC
 	tristate "NAND support for Freescale eLBC controllers"
-	depends on MTD_NAND && PPC_OF
+	depends on PPC_OF
 	help
 	  Various Freescale chips, including the 8313, include a NAND Flash
 	  Controller Module with built-in hardware ECC capabilities.
@@ -467,7 +465,7 @@ config MTD_NAND_FSL_ELBC
=20
 config MTD_NAND_FSL_UPM
 	tristate "Support for NAND on Freescale UPM"
-	depends on MTD_NAND && (PPC_83xx || PPC_85xx)
+	depends on PPC_83xx || PPC_85xx
 	select FSL_LBC
 	help
 	  Enables support for NAND Flash chips wired onto Freescale PowerPC
@@ -495,7 +493,7 @@ config MTD_NAND_NOMADIK
=20
 config MTD_NAND_SH_FLCTL
 	tristate "Support for NAND on Renesas SuperH FLCTL"
-	depends on MTD_NAND && (SUPERH || ARCH_SHMOBILE)
+	depends on SUPERH || ARCH_SHMOBILE
 	help
 	  Several Renesas SuperH CPU has FLCTL. This option enables support
 	  for NAND Flash using FLCTL.
@@ -515,7 +513,7 @@ config MTD_NAND_TXX9NDFMC
=20
 config MTD_NAND_SOCRATES
 	tristate "Support for NAND on Socrates board"
-	depends on MTD_NAND && SOCRATES
+	depends on SOCRATES
 	help
 	  Enables support for NAND Flash chips wired onto Socrates board.
=20
diff --git a/drivers/mtd/onenand/Kconfig b/drivers/mtd/onenand/Kconfig
index 9a49d68..3f32289 100644
--- a/drivers/mtd/onenand/Kconfig
+++ b/drivers/mtd/onenand/Kconfig
@@ -25,14 +25,14 @@ config MTD_ONENAND_GENERIC
=20
 config MTD_ONENAND_OMAP2
 	tristate "OneNAND on OMAP2/OMAP3 support"
-	depends on MTD_ONENAND && (ARCH_OMAP2 || ARCH_OMAP3)
+	depends on ARCH_OMAP2 || ARCH_OMAP3
 	help
 	  Support for a OneNAND flash device connected to an OMAP2/OMAP3 CPU
 	  via the GPMC memory controller.
=20
 config MTD_ONENAND_SAMSUNG
         tristate "OneNAND on Samsung SOC controller support"
-        depends on MTD_ONENAND && (ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5=
PV210)
+        depends on ARCH_S3C64XX || ARCH_S5PC100 || ARCH_S5PV210
         help
           Support for a OneNAND flash device connected to an Samsung SOC
           S3C64XX/S5PC1XX controller.
--=20
1.5.6.5


--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.9 (GNU/Linux)

iEYEARECAAYFAkwOSiYACgkQ7ECsBhUMPvB7XwCfdj+UkwiBSiHuFF/uaaqKoRUi
BNgAn0vx3GGpfZE+9Tv6YQg4T4huQybr
=5rnH
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
