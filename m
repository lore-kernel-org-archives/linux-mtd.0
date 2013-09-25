Received: from am1ehsobe001.messaging.microsoft.com ([213.199.154.204]
 helo=am1outboundpool.messaging.microsoft.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOjF0-0007RO-J4
 for linux-mtd@lists.infradead.org; Wed, 25 Sep 2013 07:10:37 +0000
From: Huang Shijie <b32955@freescale.com>
To: <dwmw2@infradead.org>
Subject: [PATCH v4 02/12] mtd: nand: rename the cellinfo to bits_per_cell
Date: Wed, 25 Sep 2013 14:58:11 +0800
Message-ID: <1380092301-21924-3-git-send-email-b32955@freescale.com>
In-Reply-To: <1380092301-21924-1-git-send-email-b32955@freescale.com>
References: <1380092301-21924-1-git-send-email-b32955@freescale.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Huang Shijie <b32955@freescale.com>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The @cellinfo fields contains unused information, such as write caching,
internal chip numbering, etc. But we only use it to check the SLC or MLC.

This patch tries to make it more clear and simple, renames the @cellinfo
to @bits_per_cell.

In order to avoiding the bisect issue, this patch also does the following
changes:
  (0) add a macro NAND_CI_CELLTYPE_SHIFT to avoid the hardcode.

  (1) add a helper to parse out the cell type : nand_get_bits_per_cell()

  (2) parse out the cell type for extended-ID chips and the full-id nand chips.

Signed-off-by: Huang Shijie <b32955@freescale.com>
---
 drivers/mtd/nand/nand_base.c |   14 ++++++++++++--
 include/linux/mtd/nand.h     |    7 ++++---
 2 files changed, 16 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index f256385..c84c35f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -3081,6 +3081,16 @@ static int nand_id_len(u8 *id_data, int arrlen)
 	return arrlen;
 }
 
+/* Extract the bits of per cell from the 3rd byte of the extended ID */
+static int nand_get_bits_per_cell(u8 cellinfo)
+{
+	int bits;
+
+	bits = cellinfo & NAND_CI_CELLTYPE_MSK;
+	bits >>= NAND_CI_CELLTYPE_SHIFT;
+	return bits + 1;
+}
+
 /*
  * Many new NAND share similar device ID codes, which represent the size of the
  * chip. The rest of the parameters must be decoded according to generic or
@@ -3091,7 +3101,7 @@ static void nand_decode_ext_id(struct mtd_info *mtd, struct nand_chip *chip,
 {
 	int extid, id_len;
 	/* The 3rd id byte holds MLC / multichip data */
-	chip->cellinfo = id_data[2];
+	chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 	/* The 4th id byte is the important one */
 	extid = id_data[3];
 
@@ -3291,7 +3301,7 @@ static bool find_full_id_nand(struct mtd_info *mtd, struct nand_chip *chip,
 		mtd->erasesize = type->erasesize;
 		mtd->oobsize = type->oobsize;
 
-		chip->cellinfo = id_data[2];
+		chip->bits_per_cell = nand_get_bits_per_cell(id_data[2]);
 		chip->chipsize = (uint64_t)type->chipsize << 20;
 		chip->options |= type->options;
 		chip->ecc_strength_ds = NAND_ECC_STRENGTH(type);
diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
index 5c05bab..0eb4a63 100644
--- a/include/linux/mtd/nand.h
+++ b/include/linux/mtd/nand.h
@@ -198,6 +198,7 @@ typedef enum {
 /* Cell info constants */
 #define NAND_CI_CHIPNR_MSK	0x03
 #define NAND_CI_CELLTYPE_MSK	0x0C
+#define NAND_CI_CELLTYPE_SHIFT	2
 
 /* Keep gcc happy */
 struct nand_chip;
@@ -477,7 +478,7 @@ struct nand_buffers {
  * @badblockbits:	[INTERN] minimum number of set bits in a good block's
  *			bad block marker position; i.e., BBM == 11110111b is
  *			not bad when badblockbits == 7
- * @cellinfo:		[INTERN] MLC/multichip data from chip ident
+ * @bits_per_cell:	[INTERN] the bits of per cell. i.e., 1 means SLC.
  * @ecc_strength_ds:	[INTERN] ECC correctability from the datasheet.
  *			Minimum amount of bit errors per @ecc_step_ds guaranteed
  *			to be correctable. If unknown, set to zero.
@@ -558,7 +559,7 @@ struct nand_chip {
 	int pagebuf;
 	unsigned int pagebuf_bitflips;
 	int subpagesize;
-	uint8_t cellinfo;
+	uint8_t bits_per_cell;
 	uint16_t ecc_strength_ds;
 	uint16_t ecc_step_ds;
 	int badblockpos;
@@ -802,6 +803,6 @@ static inline int onfi_get_sync_timing_mode(struct nand_chip *chip)
  */
 static inline bool nand_is_slc(struct nand_chip *chip)
 {
-	return !(chip->cellinfo & NAND_CI_CELLTYPE_MSK);
+	return chip->bits_per_cell == 1;
 }
 #endif /* __LINUX_MTD_NAND_H */
-- 
1.7.1
