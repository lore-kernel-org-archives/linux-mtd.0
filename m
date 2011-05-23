Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROn-0002TQ-Id
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:07 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098499wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:05 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 57/62] mtd/omap2 onenand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:38 +0100
Message-Id: <1306142623-24952-58-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
Cc: Jamie Iles <jamie@jamieiles.com>, Kyungmin Park <kyungmin.park@samsung.com>,
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

Cc: Kyungmin Park <kyungmin.park@samsung.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
Signed-off-by: Jamie Iles <jamie@jamieiles.com>
---
 drivers/mtd/onenand/omap2.c |   10 +++-------
 1 files changed, 3 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 1fcb41a..a916dec 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -67,9 +67,7 @@ struct omap2_onenand {
 	struct regulator *regulator;
 };
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL,  };
-#endif
 
 static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
 {
@@ -755,15 +753,13 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_regulator;
 
-#ifdef CONFIG_MTD_PARTITIONS
 	r = parse_mtd_partitions(&c->mtd, part_probes, &c->parts, 0);
 	if (r > 0)
-		r = add_mtd_partitions(&c->mtd, c->parts, r);
+		r = mtd_device_register(&c->mtd, c->parts, r);
 	else if (pdata->parts != NULL)
-		r = add_mtd_partitions(&c->mtd, pdata->parts, pdata->nr_parts);
+		r = mtd_device_register(&c->mtd, pdata->parts, pdata->nr_parts);
 	else
-#endif
-		r = add_mtd_device(&c->mtd);
+		r = mtd_device_register(&c->mtd, NULL, 0);
 	if (r)
 		goto err_release_onenand;
 
-- 
1.7.4.4
