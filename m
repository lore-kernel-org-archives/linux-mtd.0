Received: from mail-qg0-x233.google.com ([2607:f8b0:400d:c04::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYgh7-0005N5-9u
 for linux-mtd@lists.infradead.org; Fri, 11 Apr 2014 19:00:58 +0000
Received: by mail-qg0-f51.google.com with SMTP id q108so5839593qgd.38
 for <linux-mtd@lists.infradead.org>; Fri, 11 Apr 2014 12:00:35 -0700 (PDT)
From: Brian Norris <computersforpeace@gmail.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 03/11] mtd: spi-nor: unify read opcode variants with ST SPI
 FSM
Date: Fri, 11 Apr 2014 11:59:58 -0700
Message-Id: <1397242806-7575-4-git-send-email-computersforpeace@gmail.com>
In-Reply-To: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
References: <1397242806-7575-1-git-send-email-computersforpeace@gmail.com>
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
v3: changed fsl-quadspi.c too (misplaced in v2)

 drivers/mtd/spi-nor/fsl-quadspi.c |  6 +++---
 drivers/mtd/spi-nor/spi-nor.c     | 16 ++++++++--------
 include/linux/mtd/spi-nor.h       | 24 ++++++++++++++++--------
 3 files changed, 27 insertions(+), 19 deletions(-)

diff --git a/drivers/mtd/spi-nor/fsl-quadspi.c b/drivers/mtd/spi-nor/fsl-quadspi.c
index 2977f026f39d..b41bbbc531ff 100644
--- a/drivers/mtd/spi-nor/fsl-quadspi.c
+++ b/drivers/mtd/spi-nor/fsl-quadspi.c
@@ -294,12 +294,12 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 	lut_base = SEQID_QUAD_READ * 4;
 
 	if (q->nor_size <= SZ_16M) {
-		cmd = SPINOR_OP_QUAD_READ;
+		cmd = SPINOR_OP_READ_1_1_4;
 		addrlen = ADDR24BIT;
 		dummy = 8;
 	} else {
 		/* use the 4-byte address */
-		cmd = SPINOR_OP_QUAD_READ;
+		cmd = SPINOR_OP_READ_1_1_4;
 		addrlen = ADDR32BIT;
 		dummy = 8;
 	}
@@ -388,7 +388,7 @@ static void fsl_qspi_init_lut(struct fsl_qspi *q)
 static int fsl_qspi_get_seqid(struct fsl_qspi *q, u8 cmd)
 {
 	switch (cmd) {
-	case SPINOR_OP_QUAD_READ:
+	case SPINOR_OP_READ_1_1_4:
 		return SEQID_QUAD_READ;
 	case SPINOR_OP_WREN:
 		return SEQID_WREN;
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
