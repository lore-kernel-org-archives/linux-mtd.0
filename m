Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHU-0007CU-2w
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:57 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so630582wyb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:55 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 35/43] mtd: ppchameleonevb.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:44 +0400
Message-Id: <1307549152-7085-36-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/ppchameleonevb.c |   42 ++++++++----------------------------
 1 files changed, 10 insertions(+), 32 deletions(-)

diff --git a/drivers/mtd/nand/ppchameleonevb.c b/drivers/mtd/nand/ppchameleonevb.c
index 9376633..7e52af5 100644
--- a/drivers/mtd/nand/ppchameleonevb.c
+++ b/drivers/mtd/nand/ppchameleonevb.c
@@ -191,9 +191,6 @@ static int ppchameleonevb_device_ready(struct mtd_info *minfo)
 static int __init ppchameleonevb_init(void)
 {
 	struct nand_chip *this;
-	const char *part_type = 0;
-	int mtd_parts_nb = 0;
-	struct mtd_partition *mtd_parts = 0;
 	void __iomem *ppchameleon_fio_base;
 	void __iomem *ppchameleonevb_fio_base;
 
@@ -276,24 +273,13 @@ static int __init ppchameleonevb_init(void)
 #endif
 
 	ppchameleon_mtd->name = "ppchameleon-nand";
-	mtd_parts_nb = parse_mtd_partitions(ppchameleon_mtd, NULL, &mtd_parts, 0);
-	if (mtd_parts_nb > 0)
-		part_type = "command line";
-	else
-		mtd_parts_nb = 0;
-
-	if (mtd_parts_nb == 0) {
-		if (ppchameleon_mtd->size == NAND_SMALL_SIZE)
-			mtd_parts = partition_info_me;
-		else
-			mtd_parts = partition_info_hi;
-		mtd_parts_nb = NUM_PARTITIONS;
-		part_type = "static";
-	}
 
 	/* Register the partitions */
-	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	mtd_device_register(ppchameleon_mtd, mtd_parts, mtd_parts_nb);
+	mtd_device_parse_register(ppchameleon_mtd, NULL, 0,
+			ppchameleon_mtd->size == NAND_SMALL_SIZE ?
+				partition_info_me :
+				partition_info_hi,
+			NUM_PARTITIONS);
 
  nand_evb_init:
 	/****************************
@@ -377,21 +363,13 @@ static int __init ppchameleonevb_init(void)
 	}
 
 	ppchameleonevb_mtd->name = NAND_EVB_MTD_NAME;
-	mtd_parts_nb = parse_mtd_partitions(ppchameleonevb_mtd, NULL, &mtd_parts, 0);
-	if (mtd_parts_nb > 0)
-		part_type = "command line";
-	else
-		mtd_parts_nb = 0;
-
-	if (mtd_parts_nb == 0) {
-		mtd_parts = partition_info_evb;
-		mtd_parts_nb = NUM_PARTITIONS;
-		part_type = "static";
-	}
 
 	/* Register the partitions */
-	printk(KERN_NOTICE "Using %s partition definition\n", part_type);
-	mtd_device_register(ppchameleonevb_mtd, mtd_parts, mtd_parts_nb);
+	mtd_device_parse_register(ppchameleonevb_mtd, NULL, 0,
+			ppchameleon_mtd->size == NAND_SMALL_SIZE ?
+				partition_info_me :
+				partition_info_hi,
+			NUM_PARTITIONS);
 
 	/* Return happy */
 	return 0;
-- 
1.7.4.4
