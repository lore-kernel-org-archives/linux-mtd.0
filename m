Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ahx9U-00018o-OG
 for linux-mtd@lists.infradead.org; Mon, 21 Mar 2016 10:33:38 +0000
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: <computersforpeace@gmail.com>, <linux-mtd@lists.infradead.org>
CC: <nicolas.ferre@atmel.com>, <boris.brezillon@free-electrons.com>,
 <marex@denx.de>, <linux-kernel@vger.kernel.org>, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>
Subject: [PATCH 1/1] mtd: spi-nor: add an alternative method to support memory
 >16MiB
Date: Mon, 21 Mar 2016 11:33:49 +0100
Message-ID: <1458556429-11741-1-git-send-email-cyrille.pitchen@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch provides an alternative mean to support memory above 16MiB
(128Mib) by replacing 3byte address op codes by their associated 4byte
address versions.

Using the dedicated 4byte address op codes doesn't change the internal
state of the SPI NOR memory as opposed to using other means such as
updating a Base Address Register (BAR) and sending command to enter/leave
the 4byte mode.

Hence when a CPU reset occurs, early bootloaders don't need to be aware
of BAR value or 4byte mode being enabled: they can still access the first
16MiB of the SPI NOR memory using the regular 3byte address op codes.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---

Hi all,

This patch was tested on a sama5d2 xplained board + Macronix mx25l25635e.

Best regards,

Cyrille

 drivers/mtd/spi-nor/Kconfig   |  12 +++++
 drivers/mtd/spi-nor/spi-nor.c | 105 +++++++++++++++++++++++++++++++++---------
 include/linux/mtd/spi-nor.h   |  23 ++++++---
 3 files changed, 113 insertions(+), 27 deletions(-)

diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
index d42c98e1f581..7fae36fc8526 100644
--- a/drivers/mtd/spi-nor/Kconfig
+++ b/drivers/mtd/spi-nor/Kconfig
@@ -29,6 +29,18 @@ config MTD_SPI_NOR_USE_4K_SECTORS
 	  Please note that some tools/drivers/filesystems may not work with
 	  4096 B erase size (e.g. UBIFS requires 15 KiB as a minimum).
 
+config MTD_SPI_NOR_USE_4B_OPCODES
+	bool "Use 4-byte address op codes"
+	default n
+	help
+	  This is an alternative to the "Enter/Exit 4-byte mode" commands and
+	  Base Address Register (BAR) updates to support flash size above 16MiB.
+	  Using dedicated 4-byte address op codes for (Fast) Read, Page Program
+	  and Sector Erase operations avoids changing the internal state of the
+	  SPI NOR memory. Hence if a CPU reset occurs, early bootloaders can
+	  still use regular 3-byte address op codes and read from the very first
+	  16MiB of the flash memory.
+
 config SPI_FSL_QUADSPI
 	tristate "Freescale Quad SPI controller"
 	depends on ARCH_MXC || SOC_LS1021A || ARCH_LAYERSCAPE || COMPILE_TEST
diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 157841dc3e99..b33b6a1b7b4d 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -188,6 +188,81 @@ static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 	return mtd->priv;
 }
 
