Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMve-0005Dw-Ln
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:08 +0000
Received: by padhk11 with SMTP id hk11so91289539pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:46 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 03/11] mtd: {nand,spi-nor}: assign MTD of_node
Date: Fri, 30 Oct 2015 20:33:22 -0700
Message-Id: <1446262410-45754-4-git-send-email-computersforpeace@gmail.com>
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

We should pass along our flash DT node to the MTD layer, so it can set
up ofpart for us.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: split out of the previous patch

 drivers/mtd/nand/nand_base.c  | 3 +++
 drivers/mtd/spi-nor/spi-nor.c | 1 +
 2 files changed, 4 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index cc74142938b0..939ab3d5acc2 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3990,6 +3990,9 @@ int nand_scan_ident(struct mtd_info *mtd, int maxchips,
 	int ret;
 
 	if (chip->flash_node) {
+		/* MTD can automatically handle DT partitions, etc. */
+		mtd_set_of_node(mtd, chip->flash_node);
+
 		ret = nand_dt_init(mtd, chip, chip->flash_node);
 		if (ret)
 			return ret;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 49883905a434..1d3107ccee61 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1258,6 +1258,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
+	mtd_set_of_node(mtd, np);
 	nor->page_size = info->page_size;
 	mtd->writebufsize = nor->page_size;
 
-- 
2.6.0.rc2.230.g3dd15c0
