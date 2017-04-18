Received: from 12.mo1.mail-out.ovh.net ([87.98.162.229])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0byt-0007jN-5G
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 22:52:24 +0000
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id 4B03768B85
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 00:51:57 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com,
	linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v7 3/4] mtd: spi-nor: introduce Double Transfer Rate (DTR) SPI
 protocols
Date: Wed, 19 Apr 2017 00:51:18 +0200
Message-Id: <be585167c61f5c057041b2079d477e0106e9be64.1492554665.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1492554665.git.cyrille.pitchen@atmel.com>
References: <cover.1492554665.git.cyrille.pitchen@atmel.com>
In-Reply-To: <cover.1492554665.git.cyrille.pitchen@atmel.com>
References: <cover.1492554665.git.cyrille.pitchen@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

This patch introduces support to Double Transfer Rate (DTR) SPI protocols.
DTR is used only for Fast Read operations.

According to manufacturer datasheets, whatever the number of I/O lines
used during instruction (x) and address/mode/dummy (y) clock cycles, DTR
is used only during data (z) clock cycles of SPI x-y-z protocols.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 10 +++++++++
 include/linux/mtd/spi-nor.h   | 48 +++++++++++++++++++++++++++++++++----------
 2 files changed, 47 insertions(+), 11 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 3421a42b4120..9f0956d56dc9 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -203,6 +203,10 @@ static inline u8 spi_nor_convert_3to4_read(u8 opcode)
 		{ SPINOR_OP_READ_1_2_2,	SPINOR_OP_READ_1_2_2_4B },
 		{ SPINOR_OP_READ_1_1_4,	SPINOR_OP_READ_1_1_4_4B },
 		{ SPINOR_OP_READ_1_4_4,	SPINOR_OP_READ_1_4_4_4B },
