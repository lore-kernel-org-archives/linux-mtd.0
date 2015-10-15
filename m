From: Antoine Tenart <antoine.tenart@free-electrons.com>
To: sebastian.hesselbarth@gmail.com, ezequiel.garcia@free-electrons.com,
 dwmw2@infradead.org, computersforpeace@gmail.com
Cc: Antoine Tenart <antoine.tenart@free-electrons.com>, zmxu@marvell.com,
 jszhang@marvell.com, linux-arm-kernel@lists.infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] mtd: nand: allow compile test of MTD_NAND_PXA3xx
Date: Thu, 15 Oct 2015 09:17:28 +0200
Message-Id: <1444893451-16610-2-git-send-email-antoine.tenart@free-electrons.com>
In-Reply-To: <1444893451-16610-1-git-send-email-antoine.tenart@free-electrons.com>
References: <1444893451-16610-1-git-send-email-antoine.tenart@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Allow compile test of the MTD_NAND_PXA3xx nand driver.

Signed-off-by: Antoine Tenart <antoine.tenart@free-electrons.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 3324281d1f53..0d3b7c442928 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -329,7 +329,7 @@ config MTD_NAND_ATMEL
 
 config MTD_NAND_PXA3xx
 	tristate "NAND support on PXA3xx and Armada 370/XP"
-	depends on PXA3xx || ARCH_MMP || PLAT_ORION
+	depends on PXA3xx || ARCH_MMP || PLAT_ORION || COMPILE_TEST
 	help
 	  This enables the driver for the NAND flash device found on
 	  PXA3xx processors (NFCv1) and also on Armada 370/XP (NFCv2).
-- 
2.6.1
