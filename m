From: Roland Stigge <stigge@antcom.de>
To: dedekind1@gmail.com, linux-mtd@lists.infradead.org, aletes.xgr@gmail.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 devicetree-discuss@lists.ozlabs.org, dwmw2@infradead.org,
 kevin.wells@nxp.com, srinivas.bakki@nxp.com,
 linux-arm-kernel@lists.infradead.org, hechtb@googlemail.com,
 lars@metafoo.de, b32955@freescale.com, leiwen@marvell.com,
 linux@arm.linux.org.uk
Subject: [PATCH 1/4] mtd: lpc32xx_slc: Select AMBA_PL08X in Kconfig
Date: Wed, 27 Jun 2012 17:51:12 +0200
Message-Id: <1340812275-1197-1-git-send-email-stigge@antcom.de>
Cc: Roland Stigge <stigge@antcom.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Alexandre Pereira da Silva <aletes.xgr@gmail.com>

Since this driver depends on the amba pl08x dma driver, select it in Kconfig.

Signed-off-by: Alexandre Pereira da Silva <aletes.xgr@gmail.com>
Signed-off-by: Roland Stigge <stigge@antcom.de>
---
 drivers/mtd/nand/Kconfig |    1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index de69978..a9e8b73 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -417,6 +417,7 @@ config MTD_NAND_PXA3xx
 config MTD_NAND_SLC_LPC32XX
 	tristate "NXP LPC32xx SLC Controller"
 	depends on ARCH_LPC32XX
+	select AMBA_PL08X
 	help
 	  Enables support for NXP's LPC32XX SLC (i.e. for Single Level Cell
 	  chips) NAND controller. This is the default for the PHYTEC 3250
-- 
1.7.10.4
