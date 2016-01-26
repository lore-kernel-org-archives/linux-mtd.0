From: Yuan Yao <yao.yuan@freescale.com>
To: <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <han.xu@freescale.com>
CC: <robh@kernel.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <yao.yuan@nxp.com>
Subject: [PATCH v4 3/7] mtd: spi-nor: fsl-quadspi: add support for layerscape
Date: Tue, 26 Jan 2016 15:23:57 +0800
Message-ID: <1453793041-35868-3-git-send-email-yao.yuan@freescale.com>
In-Reply-To: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
References: <1453793041-35868-1-git-send-email-yao.yuan@freescale.com>
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
Changed in v4:
No changes.

Changed in v3:
No changes.

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
