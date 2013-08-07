From: Josh Wu <josh.wu@atmel.com>
To: <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <dedekind1@gmail.com>
Subject: [PATCH] mtd: atmel_nand: fix the warning when CONFIG_OF is not defined
Date: Wed, 7 Aug 2013 11:36:09 +0800
Message-ID: <1375846569-9499-1-git-send-email-josh.wu@atmel.com>
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

This patch fix following warning:

drivers/mtd/nand/atmel_nand.c:2007: warning: 'atmel_nand_nfc_match' defined but not used

This patch add '#if defined(CONFIG_OF)' block to guard around the definition of
atmel_nand_nfc_match, in order to avoid the warning when kernel is configurated
as non-dt supported.

Signed-off-by: Josh Wu <josh.wu@atmel.com>
---
 drivers/mtd/nand/atmel_nand.c |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/mtd/nand/atmel_nand.c b/drivers/mtd/nand/atmel_nand.c
index 65b302c..ddcd575 100644
--- a/drivers/mtd/nand/atmel_nand.c
+++ b/drivers/mtd/nand/atmel_nand.c
@@ -2251,10 +2251,12 @@ static int atmel_nand_nfc_probe(struct platform_device *pdev)
 	return 0;
 }
 
+#if defined(CONFIG_OF)
 static struct of_device_id atmel_nand_nfc_match[] = {
 	{ .compatible = "atmel,sama5d3-nfc" },
 	{ /* sentinel */ }
 };
+#endif
 
 static struct platform_driver atmel_nand_nfc_driver = {
 	.driver = {
-- 
1.7.9.5
