Received: from mail-by2on0127.outbound.protection.outlook.com
 ([207.46.100.127] helo=na01-by2-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aC3l0-0002ox-8A
 for linux-mtd@lists.infradead.org; Thu, 24 Dec 2015 11:08:31 +0000
From: Yuan Yao <yao.yuan@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <han.xu@freescale.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <yao.yuan@nxp.com>
Subject: [PATCH v2 3/4] mtd: spi-nor: fsl-quadspi: add support for layerscape
Date: Thu, 24 Dec 2015 19:00:20 +0800
Message-ID: <1450954821-7483-3-git-send-email-yao.yuan@freescale.com>
In-Reply-To: <1450954821-7483-1-git-send-email-yao.yuan@freescale.com>
References: <1450954821-7483-1-git-send-email-yao.yuan@freescale.com>
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

LS1043a and LS2080A in the Layerscape family also support Freescale Quad
SPI, make Quad SPI selectable for these hardwares.

Signed-off-by: Yuan Yao <yao.yuan@nxp.com>
---
Changed in v2:
Update my email to <yao.yuan@nxp.com>
---
 drivers/mtd/spi-nor/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index a28c278..6b53deb 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -30,7 +30,7 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
-	depends on ARCH_MXC || SOC_LS1021A || COMPILE_TEST
+	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
-- 
2.1.0.27.g96db324
