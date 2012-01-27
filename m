Received: from mail-pw0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RqmjR-0007KX-S9
 for linux-mtd@lists.infradead.org; Fri, 27 Jan 2012 14:24:50 +0000
Received: by pbdx9 with SMTP id x9so2050943pbd.36
 for <linux-mtd@lists.infradead.org>; Fri, 27 Jan 2012 06:24:48 -0800 (PST)
From: Akinobu Mita <akinobu.mita@gmail.com>
To: linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org
Subject: [PATCH] mtd/nand: use string library
Date: Fri, 27 Jan 2012 23:24:49 +0900
Message-Id: <1327674295-3700-2-git-send-email-akinobu.mita@gmail.com>
In-Reply-To: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
References: <1327674295-3700-1-git-send-email-akinobu.mita@gmail.com>
Cc: linux-mtd@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>, Akinobu Mita <akinobu.mita@gmail.com>,
 Jiandong Zheng <jdzheng@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

- Use memchr_inv to check if the data contains all 0xFF bytes.
  It is faster than looping for each byte.

- Use memcmp to compare memory areas

Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
Cc: Jiandong Zheng <jdzheng@broadcom.com>
Cc: Scott Branden <sbranden@broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
---
 drivers/mtd/nand/davinci_nand.c |    7 +++----
 drivers/mtd/nand/denali.c       |    7 +++----
 drivers/mtd/nand/diskonchip.c   |   18 +++---------------
 drivers/mtd/nand/nand_bbt.c     |   16 +++++-----------
 drivers/mtd/nand/nand_bcm_umi.c |   10 +++-------
 5 files changed, 17 insertions(+), 41 deletions(-)

diff --git a/drivers/mtd/nand/davinci_nand.c b/drivers/mtd/nand/davinci_nand.c
index 6e56615..423a7cc 100644
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -315,10 +315,9 @@ static int nand_davinci_correct_4bit(struct mtd_info *mtd,
 	unsigned long timeo;
 
 	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
-	for (i = 0; i < 10; i++) {
-		if (ecc_code[i] != 0xff)
-			goto compare;
-	}
+	if (memchr_inv(ecc_code, 0xff, 10))
+		goto compare;
+
 	return 0;
 
 compare:
diff --git a/drivers/mtd/nand/denali.c b/drivers/mtd/nand/denali.c
index 3984d48..a87e3a4 100644
--- a/drivers/mtd/nand/denali.c
+++ b/drivers/mtd/nand/denali.c
@@ -908,10 +908,9 @@ static void read_oob_data(struct mtd_info *mtd, uint8_t *buf, int page)
  */
 bool is_erased(uint8_t *buf, int len)
 {
-	int i = 0;
-	for (i = 0; i < len; i++)
-		if (buf[i] != 0xFF)
-			return false;
+	if (memchr_inv(buf, 0xFF, len))
+		return false;
+
 	return true;
 }
 #define ECC_SECTOR_SIZE 512
diff --git a/drivers/mtd/nand/diskonchip.c b/drivers/mtd/nand/diskonchip.c
index df921e7..bf0602e 100644
--- a/drivers/mtd/nand/diskonchip.c
+++ b/drivers/mtd/nand/diskonchip.c
@@ -945,12 +945,8 @@ static int doc200x_calculate_ecc(struct mtd_info *mtd, const u_char *dat, unsign
 		/* Note: this somewhat expensive test should not be triggered
 		   often.  It could be optimized away by examining the data in
 		   the writebuf routine, and remembering the result. */
-		for (i = 0; i < 512; i++) {
-			if (dat[i] == 0xff)
-				continue;
+		if (memchr_inv(dat, 0xff, 512))
 			emptymatch = 0;
-			break;
-		}
 	}
 	/* If emptymatch still =1, we do have an all-0xff data buffer.
 	   Return all-0xff ecc value instead of the computed one, so
@@ -1000,24 +996,16 @@ static int doc200x_correct_data(struct mtd_info *mtd, u_char *dat,
 		/* If emptymatch=1, the read syndrome is consistent with an
 		   all-0xff data and stored ecc block.  Check the stored ecc. */
 		if (emptymatch) {
-			for (i = 0; i < 6; i++) {
-				if (read_ecc[i] == 0xff)
-					continue;
+			if (memchr_inv(read_ecc, 0xff, 6))
 				emptymatch = 0;
-				break;
-			}
 		}
 		/* If emptymatch still =1, check the data block. */
 		if (emptymatch) {
 			/* Note: this somewhat expensive test should not be triggered
 			   often.  It could be optimized away by examining the data in
 			   the readbuf routine, and remembering the result. */
-			for (i = 0; i < 512; i++) {
-				if (dat[i] == 0xff)
-					continue;
+			if (memchr_inv(dat, 0xff, 512))
 				emptymatch = 0;
-				break;
-			}
 		}
 		/* If emptymatch still =1, this is almost certainly a freshly-
 		   erased block, in which case the ECC will not come out right.
diff --git a/drivers/mtd/nand/nand_bbt.c b/drivers/mtd/nand/nand_bbt.c
index 20a112f..a1b2dd5 100644
--- a/drivers/mtd/nand/nand_bbt.c
+++ b/drivers/mtd/nand/nand_bbt.c
@@ -100,10 +100,8 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
 
 	end = paglen + td->offs;
 	if (td->options & NAND_BBT_SCANEMPTY) {
-		for (i = 0; i < end; i++) {
-			if (p[i] != 0xff)
-				return -1;
-		}
+		if (memchr_inv(p, 0xff, end))
+			return -1;
 	}
 	p += end;
 
@@ -133,14 +131,10 @@ static int check_pattern(uint8_t *buf, int len, int paglen, struct nand_bbt_desc
  */
 static int check_short_pattern(uint8_t *buf, struct nand_bbt_descr *td)
 {
-	int i;
-	uint8_t *p = buf;
-
 	/* Compare the pattern */
-	for (i = 0; i < td->len; i++) {
-		if (p[td->offs + i] != td->pattern[i])
-			return -1;
-	}
+	if (memcmp(buf + td->offs, td->pattern, td->len))
+		return -1;
+
 	return 0;
 }
 
diff --git a/drivers/mtd/nand/nand_bcm_umi.c b/drivers/mtd/nand/nand_bcm_umi.c
index 46a6bc9..ad51dad 100644
--- a/drivers/mtd/nand/nand_bcm_umi.c
+++ b/drivers/mtd/nand/nand_bcm_umi.c
@@ -109,13 +109,9 @@ int nand_bcm_umi_bch_correct_page(uint8_t *datap, uint8_t *readEccData,
 	 * see if errors are correctible
 	 */
 	if ((regValue & REG_UMI_BCH_CTRL_STATUS_UNCORR_ERR) > 0) {
-		int i;
-
-		for (i = 0; i < numEccBytes; i++) {
-			if (readEccData[i] != 0xff) {
-				/* errors cannot be fixed, return -1 */
-				return -1;
-			}
+		if (memchr_inv(readEccData, 0xff, numEccBytes)) {
+			/* errors cannot be fixed, return -1 */
+			return -1;
 		}
 		/* If ECC is unprogrammed then we can't correct,
 		 * assume everything OK */
-- 
1.7.4.4
