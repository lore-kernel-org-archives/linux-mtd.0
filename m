Date: Tue, 19 Aug 2008 22:56:14 +0200
From: Sebastian Siewior <bigeasy@linutronix.de>
To: David Woodhouse <dwmw2@infradead.org>
Subject: [PATCH] mtd: remove unused mtd parameter in of_mtd_parse_partitions()
Message-ID: <20080819205614.GA1235@www.tglx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Sebastian Siewior <bigeasy@linutronix.de>
---
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
index 4b69aac..25a4bd1 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -877,8 +877,7 @@ static int fsl_elbc_chip_probe(struct fsl_elbc_ctrl *ctrl,
 
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
index 7c37d7e..54713b5 100644
--- a/include/linux/mtd/partitions.h
+++ b/include/linux/mtd/partitions.h
@@ -75,7 +75,6 @@ struct device;
 struct device_node;
 
 int __devinit of_mtd_parse_partitions(struct device *dev,
-                                      struct mtd_info *mtd,
                                       struct device_node *node,
                                       struct mtd_partition **pparts);
 
-- 
1.5.5.2
