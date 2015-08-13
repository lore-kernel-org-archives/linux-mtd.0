Received: from mail-bn1on0140.outbound.protection.outlook.com
 ([157.56.110.140] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPvtz-00036D-1B
 for linux-mtd@lists.infradead.org; Thu, 13 Aug 2015 17:02:51 +0000
From: Fabio Estevam <fabio.estevam@freescale.com>
To: <computersforpeace@gmail.com>
CC: <linux-mtd@lists.infradead.org>, <han.xu@freescale.com>,
 <shijie8@gmail.com>, <Frank.Li@freescale.com>, Fabio Estevam
 <fabio.estevam@freescale.com>
Subject: [PATCH v2] spi-nor: Kconfig: Improve help text for SPI_FSL_QUADSPI
Date: Thu, 13 Aug 2015 14:02:05 -0300
Message-ID: <1439485325-22977-1-git-send-email-fabio.estevam@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The current "We only connect the NOR to this controller now." text
is not very clear, so explain it better by saying that generic SPI
is not supported by SPI_FSL_QUADSPI and only SPI NOR is.

Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>
---
Changes since v1:
- Explain that generic SPI is not supported and only SPI NOR is as
suggested by Frank Li

 drivers/mtd/spi-nor/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 64a4f0e..2353431 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -26,6 +26,7 @@ config SPI_FSL_QUADSPI
 	depends on ARCH_MXC
 	help
 	  This enables support for the Quad SPI controller in master mode.
-	  We only connect the NOR to this controller now.
+	  This controller does not support generic SPI. It only supports
+	  SPI NOR.
 
 endif # MTD_SPI_NOR
-- 
1.9.1
