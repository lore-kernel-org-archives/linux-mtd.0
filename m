Received: from chamillionaire.breakpoint.cc ([85.10.199.196])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Kp1mL-0007NQ-Cp
	for linux-mtd@lists.infradead.org; Sun, 12 Oct 2008 14:18:41 +0000
Date: Sun, 12 Oct 2008 16:18:36 +0200
From: Sebastian Andrzej Siewior <sebastian@breakpoint.cc>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: remove unused mtd parameter in of_mtd_parse_partitions()
Message-ID: <20081012141836.GA7914@Chamillionaire.breakpoint.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
Repost of 19th Aug [1]

[1] http://article.gmane.org/gmane.linux.drivers.mtd/22589

 drivers/mtd/maps/physmap_of.c    |    3 +--
 drivers/mtd/nand/fsl_elbc_nand.c |    3 +--
 drivers/mtd/ofpart.c             |    1 -
 include/linux/mtd/partitions.h   |    1 -
 4 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
index 49acd41..5fcfec0 100644
--- a/drivers/mtd/maps/physmap_of.c
+++ b/drivers/mtd/maps/physmap_of.c
@@ -230,8 +230,7 @@ static int __devinit of_flash_probe(struct of_device *dev,
 
 #ifdef CONFIG_MTD_OF_PARTS
 	if (err == 0) {
-		err = of_mtd_parse_partitions(&dev->dev, info->mtd,
-		                              dp, &info->parts);
+		err = of_mtd_parse_partitions(&dev->dev, dp, &info->parts);
 		if (err < 0)
 			return err;
 	}
diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 98ad3ce..4aa5bd6 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -918,8 +918,7 @@ static int __devinit fsl_elbc_chip_probe(struct fsl_elbc_ctrl *ctrl,
 
 #ifdef CONFIG_MTD_OF_PARTS
 	if (ret == 0) {
-		ret = of_mtd_parse_partitions(priv->dev, &priv->mtd,
-		                              node, &parts);
+		ret = of_mtd_parse_partitions(priv->dev, node, &parts);
 		if (ret < 0)
 			goto err;
 	}
diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
index 4f80c2f..9e45b3f 100644
--- a/drivers/mtd/ofpart.c
+++ b/drivers/mtd/ofpart.c
@@ -20,7 +20,6 @@
 #include <linux/mtd/partitions.h>
 
 int __devinit of_mtd_parse_partitions(struct device *dev,
-                                      struct mtd_info *mtd,
                                       struct device_node *node,
                                       struct mtd_partition **pparts)
 {
diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partitions.h
index 5014f7a..c92b4d4 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -73,7 +73,6 @@ struct device;
 struct device_node;
 
 int __devinit of_mtd_parse_partitions(struct device *dev,
-                                      struct mtd_info *mtd,
                                       struct device_node *node,
                                       struct mtd_partition **pparts);
 
-- 
1.5.6.5
