Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by casper.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VXdwP-0002Nj-CY
 for linux-mtd@lists.infradead.org; Sat, 19 Oct 2013 21:20:09 +0000
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: <linux-mtd@lists.infradead.org>, Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH v3] mtd: nand: pxa3xx: Fix registered MTD name
Date: Sat, 19 Oct 2013 18:19:25 -0300
Message-Id: <1382217565-11312-1-git-send-email-ezequiel.garcia@free-electrons.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Daniel Mack <zonque@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
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
using the kernel parameter 'mtdparts', where the name is needed.

Therefore, to avoid regressions in users relying in 'mtdparts' we revert
the change and use the previous one 'pxa3xx_nand-0'.

While at it, let's put a big comment and prevent this change from happening
ever again.

Signed-off-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
---
v2->v3:
  * Limit the name change to mtd->name. This means that driver's name
    and the mtd->name will be different. We do this because:
    1. We want to read a simpler 'pxa3xx-nand' driver name in
       kernel messages and other kernel reports.
    2. We're forced to use the silly name 'pxa3xx_nand-0' for backwards
       compatibility.

v1->v2:
  * Use exactly the same name as before, and avoid regressions
    instead of using any seemingly better or cleaner one.

 drivers/mtd/nand/pxa3xx_nand.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index cbc7240..bae1573 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1749,7 +1749,12 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 	for (cs = 0; cs < pdata->num_cs; cs++) {
 		struct mtd_info *mtd = info->host[cs]->mtd;
 
-		mtd->name = pdev->name;
+		/*
+		 * The mtd name matches the one used in 'mtdparts' kernel
+		 * parameter. This name cannot be changed or otherwise
+		 * user's mtd partitions configuration would get broken.
+		 */
+		mtd->name = "pxa3xx_nand-0";
 		info->cs = cs;
 		ret = pxa3xx_nand_scan(mtd);
 		if (ret) {
-- 
1.8.1.5
