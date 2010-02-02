Message-Id: <201002022212.o12MC2HT017477@imap1.linux-foundation.org>
Subject: [patch for 2.6.33? 1/1] mtd/nand: fix build failure caused by typo
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 02 Feb 2010 14:12:02 -0800
Cc: hsweeten@visionengravers.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, peterhuewe@gmx.de,
	u.kleine-koenig@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Peter Huewe <peterhuewe@gmx.de>

Fix a build failure introduced by the patch

    mtd: orion_nand.c: add error handling and use resource_size()

The patch assigns something to a undeclared variable 'err', whereas the
rest of the code uses 'ret' for this task.

Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
Reviewed-by: H Hartley Sweeten <hsweeten@visionengravers.com>
Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/orion_nand.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN drivers/mtd/nand/orion_nand.c~mtd-nand-fix-build-failure-caused-by-typo drivers/mtd/nand/orion_nand.c
--- a/drivers/mtd/nand/orion_nand.c~mtd-nand-fix-build-failure-caused-by-typo
+++ a/drivers/mtd/nand/orion_nand.c
@@ -92,7 +92,7 @@ static int __init orion_nand_probe(struc
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!res) {
-		err = -ENODEV;
+		ret = -ENODEV;
 		goto no_res;
 	}
 
_
