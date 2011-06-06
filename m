Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvH-00071b-Pa
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:36 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682911wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 09/32] mtd: cmx270_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:15:59 +0400
Message-Id: <1307351782-7456-9-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
References: <1307351782-7456-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Since 'cmdline, NULL' is now a default for parse_mtd_partitions, don't specify
this in every driver, instead pass NULL to force parse_mtd_partitions
to use default.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/cmx270_nand.c |    7 ++-----
 1 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/cmx270_nand.c b/drivers/mtd/nand/cmx270_nand.c
index 6fc043a..f8f5b7c 100644
--- a/drivers/mtd/nand/cmx270_nand.c
+++ b/drivers/mtd/nand/cmx270_nand.c
@@ -50,8 +50,6 @@ static struct mtd_partition partition_info[] = {
 };
 #define NUM_PARTITIONS (ARRAY_SIZE(partition_info))
 
-const char *part_probes[] = { "cmdlinepart", NULL };
-
 static u_char cmx270_read_byte(struct mtd_info *mtd)
 {
 	struct nand_chip *this = mtd->priv;
@@ -222,14 +220,13 @@ static int __init cmx270_init(void)
 		goto err_scan;
 	}
 
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-	mtd_parts_nb = parse_mtd_partitions(cmx270_nand_mtd, part_probes,
+	mtd_parts_nb = parse_mtd_partitions(cmx270_nand_mtd, NULL,
 					    &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
 	else
 		mtd_parts_nb = 0;
-#endif
+
 	if (!mtd_parts_nb) {
 		mtd_parts = partition_info;
 		mtd_parts_nb = NUM_PARTITIONS;
-- 
1.7.4.4
