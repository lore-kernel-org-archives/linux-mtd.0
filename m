Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fg5RX-0002Ch-RD
 for linux-mtd@lists.infradead.org; Thu, 19 Jul 2018 09:41:53 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Boris Brezillon <boris.brezillon@bootlin.com>,
 Richard Weinberger <richard@nod.at>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] mtd: rawnand: s3c2410: Error out when ->nrsets < 0 or ->sets
 == NULL
Date: Thu, 19 Jul 2018 11:41:37 +0200
Message-Id: <20180719094137.22893-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All of the code in the probe path assumes ->sets != NULL and
->nrsets > 0. Error out if that's not the case to avoid dereferencing a
NULL pointer.

Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
Hello,

I intentionally did not Cc stable because nobody complained so far.
Also didn't add a Fixes tag because it's hard to tell when people
started to dereferencing ->sets without checking its value.

Regards,

Boris
---
 drivers/mtd/nand/raw/s3c2410.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/s3c2410.c b/drivers/mtd/nand/raw/s3c2410.c
index 10d81f367d26..5a4a68790653 100644
--- a/drivers/mtd/nand/raw/s3c2410.c
+++ b/drivers/mtd/nand/raw/s3c2410.c
@@ -1134,8 +1134,13 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 
 	dev_dbg(&pdev->dev, "mapped registers at %p\n", info->regs);
 
-	sets = (plat != NULL) ? plat->sets : NULL;
-	nr_sets = (plat != NULL) ? plat->nr_sets : 1;
+	if (!plat->sets || plat->nr_sets < 1) {
+		err = -EINVAL;
+		goto exit_error;
+	}
+
+	sets = plat->sets;
+	nr_sets = plat->nr_sets;
 
 	info->mtd_count = nr_sets;
 
@@ -1152,7 +1157,7 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 
 	nmtd = info->mtds;
 
-	for (setno = 0; setno < nr_sets; setno++, nmtd++) {
+	for (setno = 0; setno < nr_sets; setno++, nmtd++, sets++) {
 		struct mtd_info *mtd = nand_to_mtd(&nmtd->chip);
 
 		pr_debug("initialising set %d (%p, info %p)\n",
@@ -1174,9 +1179,6 @@ static int s3c24xx_nand_probe(struct platform_device *pdev)
 			goto exit_error;
 
 		s3c2410_nand_add_partition(info, nmtd, sets);
-
-		if (sets != NULL)
-			sets++;
 	}
 
 	/* initialise the hardware */
-- 
2.14.1
