Received: from mail.bootlin.com ([62.4.15.54])
 by casper.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7iKe-0007ot-1u
 for linux-mtd@lists.infradead.org; Wed, 03 Oct 2018 14:40:58 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 linux-mtd@lists.infradead.org
Cc: Julien Su <juliensu@mxic.com.tw>, Mason Yang <masonccyang@mxic.com.tw>,
 <zhengxunli@mxic.com.tw>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Tudor Ambarus <tudor.ambarus@microchip.com>
Subject: [PATCH 2/8] mtd: spi-nor: Drop inline on all internal helpers
Date: Wed,  3 Oct 2018 16:40:37 +0200
Message-Id: <20181003144043.21529-3-boris.brezillon@bootlin.com>
In-Reply-To: <20181003144043.21529-1-boris.brezillon@bootlin.com>
References: <20181003144043.21529-1-boris.brezillon@bootlin.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

gcc should be smart enough to decide when inlining a function makes
sense. Drop all inline specifiers.

Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
---
 drivers/mtd/spi-nor/spi-nor.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
index 27ea10dc0395..470e15d2bc48 100644
--- a/drivers/mtd/spi-nor/spi-nor.c
+++ b/drivers/mtd/spi-nor/spi-nor.c
@@ -159,7 +159,7 @@ static int read_cr(struct spi_nor *nor)
  * Write status register 1 byte
  * Returns negative if error occurred.
  */
-static inline int write_sr(struct spi_nor *nor, u8 val)
+static int write_sr(struct spi_nor *nor, u8 val)
 {
 	nor->cmd_buf[0] = val;
 	return nor->write_reg(nor, SPINOR_OP_WRSR, nor->cmd_buf, 1);
@@ -169,7 +169,7 @@ static inline int write_sr(struct spi_nor *nor, u8 val)
  * Set write enable latch with Write Enable command.
  * Returns negative if error occurred.
  */
-static inline int write_enable(struct spi_nor *nor)
+static int write_enable(struct spi_nor *nor)
 {
 	return nor->write_reg(nor, SPINOR_OP_WREN, NULL, 0);
 }
@@ -177,12 +177,12 @@ static inline int write_enable(struct spi_nor *nor)
 /*
  * Send write disable instruction to the chip.
  */
-static inline int write_disable(struct spi_nor *nor)
+static int write_disable(struct spi_nor *nor)
 {
 	return nor->write_reg(nor, SPINOR_OP_WRDI, NULL, 0);
 }
 
-static inline struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
+static struct spi_nor *mtd_to_spi_nor(struct mtd_info *mtd)
 {
 	return mtd->priv;
 }
@@ -200,7 +200,7 @@ static u8 spi_nor_convert_opcode(u8 opcode, const u8 table[][2], size_t size)
 	return opcode;
 }
 
-static inline u8 spi_nor_convert_3to4_read(u8 opcode)
+static u8 spi_nor_convert_3to4_read(u8 opcode)
 {
 	static const u8 spi_nor_3to4_read[][2] = {
 		{ SPINOR_OP_READ,	SPINOR_OP_READ_4B },
@@ -219,7 +219,7 @@ static inline u8 spi_nor_convert_3to4_read(u8 opcode)
 				      ARRAY_SIZE(spi_nor_3to4_read));
 }
 
-static inline u8 spi_nor_convert_3to4_program(u8 opcode)
+static u8 spi_nor_convert_3to4_program(u8 opcode)
 {
 	static const u8 spi_nor_3to4_program[][2] = {
 		{ SPINOR_OP_PP,		SPINOR_OP_PP_4B },
@@ -231,7 +231,7 @@ static inline u8 spi_nor_convert_3to4_program(u8 opcode)
 				      ARRAY_SIZE(spi_nor_3to4_program));
 }
 
-static inline u8 spi_nor_convert_3to4_erase(u8 opcode)
+static u8 spi_nor_convert_3to4_erase(u8 opcode)
 {
 	static const u8 spi_nor_3to4_erase[][2] = {
 		{ SPINOR_OP_BE_4K,	SPINOR_OP_BE_4K_4B },
@@ -276,8 +276,8 @@ static void spi_nor_set_4byte_opcodes(struct spi_nor *nor,
 }
 
 /* Enable/disable 4-byte addressing mode. */
-static inline int set_4byte(struct spi_nor *nor, const struct flash_info *info,
-			    int enable)
+static int set_4byte(struct spi_nor *nor, const struct flash_info *info,
+		     int enable)
 {
 	int status;
 	bool need_wren = false;
@@ -333,7 +333,7 @@ static int s3an_sr_ready(struct spi_nor *nor)
 	return !!(val & XSR_RDY);
 }
 
-static inline int spi_nor_sr_ready(struct spi_nor *nor)
+static int spi_nor_sr_ready(struct spi_nor *nor)
 {
 	int sr = read_sr(nor);
 	if (sr < 0)
@@ -352,7 +352,7 @@ static inline int spi_nor_sr_ready(struct spi_nor *nor)
 	return !(sr & SR_WIP);
 }
 
-static inline int spi_nor_fsr_ready(struct spi_nor *nor)
+static int spi_nor_fsr_ready(struct spi_nor *nor)
 {
 	int fsr = read_fsr(nor);
 	if (fsr < 0)
@@ -2357,7 +2357,7 @@ struct sfdp_bfpt {
 
 /* Fast Read settings. */
 
-static inline void
+static void
 spi_nor_set_read_settings_from_bfpt(struct spi_nor_read_command *read,
 				    u16 half,
 				    enum spi_nor_protocol proto)
-- 
2.14.1
