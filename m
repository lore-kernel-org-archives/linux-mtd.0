Received: from eu1sys200aog120.obsmtp.com ([207.126.144.149])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F69-0006X6-HF
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:32:02 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 06/18] nand/fsmc: Improve the fsmc_correct_data() routine
Date: Wed, 7 Mar 2012 17:00:54 +0530
Message-ID: <0a8d660b6b7e99db8770459b85f8460e622102a3.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Armando Visconti <armando.visconti@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org, Vipin Kumar <vipin.kumar@st.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Armando Visconti <armando.visconti@st.com>

This patch improves the error correction routine for bch8
- Loop only up to number of errors detected
- Improve the error index calculation procedure

Additionally, it also renames the "correct" routine to indicate that it is bch8
specific

Signed-off-by: Armando Visconti <armando.visconti@st.com>
Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   38 +++++++++++++++++---------------------
 1 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index cfe15a6..5b217f2 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -587,7 +587,7 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 }
 
 /*
- * fsmc_correct_data
+ * fsmc_bch8_correct_data
  * @mtd:	mtd info structure
  * @dat:	buffer of read data
  * @read_ecc:	ecc read from device spare area
@@ -596,7 +596,7 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
  * calc_ecc is a 104 bit information containing maximum of 8 error
  * offset informations of 13 bits each in 512 bytes of read data.
  */
-static int fsmc_correct_data(struct mtd_info *mtd, uint8_t *dat,
+static int fsmc_bch8_correct_data(struct mtd_info *mtd, uint8_t *dat,
 			     uint8_t *read_ecc, uint8_t *calc_ecc)
 {
 	struct fsmc_nand_data *host = container_of(mtd,
@@ -605,8 +605,8 @@ static int fsmc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	struct fsmc_regs *regs = host->regs_va;
 	unsigned int bank = host->bank;
 	uint32_t err_idx[8];
-	uint64_t ecc_data[2];
 	uint32_t num_err, i;
+	uint32_t ecc1, ecc2, ecc3, ecc4;
 
 	num_err = (readl(&regs->bank_regs[bank].sts) >> 10) & 0xF;
 
@@ -642,9 +642,6 @@ static int fsmc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 		return -EBADMSG;
 	}
 
-	/* The calculated ecc is actually the correction index in data */
-	memcpy(ecc_data, calc_ecc, chip->ecc.bytes);
-
 	/*
 	 * ------------------- calc_ecc[] bit wise -----------|--13 bits--|
 	 * |---idx[7]--|--.....-----|---idx[2]--||---idx[1]--||---idx[0]--|
@@ -654,20 +651,19 @@ static int fsmc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 	 * uint64_t array and error offset indexes are populated in err_idx
 	 * array
 	 */
-	for (i = 0; i < 8; i++) {
-		if (i == 4) {
-			err_idx[4] = ((ecc_data[1] & 0x1) << 12) | ecc_data[0];
-			ecc_data[1] >>= 1;
-			continue;
-		}
-		err_idx[i] = (ecc_data[i/4] & 0x1FFF);
-		ecc_data[i/4] >>= 13;
-	}
-
-	num_err = (readl(&regs->bank_regs[bank].sts) >> 10) & 0xF;
-
-	if (num_err == 0xF)
-		return -EBADMSG;
+	ecc1 = readl(&regs->bank_regs[bank].ecc1);
+	ecc2 = readl(&regs->bank_regs[bank].ecc2);
+	ecc3 = readl(&regs->bank_regs[bank].ecc3);
+	ecc4 = readl(&regs->bank_regs[bank].sts);
+
+	err_idx[0] = (ecc1 >> 0) & 0x1FFF;
+	err_idx[1] = (ecc1 >> 13) & 0x1FFF;
+	err_idx[2] = (((ecc2 >> 0) & 0x7F) << 6) | ((ecc1 >> 26) & 0x3F);
+	err_idx[3] = (ecc2 >> 7) & 0x1FFF;
+	err_idx[4] = (((ecc3 >> 0) & 0x1) << 12) | ((ecc2 >> 20) & 0xFFF);
+	err_idx[5] = (ecc3 >> 1) & 0x1FFF;
+	err_idx[6] = (ecc3 >> 14) & 0x1FFF;
+	err_idx[7] = (((ecc4 >> 16) & 0xFF) << 5) | ((ecc3 >> 27) & 0x1F);
 
 	i = 0;
 	while (num_err--) {
@@ -829,7 +825,7 @@ static int __init fsmc_nand_probe(struct platform_device *pdev)
 	if (AMBA_REV_BITS(host->pid) >= 8) {
 		nand->ecc.read_page = fsmc_read_page_hwecc;
 		nand->ecc.calculate = fsmc_read_hwecc_ecc4;
-		nand->ecc.correct = fsmc_correct_data;
+		nand->ecc.correct = fsmc_bch8_correct_data;
 		nand->ecc.bytes = 13;
 	} else {
 		nand->ecc.calculate = fsmc_read_hwecc_ecc1;
-- 
1.7.0.4
