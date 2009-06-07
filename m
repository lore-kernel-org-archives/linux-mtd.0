Received: from fg-out-1718.google.com ([72.14.220.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MDI31-0004C1-7y
	for linux-mtd@lists.infradead.org; Sun, 07 Jun 2009 13:04:40 +0000
Received: by fg-out-1718.google.com with SMTP id e21so907254fga.3
	for <linux-mtd@lists.infradead.org>;
	Sun, 07 Jun 2009 06:04:25 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: ben-linux@fluff.org, David.Woodhouse@intel.com,
	linux-mtd@lists.infradead.org, linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH] mtd/nand: s3c6400 support for s3c2410 driver
Date: Sun,  7 Jun 2009 15:04:23 +0200
Message-Id: <1244379863-23581-2-git-send-email-jacmet@sunsite.dk>
In-Reply-To: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
References: <1244379863-23581-1-git-send-email-jacmet@sunsite.dk>
Cc: wookey@wookware.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Add s3c6400 support to the s3c2410 driver. The nand controller in
the s3c64xx devices is compatible with the one in the s3c2412, so
simply reuse that code.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 drivers/mtd/nand/Kconfig   |   18 +++++++++---------
 drivers/mtd/nand/s3c2410.c |    3 +++
 2 files changed, 12 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 890936d..4d63d7b 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -139,27 +139,27 @@ config MTD_NAND_PPCHAMELEONEVB
 	  This enables the NAND flash driver on the PPChameleon EVB Board.
 
 config MTD_NAND_S3C2410
-	tristate "NAND Flash support for S3C2410/S3C2440 SoC"
-	depends on ARCH_S3C2410
+	tristate "NAND Flash support for Samsung S3C SoCs"
+	depends on ARCH_S3C2410 || ARCH_S3C64XX
 	help
-	  This enables the NAND flash controller on the S3C2410 and S3C2440
+	  This enables the NAND flash controller on the S3C24xx and S3C64xx
 	  SoCs
 
 	  No board specific support is done by this driver, each board
 	  must advertise a platform_device for the driver to attach.
 
 config MTD_NAND_S3C2410_DEBUG
-	bool "S3C2410 NAND driver debug"
+	bool "Samsung S3C NAND driver debug"
 	depends on MTD_NAND_S3C2410
 	help
-	  Enable debugging of the S3C2410 NAND driver
+	  Enable debugging of the S3C NAND driver
 
 config MTD_NAND_S3C2410_HWECC
-	bool "S3C2410 NAND Hardware ECC"
+	bool "Samsung S3C NAND Hardware ECC"
 	depends on MTD_NAND_S3C2410
 	help
-	  Enable the use of the S3C2410's internal ECC generator when
-	  using NAND. Early versions of the chip have had problems with
+	  Enable the use of the controller's internal ECC generator when
+	  using NAND. Early versions of the chips have had problems with
 	  incorrect ECC generation, and if using these, the default of
 	  software ECC is preferable.
 
@@ -171,7 +171,7 @@ config MTD_NAND_NDFC
 	 NDFC Nand Flash Controllers are integrated in IBM/AMCC's 4xx SoCs
 
 config MTD_NAND_S3C2410_CLKSTOP
-	bool "S3C2410 NAND IDLE clock stop"
+	bool "Samsung S3C NAND IDLE clock stop"
 	depends on MTD_NAND_S3C2410
 	default n
 	help
diff --git a/drivers/mtd/nand/s3c2410.c b/drivers/mtd/nand/s3c2410.c
index 01a105e..11dc7e6 100644
--- a/drivers/mtd/nand/s3c2410.c
+++ b/drivers/mtd/nand/s3c2410.c
@@ -1111,6 +1111,9 @@ static struct platform_device_id s3c24xx_driver_ids[] = {
 	}, {
 		.name		= "s3c2412-nand",
 		.driver_data	= TYPE_S3C2412,
+	}, {
+		.name		= "s3c6400-nand",
+		.driver_data	= TYPE_S3C2412, /* compatible with 2412 */
 	},
 	{ }
 };
-- 
1.6.2
