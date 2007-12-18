Received: from ganesha.gnumonks.org ([213.95.27.120])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J4aVu-0005h2-Qp
	for linux-mtd@lists.infradead.org; Tue, 18 Dec 2007 11:21:38 +0000
Date: Tue, 18 Dec 2007 12:06:39 +0100
From: Harald Welte <laforge@openmoko.org>
To: linux-arm-kernel@lists.arm.linux.org.uk
Subject: [PATCH 2/12] neo1973: S3C2410 NAND commandline partition support
Message-ID: <20071218110639.GI29882@prithivi.gnumonks.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org, ben-linux@fluff.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[PATCH] support mtd NAND commandline partitions for S3C2410

This patch adds support for the mtd NAND core standard method of passing
partition table information from the bootloader into the kernel by using
the kernel commandline.

The board specific code can still manually override and provide a fixed
partition table, so this patch will behave backwards compatible.

Signed-off-by: Harald Welte <laforge@openmoko.org>

---

--- linux-2.6.22.1.orig/drivers/mtd/nand/s3c2410.c
+++ linux-2.6.22.1/drivers/mtd/nand/s3c2410.c
@@ -547,17 +547,31 @@
 }
 
 #ifdef CONFIG_MTD_PARTITIONS
+const char *part_probes[] = { "cmdlinepart", NULL };
 static int s3c2410_nand_add_partition(struct s3c2410_nand_info *info,
 				      struct s3c2410_nand_mtd *mtd,
 				      struct s3c2410_nand_set *set)
 {
+	struct mtd_partition *part_info;
+	int nr_part = 0;
+
 	if (set == NULL)
 		return add_mtd_device(&mtd->mtd);
 
-	if (set->nr_partitions > 0 && set->partitions != NULL) {
-		return add_mtd_partitions(&mtd->mtd, set->partitions, set->nr_partitions);
+	if (set->nr_partitions == 0) {
+		mtd->mtd.name = set->name;
+		nr_part = parse_mtd_partitions(&mtd->mtd, part_probes,
+						&part_info, 0);
+	} else {
+		if (set->nr_partitions > 0 && set->partitions != NULL) {
+			nr_part = set->nr_partitions;
+			part_info = set->partitions;
+		}
 	}
 
+	if (nr_part > 0 && part_info)
+		return add_mtd_partitions(&mtd->mtd, part_info, nr_part);
+
 	return add_mtd_device(&mtd->mtd);
 }
 #else
-- 
- Harald Welte <laforge@openmoko.org>          	        http://openmoko.org/
============================================================================
Software for the world's first truly open Free Software mobile phone
