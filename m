Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOROp-0002TB-N4
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 09:26:09 +0000
Received: by mail-wy0-f177.google.com with SMTP id 28so5098469wyb.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 02:26:07 -0700 (PDT)
From: Jamie Iles <jamie@jamieiles.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 58/62] mtd/samsung onenand: convert to mtd_device_register()
Date: Mon, 23 May 2011 10:23:39 +0100
Message-Id: <1306142623-24952-59-git-send-email-jamie@jamieiles.com>
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
 drivers/mtd/onenand/samsung.c |   12 +++---------
 1 files changed, 3 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/onenand/samsung.c b/drivers/mtd/onenand/samsung.c
index a4c74a9..3306b5b 100644
--- a/drivers/mtd/onenand/samsung.c
+++ b/drivers/mtd/onenand/samsung.c
@@ -147,9 +147,7 @@ struct s3c_onenand {
 	struct resource *dma_res;
 	unsigned long	phys_base;
 	struct completion	complete;
-#ifdef CONFIG_MTD_PARTITIONS
 	struct mtd_partition *parts;
-#endif
 };
 
 #define CMD_MAP_00(dev, addr)		(dev->cmd_map(MAP_00, ((addr) << 1)))
@@ -159,9 +157,7 @@ struct s3c_onenand {
 
 static struct s3c_onenand *onenand;
 
-#ifdef CONFIG_MTD_PARTITIONS
 static const char *part_probes[] = { "cmdlinepart", NULL, };
-#endif
 
 static inline int s3c_read_reg(int offset)
 {
@@ -1021,15 +1017,13 @@ static int s3c_onenand_probe(struct platform_device *pdev)
 	if (s3c_read_reg(MEM_CFG_OFFSET) & ONENAND_SYS_CFG1_SYNC_READ)
 		dev_info(&onenand->pdev->dev, "OneNAND Sync. Burst Read enabled\n");
 
-#ifdef CONFIG_MTD_PARTITIONS
 	err = parse_mtd_partitions(mtd, part_probes, &onenand->parts, 0);
 	if (err > 0)
-		add_mtd_partitions(mtd, onenand->parts, err);
+		mtd_device_register(mtd, onenand->parts, err);
 	else if (err <= 0 && pdata && pdata->parts)
-		add_mtd_partitions(mtd, pdata->parts, pdata->nr_parts);
+		mtd_device_register(mtd, pdata->parts, pdata->nr_parts);
 	else
-#endif
-		err = add_mtd_device(mtd);
+		err = mtd_device_register(mtd, NULL, 0);
 
 	platform_set_drvdata(pdev, mtd);
 
-- 
1.7.4.4
