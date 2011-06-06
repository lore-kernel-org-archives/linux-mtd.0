Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVvl-00071b-Ne
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:06 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682911wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:05 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 24/32] mtd: pxa3xx_nand don't specify default parsing options
Date: Mon,  6 Jun 2011 13:16:14 +0400
Message-Id: <1307351782-7456-24-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/nand/pxa3xx_nand.c |   13 +++++--------
 1 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nand.c
index 1fb3b3a..80d65c4 100644
--- a/drivers/mtd/nand/pxa3xx_nand.c
+++ b/drivers/mtd/nand/pxa3xx_nand.c
@@ -1129,6 +1129,8 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 {
 	struct pxa3xx_nand_platform_data *pdata;
 	struct pxa3xx_nand_info *info;
+	struct mtd_partition *parts;
+	int nr_parts;
 
 	pdata = pdev->dev.platform_data;
 	if (!pdata) {
@@ -1146,16 +1148,11 @@ static int pxa3xx_nand_probe(struct platform_device *pdev)
 		return -ENODEV;
 	}
 
-	if (mtd_has_cmdlinepart()) {
-		const char *probes[] = { "cmdlinepart", NULL };
-		struct mtd_partition *parts;
-		int nr_parts;
 
-		nr_parts = parse_mtd_partitions(info->mtd, probes, &parts, 0);
+	nr_parts = parse_mtd_partitions(info->mtd, NULL, &parts, 0);
 
-		if (nr_parts)
-			return mtd_device_register(info->mtd, parts, nr_parts);
-	}
+	if (nr_parts)
+		return mtd_device_register(info->mtd, parts, nr_parts);
 
 	return mtd_device_register(info->mtd, pdata->parts, pdata->nr_parts);
 }
-- 
1.7.4.4
