Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvj-000726-En
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:04 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:03 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 23/32] mtd: ppchameleonevb don't specify default parsing
	options
Date: Mon,  6 Jun 2011 13:16:13 +0400
Message-Id: <1307351782-7456-23-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/ppchameleonevb.c |    9 ++-------
 1 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/ppchameleonevb.c b/drivers/mtd/nand/ppchameleonevb.c
index 3bbb796..9376633 100644
--- a/drivers/mtd/nand/ppchameleonevb.c
+++ b/drivers/mtd/nand/ppchameleonevb.c
@@ -99,8 +99,6 @@ static struct mtd_partition partition_info_evb[] = {
 
 #define NUM_PARTITIONS 1
 
-extern int parse_cmdline_partitions(struct mtd_info *master, struct mtd_partition **pparts, const char *mtd_id);
-
 /*
  *	hardware specific access to control-lines
  */
@@ -187,9 +185,6 @@ static int ppchameleonevb_device_ready(struct mtd_info *minfo)
 }
 #endif
 
-const char *part_probes[] = { "cmdlinepart", NULL };
-const char *part_probes_evb[] = { "cmdlinepart", NULL };
-
 /*
  * Main initialization routine
  */
@@ -281,7 +276,7 @@ static int __init ppchameleonevb_init(void)
 #endif
 
 	ppchameleon_mtd->name = "ppchameleon-nand";
-	mtd_parts_nb = parse_mtd_partitions(ppchameleon_mtd, part_probes, &mtd_parts, 0);
+	mtd_parts_nb = parse_mtd_partitions(ppchameleon_mtd, NULL, &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
 	else
@@ -382,7 +377,7 @@ static int __init ppchameleonevb_init(void)
 	}
 
 	ppchameleonevb_mtd->name = NAND_EVB_MTD_NAME;
-	mtd_parts_nb = parse_mtd_partitions(ppchameleonevb_mtd, part_probes_evb, &mtd_parts, 0);
+	mtd_parts_nb = parse_mtd_partitions(ppchameleonevb_mtd, NULL, &mtd_parts, 0);
 	if (mtd_parts_nb > 0)
 		part_type = "command line";
 	else
-- 
1.7.4.4
