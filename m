Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvV-00071b-KX
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:16:50 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682911wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:16:49 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 17/32] mtd: lantiq-flash don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:07 +0400
Message-Id: <1307351782-7456-17-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/maps/lantiq-flash.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index a90cabd..6c7a5b9 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -107,8 +107,6 @@ ltq_copy_to(struct map_info *map, unsigned long to,
 	spin_unlock_irqrestore(&ebu_lock, flags);
 }
 
-static const char const *part_probe_types[] = { "cmdlinepart", NULL };
-
 static int __init
 ltq_mtd_probe(struct platform_device *pdev)
 {
@@ -173,7 +171,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 	cfi->addr_unlock2 ^= 1;
 
 	nr_parts = parse_mtd_partitions(ltq_mtd->mtd,
-				part_probe_types, &parts, 0);
+				NULL, &parts, 0);
 	if (nr_parts > 0) {
 		dev_info(&pdev->dev,
 			"using %d partitions from cmdline", nr_parts);
-- 
1.7.4.4
