Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZXXUf-0001jU-K6
 for linux-mtd@lists.infradead.org; Thu, 03 Sep 2015 16:36:10 +0000
From: Marek Vasut <marex@denx.de>
To: linux-mtd@lists.infradead.org
Cc: Jonas Gorski <jogo@openwrt.org>, Marek Vasut <marex@denx.de>,
 Brian Norris <computersforpeace@gmail.com>
Subject: [PATCH V2 1/2] mtd: spi-nor: Decouple SPI NOR's device_node from
 controller device
Date: Thu,  3 Sep 2015 18:35:36 +0200
Message-Id: <1441298137-12199-1-git-send-email-marex@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The problem this patch is trying to address is such, that SPI NOR flash
devices attached to a dedicated SPI NOR controller cannot read their
properties from the associated struct device_node.

A couple of facts first:
1) Each SPI NOR flash has a struct spi_nor associated with it.
2) Each SPI NOR flash has certain device properties associated
   with it, for example the OF property 'm25p,fast-read' is a
   good pick. These properties are used by the SPI NOR core to
   select which opcodes are sent to such SPI NOR flash. These
   properties are coming from spi_nor .dev->of_node .

The problem is, that for SPI NOR controllers, the struct spi_nor .dev
element points to the struct device of the SPI NOR controller, not the
SPI NOR flash. Therefore, the associated dev->of_node also is the
one of the controller and therefore the SPI NOR core code is trying to
parse the SPI NOR controller's properties, not the properties of the
SPI NOR flash.

Note: The m25p80 driver is not affected, because the controller and
      the flash are the same device, so the associated device_node
      of the controller and the flash are the same.

This patch adjusts the SPI NOR core such that the device_node is not
picked from spi_nor .dev directly, but from a new separate spi_nor
.flash_node element. This let's the SPI NOR controller drivers set up
a different spi_nor .flash_node element for each SPI NOR flash.

This patch also fixes the controller drivers to be compatible with
this modification and correctly set the spi_nor .flash_node element.

This patch is inspired by 5844feeaa4154d1c46d3462c7a4653d22356d8b4
mtd: nand: add common DT init code

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Brian Norris <computersforpeace@gmail.com>
---
 drivers/mtd/devices/m25p80.c      | 1 +
 drivers/mtd/spi-nor/fsl-quadspi.c | 1 +
 drivers/mtd/spi-nor/nxp-spifi.c   | 1 +
 drivers/mtd/spi-nor/spi-nor.c     | 2 +-
 include/linux/mtd/spi-nor.h       | 2 ++
 5 files changed, 6 insertions(+), 1 deletion(-)

V2: - Rename .dn to .flash_node
    - Add missing change to spi-nor.c
    - Fix build issue in m25p80, where there was one deref. too much

diff --git a/drivers/mtd/devices/m25p80.c b/drivers/mtd/devices/m25p80.c
index 9cd3631..dfd5cf2 100644
--- a/drivers/mtd/devices/m25p80.c
+++ b/drivers/mtd/devices/m25p80.c
@@ -202,6 +202,7 @@ static int m25p_probe(struct spi_device *spi)
 
 	nor->dev = &spi->dev;
 	nor->mtd = &flash->mtd;
+	nor->flash_node = spi->dev.of_node;
 	nor->priv = flash;
 
 	spi_set_drvdata(spi, flash);
diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index d32b7e0..5b4cacc 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -1017,6 +1017,7 @@ static int fsl_qspi_probe(struct platform_device *pdev)
 
 		nor->mtd = mtd;
 		nor->dev = dev;
+		nor->flash_node = np;
 		nor->priv = q;
 		mtd->priv = nor;
 
diff --git a/drivers/mtd/spi-nor/nxp-spifi.c b/drivers/mtd/spi-nor/nxp-spifi.c
index 9ad1dd0..7c48616 100644
--- a/drivers/mtd/spi-nor/nxp-spifi.c
+++ b/drivers/mtd/spi-nor/nxp-spifi.c
@@ -334,6 +334,7 @@ static int nxp_spifi_setup_flash(struct nxp_spifi *spifi,
 	spifi->mtd.priv  = &spifi->nor;
 	spifi->nor.mtd   = &spifi->mtd;
 	spifi->nor.dev   = spifi->dev;
+	spifi->nor.flash_node = np;
 	spifi->nor.priv  = spifi;
 	spifi->nor.read  = nxp_spifi_read;
 	spifi->nor.write = nxp_spifi_write;
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 39a6a34..0734478 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1026,7 +1026,7 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	const struct flash_info *info = NULL;
 	struct device *dev = nor->dev;
 	struct mtd_info *mtd = nor->mtd;
-	struct device_node *np = dev->of_node;
+	struct device_node *np = nor->flash_node;
 	int ret;
 	int i;
 
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 1bf6f11..67a6320 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -142,6 +142,7 @@ enum spi_nor_option_flags {
  * @mtd:		point to a mtd_info structure
  * @lock:		the lock for the read/write/erase/lock/unlock operations
  * @dev:		point to a spi device, or a spi nor controller device.
+ * @flash_node:		point to a device node describing this flash instance.
  * @page_size:		the page size of the SPI NOR
  * @addr_width:		number of address bytes
  * @erase_opcode:	the opcode for erasing a sector
@@ -174,6 +175,7 @@ struct spi_nor {
 	struct mtd_info		*mtd;
 	struct mutex		lock;
 	struct device		*dev;
+	struct device_node	*flash_node;
 	u32			page_size;
 	u8			addr_width;
 	u8			erase_opcode;
-- 
2.1.4
