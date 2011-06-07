Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTwTs-0001lv-B9
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 13:38:05 +0000
Received: by wwi18 with SMTP id 18so2388624wwi.0
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 06:38:03 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 44/44] mtd: onenand/samsung.c: use mtd_device_parse_register
Date: Tue,  7 Jun 2011 17:36:43 +0400
Message-Id: <1307453803-31950-45-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
References: <1307453803-31950-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replace custom invocations of parse_mtd_partitions and mtd_device_register
with common mtd_device_parse_register call. This would bring: standard
handling of all errors, fallback to default partitions, etc.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/onenand/samsung.c |   11 +++--------
 1 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index 78a08ea..597dffc 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -147,7 +147,6 @@ struct s3c_onenand {
 	struct resource *dma_res;
 	unsigned long	phys_base;
 	struct completion	complete;
-	struct mtd_partition *parts;
 };
 
 #define CMD_MAP_00(dev, addr)		(dev->cmd_map(MAP_00, ((addr) << 1)))
@@ -1015,13 +1014,9 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (s3c_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ)
 		dev_info(&onenand->pdev->dev, "OneNAND Sync. Burst Read enabled\n");
 
-	err = parse_mtd_partitions(mtd, NULL, &onenand->parts, 0);
-	if (err > 0)
-		mtd_device_register(mtd, onenand->parts, err);
-	else if (err <= 0 && pdata && pdata->parts)
-		mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
-	else
-		err = mtd_device_register(mtd, NULL, 0);
+	err = mtd_device_parse_register(&info->mtd, NULL, 0,
+			pdata ? pdata->parts : NULL,
+			pdata ? pdata->nr_parts : 0);
 
 	platform_set_drvdata(pdev, mtd);
 
-- 
1.7.4.4
