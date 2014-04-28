From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v2 02/10] mtd: spi-nor: add a new field for spi_nor{}
Date: Mon, 28 Apr 2014 11:53:39 +0800
Message-ID: <1398657227-20721-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1398657227-20721-1-git-send-email-b32955@freescale.com>
References: <1398657227-20721-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-spi@vger.kernel.org, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

We need the SPI NOR child node to store some specific features, such as the
dummy cycles for the DDR Quad read.

But now, we only have the @dev field in the spi_nor{}. The @dev may points to a
spi_device{} for m25p80, while it may points to a platform_deivice{} for the
SPI NOR controller, such as fsl_quadspi.c.

It is not convenient for us to get come information from the SPI NOR flash.

This patch adds a new field @np to spi_nor{}, it points to the child node for
the SPI NOR flash.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/devices/m25p80.c  |    1 +
 drivers/mtd/spi-nor/spi-nor.c |    2 +-
 include/linux/mtd/spi-nor.h   |    3 +++
 3 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 3a1d9e0..f996c3a 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -215,6 +215,7 @@ static int m25p_probe(struct spi_device *spi)
 	nor->read_reg = m25p80_read_reg;
 
 	nor->dev = &spi->dev;
+	nor->np = spi->dev.of_node;
 	nor->mtd = &flash->mtd;
 	nor->priv = flash;
 
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1a12f81..f374e44 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -891,7 +891,7 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	struct flash_platform_data	*data;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = nor->mtd;
-	struct device_node *np = dev->of_node;
+	struct device_node *np = nor->np;
 	int ret;
 	int i;
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5324184..48fe9fc 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -117,6 +117,8 @@ enum spi_nor_ops {
  * @mtd:		point to a mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		point to a spi device, or a spi nor controller device.
+ * @np:			If exit, it points to a device_node which stands for the
+ *			SPI NOR flash child node.
  * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
@@ -148,6 +150,7 @@ struct spi_nor {
 	struct mtd_info		*mtd;
 	struct mutex		lock;
 	struct device		*dev;
+	struct device_node	*np;
 	u32			page_size;
 	u8			addr_width;
 	u8			erase_opcode;
-- 
1.7.2.rc3