+
+struct spi_nor_address_entry {
+	u8	src_opcode;
+	u8	dst_opcode;
+};
+
+static u8 spi_nor_convert_opcode(u8 opcode,
+				 const struct spi_nor_address_entry *entries,
+				 size_t num_entries)
+{
+	int min, max;
+
+	min = 0;
+	max = num_entries - 1;
+	while (min <= max) {
+		int mid = (min + max) >> 1;
+		const struct spi_nor_address_entry *entry = &entries[mid];
+
+		if (opcode == entry->src_opcode)
+			return entry->dst_opcode;
+
+		if (opcode < entry->src_opcode)
+			max = mid - 1;
+		else
+			min = mid + 1;
+	}
+
+	/* No conversion found */
+	return opcode;
+}
+
+static u8 spi_nor_3to4_opcode(u8 opcode)
+{
+	/* MUST be sorted by 3byte opcode */
+#define ENTRY_3TO4(_opcode)	{ _opcode, _opcode##_4B }
+	static const struct spi_nor_address_entry spi_nor_3to4_table[] = {
+		ENTRY_3TO4(SPINOR_OP_PP),		/* 0x02 */
+		ENTRY_3TO4(SPINOR_OP_READ),		/* 0x03 */
+		ENTRY_3TO4(SPINOR_OP_READ_FAST),	/* 0x0b */
+		ENTRY_3TO4(SPINOR_OP_BE_4K),		/* 0x20 */
+		ENTRY_3TO4(SPINOR_OP_QUAD_PP),		/* 0x32 */
+		ENTRY_3TO4(SPINOR_OP_QUAD_PP_MX),	/* 0x38 */
+		ENTRY_3TO4(SPINOR_OP_READ_1_1_2),	/* 0x3b */
+		ENTRY_3TO4(SPINOR_OP_READ_1_1_4),	/* 0x6b */
+		ENTRY_3TO4(SPINOR_OP_READ_1_2_2),	/* 0xbb */
+		ENTRY_3TO4(SPINOR_OP_SE),		/* 0xd8 */
+		ENTRY_3TO4(SPINOR_OP_READ_1_4_4),	/* 0xeb */
+	};
+#undef ENTRY_3TO4
+
+	return spi_nor_convert_opcode(opcode, spi_nor_3to4_table,
+				      ARRAY_SIZE(spi_nor_3to4_table));
+}
+
+static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
+				      const struct flash_info *info)
+{
+	/* Do some manufacturer fixups first */
+	switch (JEDEC_MFR(info)) {
+	case SNOR_MFR_SPANSION:
+		/* No small sector erase for 4-byte command set */
+		nor->erase_opcode = SPINOR_OP_SE;
+		nor->mtd.erasesize = info->sector_size;
+		break;
+
+	default:
+		break;
+	}
+
+	nor->read_opcode	= spi_nor_3to4_opcode(nor->read_opcode);
+	nor->program_opcode	= spi_nor_3to4_opcode(nor->program_opcode);
+	nor->erase_opcode	= spi_nor_3to4_opcode(nor->erase_opcode);
+}
+
+#ifndef CONFIG_MTD_SPI_NOR_USE_4B_OPCODES
 /* Enable/disable 4-byte addressing mode. */
 static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 			    int enable)
@@ -217,6 +292,8 @@ static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
 		return nor->write_reg(nor, SPINOR_OP_BRWR, nor->cmd_buf, 1);
 	}
 }
