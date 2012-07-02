Received: from mail-yw0-f43.google.com ([209.85.213.43])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Slofa-0003fr-7j
 for linux-mtd@lists.infradead.org; Mon, 02 Jul 2012 22:00:35 +0000
Received: by yhl10 with SMTP id 10so627328yhl.16
 for <linux-mtd@lists.infradead.org>; Mon, 02 Jul 2012 15:00:30 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: dwmw2@infradead.org
Subject: [PATCH] mtd: mxc_nand: Select the driver via ARCH_MXC
Date: Mon,  2 Jul 2012 19:00:19 -0300
Message-Id: <1341266419-21321-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 artem.bityutskiy@linux.intel.com, shawn.guo@linaro.org,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

With device tree support in place, we should not use IMX_HAVE_PLATFORM_MXC_NAND
as a dependency for selecting the mxc_nand driver.

Use ARCH_MXC symbol instead, so that the driver can be even selected when a single device-tree
machine is selected.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index de69978..d2a0db1 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -521,7 +521,7 @@ config MTD_NAND_MPC5121_NFC
 
 config MTD_NAND_MXC
 	tristate "MXC NAND support"
-	depends on IMX_HAVE_PLATFORM_MXC_NAND
+	depends on ARCH_MXC
 	help
 	  This enables the driver for the NAND flash controller on the
 	  MXC processors.
-- 
1.7.1
