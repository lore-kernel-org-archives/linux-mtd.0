Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTE-0001Ql-3d
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:37:25 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so4898925wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:37:23 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 23/44] mtd: bcm_umi_nand.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:22 +0400
Message-Id: <1307453803-31950-24-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/bcm_umi_nand.c |   19 ++-----------------
 1 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/nand/bcm_umi_nand.c b/drivers/mtd/nand/bcm_umi_nand.c
index e0230c5..d98bc48 100644
--- a/drivers/mtd/nand/bcm_umi_nand.c
+++ b/drivers/mtd/nand/bcm_umi_nand.c
@@ -489,23 +489,8 @@ static int __devinit bcm_umi_nand_probe(struct platform_device *pdev)
 	}
 
 	/* Register the partitions */
-	{
-		int nr_partitions;
-		struct mtd_partition *partition_info;
-
-		board_mtd->name = "bcm_umi-nand";
-		nr_partitions = parse_mtd_partitions(board_mtd, NULL,
-						     &partition_info, 0);
-
-		if (nr_partitions <= 0) {
-			printk(KERN_ERR "BCM UMI NAND: Too few partitions - %d\n",
-			       nr_partitions);
-			iounmap(bcm_umi_io_base);
-			kfree(board_mtd);
-			return -EIO;
-		}
-		mtd_device_register(board_mtd, partition_info, nr_partitions);
-	}
+	board_mtd->name = "bcm_umi-nand";
+	mtd_device_parse_register(board_mtd, NULL, 0, NULL, 0);
 
 	/* Return happy */
 	return 0;
-- 
1.7.4.4
