Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvD-00073I-CX
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:32 +0000
Received: by wwb39 with SMTP id 39so2799739wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:30 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 06/32] mtd: rbtx4939-flash don't specify default parsing
	options
Date: Mon,  6 Jun 2011 13:15:56 +0400
Message-Id: <1307351782-7456-6-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/rbtx4939-flash.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/rbtx4939-flash.c b/drivers/mtd/maps/rbtx4939-flash.c
index 761fb45..a272678 100644
--- a/drivers/mtd/maps/rbtx4939-flash.c
+++ b/drivers/mtd/maps/rbtx4939-flash.c
@@ -50,7 +50,6 @@ static int rbtx4939_flash_remove(struct platform_device *dev)
 }
 
 static const char *rom_probe_types[] = { "cfi_probe", "jedec_probe", NULL };
-static const char *part_probe_types[] = { "cmdlinepart", NULL };
 
 static int rbtx4939_flash_probe(struct platform_device *dev)
 {
@@ -107,8 +106,7 @@ static int rbtx4939_flash_probe(struct platform_device *dev)
 	info->mtd->owner = THIS_MODULE;
 	if (err)
 		goto err_out;
-
-	err = parse_mtd_partitions(info->mtd, part_probe_types,
+	err = parse_mtd_partitions(info->mtd, NULL,
 				&info->parts, 0);
 	if (err > 0) {
 		mtd_device_register(info->mtd, info->parts, err);
-- 
1.7.4.4
