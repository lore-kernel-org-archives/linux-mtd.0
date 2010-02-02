Message-Id: <201002022243.o12MhBQF019185@imap1.linux-foundation.org>
Subject: [patch 4/5] mtd: hot spin and code duplication in
	nand_bcm_umi_bch_read_oobEcc()
To: dwmw2@infradead.org
From: akpm@linux-foundation.org
Date: Tue, 02 Feb 2010 14:43:11 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Cc: roel.kluin@gmail.com, akpm@linux-foundation.org,
	linux-mtd@lists.infradead.org, leochen@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Roel Kluin <roel.kluin@gmail.com>

In the branch where pagesize equalled NAND_DATA_ACCESS_SIZE, NumToRead
wasn't decremented in the `while (numToRead > 11)' loop.  Also the first
and last while loops were duplicated in both branches.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
Acked-by: Leo Chen <leochen@broadcom.com>
Cc: "Scott Branden" <sbranden@broadcom.com>
Cc: David Woodhouse <dwmw2@infradead.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 drivers/mtd/nand/nand_bcm_umi.h |   73 ++++++++++--------------------
 1 file changed, 26 insertions(+), 47 deletions(-)

diff -puN drivers/mtd/nand/nand_bcm_umi.h~mtd-hot-spin-and-code-duplication-in-nand_bcm_umi_bch_read_oobecc drivers/mtd/nand/nand_bcm_umi.h
--- a/drivers/mtd/nand/nand_bcm_umi.h~mtd-hot-spin-and-code-duplication-in-nand_bcm_umi_bch_read_oobecc
+++ a/drivers/mtd/nand/nand_bcm_umi.h
@@ -167,18 +167,27 @@ static inline void nand_bcm_umi_bch_read
 	int numToRead = 16;	/* There are 16 bytes per sector in the OOB */
 
 	/* ECC is already paused when this function is called */
+	if (pageSize != NAND_DATA_ACCESS_SIZE) {
+		/* skip BI */
+#if defined(__KERNEL__) && !defined(STANDALONE)
+		*oobp++ = REG_NAND_DATA8;
+#else
+		REG_NAND_DATA8;
+#endif
+		numToRead--;
+	}
 
-	if (pageSize == NAND_DATA_ACCESS_SIZE) {
-		while (numToRead > numEccBytes) {
-			/* skip free oob region */
+	while (numToRead > numEccBytes) {
+		/* skip free oob region */
 #if defined(__KERNEL__) && !defined(STANDALONE)
-			*oobp++ = REG_NAND_DATA8;
+		*oobp++ = REG_NAND_DATA8;
 #else
-			REG_NAND_DATA8;
+		REG_NAND_DATA8;
 #endif
-			numToRead--;
-		}
+		numToRead--;
+	}
 
+	if (pageSize == NAND_DATA_ACCESS_SIZE) {
 		/* read ECC bytes before BI */
 		nand_bcm_umi_bch_resume_read_ecc_calc();
 
@@ -190,6 +199,7 @@ static inline void nand_bcm_umi_bch_read
 #else
 			eccCalc[eccPos++] = REG_NAND_DATA8;
 #endif
+			numToRead--;
 		}
 
 		nand_bcm_umi_bch_pause_read_ecc_calc();
@@ -204,49 +214,18 @@ static inline void nand_bcm_umi_bch_read
 			numToRead--;
 		}
 
-		/* read ECC bytes */
-		nand_bcm_umi_bch_resume_read_ecc_calc();
-		while (numToRead) {
-#if defined(__KERNEL__) && !defined(STANDALONE)
-			*oobp = REG_NAND_DATA8;
-			eccCalc[eccPos++] = *oobp;
-			oobp++;
-#else
-			eccCalc[eccPos++] = REG_NAND_DATA8;
-#endif
-			numToRead--;
-		}
-	} else {
-		/* skip BI */
-#if defined(__KERNEL__) && !defined(STANDALONE)
-		*oobp++ = REG_NAND_DATA8;
+	}
+	/* read ECC bytes */
+	nand_bcm_umi_bch_resume_read_ecc_calc();
+	while (numToRead) {
+#if defined(__KERNEL__) && !defined(STANDALONE)
+		*oobp = REG_NAND_DATA8;
+		eccCalc[eccPos++] = *oobp;
+		oobp++;
 #else
-		REG_NAND_DATA8;
+		eccCalc[eccPos++] = REG_NAND_DATA8;
 #endif
 		numToRead--;
-
-		while (numToRead > numEccBytes) {
-			/* skip free oob region */
-#if defined(__KERNEL__) && !defined(STANDALONE)
-			*oobp++ = REG_NAND_DATA8;
-#else
-			REG_NAND_DATA8;
-#endif
-			numToRead--;
-		}
-
-		/* read ECC bytes */
-		nand_bcm_umi_bch_resume_read_ecc_calc();
-		while (numToRead) {
-#if defined(__KERNEL__) && !defined(STANDALONE)
-			*oobp = REG_NAND_DATA8;
-			eccCalc[eccPos++] = *oobp;
-			oobp++;
-#else
-			eccCalc[eccPos++] = REG_NAND_DATA8;
-#endif
-			numToRead--;
-		}
 	}
 }
 
_