+#endif /* !CONFIG_MTD_SPI_NOR_USE_4B_OPCODES */
+
 static inline int spi_nor_sr_ready(struct spi_nor *nor)
 {
 	int sr = read_sr(nor);
@@ -1421,28 +1498,14 @@ int spi_nor_scan(struct spi_nor *nor, const char *name, enum read_mode mode)
 	else if (mtd->size > 0x1000000) {
 		/* enable 4-byte addressing if the device exceeds 16MiB */
 		nor->addr_width = 4;
-		if (JEDEC_MFR(info) == SNOR_MFR_SPANSION) {
-			/* Dedicated 4-byte command set */
-			switch (nor->flash_read) {
-			case SPI_NOR_QUAD:
-				nor->read_opcode = SPINOR_OP_READ4_1_1_4;
-				break;
-			case SPI_NOR_DUAL:
-				nor->read_opcode = SPINOR_OP_READ4_1_1_2;
-				break;
-			case SPI_NOR_FAST:
-				nor->read_opcode = SPINOR_OP_READ4_FAST;
-				break;
-			case SPI_NOR_NORMAL:
-				nor->read_opcode = SPINOR_OP_READ4;
-				break;
-			}
-			nor->program_opcode = SPINOR_OP_PP_4B;
-			/* No small sector erase for 4-byte command set */
-			nor->erase_opcode = SPINOR_OP_SE_4B;
-			mtd->erasesize = info->sector_size;
-		} else
+#ifndef CONFIG_MTD_SPI_NOR_USE_4B_OPCODES
+		if (JEDEC_MFR(info) != SNOR_MFR_SPANSION) {
 			set_4byte(nor, info, 1);
+		} else
+#endif
+		{
+			spi_nor_set_4byte_opcodes(nor, info);
+		}
 	} else {
 		nor->addr_width = 3;
 	}
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 3c36113a88e1..749f72d3021d 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -42,9 +42,12 @@
 #define SPINOR_OP_WRSR		0x01	/* Write status register 1 byte */
 #define SPINOR_OP_READ		0x03	/* Read data bytes (low frequency) */
 #define SPINOR_OP_READ_FAST	0x0b	/* Read data bytes (high frequency) */
-#define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual SPI) */
-#define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad SPI) */
+#define SPINOR_OP_READ_1_1_2	0x3b	/* Read data bytes (Dual Output SPI) */
+#define SPINOR_OP_READ_1_2_2	0xbb	/* Read data bytes (Dual I/O SPI) */
+#define SPINOR_OP_READ_1_1_4	0x6b	/* Read data bytes (Quad Output SPI) */
+#define SPINOR_OP_READ_1_4_4	0xeb	/* Read data bytes (Quad I/O SPI) */
 #define SPINOR_OP_PP		0x02	/* Page program (up to 256 bytes) */
+#define SPINOR_OP_QUAD_PP	0x32	/* Quad page program */
 #define SPINOR_OP_BE_4K		0x20	/* Erase 4KiB block */
 #define SPINOR_OP_BE_4K_PMC	0xd7	/* Erase 4KiB block on PMC chips */
 #define SPINOR_OP_BE_32K	0x52	/* Erase 32KiB block */
@@ -55,11 +58,15 @@
 #define SPINOR_OP_RDFSR		0x70	/* Read flag status register */
 
 /* 4-byte address opcodes - used on Spansion and some Macronix flashes. */
-#define SPINOR_OP_READ4		0x13	/* Read data bytes (low frequency) */
-#define SPINOR_OP_READ4_FAST	0x0c	/* Read data bytes (high frequency) */
-#define SPINOR_OP_READ4_1_1_2	0x3c	/* Read data bytes (Dual SPI) */
-#define SPINOR_OP_READ4_1_1_4	0x6c	/* Read data bytes (Quad SPI) */
+#define SPINOR_OP_READ_4B	0x13	/* Read data bytes (low frequency) */
+#define SPINOR_OP_READ_FAST_4B	0x0c	/* Read data bytes (high frequency) */
+#define SPINOR_OP_READ_1_1_2_4B	0x3c	/* Read data bytes (Dual Output SPI) */
+#define SPINOR_OP_READ_1_2_2_4B	0xbc	/* Read data bytes (Dual I/O SPI) */
+#define SPINOR_OP_READ_1_1_4_4B	0x6c	/* Read data bytes (Quad Output SPI) */
+#define SPINOR_OP_READ_1_4_4_4B	0xec	/* Read data bytes (Quad I/O SPI) */
 #define SPINOR_OP_PP_4B		0x12	/* Page program (up to 256 bytes) */
+#define SPINOR_OP_QUAD_PP_4B	0x34	/* Quad page program */
+#define SPINOR_OP_BE_4K_4B	0x21	/* Erase 4KiB block */
 #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
 /* Used for SST flashes only. */
@@ -71,6 +78,10 @@
 #define SPINOR_OP_EN4B		0xb7	/* Enter 4-byte mode */
 #define SPINOR_OP_EX4B		0xe9	/* Exit 4-byte mode */
 
+/* Used for Macronix flashes only. */
+#define SPINOR_OP_QUAD_PP_MX	0x38	/* Quad page program */
+#define SPINOR_OP_QUAD_PP_MX_4B	0x3e	/* Quad page program */
+
 /* Used for Spansion flashes only. */
 #define SPINOR_OP_BRWR		0x17	/* Bank register write */
 
-- 
1.8.2.2
