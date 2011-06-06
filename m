Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTVwF-000726-W5
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 09:17:36 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so3682940wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 02:17:35 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 32/32] mtd: samsung/onenand don't specify default parsing
	options
Date: Mon,  6 Jun 2011 13:16:22 +0400
Message-Id: <1307351782-7456-32-git-send-email-dbaryshkov@gmail.com>
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
 drivers/mtd/onenand/samsung.c |    4 +---
 1 files changed, 1 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 3306b5b..78a08ea 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -157,8 +157,6 @@ struct s3c_onenand {
 
 static struct s3c_onenand *onenand;
 
-static const char *part_probes[] = { "cmdlinepart", NULL, };
-
 static inline int s3c_read_reg(int offset)
 {
 	return readl(onenand->base + offset);
@@ -1017,7 +1015,7 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (s3c_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ)
 		dev_info(&onenand->pdev->dev, "OneNAND Sync. Burst Read enabled\n");
 
-	err = parse_mtd_partitions(mtd, part_probes, &onenand->parts, 0);
+	err = parse_mtd_partitions(mtd, NULL, &onenand->parts, 0);
 	if (err > 0)
 		mtd_device_register(mtd, onenand->parts, err);
 	else if (err <= 0 && pdata && pdata->parts)
-- 
1.7.4.4
