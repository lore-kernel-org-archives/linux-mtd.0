Received: from mail-yw0-f49.google.com ([209.85.213.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Sthlj-0002AH-Ga
 for linux-mtd@lists.infradead.org; Tue, 24 Jul 2012 16:15:34 +0000
Received: by yhjj52 with SMTP id j52so7294006yhj.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jul 2012 09:15:26 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: Artem.Bityutskiy@linux.intel.com
Subject: [PATCH 1/2] mtd: nand: Include IMX6 in the list of supported SoCs
Date: Tue, 24 Jul 2012 13:15:15 -0300
Message-Id: <1343146515-18578-2-git-send-email-festevam@gmail.com>
In-Reply-To: <1343146515-18578-1-git-send-email-festevam@gmail.com>
References: <1343146515-18578-1-git-send-email-festevam@gmail.com>
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

Include IMX6 in the list of supported SoCs.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/nand/Kconfig |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index f4e81a7..b40e172 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -464,7 +464,7 @@ config MTD_NAND_GPMI_NAND
         bool "GPMI NAND Flash Controller driver"
         depends on MTD_NAND && (SOC_IMX23 || SOC_IMX28 || SOC_IMX6Q)
         help
-	 Enables NAND Flash support for IMX23 or IMX28.
+	 Enables NAND Flash support for IMX23, IMX28 or IMX6.
 	 The GPMI controller is very powerful, with the help of BCH
 	 module, it can do the hardware ECC. The GPMI supports several
 	 NAND flashs at the same time. The GPMI may conflicts with other
-- 
1.7.1
