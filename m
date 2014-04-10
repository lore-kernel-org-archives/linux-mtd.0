Received: from mail-ie0-x22b.google.com ([2607:f8b0:4001:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYKXf-0005vN-KM
 for linux-mtd@lists.infradead.org; Thu, 10 Apr 2014 19:21:44 +0000
Received: by mail-ie0-f171.google.com with SMTP id ar20so4446594iec.30
 for <linux-mtd@lists.infradead.org>; Thu, 10 Apr 2014 12:21:22 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v2 03/10] mtd: spi-nor: unify read opcode variants with ST SPI
 FSM
Date: Thu, 10 Apr 2014 12:20:57 -0700
Message-Id: <1397157664-24405-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
References: <1397157664-24405-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>, Huang Shijie <b32955@freescale.com>,
 Brian Norris <computersforpeace@gmail.com>, Lee Jones <lee.jones@linaro.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

serial_flash_cmds.h defines our opcodes a little differently. Let's
borrow its naming, since it's borrowed from the SFDP standard, and it's
more extensible.

This prepares us for merging serial_flash_cmds.h and spi-nor.h opcode
listing.

Signed-off-by: Brian Norris <computersforpeace@gmail.com>
Reviewed-by: Marek Vasut <marex@denx.de>
Acked-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 16 ++++++++--------
 include/linux/mtd/spi-nor.h   | 24 ++++++++++++++++--------
 2 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 1716f3ce9949..d6f44d527701 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1014,16 +1014,16 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 	/* Default commands */
 	switch (nor->flash_read) {
 	case SPI_NOR_QUAD:
-		nor->read_opcode = SPINOR_OP_QUAD_READ;
+		nor->read_opcode = SPINOR_OP_READ_1_1_4;
 		break;
 	case SPI_NOR_DUAL:
-		nor->read_opcode = SPINOR_OP_DUAL_READ;
+		nor->read_opcode = SPINOR_OP_READ_1_1_2;
 		break;
 	case SPI_NOR_FAST:
-		nor->read_opcode = SPINOR_OP_FAST_READ;
+		nor->read_opcode = SPINOR_OP_READ_FAST;
 		break;
 	case SPI_NOR_NORMAL:
-		nor->read_opcode = SPINOR_OP_NORM_READ;
+		nor->read_opcode = SPINOR_OP_READ;
 		break;
 	default:
 		dev_err(dev, "No Read opcode defined\n");
@@ -1041,16 +1041,16 @@ int spi_nor_scan(struct spi_nor *nor, const struct spi_device_id *id,
 			/* Dedicated 4-byte command set */
 			switch (nor->flash_read) {
 			case SPI_NOR_QUAD:
-				nor->read_opcode = SPINOR_OP_QUAD_READ_4B;
+				nor->read_opcode = SPINOR_OP_READ4_1_1_4;
 				break;
 			case SPI_NOR_DUAL:
-				nor->read_opcode = SPINOR_OP_DUAL_READ_4B;
+				nor->read_opcode = SPINOR_OP_READ4_1_1_2;
 				break;
 			case SPI_NOR_FAST:
-				nor->read_opcode = SPINOR_OP_FAST_READ_4B;
+				nor->read_opcode = SPINOR_OP_READ4_FAST;
 				break;
 			case SPI_NOR_NORMAL:
-				nor->read_opcode = SPINOR_OP_NORM_READ_4B;
+				nor->read_opcode = SPINOR_OP_READ4;
 				break;
 			}
 			nor->program_opcode = SPINOR_OP_PP_4B;
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f1fe1a6659a3..53241842a7ab 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -10,14 +10,22 @@
 #ifndef __LINUX_MTD_SPI_NOR_H
 #define __LINUX_MTD_SPI_NOR_H
 
+/*
+ * Note on opcode nomenclature: some opcodes have a format like
+ * SPINOR_OP_FUNCTION{4,}_x_y_z. The numbers x, y, and z stand for the number
+ * of I/O lines used for the opcode, address, and data (respectively). The
+ * FUNCTION has an optional suffix of '4', to represent an opcode which
+ * requires a 4-byte (32-bit) address.
+ */
+
 /* Flash opcodes. */
 #define SPINOR_OP_WREN		0x06	/* Write enable */
 #define SPINOR_OP_RDSR		0x05	/* Read status register */
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
-#define SPINOR_OP_NORM_READ	0x03	/* Read data bytes (low frequency) */
-#define SPINOR_OP_FAST_READ	0x0b	/* Read data bytes (high frequency) */
-#define SPINOR_OP_DUAL_READ	0x3b	/* Read data bytes (Dual SPI) */
-#define SPINOR_OP_QUAD_READ	0x6b	/* Read data bytes (Quad SPI) */
+#define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
+#define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
+#define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual SPI) */
+#define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad SPI) */
 #define SPINOR_OP_PP		0x02	/* Page program (up to 256 bytes) */
 #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
 #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
@@ -28,10 +36,10 @@
 #define SPINOR_OP_RDCR		0x35	/* Read configuration register */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
-#define SPINOR_OP_NORM_READ_4B	0x13	/* Read data bytes (low frequency) */
-#define SPINOR_OP_FAST_READ_4B	0x0c	/* Read data bytes (high frequency) */
-#define SPINOR_OP_DUAL_READ_4B	0x3c	/* Read data bytes (Dual SPI) */
-#define SPINOR_OP_QUAD_READ_4B	0x6c	/* Read data bytes (Quad SPI) */
+#define SPINOR_OP_READ4		0x13	/* Read data bytes (low frequency) */
+#define SPINOR_OP_READ4_FAST	0x0c	/* Read data bytes (high frequency) */
+#define SPINOR_OP_READ4_1_1_2	0x3c	/* Read data bytes (Dual SPI) */
+#define SPINOR_OP_READ4_1_1_4	0x6c	/* Read data bytes (Quad SPI) */
 #define SPINOR_OP_PP_4B		0x12	/* Page program (up to 256 bytes) */
 #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
-- 
1.8.3.2
