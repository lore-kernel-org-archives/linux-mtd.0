Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVwD-00071b-5V
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:34 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682911wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:32 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 31/32] mtd: onenand/omap2 don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:21 +0400
Message-Id: <1307351782-7456-31-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/onenand/omap2.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/omap2.c b/drivers/mtd/onenand/omap2.c
index 0d9073d..5ca2053 100644
--- a/drivers/mtd/onenand/omap2.c
+++ b/drivers/mtd/onenand/omap2.c
@@ -67,8 +67,6 @@ struct omap2_onenand {
 	struct regulator *regulator;
 };
 
-static const char *part_probes[] = { "cmdlinepart", NULL,  };
-
 static void omap2_onenand_dma_cb(int lch, u16 ch_status, void *data)
 {
 	struct omap2_onenand *c = data;
@@ -754,7 +752,7 @@ static int __devinit omap2_onenand_probe(struct platform_device *pdev)
 	if ((r = onenand_scan(&c->mtd, 1)) < 0)
 		goto err_release_regulator;
 
-	r = parse_mtd_partitions(&c->mtd, part_probes, &c->parts, 0);
+	r = parse_mtd_partitions(&c->mtd, NULL, &c->parts, 0);
 	if (r > 0)
 		r = mtd_device_register(&c->mtd, c->parts, r);
 	else if (pdata->parts != NULL)
-- 
1.7.4.4
