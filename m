Received: from mail-out.m-online.net ([212.18.0.9])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K4BBI-00048Q-AK
	for linux-mtd@lists.infradead.org; Thu, 05 Jun 2008 08:50:48 +0000
Message-ID: <4847A8DA.6010406@grandegger.com>
Date: Thu, 05 Jun 2008 10:50:34 +0200
From: Wolfgang Grandegger <wg@grandegger.com>
MIME-Version: 1.0
To: linuxppc-dev@ozlabs.org
Subject: [PATCH v2] [NAND] driver extension to support NAND on TQM85xx modules
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Anton Vorontsov <avorontsov@ru.mvista.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[NAND] driver extension to support NAND on TQM85xx modules

This patch extends the FSL UPM NAND driver from Anton Vorontsov to
support NAND on the TQM85xx modules. Unfortunately, the hardware does
not support the R/B pins of the NAND chip and therefore the specified
maximum delay time must used. It therefore re-introduces the chip-delay
property.

Note: this patch is based on various patches from  Anton Vorontsov posted
      to this list:

      http://ozlabs.org/pipermail/linuxppc-dev/2008-April/055587.html.
      http://ozlabs.org/pipermail/linuxppc-dev/2008-May/057158.html
      http://ozlabs.org/pipermail/linuxppc-dev/2008-May/056531.html
      http://ozlabs.org/pipermail/linuxppc-dev/2008-June/057244.html

      They should show up mainstream soon.

Signed-off-by: Wolfgang Grandegger <wg@grandegger.com>
---
 Documentation/powerpc/booting-without-of.txt |    1 +
 drivers/mtd/nand/Kconfig                     |    2 +-
 drivers/mtd/nand/fsl_upm.c                   |   17 +++++++++++++----
 3 files changed, 15 insertions(+), 5 deletions(-)

Index: linux-2.6-galak/drivers/mtd/nand/Kconfig
===================================================================
--- linux-2.6-galak.orig/drivers/mtd/nand/Kconfig
+++ linux-2.6-galak/drivers/mtd/nand/Kconfig
@@ -380,7 +380,7 @@ config MTD_NAND_FSL_ELBC
 
 config MTD_NAND_FSL_UPM
 	tristate "Support for NAND on Freescale UPM"
-	depends on MTD_NAND && OF_GPIO && (PPC_83xx || PPC_85xx)
+	depends on MTD_NAND && (PPC_83xx || PPC_85xx)
 	select FSL_LBC
 	help
 	  Enables support for NAND Flash chips wired onto Freescale PowerPC
Index: linux-2.6-galak/drivers/mtd/nand/fsl_upm.c
===================================================================
--- linux-2.6-galak.orig/drivers/mtd/nand/fsl_upm.c
+++ linux-2.6-galak/drivers/mtd/nand/fsl_upm.c
@@ -13,6 +13,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/delay.h>
 #include <linux/mtd/nand.h>
 #include <linux/mtd/nand_ecc.h>
 #include <linux/mtd/partitions.h>
@@ -36,6 +37,7 @@ struct fsl_upm_nand {
 	uint8_t upm_cmd_offset;
 	void __iomem *io_base;
 	int rnb_gpio;
+	int chip_delay;
 };
 
 #define to_fsl_upm_nand(mtd) container_of(mtd, struct fsl_upm_nand, mtd)
@@ -58,10 +60,11 @@ static void fun_wait_rnb(struct fsl_upm_
 	if (fun->rnb_gpio >= 0) {
 		while (--cnt && !fun_chip_ready(&fun->mtd))
 			cpu_relax();
+		if (!cnt)
+			dev_err(fun->dev, "tired waiting for RNB\n");
+	} else {
+		ndelay(100);
 	}
-
-	if (!cnt)
-		dev_err(fun->dev, "tired waiting for RNB\n");
 }
 
 static void fun_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int ctrl)
@@ -129,7 +132,7 @@ static int __devinit fun_chip_init(struc
 	fun->chip.IO_ADDR_R = fun->io_base;
 	fun->chip.IO_ADDR_W = fun->io_base;
 	fun->chip.cmd_ctrl = fun_cmd_ctrl;
-	fun->chip.chip_delay = 50;
+	fun->chip.chip_delay = fun->chip_delay;
 	fun->chip.read_byte = fun_read_byte;
 	fun->chip.read_buf = fun_read_buf;
 	fun->chip.write_buf = fun_write_buf;
@@ -233,6 +236,12 @@ static int __devinit fun_probe(struct of
 		goto err2;
 	}
 
+	prop = of_get_property(ofdev->node, "chip-delay", NULL);
+	if (prop)
+		fun->chip_delay = *prop;
+	else
+		fun->chip_delay = 50;
+
 	fun->io_base = devm_ioremap_nocache(&ofdev->dev, io_res.start,
 					  io_res.end - io_res.start + 1);
 	if (!fun->io_base) {
Index: linux-2.6-galak/Documentation/powerpc/booting-without-of.txt
===================================================================
--- linux-2.6-galak.orig/Documentation/powerpc/booting-without-of.txt
+++ linux-2.6-galak/Documentation/powerpc/booting-without-of.txt
@@ -3007,6 +3007,7 @@ platforms are moved over to use the flat
       - reg : should specify localbus chip select and size used for the chip.
       - fsl,upm-addr-offset : UPM pattern offset for the address latch.
       - fsl,upm-cmd-offset : UPM pattern offset for the command latch.
+      - chip-delay : may specify a delay value in milliseconds.
       - gpios : may specify optional GPIO connected to the Ready-Not-Busy pin.
 
       Example:
