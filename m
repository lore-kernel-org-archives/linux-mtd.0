Received: from mba.ocn.ne.jp ([122.1.235.107] helo=smtp.mba.ocn.ne.jp)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JJqYT-0008EU-HW
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 13:31:14 +0000
Date: Tue, 29 Jan 2008 22:28:22 +0900 (JST)
Message-Id: <20080129.222822.59465469.anemo@mba.ocn.ne.jp>
To: Andrew Victor <andrew@sanpeople.com>
Subject: [PATCH] at91_nand: Make mtdparts option can override board info
From: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Frank Mandarino <fmandarino@endrelia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Call parse_mtd_partitions before checking board's partition_info, so
that "mtdparts=" option can override board's default setting.

Signed-off-by: Atsushi Nemoto <anemo@mba.ocn.ne.jp>
---
diff --git a/drivers/mtd/nand/at91_nand.c b/drivers/mtd/nand/at91_nand.c
index b2a5672..c9fb2ac 100644
--- a/drivers/mtd/nand/at91_nand.c
+++ b/drivers/mtd/nand/at91_nand.c
@@ -156,14 +156,14 @@ static int __init at91_nand_probe(struct platform_device *pdev)
 	}
 
 #ifdef CONFIG_MTD_PARTITIONS
-	if (host->board->partition_info)
-		partitions = host->board->partition_info(mtd->size, &num_partitions);
 #ifdef CONFIG_MTD_CMDLINE_PARTS
-	else {
-		mtd->name = "at91_nand";
-		num_partitions = parse_mtd_partitions(mtd, part_probes, &partitions, 0);
-	}
+	mtd->name = "at91_nand";
+	num_partitions = parse_mtd_partitions(mtd, part_probes,
+					      &partitions, 0);
 #endif
+	if (num_partitions <= 0 && host->board->partition_info)
+		partitions = host->board->partition_info(mtd->size,
+							 &num_partitions);
 
 	if ((!partitions) || (num_partitions == 0)) {
 		printk(KERN_ERR "at91_nand: No parititions defined, or unsupported device.\n");
