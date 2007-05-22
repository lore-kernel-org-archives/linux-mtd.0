Received: from mo-p07-ob.rzone.de ([81.169.146.189])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HqQam-0007xU-6z
	for linux-mtd@lists.infradead.org; Tue, 22 May 2007 05:23:49 -0400
Received: from ubuntu (achn-4db4ad4e.pool.einsundeins.de [77.180.173.78])
	by post.webmailer.de (klopstock mo43) (RZmta 6.5)
	with ESMTP id D04749j4M8IIK3 for <linux-mtd@lists.infradead.org>;
	Tue, 22 May 2007 11:23:41 +0200 (MEST)
From: Stefan Roese <ml@stefan-roese.de>
To: linux-mtd@lists.infradead.org
Subject: [PATCH] nand: Change NDFC driver to support 405 platforms too
Date: Tue, 22 May 2007 11:23:45 +0200
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200705221123.45953.ml@stefan-roese.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] nand: Change NDFC driver to support 405 platforms too

This patch adds 405 platform support to the 440 NDFC driver. The new
AMCC 405EZ PPC is equipped with the same NDFC core as the 440EP(x)
and other will follow soon.

Signed-off-by: Stefan Roese <sr@denx.de>

---
commit 5e3b364a50f6eb6b72e438f53cb168ffe738f01d
tree afc35284cb993ff8f192db857a20b91b167ed08d
parent 3f7d2457484763a4cdae4c2f94949cd94c37cd78
author Stefan Roese <sr@denx.de> Tue, 22 May 2007 11:20:15 +0200
committer Stefan Roese <sr@denx.de> Tue, 22 May 2007 11:20:15 +0200

 drivers/mtd/nand/Kconfig |    4 ++--
 drivers/mtd/nand/ndfc.c  |    8 ++++++++
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 1f7ac54..3c91b64 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -128,10 +128,10 @@ config MTD_NAND_S3C2410_HWECC
 
 config MTD_NAND_NDFC
 	tristate "NDFC NanD Flash Controller"
-	depends on MTD_NAND && 44x
+	depends on MTD_NAND && 4xx
 	select MTD_NAND_ECC_SMC
 	help
-	 NDFC Nand Flash Controllers are integrated in EP44x SoCs
+	 NDFC Nand Flash Controllers are integrated in IBM/AMCC's 4xx SoCs
 
 config MTD_NAND_TQM8272
 	tristate "NAND Flash support on TQ TQM8272 Board."
diff --git a/drivers/mtd/nand/ndfc.c b/drivers/mtd/nand/ndfc.c
index fd7a8d5..1c0e89f 100644
--- a/drivers/mtd/nand/ndfc.c
+++ b/drivers/mtd/nand/ndfc.c
@@ -24,7 +24,11 @@
 #include <linux/platform_device.h>
 
 #include <asm/io.h>
+#ifdef CONFIG_40x
+#include <asm/ibm405.h>
+#else
 #include <asm/ibm44x.h>
+#endif
 
 struct ndfc_nand_mtd {
 	struct mtd_info			mtd;
@@ -230,7 +234,11 @@ static int ndfc_nand_probe(struct platform_device *pdev)
 	struct ndfc_controller *ndfc = &ndfc_ctrl;
 	unsigned long long phys = settings->ndfc_erpn | res->start;
 
+#ifndef CONFIG_PHYS_64BIT
+	ndfc->ndfcbase = ioremap((phys_addr_t)phys, res->end - res->start + 1);
+#else
 	ndfc->ndfcbase = ioremap64(phys, res->end - res->start + 1);
+#endif
 	if (!ndfc->ndfcbase) {
 		printk(KERN_ERR "NDFC: ioremap failed\n");
 		return -EIO;
