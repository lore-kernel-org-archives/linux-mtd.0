From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH] mtd: atmel_nand: don't map the ROM table if no pmecc table
 offset in DT
Date: Thu, 2 Apr 2015 14:13:47 +0800
Message-ID: <1427955227-8927-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Josh Wu <josh.wu@atmel.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

if atmel,pmecc-lookup-table-offset is not found in DT node, we don't
need to map the ROM table as we will build a runtime gf table anyway.

Reported-by: Nicolas Ferre <nicolas.ferre@atmel.com>
Signed-off-by: Josh Wu <josh.wu@atmel.com>
---

 drivers/mtd/nand/atmel_nand.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 0361c19..46010bd 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -1204,14 +1204,14 @@ static int atmel_pmecc_nand_init_params(struct platform_device *pdev,
 		goto err;
 	}
 
-	regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
-	host->pmecc_rom_base = devm_ioremap_resource(&pdev->dev, regs_rom);
-	if (IS_ERR(host->pmecc_rom_base)) {
-		if (!host->has_no_lookup_table)
-			/* Don't display the information again */
+	if (!host->has_no_lookup_table) {
+		regs_rom = platform_get_resource(pdev, IORESOURCE_MEM, 3);
+		host->pmecc_rom_base = devm_ioremap_resource(&pdev->dev,
+								regs_rom);
+		if (IS_ERR(host->pmecc_rom_base)) {
 			dev_err(host->dev, "Can not get I/O resource for ROM, will build a lookup table in runtime!\n");
-
-		host->has_no_lookup_table = true;
+			host->has_no_lookup_table = true;
+		}
 	}
 
 	if (host->has_no_lookup_table) {
-- 
1.9.1
