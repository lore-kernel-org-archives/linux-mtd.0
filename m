Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QULHA-0007GE-9b
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2011 16:06:37 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so531513wwb.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 08 Jun 2011 09:06:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 24/43] mtd: cmx270_nand.c: use mtd_device_parse_register
Date: Wed,  8 Jun 2011 20:05:33 +0400
Message-Id: <1307549152-7085-25-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/cmx270_nand.c |   20 ++------------------
 1 files changed, 2 insertions(+), 18 deletions(-)

diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index f8f5b7c..8305692 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -149,9 +149,6 @@ static int cmx270_device_ready(struct mtd_info *mtd)
 static int __init cmx270_init(void)
 {
 	struct nand_chip *this;
-	const char *part_type;
-	struct mtd_partition *mtd_parts;
-	int mtd_parts_nb = 0;
 	int ret;
 
 	if (!(machine_is_armcore() && cpu_is_pxa27x()))
@@ -220,22 +217,9 @@ static int __init cmx270_init(void)
 		goto err_scan;
 	}
 
-	mtd_parts_nb = parse_mtd_partitions(cmx270_nand_mtd, NULL,
-					    &mtd_parts, 0);
-	if (mtd_parts_nb > 0)
-		part_type = "command line";
-	else
-		mtd_parts_nb = 0;
-
-	if (!mtd_parts_nb) {
-		mtd_parts = partition_info;
-		mtd_parts_nb = NUM_PARTITIONS;
-		part_type = "static";
-	}
-
 	/* Register the partitions */
-	pr_notice("Using %s partition definition\n", part_type);
-	ret = mtd_device_register(cmx270_nand_mtd, mtd_parts, mtd_parts_nb);
+	ret = mtd_device_parse_register(cmx270_nand_mtd, NULL, 0,
+			partition_info, NUM_PARTITIONS);
 	if (ret)
 		goto err_scan;
 
-- 
1.7.4.4
