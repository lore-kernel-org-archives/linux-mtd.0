Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QTaPo-0005oy-GC
	for linux-mtd@lists.infradead.org; Mon, 06 Jun 2011 14:04:25 +0000
Received: by wwi18 with SMTP id 18so1446685wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 06 Jun 2011 07:04:22 -0700 (PDT)
From: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: [PATCH 3/3] mtd: plat-nand: drop unused fields from platform_nand_data
Date: Mon,  6 Jun 2011 18:04:16 +0400
Message-Id: <1307369056-29319-4-git-send-email-dbaryshkov@gmail.com>
In-Reply-To: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
References: <1307369056-29319-1-git-send-email-dbaryshkov@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
	Russell King <linux@arm.linux.org.uk>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drop now unused set_parts from struct platform_nand_data. Also, while we are
at it, drop long unused priv field from platform_nand_data.

Signed-off-by: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
---
 drivers/mtd/nand/plat_nand.c |    2 --
 include/linux/mtd/nand.h     |    2 --
 2 files changed, 0 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/plat_nand.c b/drivers/mtd/nand/plat_nand.c
index 633c04b..1339fa8 100644
--- a/drivers/mtd/nand/plat_nand.c
+++ b/drivers/mtd/nand/plat_nand.c
@@ -108,8 +108,6 @@ static int __devinit plat_nand_probe(struct platform_device *pdev)
 			return 0;
 		}
 	}
-	if (pdata->chip.set_parts)
-		pdata->chip.set_parts(data->mtd.size, &pdata->chip);
 	if (pdata->chip.partitions) {
 		data->parts = pdata->chip.partitions;
 		err = mtd_device_register(&data->mtd, data->parts,
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 585d49b..da6e252 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -617,8 +617,6 @@ struct platform_nand_chip {
 	int chip_delay;
 	unsigned int options;
 	const char **part_probe_types;
-	void (*set_parts)(uint64_t size, struct platform_nand_chip *chip);
-	void *priv;
 };
 
 /* Keep gcc happy */
-- 
1.7.4.4
