Received: from co9ehsobe005.messaging.microsoft.com ([207.46.163.28]
 helo=co9outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaNJG-0003F8-5q
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 10:43:18 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [RFC PATCH] mtd: spi-nor: add DDR quad read support
Date: Wed, 16 Apr 2014 17:47:21 +0800
Message-ID: <1397641641-11430-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: marex@denx.de, angus.clark@st.com, Huang Shijie <b32955@freescale.com>,
 linux-mtd@lists.infradead.org, sourav.poddar@ti.com,
 computersforpeace@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch adds the DDR quad read support by the following:
  [1] add SPI_NOR_DDR_QUAD read mode.

  [2] add DDR Quad read opcode: SPINOR_OP_READ_1_4_4_D.

  [3] add set_ddr_quad_mode() to initialize for the DDR quad read.
      Currently it only works for Spansion NOR.

  [3] set the dummy with 8 for DDR quad read.
      _
Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c |   36 ++++++++++++++++++++++++++++++++++--
 include/linux/mtd/spi-nor.h   |    7 +++++--
 2 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index b88cc7e..6858e36 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -74,6 +74,11 @@ static int read_cr(struct spi_nor *nor)
 static inline int spi_nor_read_dummy_cycles(struct spi_nor *nor)
 {
 	switch (nor->flash_read) {
+	case SPI_NOR_DDR_QUAD:
+		/*
+		 * We set 8 for the DDR Quad read, the SPI NOR controller
+		 * can change it to 6 or 4 with DeviceTree property.
+		 */
 	case SPI_NOR_FAST:
 	case SPI_NOR_DUAL:
 	case SPI_NOR_QUAD:
@@ -402,6 +407,7 @@ struct flash_info {
 #define	SECT_4K_PMC		0x10	/* SPINOR_OP_BE_4K_PMC works uniformly */
 #define	SPI_NOR_DUAL_READ	0x20    /* Flash supports Dual Read */
 #define	SPI_NOR_QUAD_READ	0x40    /* Flash supports Quad Read */
+#define	SPI_NOR_DDR_QUAD_READ	0x80    /* Flash supports DDR Quad Read */
 };
 
 #define INFO(_jedec_id, _ext_id, _sector_size, _n_sectors, _flags)	\
@@ -846,6 +852,22 @@ static int spansion_quad_enable(struct spi_nor *nor)
 	return 0;
 }
 
+static int set_ddr_quad_mode(struct spi_nor *nor, u32 jedec_id)
+{
+	int status;
+
+	switch (JEDEC_MFR(jedec_id)) {
+	default: /* Spansion */
+		status = spansion_quad_enable(nor);
+		if (status) {
+			dev_err(nor->dev,
+				"Spansion DDR quad-read not enabled\n");
+			return -EINVAL;
+		}
+		return status;
+	}
+}
+
 static int set_quad_mode(struct spi_nor *nor, u32 jedec_id)
 {
 	int status;
@@ -1016,8 +1038,15 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	if (info->flags & SPI_NOR_NO_FR)
 		nor->flash_read = SPI_NOR_NORMAL;
 
-	/* Quad/Dual-read mode takes precedence over fast/normal */
-	if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
+	/* DDR Quad/Quad/Dual-read mode takes precedence over fast/normal */
+	if (mode == SPI_NOR_DDR_QUAD && info->flags & SPI_NOR_DDR_QUAD_READ) {
+		ret = set_ddr_quad_mode(nor, info->jedec_id);
+		if (ret) {
+			dev_err(dev, "DDR quad mode not supported\n");
+			return ret;
+		}
+		nor->flash_read = SPI_NOR_DDR_QUAD;
+	} else if (mode == SPI_NOR_QUAD && info->flags & SPI_NOR_QUAD_READ) {
 		ret = set_quad_mode(nor, info->jedec_id);
 		if (ret) {
 			dev_err(dev, "quad mode not supported\n");
@@ -1030,6 +1059,9 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 
 	/* Default commands */
 	switch (nor->flash_read) {
+	case SPI_NOR_DDR_QUAD:
+		nor->read_opcode = SPINOR_OP_READ_1_4_4_D;
+		break;
 	case SPI_NOR_QUAD:
 		nor->read_opcode = SPINOR_OP_READ_1_1_4;
 		break;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5324184..b3ada3e 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -12,10 +12,11 @@
 
 /*
  * Note on opcode nomenclature: some opcodes have a format like
- * SPINOR_OP_FUNCTION{4,}_x_y_z. The numbers x, y, and z stand for the number
+ * SPINOR_OP_FUNCTION{4,}_x_y_z{_D}. The numbers x, y, and z stand for the number
  * of I/O lines used for the opcode, address, and data (respectively). The
  * FUNCTION has an optional suffix of '4', to represent an opcode which
- * requires a 4-byte (32-bit) address.
+ * requires a 4-byte (32-bit) address. The suffix of 'D' stands for the
+ * DDR mode.
  */
 
 /* Flash opcodes. */
@@ -26,6 +27,7 @@
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
 #define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual SPI) */
 #define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad SPI) */
+#define SPINOR_OP_READ_1_4_4_D	0xed	/* Read data bytes (DDR Quad SPI) */
 #define SPINOR_OP_PP		0x02	/* Page program (up to 256 bytes) */
 #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
 #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
@@ -74,6 +76,7 @@ enum read_mode {
 	SPI_NOR_FAST,
 	SPI_NOR_DUAL,
 	SPI_NOR_QUAD,
+	SPI_NOR_DDR_QUAD,
 };
 
 /**
-- 
1.7.2.rc3
