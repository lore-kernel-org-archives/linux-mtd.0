Received: from mail-gg0-f177.google.com ([209.85.161.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sthle-00029w-F8
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2012 16:15:32 +0000
Received: by ggcs5 with SMTP id s5so7261468ggc.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jul 2012 09:15:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Artem.Bityutskiy@linux.intel.com
Subject: [PATCH 2/2] mtd: nand: Select MXS_DMA for MTD_NAND_GPMI_NAND
Date: Tue, 24 Jul 2012 13:15:14 -0300
Message-Id: <1343146515-18578-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org,
 shawn.guo@linaro.org, dwmw2@infradead.org, kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

MTD_NAND_GPMI_NAND driver needs MXS_DMA to be selected, otherwise the following error happens
for imx_v6_v7_defconfig:

drivers/built-in.o: In function `gpmi_dma_filter':
clk-fixed-factor.c:(.text+0xb124c): undefined reference to `mxs_dma_is_apbh'
make: *** [vmlinux] Error 1

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/Kconfig |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index b40e172..2062ee9 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -463,6 +463,7 @@ config MTD_NAND_NANDSIM
 config MTD_NAND_GPMI_NAND
         bool "GPMI NAND Flash Controller driver"
         depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q)
+	select MXS_DMA
         help
 	 Enables NAND Flash support for IMX23/28/6.
 	 The GPMI controller is very powerful, with the help of BCH
-- 
1.7.1
