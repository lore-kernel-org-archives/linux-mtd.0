Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zljp0-0007Ap-Bn
 for linux-mtd@lists.infradead.org; Mon, 12 Oct 2015 20:35:50 +0000
Received: by pabrc13 with SMTP id rc13so27694146pab.0
 for <linux-mtd@lists.infradead.org>; Mon, 12 Oct 2015 13:35:30 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Cc: Han Xu <han.xu@freescale.com>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH 2/2] mtd: fsl-quadspi: allow building for other ARCHes with
 COMPILE_TEST
Date: Mon, 12 Oct 2015 13:35:16 -0700
Message-Id: <1444682116-4708-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1444682116-4708-1-git-send-email-computersforpeace@gmail.com>
References: <1444682116-4708-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This driver doesn't actually need ARCH_MXC to compile. Relax the
constraints.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Cc: Han Xu <han.xu@freescale.com>
---
 drivers/mtd/spi-nor/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 89bf4c1faa2b..2fe2a7e90fa9 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -23,7 +23,8 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
-	depends on ARCH_MXC
+	depends on ARCH_MXC || COMPILE_TEST
+	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
 	  This controller does not support generic SPI. It only supports
-- 
2.6.0.rc2.230.g3dd15c0
