Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHF-0007LR-Lu
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:43 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so631181wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:41 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 27/43] mtd: edb7312.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:36 +0400
Message-Id: <1307549152-7085-28-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
References: <1307549152-7085-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
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
 drivers/mtd/nand/edb7312.c |   17 ++---------------
 1 files changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/edb7312.c b/drivers/mtd/nand/edb7312.c
index 2f9374b..0b1bb91 100644
--- a/drivers/mtd/nand/edb7312.c
+++ b/drivers/mtd/nand/edb7312.c
@@ -104,9 +104,6 @@ static int ep7312_device_ready(struct mtd_info *mtd)
 static int __init ep7312_init(void)
 {
 	struct nand_chip *this;
-	const char *part_type = 0;
-	int mtd_parts_nb = 0;
-	struct mtd_partition *mtd_parts = 0;
 	void __iomem *ep7312_fio_base;
 
 	/* Allocate memory for MTD device structure and private data */
@@ -156,20 +153,10 @@ static int __init ep7312_init(void)
 		return -ENXIO;
 	}
 	ep7312_mtd->name = "edb7312-nand";
-	mtd_parts_nb = parse_mtd_partitions(ep7312_mtd, NULL, &mtd_parts, 0);
-	if (mtd_parts_nb > 0)
-		part_type = "command line";
-	else
-		mtd_parts_nb = 0;
-	if (mtd_parts_nb == 0) {
-		mtd_parts = partition_info;
-		mtd_parts_nb = NUM_PARTITIONS;
-		part_type = "static";
-	}
 
 	/* Register the partitions */
-	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	mtd_device_register(ep7312_mtd, mtd_parts, mtd_parts_nb);
+	mtd_device_register(ep7312_mtd, NULL, 0,
+			partition_info, NUM_PARTITIONS);
 
 	/* Return happy */
 	return 0;
-- 
1.7.4.4
