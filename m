Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNU-0002TB-OP
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:46 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:44 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 22/62] mtd/h720x-flash: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:03 +0100
Message-Id: <1306142623-24952-23-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/h720x-flash.c |    6 ++----
 1 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/maps/h720x-flash.c b/drivers/mtd/maps/h720x-flash.c
index 72c724f..7f03586 100644
--- a/drivers/mtd/maps/h720x-flash.c
+++ b/drivers/mtd/maps/h720x-flash.c
@@ -92,18 +92,16 @@ static int __init h720x_mtd_init(void)
 	if (mymtd) {
 		mymtd->owner = THIS_MODULE;
 
-#ifdef CONFIG_MTD_PARTITIONS
 		nr_mtd_parts = parse_mtd_partitions(mymtd, probes, &mtd_parts, 0);
 		if (nr_mtd_parts > 0)
 			part_type = "command line";
-#endif
 		if (nr_mtd_parts <= 0) {
 			mtd_parts = h720x_partitions;
 			nr_mtd_parts = NUM_PARTITIONS;
 			part_type = "builtin";
 		}
 		printk(KERN_INFO "Using %s partition table\n", part_type);
-		add_mtd_partitions(mymtd, mtd_parts, nr_mtd_parts);
+		mtd_device_register(mymtd, mtd_parts, nr_mtd_parts);
 		return 0;
 	}
 
@@ -118,7 +116,7 @@ static void __exit h720x_mtd_cleanup(void)
 {
 
 	if (mymtd) {
-		del_mtd_partitions(mymtd);
+		mtd_device_unregister(mymtd);
 		map_destroy(mymtd);
 	}
 
-- 
1.7.4.4
