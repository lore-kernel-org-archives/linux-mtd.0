Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXEZM-0004Ar-9f
 for linux-mtd@lists.infradead.org; Fri, 18 Oct 2013 18:14:40 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2] mtd: nand: pxa3xx: Fix registered MTD name
Date: Fri, 18 Oct 2013 15:14:32 -0300
Message-Id: <1382120072-30057-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In a recent commit:

  commit f455578dd961087a5cf94730d9f6489bb1d355f0
  Author: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
  Date:   Mon Aug 12 14:14:53 2013 -0300

  mtd: nand: pxa3xx: Remove hardcoded mtd name

  There's no advantage in using a hardcoded name for the mtd device.
  Instead use the provided by the platform_device.

The MTD name was changed to use the one provided by the platform_device.
However, this can be problematic as some users want to set partitions
using the kernel parameter 'mtdpart', where the name is needed.

Therefore, to avoid regressions in users relying in 'mtdpart' we revert
the change and use the previous one 'pxa3xx_nand-0'.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
v1->v2:
  * Use exactly the same name as before, and avoid regressions
    instead of using any seemingly better or cleaner one.

 drivers/mtd/nand/pxa3xx_nand.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index aa75adf..4d53e8e 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -46,6 +46,8 @@
  */
 #define INIT_BUFFER_SIZE	256
 
+#define DRIVER_NAME		"pxa3xx_nand-0"
+
 /* registers and bit definitions */
 #define NDCR		(0x00) /* Control register */
 #define NDTR0CS0	(0x04) /* Timing Parameter 0 for CS0 */
@@ -1339,7 +1341,7 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		struct mtd_info *mtd = info->host[cs]->mtd;
 
-		mtd->name = pdev->name;
+		mtd->name = DRIVER_NAME;
 		info->cs = cs;
 		ret = pxa3xx_nand_scan(mtd);
 		if (ret) {
@@ -1425,7 +1427,7 @@ static int pxa3xx_nand_resume(struct platform_device *pdev)
 
 static struct platform_driver pxa3xx_nand_driver = {
 	.driver = {
-		.name	= "pxa3xx-nand",
+		.name	= DRIVER_NAME,
 		.of_match_table = pxa3xx_nand_dt_ids,
 	},
 	.probe		= pxa3xx_nand_probe,
-- 
1.8.1.5