+
+		{ SPINOR_OP_READ_1_1_1_DTR,	SPINOR_OP_READ_1_1_1_DTR_4B },
+		{ SPINOR_OP_READ_1_2_2_DTR,	SPINOR_OP_READ_1_2_2_DTR_4B },
+		{ SPINOR_OP_READ_1_4_4_DTR,	SPINOR_OP_READ_1_4_4_DTR_4B },
 	};
 
 	return spi_nor_convert_opcode(opcode, spi_nor_3to4_read,
@@ -1509,16 +1513,19 @@ struct spi_nor_pp_command {
 enum spi_nor_read_command_index {
 	SNOR_CMD_READ,
 	SNOR_CMD_READ_FAST,
+	SNOR_CMD_READ_1_1_1_DTR,
 
 	/* Dual SPI */
 	SNOR_CMD_READ_1_1_2,
 	SNOR_CMD_READ_1_2_2,
 	SNOR_CMD_READ_2_2_2,
+	SNOR_CMD_READ_1_2_2_DTR,
 
 	/* Quad SPI */
 	SNOR_CMD_READ_1_1_4,
 	SNOR_CMD_READ_1_4_4,
 	SNOR_CMD_READ_4_4_4,
+	SNOR_CMD_READ_1_4_4_DTR,
 
 	SNOR_CMD_READ_MAX
 };
@@ -1646,12 +1653,15 @@ static int spi_nor_hwcaps_read2cmd(u32 hwcaps)
 	static const int hwcaps_read2cmd[][2] = {
 		{ SNOR_HWCAPS_READ,		SNOR_CMD_READ },
 		{ SNOR_HWCAPS_READ_FAST,	SNOR_CMD_READ_FAST },
+		{ SNOR_HWCAPS_READ_1_1_1_DTR,	SNOR_CMD_READ_1_1_1_DTR },
 		{ SNOR_HWCAPS_READ_1_1_2,	SNOR_CMD_READ_1_1_2 },
 		{ SNOR_HWCAPS_READ_1_2_2,	SNOR_CMD_READ_1_2_2 },
 		{ SNOR_HWCAPS_READ_2_2_2,	SNOR_CMD_READ_2_2_2 },
+		{ SNOR_HWCAPS_READ_1_2_2_DTR,	SNOR_CMD_READ_1_2_2_DTR },
 		{ SNOR_HWCAPS_READ_1_1_4,	SNOR_CMD_READ_1_1_4 },
 		{ SNOR_HWCAPS_READ_1_4_4,	SNOR_CMD_READ_1_4_4 },
 		{ SNOR_HWCAPS_READ_4_4_4,	SNOR_CMD_READ_4_4_4 },
+		{ SNOR_HWCAPS_READ_1_4_4_DTR,	SNOR_CMD_READ_1_4_4_DTR },
 	};
 
 	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_read2cmd,
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index f5e0db94e545..5ed2872fe61a 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -73,6 +73,15 @@
 #define SPINOR_OP_BE_32K_4B	0x5c	/* Erase 32KiB block */
 #define SPINOR_OP_SE_4B		0xdc	/* Sector erase (usually 64KiB) */
 
+/* Double Transfer Rate opcodes - defined in JEDEC JESD216B. */
+#define SPINOR_OP_READ_1_1_1_DTR	0x0d
+#define SPINOR_OP_READ_1_2_2_DTR	0xbd
+#define SPINOR_OP_READ_1_4_4_DTR	0xed
+
+#define SPINOR_OP_READ_1_1_1_DTR_4B	0x0e
+#define SPINOR_OP_READ_1_2_2_DTR_4B	0xbe
+#define SPINOR_OP_READ_1_4_4_DTR_4B	0xee
+
 /* Used for SST flashes only. */
 #define SPINOR_OP_BP		0x02	/* Byte program */
 #define SPINOR_OP_WRDI		0x04	/* Write disable */
@@ -135,10 +144,15 @@
 #define SNOR_PROTO_DATA(_nbits)	\
 	((((u32)(_nbits)) << SNOR_PROTO_DATA_SHIFT) & SNOR_PROTO_DATA_MASK)
 
+#define SNOR_PROTO_IS_DTR	BIT(24)	/* Double Transfer Rate */
+
 #define SNOR_PROTO_STR(_inst_nbits, _addr_nbits, _data_nbits)	\
 	(SNOR_PROTO_INST(_inst_nbits) |				\
 	 SNOR_PROTO_ADDR(_addr_nbits) |				\
 	 SNOR_PROTO_DATA(_data_nbits))
+#define SNOR_PROTO_DTR(_inst_nbits, _addr_nbits, _data_nbits)	\
+	(SNOR_PROTO_IS_DTR |					\
+	 SNOR_PROTO_STR(_inst_nbits, _addr_nbits, _data_nbits))
 
 enum spi_nor_protocol {
 	SNOR_PROTO_1_1_1 = SNOR_PROTO_STR(1, 1, 1),
@@ -148,8 +162,17 @@ enum spi_nor_protocol {
 	SNOR_PROTO_1_4_4 = SNOR_PROTO_STR(1, 4, 4),
 	SNOR_PROTO_2_2_2 = SNOR_PROTO_STR(2, 2, 2),
 	SNOR_PROTO_4_4_4 = SNOR_PROTO_STR(4, 4, 4),
+
+	SNOR_PROTO_1_1_1_DTR = SNOR_PROTO_DTR(1, 1, 1),
+	SNOR_PROTO_1_2_2_DTR = SNOR_PROTO_DTR(1, 2, 2),
+	SNOR_PROTO_1_4_4_DTR = SNOR_PROTO_DTR(1, 4, 4),
 };
 
+static inline bool spi_nor_protocol_is_dtr(enum spi_nor_protocol proto)
+{
+	return (proto & SNOR_PROTO_IS_DTR) == SNOR_PROTO_IS_DTR;
+}
+
 static inline u8 spi_nor_get_protocol_inst_nbits(enum spi_nor_protocol proto)
 {
 	return ((u32)(proto & SNOR_PROTO_INST_MASK)) >> SNOR_PROTO_INST_SHIFT;
@@ -282,19 +305,22 @@ struct spi_nor_hwcaps {
  * As a matter of performances, it is relevant to use Quad SPI protocols first,
  * then Dual SPI protocols before Fast Read and lastly (Slow) Read.
  */
-#define SNOR_HWCAPS_READ_MASK		GENMASK(7, 0)
+#define SNOR_HWCAPS_READ_MASK		GENMASK(10, 0)
 #define SNOR_HWCAPS_READ		BIT(0)
 #define SNOR_HWCAPS_READ_FAST		BIT(1)
-
-#define SNOR_HWCAPS_READ_DUAL		GENMASK(4, 2)
-#define SNOR_HWCAPS_READ_1_1_2		BIT(2)
-#define SNOR_HWCAPS_READ_1_2_2		BIT(3)
-#define SNOR_HWCAPS_READ_2_2_2		BIT(4)
-
-#define SNOR_HWCAPS_READ_QUAD		GENMASK(7, 5)
-#define SNOR_HWCAPS_READ_1_1_4		BIT(5)
-#define SNOR_HWCAPS_READ_1_4_4		BIT(6)
-#define SNOR_HWCAPS_READ_4_4_4		BIT(7)
+#define SNOR_HWCAPS_READ_1_1_1_DTR	BIT(2)
+
+#define SNOR_HWCAPS_READ_DUAL		GENMASK(6, 3)
+#define SNOR_HWCAPS_READ_1_1_2		BIT(3)
+#define SNOR_HWCAPS_READ_1_2_2		BIT(4)
+#define SNOR_HWCAPS_READ_2_2_2		BIT(5)
+#define SNOR_HWCAPS_READ_1_2_2_DTR	BIT(6)
+
+#define SNOR_HWCAPS_READ_QUAD		GENMASK(10, 7)
+#define SNOR_HWCAPS_READ_1_1_4		BIT(7)
+#define SNOR_HWCAPS_READ_1_4_4		BIT(8)
+#define SNOR_HWCAPS_READ_4_4_4		BIT(9)
+#define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
 
 /*
  * Page Program capabilities.
-- 
2.9.3
