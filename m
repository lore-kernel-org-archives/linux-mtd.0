Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPUDT-0002nY-2X
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 11:29:09 +0000
Received: by ykdz80 with SMTP id z80so10934294ykd.2
 for <linux-mtd@lists.infradead.org>; Wed, 12 Aug 2015 04:28:45 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: han.xu@freescale.com
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org,
 Fabio Estevam <fabio.estevam@freescale.com>
Subject: [PATCH] spi-nor: Kconfig: Remove unneeded help message
Date: Wed, 12 Aug 2015 08:28:19 -0300
Message-Id: <1439378899-5660-1-git-send-email-festevam@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Fabio Estevam <fabio.estevam@freescale.com>

The "We only connect the NOR to this controller now" phrase
is not really useful for a Kconfig help text, so remove it.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
 drivers/mtd/spi-nor/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 64a4f0e..baa8442 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -26,6 +26,5 @@ config SPI_FSL_QUADSPI
 	depends on ARCH_MXC
 	help
 	  This enables support for the Quad SPI controller in master mode.
-	  We only connect the NOR to this controller now.
 
 endif # MTD_SPI_NOR
-- 
1.9.1
