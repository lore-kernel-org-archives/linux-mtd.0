Received: from mail-pa0-x232.google.com ([2607:f8b0:400e:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMve-0005Dr-A1
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:07 +0000
Received: by padhk11 with SMTP id hk11so91289024pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:44 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 01/11] mtd: add get/set of_node/flash_node helpers
Date: Fri, 30 Oct 2015 20:33:20 -0700
Message-Id: <1446262410-45754-2-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
References: <1446262410-45754-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We are going to begin using the mtd->dev.of_node field for MTD device
nodes, so let's add helpers for it. Also, we'll be making some
conversions on spi_nor (and nand_chip eventually) too, so get that ready
with their own helpers.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: new

 include/linux/mtd/mtd.h     | 11 +++++++++++
 include/linux/mtd/nand.h    | 11 +++++++++++
 include/linux/mtd/spi-nor.h | 11 +++++++++++
 3 files changed, 33 insertions(+)

diff --git a/include/linux/mtd/mtd.h b/include/linux/mtd/mtd.h
index f17fa75809aa..cc84923011c0 100644
--- a/include/linux/mtd/mtd.h
+++ b/include/linux/mtd/mtd.h
@@ -254,6 +254,17 @@ struct mtd_info {
 	int usecount;
 };
 
+static inline void mtd_set_of_node(struct mtd_info *mtd,
+				   struct device_node *np)
+{
+	mtd->dev.of_node = np;
+}
+
+static inline struct device_node *mtd_get_of_node(struct mtd_info *mtd)
+{
+	return mtd->dev.of_node;
+}
+
 int mtd_erase(struct mtd_info *mtd, struct erase_info *instr);
 int mtd_point(struct mtd_info *mtd, loff_t from, size_t len, size_t *retlen,
 	      void **virt, resource_size_t *phys);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5a9d1d4c2487..4f7c9b97982f 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -719,6 +719,17 @@ struct nand_chip {
 	void *priv;
 };
 
+static inline void nand_set_flash_node(struct nand_chip *chip,
+				       struct device_node *np)
+{
+	chip->flash_node = np;
+}
+
+static inline struct device_node *nand_get_flash_node(struct nand_chip *chip)
+{
+	return chip->flash_node;
+}
+
 /*
  * NAND Flash Manufacturer ID Codes
  */
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index c8723b62c4cd..6d991df8f986 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -185,6 +185,17 @@ struct spi_nor {
 	void *priv;
 };
 
+static inline void spi_nor_set_flash_node(struct spi_nor *nor,
+					  struct device_node *np)
+{
+	nor->flash_node = np;
+}
+
+static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
+{
+	return nor->flash_node;
+}
+
 /**
  * spi_nor_scan() - scan the SPI NOR
  * @nor:	the spi_nor structure
-- 
2.6.0.rc2.230.g3dd15c0
