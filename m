Received: from mail-pa0-x22c.google.com ([2607:f8b0:400e:c03::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZsMvg-0005E2-UE
 for linux-mtd@lists.infradead.org; Sat, 31 Oct 2015 03:34:11 +0000
Received: by padhk11 with SMTP id hk11so91291344pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 30 Oct 2015 20:33:52 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Marek Vasut <marex@denx.de>, Scott Wood <scottwood@freescale.com>,
 Josh Wu <josh.wu@atmel.com>, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Han Xu <han.xu@freescale.com>
Subject: [PATCH v2 08/11] mtd: spi-nor: drop flash_node field
Date: Fri, 30 Oct 2015 20:33:27 -0700
Message-Id: <1446262410-45754-9-git-send-email-computersforpeace@gmail.com>
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

We can just alias to the MTD of_node.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
---
v2: new

 drivers/mtd/spi-nor/spi-nor.c | 1 -
 include/linux/mtd/spi-nor.h   | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 924d455dadb5..12041e181630 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1258,7 +1258,6 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 		mtd->flags |= MTD_NO_ERASE;
 
 	mtd->dev.parent = dev;
-	mtd_set_of_node(mtd, np);
 	nor->page_size = info->page_size;
 	mtd->writebufsize = nor->page_size;
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 6d991df8f986..955f268d159a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -124,7 +124,6 @@ struct mtd_info;
  * @mtd:		point to a mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		point to a spi device, or a spi nor controller device.
- * @flash_node:		point to a device node describing this flash instance.
  * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
@@ -155,7 +154,6 @@ struct spi_nor {
 	struct mtd_info		mtd;
 	struct mutex		lock;
 	struct device		*dev;
-	struct device_node	*flash_node;
 	u32			page_size;
 	u8			addr_width;
 	u8			erase_opcode;
@@ -188,12 +186,12 @@ struct spi_nor {
 static inline void spi_nor_set_flash_node(struct spi_nor *nor,
 					  struct device_node *np)
 {
-	nor->flash_node = np;
+	mtd_set_of_node(&nor->mtd, np);
 }
 
 static inline struct device_node *spi_nor_get_flash_node(struct spi_nor *nor)
 {
-	return nor->flash_node;
+	return mtd_get_of_node(&nor->mtd);
 }
 
 /**
-- 
2.6.0.rc2.230.g3dd15c0
