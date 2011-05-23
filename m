Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QORNZ-0002TQ-Kq
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:24:50 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:24:49 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 24/62] mtd/intel_vr_nor: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:05 +0100
Message-Id: <1306142623-24952-25-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/maps/intel_vr_nor.c |   19 ++-----------------
 1 files changed, 2 insertions(+), 17 deletions(-)

diff --git a/drivers/mtd/maps/intel_vr_nor.c b/drivers/mtd/maps/intel_vr_nor.c
index fc19985..d2f47be 100644
--- a/drivers/mtd/maps/intel_vr_nor.c
+++ b/drivers/mtd/maps/intel_vr_nor.c
@@ -66,33 +66,18 @@ struct vr_nor_mtd {
 
 static void __devexit vr_nor_destroy_partitions(struct vr_nor_mtd *p)
 {
-	if (p->nr_parts > 0) {
-#if defined(CONFIG_MTD_PARTITIONS) || defined(CONFIG_MTD_PARTITIONS_MODULE)
-		del_mtd_partitions(p->info);
-#endif
-	} else
-		del_mtd_device(p->info);
+	mtd_device_unregister(p->info);
 }
 
 static int __devinit vr_nor_init_partitions(struct vr_nor_mtd *p)
 {
-	int err = 0;
-#if defined(CONFIG_MTD_PARTITIONS) || defined(CONFIG_MTD_PARTITIONS_MODULE)
 	struct mtd_partition *parts;
 	static const char *part_probes[] = { "cmdlinepart", NULL };
-#endif
 
 	/* register the flash bank */
-#if defined(CONFIG_MTD_PARTITIONS) || defined(CONFIG_MTD_PARTITIONS_MODULE)
 	/* partition the flash bank */
 	p->nr_parts = parse_mtd_partitions(p->info, part_probes, &parts, 0);
-	if (p->nr_parts > 0)
-		err = add_mtd_partitions(p->info, parts, p->nr_parts);
-#endif
-	if (p->nr_parts <= 0)
-		err = add_mtd_device(p->info);
-
-	return err;
+	return mtd_device_register(p->info, parts, p->nr_parts);
 }
 
 static void __devexit vr_nor_destroy_mtd_setup(struct vr_nor_mtd *p)
-- 
1.7.4.4
