Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YTr7e-0003Uc-TK
 for linux-mtd@lists.infradead.org; Fri, 06 Mar 2015 12:12:56 +0000
From: rnd4@dave-tech.it
To: linux-mtd@lists.infradead.org
Subject: [PATCH 2/2] mtd: nand: use nand_chip badblockbits when checking bad
 block pattern
Date: Fri,  6 Mar 2015 13:12:18 +0100
Message-Id: <1425643938-24749-3-git-send-email-rnd4@dave-tech.it>
In-Reply-To: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
References: <1425643938-24749-1-git-send-email-rnd4@dave-tech.it>
Cc: boris.brezillon@free-electrons.com, Andrea Scian <andrea.scian@dave.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Andrea Scian <andrea.scian@dave.eu>

Use nand_chip->badblockbits like it's used inside nand_base.c when scanning
bad block markers.
This is particularly useful when using MLC NAND

Signed-off-by: Andrea Scian <andrea.scian@dave.eu>
---
 drivers/mtd/nand/nand_bbt.c |   19 ++++++++++++++++---
 include/linux/mtd/bbm.h     |    3 +++
 2 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 2672643..dba7f8b 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -127,9 +127,21 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
  */
 static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
 {
-	/* Compare the pattern */
-	if (memcmp(buf + td->offs, td->pattern, td->len))
-		return -1;
+	if (likely(td->toleratedbitdiff == 0)) {
+		/* Compare the pattern */
+		if (memcmp(buf + td->offs, td->pattern, td->len))
+			return -1;
+	} else {
+		int i, nbitdiff = 0;
+		uint8_t tmp;
+
+		for (i = 0; i < td->len; i++) {
+			tmp = buf[td->offs + i] ^ td->pattern[i];
+			nbitdiff += hweight8(tmp);
+			if (nbitdiff > td->toleratedbitdiff)
+				return -1;
+		}
+	}
 	return 0;
 }
 
@@ -1309,6 +1321,7 @@ static int nand_create_badblock_pattern(struct nand_chip *this)
 	bd->len = (this->options & NAND_BUSWIDTH_16) ? 2 : 1;
 	bd->pattern = scan_ff_pattern;
 	bd->options |= NAND_BBT_DYNAMICSTRUCT;
+	bd->toleratedbitdiff = 8-this->badblockbits;
 	this->badblock_pattern = bd;
 	return 0;
 }
diff --git a/include/linux/mtd/bbm.h b/include/linux/mtd/bbm.h
index 211ff67..0714337 100644
--- a/include/linux/mtd/bbm.h
+++ b/include/linux/mtd/bbm.h
@@ -48,6 +48,8 @@
  *              bad) block in the stored bbt
  * @pattern:	pattern to identify bad block table or factory marked good /
  *		bad blocks, can be NULL, if len = 0
+ * @toleratedbitdiff: number of tolerated bit difference (in a byte) between
+ *		pattern and buffer
  *
  * Descriptor for the bad block table marker and the descriptor for the
  * pattern which identifies good and bad blocks. The assumption is made
@@ -64,6 +66,7 @@ struct nand_bbt_descr {
 	int maxblocks;
 	int reserved_block_code;
 	uint8_t *pattern;
+	int toleratedbitdiff;
 };
 
 /* Options for the bad block table descriptors */
-- 
1.7.9.5
