Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SvFVx-00018q-8F
 for linux-mtd@lists.infradead.org; Sat, 28 Jul 2012 22:29:47 +0000
Received: by yhjj52 with SMTP id j52so4206735yhj.36
 for <linux-mtd@lists.infradead.org>; Sat, 28 Jul 2012 15:29:35 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Artem.Bityutskiy@linux.intel.com
Subject: [PATCH] nand: Kconfig: Allow MTD_NAND_GPMI_NAND to be built as module
Date: Sat, 28 Jul 2012 19:29:24 -0300
Message-Id: <1343514565-8983-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, b32955@freescale.com,
 linux-mtd@lists.infradead.org, marex.vasut@denx.de, kernel@pengutronix.de,
 shawn.guo@linaro.org, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

Allow MTD_NAND_GPMI_NAND to be built as module.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f4e81a7..533eee7 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -461,7 +461,7 @@ config MTD_NAND_NANDSIM
 	  MTD nand layer.
 
 config MTD_NAND_GPMI_NAND
-        bool "GPMI NAND Flash Controller driver"
+        tristate "GPMI NAND Flash Controller driver"
         depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q)
         help
 	 Enables NAND Flash support for IMX23 or IMX28.
-- 
1.7.1
