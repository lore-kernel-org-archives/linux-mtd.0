Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNb-0002U4-PO
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:53 +0000
Received: by mail-ww0-f49.google.com with SMTP id 39so4359577wwb.18
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:51 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 25/62] mtd/latch-addr-flash: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:06 +0100
Message-Id: <1306142623-24952-26-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Convert to mtd_device_register() and remove the CONFIG_MTD_PARTITIONS
preprocessor conditionals as partitioning is always available.

Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/maps/latch-addr-flash.c |   45 +++++++++++++---------------------
 1 files changed, 17 insertions(+), 28 deletions(-)

diff --git a/drivers/mtd/maps/latch-addr-flash.c b/drivers/mtd/maps/latch-addr-flash.c
index ee25480..5936c46 100644
--- a/drivers/mtd/maps/latch-addr-flash.c
+++ b/drivers/mtd/maps/latch-addr-flash.c
@@ -112,18 +112,9 @@ static int latch_addr_flash_remove(struct platform_device *dev)
 	latch_addr_data = dev->dev.platform_data;
 
 	if (info->mtd != NULL) {
-		if (mtd_has_partitions()) {
-			if (info->nr_parts) {
-				del_mtd_partitions(info->mtd);
-				kfree(info->parts);
-			} else if (latch_addr_data->nr_parts) {
-				del_mtd_partitions(info->mtd);
-			} else {
-				del_mtd_device(info->mtd);
-			}
-		} else {
-			del_mtd_device(info->mtd);
-		}
+		if (info->nr_parts)
+			kfree(info->parts);
+		mtd_device_unregister(info->mtd);
 		map_destroy(info->mtd);
 	}
 
@@ -215,23 +206,21 @@ static int __devinit latch_addr_flash_probe(struct platform_device *dev)
 	}
 	info->mtd->owner = THIS_MODULE;
 
-	if (mtd_has_partitions()) {
-
-		err = parse_mtd_partitions(info->mtd,
-					   (const char **)part_probe_types,
-					   &info->parts, 0);
-		if (err > 0) {
-			add_mtd_partitions(info->mtd, info->parts, err);
-			return 0;
-		}
-		if (latch_addr_data->nr_parts) {
-			pr_notice("Using latch-addr-flash partition information\n");
-			add_mtd_partitions(info->mtd, latch_addr_data->parts,
-					latch_addr_data->nr_parts);
-			return 0;
-		}
+	err = parse_mtd_partitions(info->mtd, (const char **)part_probe_types,
+				   &info->parts, 0);
+	if (err > 0) {
+		mtd_device_register(info->mtd, info->parts, err);
+		return 0;
+	}
+	if (latch_addr_data->nr_parts) {
+		pr_notice("Using latch-addr-flash partition information\n");
+		mtd_device_register(info->mtd,
+				    latch_addr_data->parts,
+				    latch_addr_data->nr_parts);
+		return 0;
 	}
-	add_mtd_device(info->mtd);
+
+	mtd_device_register(info->mtd, NULL, 0);
 	return 0;
 
 iounmap:
-- 
1.7.4.4
