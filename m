Received: from 3.mo1.mail-out.ovh.net ([46.105.60.232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d0bz2-0007rj-Mm
 for linux-mtd@lists.infradead.org; Tue, 18 Apr 2017 22:52:46 +0000
Received: from player795.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id D60C068996
 for <linux-mtd@lists.infradead.org>; Wed, 19 Apr 2017 00:52:05 +0200 (CEST)
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
To: marek.vasut@gmail.com,
	linux-mtd@lists.infradead.org
Cc: computersforpeace@gmail.com, dwmw2@infradead.org,
 boris.brezillon@free-electrons.com, richard@nod.at,
 linux-kernel@vger.kernel.org, Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: [PATCH v7 4/4] mtd: spi-nor: introduce Octo SPI protocols
Date: Wed, 19 Apr 2017 00:51:19 +0200
Message-Id: <fa0c5c607bcc0916c0f8f66e24d717f326054573.1492554665.git.cyrille.pitchen@atmel.com>
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

This patch starts adding support to Octo SPI protocols (SPI x-y-8).

Op codes for Fast Read and/or Page Program operations using Octo SPI
protocols are not known yet (no JEDEC specification has defined them yet)
but we'd rather introduce the Octo SPI protocols now so it's done as it
should be.

Signed-off-by: Cyrille Pitchen <cyrille.pitchen@atmel.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 22 +++++++++++++++++++++-
 include/linux/mtd/spi-nor.h   | 26 +++++++++++++++++++++-----
 2 files changed, 42 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 9f0956d56dc9..5e664f80f3be 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -1527,6 +1527,12 @@ enum spi_nor_read_command_index {
 	SNOR_CMD_READ_4_4_4,
 	SNOR_CMD_READ_1_4_4_DTR,
 
+	/* Octo SPI */
+	SNOR_CMD_READ_1_1_8,
+	SNOR_CMD_READ_1_8_8,
+	SNOR_CMD_READ_8_8_8,
+	SNOR_CMD_READ_1_8_8_DTR,
+
 	SNOR_CMD_READ_MAX
 };
 
@@ -1538,6 +1544,11 @@ enum spi_nor_pp_command_index {
 	SNOR_CMD_PP_1_4_4,
 	SNOR_CMD_PP_4_4_4,
 
+	/* Octo SPI */
+	SNOR_CMD_PP_1_1_8,
+	SNOR_CMD_PP_1_8_8,
+	SNOR_CMD_PP_8_8_8,
+
 	SNOR_CMD_PP_MAX
 };
 
@@ -1662,6 +1673,10 @@ static int spi_nor_hwcaps_read2cmd(u32 hwcaps)
 		{ SNOR_HWCAPS_READ_1_4_4,	SNOR_CMD_READ_1_4_4 },
 		{ SNOR_HWCAPS_READ_4_4_4,	SNOR_CMD_READ_4_4_4 },
 		{ SNOR_HWCAPS_READ_1_4_4_DTR,	SNOR_CMD_READ_1_4_4_DTR },
+		{ SNOR_HWCAPS_READ_1_1_8,	SNOR_CMD_READ_1_1_8 },
+		{ SNOR_HWCAPS_READ_1_8_8,	SNOR_CMD_READ_1_8_8 },
+		{ SNOR_HWCAPS_READ_8_8_8,	SNOR_CMD_READ_8_8_8 },
+		{ SNOR_HWCAPS_READ_1_8_8_DTR,	SNOR_CMD_READ_1_8_8_DTR },
 	};
 
 	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_read2cmd,
@@ -1675,6 +1690,9 @@ static int spi_nor_hwcaps_pp2cmd(u32 hwcaps)
 		{ SNOR_HWCAPS_PP_1_1_4,		SNOR_CMD_PP_1_1_4 },
 		{ SNOR_HWCAPS_PP_1_4_4,		SNOR_CMD_PP_1_4_4 },
 		{ SNOR_HWCAPS_PP_4_4_4,		SNOR_CMD_PP_4_4_4 },
+		{ SNOR_HWCAPS_PP_1_1_8,		SNOR_CMD_PP_1_1_8 },
+		{ SNOR_HWCAPS_PP_1_8_8,		SNOR_CMD_PP_1_8_8 },
+		{ SNOR_HWCAPS_PP_8_8_8,		SNOR_CMD_PP_8_8_8 },
 	};
 
 	return spi_nor_hwcaps2cmd(hwcaps, hwcaps_pp2cmd,
@@ -1772,7 +1790,9 @@ static int spi_nor_setup(struct spi_nor *nor, const struct flash_info *info,
 	/* SPI n-n-n protocols are not supported yet. */
 	ignored_mask = (SNOR_HWCAPS_READ_2_2_2 |
 			SNOR_HWCAPS_READ_4_4_4 |
-			SNOR_HWCAPS_PP_4_4_4);
+			SNOR_HWCAPS_READ_8_8_8 |
+			SNOR_HWCAPS_PP_4_4_4 |
+			SNOR_HWCAPS_PP_8_8_8);
 	if (shared_mask & ignored_mask) {
 		dev_dbg(nor->dev,
 			"SPI n-n-n protocols are not supported yet.\n");
diff --git a/include/linux/mtd/spi-nor.h b/include/linux/mtd/spi-nor.h
index 5ed2872fe61a..86fd100c1a61 100644
--- a/include/linux/mtd/spi-nor.h
+++ b/include/linux/mtd/spi-nor.h
@@ -158,14 +158,18 @@ enum spi_nor_protocol {
 	SNOR_PROTO_1_1_1 = SNOR_PROTO_STR(1, 1, 1),
 	SNOR_PROTO_1_1_2 = SNOR_PROTO_STR(1, 1, 2),
 	SNOR_PROTO_1_1_4 = SNOR_PROTO_STR(1, 1, 4),
+	SNOR_PROTO_1_1_8 = SNOR_PROTO_STR(1, 1, 8),
 	SNOR_PROTO_1_2_2 = SNOR_PROTO_STR(1, 2, 2),
 	SNOR_PROTO_1_4_4 = SNOR_PROTO_STR(1, 4, 4),
+	SNOR_PROTO_1_8_8 = SNOR_PROTO_STR(1, 8, 8),
 	SNOR_PROTO_2_2_2 = SNOR_PROTO_STR(2, 2, 2),
 	SNOR_PROTO_4_4_4 = SNOR_PROTO_STR(4, 4, 4),
+	SNOR_PROTO_8_8_8 = SNOR_PROTO_STR(8, 8, 8),
 
 	SNOR_PROTO_1_1_1_DTR = SNOR_PROTO_DTR(1, 1, 1),
 	SNOR_PROTO_1_2_2_DTR = SNOR_PROTO_DTR(1, 2, 2),
 	SNOR_PROTO_1_4_4_DTR = SNOR_PROTO_DTR(1, 4, 4),
+	SNOR_PROTO_1_8_8_DTR = SNOR_PROTO_DTR(1, 8, 8),
 };
 
 static inline bool spi_nor_protocol_is_dtr(enum spi_nor_protocol proto)
@@ -302,10 +306,11 @@ struct spi_nor_hwcaps {
 /*
  *(Fast) Read capabilities.
  * MUST be ordered by priority: the higher bit position, the higher priority.
- * As a matter of performances, it is relevant to use Quad SPI protocols first,
- * then Dual SPI protocols before Fast Read and lastly (Slow) Read.
+ * As a matter of performances, it is relevant to use Octo SPI protocols first,
+ * then Quad SPI protocols before Dual SPI protocols, Fast Read and lastly
+ * (Slow) Read.
  */
-#define SNOR_HWCAPS_READ_MASK		GENMASK(10, 0)
+#define SNOR_HWCAPS_READ_MASK		GENMASK(14, 0)
 #define SNOR_HWCAPS_READ		BIT(0)
 #define SNOR_HWCAPS_READ_FAST		BIT(1)
 #define SNOR_HWCAPS_READ_1_1_1_DTR	BIT(2)
@@ -322,16 +327,22 @@ struct spi_nor_hwcaps {
 #define SNOR_HWCAPS_READ_4_4_4		BIT(9)
 #define SNOR_HWCAPS_READ_1_4_4_DTR	BIT(10)
 
+#define SNOR_HWCPAS_READ_OCTO		GENMASK(14, 11)
+#define SNOR_HWCAPS_READ_1_1_8		BIT(11)
+#define SNOR_HWCAPS_READ_1_8_8		BIT(12)
+#define SNOR_HWCAPS_READ_8_8_8		BIT(13)
+#define SNOR_HWCAPS_READ_1_8_8_DTR	BIT(14)
+
 /*
  * Page Program capabilities.
  * MUST be ordered by priority: the higher bit position, the higher priority.
- * Like (Fast) Read capabilities, Quad SPI protocols are preferred to the
+ * Like (Fast) Read capabilities, Octo/Quad SPI protocols are preferred to the
  * legacy SPI 1-1-1 protocol.
  * Note that Dual Page Programs are not supported because there is no existing
  * JEDEC/SFDP standard to define them. Also at this moment no SPI flash memory
  * implements such commands.
  */
-#define SNOR_HWCAPS_PP_MASK	GENMASK(19, 16)
+#define SNOR_HWCAPS_PP_MASK	GENMASK(22, 16)
 #define SNOR_HWCAPS_PP		BIT(16)
 
 #define SNOR_HWCAPS_PP_QUAD	GENMASK(19, 17)
@@ -339,6 +350,11 @@ struct spi_nor_hwcaps {
 #define SNOR_HWCAPS_PP_1_4_4	BIT(18)
 #define SNOR_HWCAPS_PP_4_4_4	BIT(19)
 
+#define SNOR_HWCAPS_PP_OCTO	GENMASK(22, 20)
+#define SNOR_HWCAPS_PP_1_1_8	BIT(20)
+#define SNOR_HWCAPS_PP_1_8_8	BIT(21)
+#define SNOR_HWCAPS_PP_8_8_8	BIT(22)
+
 /**
  * spi_nor_scan() - scan the SPI NOR
  * @nor:	the spi_nor structure
-- 
2.9.3
