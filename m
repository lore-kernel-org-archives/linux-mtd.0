Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvY-00071T-D2
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:53 +0000
Received: by mail-ww0-f41.google.com with SMTP id 18so1223527wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:52 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 18/32] mtd: latch-addr-flash don't specify default parsing
	options
Date: Mon,  6 Jun 2011 13:16:08 +0400
Message-Id: <1307351782-7456-18-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/latch-addr-flash.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index 5936c46..7b2199e 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -97,8 +97,6 @@ static void lf_copy_from(struct map_info *map, void *to,
 
 static char *rom_probe_types[] = { "cfi_probe", NULL };
 
-static char *part_probe_types[] = { "cmdlinepart", NULL };
-
 static int latch_addr_flash_remove(struct platform_device *dev)
 {
 	struct latch_addr_flash_info *info;
@@ -206,7 +204,7 @@ static int __devinit latch_addr_flash_probe(struct platform_device *dev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	err = parse_mtd_partitions(info->mtd, (const char **)part_probe_types,
+	err = parse_mtd_partitions(info->mtd, NULL,
 				   &info->parts, 0);
 	if (err > 0) {
 		mtd_device_register(info->mtd, info->parts, err);
-- 
1.7.4.4
