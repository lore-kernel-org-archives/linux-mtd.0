Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROv-0002TB-1X
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:14 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:12 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 60/62] mtd/lantiq: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:41 +0100
Message-Id: <1306142623-24952-61-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, John Crispin <blogic@openwrt.org>,
	dwmw2@infradead.org, dedekind1@gmail.com
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

Cc: John Crispin <blogic@openwrt.org>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/maps/lantiq-flash.c |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/maps/lantiq-flash.c b/drivers/mtd/maps/lantiq-flash.c
index a90cabd..8faeb492 100644
--- a/drivers/mtd/maps/lantiq-flash.c
+++ b/drivers/mtd/maps/lantiq-flash.c
@@ -182,7 +182,7 @@ ltq_mtd_probe(struct platform_device *pdev)
 		parts = ltq_mtd_data->parts;
 	}
 
-	err = add_mtd_partitions(ltq_mtd->mtd, parts, nr_parts);
+	err = mtd_register_device(ltq_mtd->mtd, parts, nr_parts);
 	if (err) {
 		dev_err(&pdev->dev, "failed to add partitions\n");
 		goto err_destroy;
@@ -208,7 +208,7 @@ ltq_mtd_remove(struct platform_device *pdev)
 
 	if (ltq_mtd) {
 		if (ltq_mtd->mtd) {
-			del_mtd_partitions(ltq_mtd->mtd);
+			mtd_device_unregister(ltq_mtd->mtd);
 			map_destroy(ltq_mtd->mtd);
 		}
 		if (ltq_mtd->map->virt)
-- 
1.7.4.4
