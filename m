From: Alison Wang <b18965@freescale.com>
To: <cyrille.pitchen@atmel.com>, <marek.vasut@gmail.com>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>,
 <boris.brezillon@free-electrons.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
CC: <alison.wang@nxp.com>
Subject: [PATCH] mtd: nand: Update dependency of IFC for LS1021A
Date: Thu, 29 Dec 2016 08:58:22 +0800
Message-ID: <1482973102-47659-1-git-send-email-b18965@freescale.com>
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

As NAND support for Freescale/NXP IFC controller is available on
LS1021A, the dependency for LS1021A is added.

Signed-off-by: Alison Wang <alison.wang@nxp.com>
---
 drivers/mtd/nand/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
index 353a9dd..85e3860 100644
--- a/drivers/mtd/nand/Kconfig
+++ b/drivers/mtd/nand/Kconfig
@@ -441,7 +441,7 @@ config MTD_NAND_FSL_ELBC
 
 config MTD_NAND_FSL_IFC
 	tristate "NAND support for Freescale IFC controller"
-	depends on FSL_SOC || ARCH_LAYERSCAPE
+	depends on FSL_SOC || ARCH_LAYERSCAPE || SOC_LS1021A
 	select FSL_IFC
 	select MEMORY
 	help
-- 
2.1.0.27.g96db324
