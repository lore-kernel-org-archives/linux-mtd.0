Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VHHmS-0004mb-Go
 for linux-mtd@lists.infradead.org; Wed, 04 Sep 2013 18:26:18 +0000
Received: by mail-ie0-f180.google.com with SMTP id x14so1482321ief.11
 for <linux-mtd@lists.infradead.org>; Wed, 04 Sep 2013 11:25:53 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 10/12] mtd: nand: remove obsolete 'ecclayout' field
Date: Wed,  4 Sep 2013 11:25:24 -0700
Message-Id: <1378319126-24473-11-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
References: <1378319126-24473-1-git-send-email-computersforpeace@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This field is never used, except to print it out.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/nand/fsl_elbc_nand.c | 2 --
 drivers/mtd/nand/fsl_ifc_nand.c  | 2 --
 include/linux/mtd/nand.h         | 1 -
 3 files changed, 5 deletions(-)

diff --git a/drivers/mtd/nand/fsl_elbc_nand.c b/drivers/mtd/nand/fsl_elbc_nand.c
index 2065720..c6ef9f1 100644
--- a/drivers/mtd/nand/fsl_elbc_nand.c
+++ b/drivers/mtd/nand/fsl_elbc_nand.c
@@ -650,8 +650,6 @@ static int fsl_elbc_chip_init_tail(struct mtd_info *mtd)
 	        chip->page_shift);
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->phys_erase_shift = %d\n",
 	        chip->phys_erase_shift);
-	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecclayout = %p\n",
-	        chip->ecclayout);
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.mode = %d\n",
 	        chip->ecc.mode);
 	dev_dbg(priv->dev, "fsl_elbc_init: nand->ecc.steps = %d\n",
diff --git a/drivers/mtd/nand/fsl_ifc_nand.c b/drivers/mtd/nand/fsl_ifc_nand.c
index 317a771..47acda6 100644
--- a/drivers/mtd/nand/fsl_ifc_nand.c
+++ b/drivers/mtd/nand/fsl_ifc_nand.c
@@ -718,8 +718,6 @@ static int fsl_ifc_chip_init_tail(struct mtd_info *mtd)
 							chip->page_shift);
 	dev_dbg(priv->dev, "%s: nand->phys_erase_shift = %d\n", __func__,
 							chip->phys_erase_shift);
-	dev_dbg(priv->dev, "%s: nand->ecclayout = %p\n", __func__,
-							chip->ecclayout);
 	dev_dbg(priv->dev, "%s: nand->ecc.mode = %d\n", __func__,
 							chip->ecc.mode);
 	dev_dbg(priv->dev, "%s: nand->ecc.steps = %d\n", __func__,
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index ac8e89d..1ef18f9 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -572,7 +572,6 @@ struct nand_chip {
 
 	uint8_t *oob_poi;
 	struct nand_hw_control *controller;
-	struct nand_ecclayout *ecclayout;
 
 	struct nand_ecc_ctrl ecc;
 	struct nand_buffers *buffers;
-- 
1.8.4
