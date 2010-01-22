Received: from ey-out-1920.google.com ([74.125.78.148])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NYQsw-00019w-3e
	for linux-mtd@lists.infradead.org; Fri, 22 Jan 2010 21:17:46 +0000
Received: by ey-out-1920.google.com with SMTP id 26so365187eyw.26
	for <linux-mtd@lists.infradead.org>;
	Fri, 22 Jan 2010 13:17:40 -0800 (PST)
Message-ID: <4B5A172C.2010609@gmail.com>
Date: Fri, 22 Jan 2010 22:22:52 +0100
From: Roel Kluin <roel.kluin@gmail.com>
MIME-Version: 1.0
To: Leo Chen <leochen@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-mtd@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH] mtd: hot spin and code duplication in
	nand_bcm_umi_bch_read_oobEcc()
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

In the branch where pagesize equalled NAND_DATA_ACCESS_SIZE, NumToRead
wasn't decremented in the `while (numToRead > 11)' loop.
Also the first and last while loops were duplicated in both branches.

Signed-off-by: Roel Kluin <roel.kluin@gmail.com>
---
 drivers/mtd/nand/nand_bcm_umi.h |   71 ++++++++++++++-------------------------
 1 files changed, 25 insertions(+), 46 deletions(-)

diff --git a/drivers/mtd/nand/nand_bcm_umi.h b/drivers/mtd/nand/nand_bcm_umi.h
index 7cec2cd..198b304 100644
--- a/drivers/mtd/nand/nand_bcm_umi.h
+++ b/drivers/mtd/nand/nand_bcm_umi.h
@@ -167,18 +167,27 @@ static inline void nand_bcm_umi_bch_read_oobEcc(uint32_t pageSize,
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
 
@@ -190,6 +199,7 @@ static inline void nand_bcm_umi_bch_read_oobEcc(uint32_t pageSize,
 #else
 			eccCalc[eccPos++] = REG_NAND_DATA8;
 #endif
+			numToRead--;
 		}
 
 		nand_bcm_umi_bch_pause_read_ecc_calc();
@@ -204,49 +214,18 @@ static inline void nand_bcm_umi_bch_read_oobEcc(uint32_t pageSize,
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
+	}
+	/* read ECC bytes */
+	nand_bcm_umi_bch_resume_read_ecc_calc();
+	while (numToRead) {
 #if defined(__KERNEL__) && !defined(STANDALONE)
-		*oobp++ = REG_NAND_DATA8;
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
 
