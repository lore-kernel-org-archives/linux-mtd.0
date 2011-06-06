Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVy8-0007j6-DQ
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:19:33 +0000
Received: by wyb28 with SMTP id 28so3685058wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:19:30 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 10/32] mtd: cs553x_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:00 +0400
Message-Id: <1307351782-7456-10-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/cs553x_nand.c |    6 +-----
 1 files changed, 1 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/cs553x_nand.c b/drivers/mtd/nand/cs553x_nand.c
index b354961..b2bdf72 100644
--- a/drivers/mtd/nand/cs553x_nand.c
+++ b/drivers/mtd/nand/cs553x_nand.c
@@ -278,8 +278,6 @@ static int is_geode(void)
 	return 0;
 }
 
-static const char *part_probes[] = { "cmdlinepart", NULL };
-
 static int __init cs553x_init(void)
 {
 	int err = -ENXIO;
@@ -318,9 +316,7 @@ static int __init cs553x_init(void)
 		if (cs553x_mtd[i]) {
 
 			/* If any devices registered, return success. Else the last error. */
-			mtd_parts_nb = parse_mtd_partitions(cs553x_mtd[i], part_probes, &mtd_parts, 0);
-			if (mtd_parts_nb > 0)
-				printk(KERN_NOTICE "Using command line partition definition\n");
+			mtd_parts_nb = parse_mtd_partitions(cs553x_mtd[i], NULL, &mtd_parts, 0);
 			mtd_device_register(cs553x_mtd[i], mtd_parts,
 					    mtd_parts_nb);
 			err = 0;
-- 
1.7.4.4
