Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvR-000726-Qk
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:47 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:45 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 15/32] mtd: h1910 don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:05 +0400
Message-Id: <1307351782-7456-15-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/h1910.c |    8 ++------
 1 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/h1910.c b/drivers/mtd/nand/h1910.c
index 02a03e6..42f9177 100644
--- a/drivers/mtd/nand/h1910.c
+++ b/drivers/mtd/nand/h1910.c
@@ -136,14 +136,10 @@ static int __init h1910_init(void)
 		iounmap((void *)nandaddr);
 		return -ENXIO;
 	}
-#ifdef CONFIG_MTD_CMDLINE_PARTS
-	mtd_parts_nb = parse_cmdline_partitions(h1910_nand_mtd, &mtd_parts, "h1910-nand");
+	mtd_parts_nb = parse_mtd_partitions(h1910_nand_mtd, NULL, &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
-	else
-		mtd_parts_nb = 0;
-#endif
-	if (mtd_parts_nb == 0) {
+	else {
 		mtd_parts = partition_info;
 		mtd_parts_nb = NUM_PARTITIONS;
 		part_type = "static";
-- 
1.7.4.4
