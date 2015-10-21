Received: from bh-25.webhostbox.net ([208.91.199.152])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZouR2-0007oE-4P
 for linux-mtd@lists.infradead.org; Wed, 21 Oct 2015 14:32:13 +0000
From: Guenter Roeck <linux@roeck-us.net>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH -next] mtd: fsl-quadspi: Never build on SPARC
Date: Wed, 21 Oct 2015 07:31:46 -0700
Message-Id: <1445437906-23633-1-git-send-email-linux@roeck-us.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Attempts to build fsl-quadspi on SPARC fail with

drivers/mtd/spi-nor/fsl-quadspi.c: In function 'fsl_qspi_init_lut':
drivers/mtd/spi-nor/fsl-quadspi.c:369:1: error:
	'LUT_0' undeclared (first use in this function)
drivers/mtd/spi-nor/fsl-quadspi.c:418:1: error:
	pasting "LUT_" and "(" does not give a valid preprocessing token
drivers/mtd/spi-nor/fsl-quadspi.c:418:2: error:
	implicit declaration of function 'LUT_'

Never build it on SPARC, even if COMPILE_TEST is enabled.

Fixes: d26a22d06708 ("mtd: fsl-quadspi: allow building for other ARCHes
	with COMPILE_TEST")
Cc: Brian Norris <computersforpeace@gmail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/mtd/spi-nor/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index 2fe2a7e90fa9..fceb2886bfd1 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -23,7 +23,7 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
-	depends on ARCH_MXC || COMPILE_TEST
+	depends on ARCH_MXC || (COMPILE_TEST && !SPARC)
 	depends on HAS_IOMEM
 	help
 	  This enables support for the Quad SPI controller in master mode.
-- 
2.1.4
