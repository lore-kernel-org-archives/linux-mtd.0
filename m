From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: [PATCH] mtd: atmel_nand: move the sanity check to the beginning of
 pmecc_enable()
Date: Wed, 7 Aug 2013 17:58:11 +0800
Message-ID: <1375869491-25137-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: nicolas.ferre@atmel.com, computersforpeace@gmail.com, plagnioj@jcrosoft.com,
 Josh Wu <josh.wu@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It is better to do the sanity check for the parameter before any hardware
operation.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 1ffa52f..0e365da 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -905,15 +905,15 @@ static void pmecc_enable(struct atmel_nand_host *host, int ecc_op)
 {
 	u32 val;
 
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_RST);
-	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DISABLE);
-	val = pmecc_readl_relaxed(host->ecc, CFG);
-
 	if (ecc_op != NAND_ECC_READ && ecc_op != NAND_ECC_WRITE) {
 		dev_err(host->dev, "atmel_nand: wrong pmecc operation type!");
 		return;
 	}
 
+	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_RST);
+	pmecc_writel(host->ecc, CTRL, PMECC_CTRL_DISABLE);
+	val = pmecc_readl_relaxed(host->ecc, CFG);
+
 	if (ecc_op == NAND_ECC_READ)
 		pmecc_writel(host->ecc, CFG, (val & ~PMECC_CFG_WRITE_OP)
 			| PMECC_CFG_AUTO_ENABLE);
-- 
1.7.9.5
