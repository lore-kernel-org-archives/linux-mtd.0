Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127])
 by merlin.infradead.org with smtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S5F65-0006TF-AJ
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 11:31:59 +0000
From: Vipin Kumar <vipin.kumar@st.com>
To: <linux-mtd@lists.infradead.org>
Subject: [PATCH 01/18] nand/fsmc: Newly erased page read algorithm implemented
Date: Wed, 7 Mar 2012 17:00:49 +0530
Message-ID: <279c36d7ca1b849e2622fac18467ed70fb1970e9.1331119143.git.vipin.kumar@st.com>
In-Reply-To: <cover.1331119143.git.vipin.kumar@st.com>
References: <cover.1331119143.git.vipin.kumar@st.com>
MIME-Version: 1.0
Content-Type: text/plain
Cc: Vipin Kumar <vipin.kumar@st.com>, Artem.Bityutskiy@nokia.com,
 linus.walleij@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A newly erased page contains ff in data as well as spare area. While reading an
erased page, the read out ecc from spare area does not match the ecc generated
by fsmc ecc hardware accelerator. This is because ecc of data ff ff is not ff
ff. This leads to errors when file system erases and reads back the pages to
ensure consistency.

This patch adds a software workaround to ensure that the ecc check is not
performed for erased pages. This problem is solved by checking the number of
bits (in 512 byte data + 13 byte ecc) which are 0. If these number of bits are
less than 8, the page is considered erased and correction algorithm is not tried
on that page

Signed-off-by: Vipin Kumar <vipin.kumar@st.com>
---
 drivers/mtd/nand/fsmc_nand.c |   56 +++++++++++++++++++++++++++++++++++++++---
 1 files changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/fsmc_nand.c b/drivers/mtd/nand/fsmc_nand.c
index e53b760..9c7d9d8 100644
--- a/drivers/mtd/nand/fsmc_nand.c
+++ b/drivers/mtd/nand/fsmc_nand.c
@@ -391,6 +391,20 @@ static int fsmc_read_hwecc_ecc1(struct mtd_info *mtd, const uint8_t *data,
 	return 0;
 }
 
+/* Count the number of 0's in buff upto a max of max_bits */
+static int count_written_bits(uint8_t *buff, int size, int max_bits)
+{
+	int k, written_bits = 0;
+
+	for (k = 0; k < size; k++) {
+		written_bits += hweight8(~buff[k]);
+		if (written_bits > max_bits)
+			break;
+	}
+
+	return written_bits;
+}
+
 /*
  * fsmc_read_page_hwecc
  * @mtd:	mtd info structure
@@ -426,7 +440,6 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 	uint8_t *oob = (uint8_t *)&ecc_oob[0];
 
 	for (i = 0, s = 0; s < eccsteps; s++, i += eccbytes, p += eccsize) {
-
 		chip->cmdfunc(mtd, NAND_CMD_READ0, s * eccsize, page);
 		chip->ecc.hwctl(mtd, NAND_ECC_READ);
 		chip->read_buf(mtd, p, eccsize);
@@ -447,7 +460,7 @@ static int fsmc_read_page_hwecc(struct mtd_info *mtd, struct nand_chip *chip,
 			j += len;
 		}
 
-		memcpy(&ecc_code[i], oob, 13);
+		memcpy(&ecc_code[i], oob, chip->ecc.bytes);
 		chip->ecc.calculate(mtd, p, &ecc_calc[i]);
 
 		stat = chip->ecc.correct(mtd, p, &ecc_code[i], &ecc_calc[i]);
@@ -475,14 +488,49 @@ static int fsmc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 {
 	struct fsmc_nand_data *host = container_of(mtd,
 					struct fsmc_nand_data, mtd);
+	struct nand_chip *chip = mtd->priv;
 	struct fsmc_regs *regs = host->regs_va;
 	unsigned int bank = host->bank;
 	uint16_t err_idx[8];
 	uint64_t ecc_data[2];
 	uint32_t num_err, i;
 
+	num_err = (readl(&regs->bank_regs[bank].sts) >> 10) & 0xF;
+
+	/* no bit flipping */
+	if (likely(num_err == 0))
+		return 0;
+
+	/* too many errors */
+	if (unlikely(num_err > 8)) {
+		/*
+		 * This is a temporary erase check. A newly erased page read
+		 * would result in an ecc error because the oob data is also
+		 * erased to FF and the calculated ecc for an FF data is not
+		 * FF..FF.
+		 * This is a workaround to skip performing correction in case
+		 * data is FF..FF
+		 *
+		 * Logic:
+		 * For every page, each bit written as 0 is counted until these
+		 * number of bits are greater than 8 (the maximum correction
+		 * capability of FSMC for each 512 + 13 bytes)
+		 */
+
+		int bits_ecc = count_written_bits(read_ecc, chip->ecc.bytes, 8);
+		int bits_data = count_written_bits(dat, chip->ecc.size, 8);
+
+		if ((bits_ecc + bits_data) <= 8) {
+			if (bits_data)
+				memset(dat, 0xff, chip->ecc.size);
+			return bits_data;
+		}
+
+		return -EBADMSG;
+	}
+
 	/* The calculated ecc is actually the correction index in data */
-	memcpy(ecc_data, calc_ecc, 13);
+	memcpy(ecc_data, calc_ecc, chip->ecc.bytes);
 
 	/*
 	 * ------------------- calc_ecc[] bit wise -----------|--13 bits--|
@@ -513,7 +561,7 @@ static int fsmc_correct_data(struct mtd_info *mtd, uint8_t *dat,
 		change_bit(0, (unsigned long *)&err_idx[i]);
 		change_bit(1, (unsigned long *)&err_idx[i]);
 
-		if (err_idx[i] <= 512 * 8) {
+		if (err_idx[i] <= chip->ecc.size * 8) {
 			change_bit(err_idx[i], (unsigned long *)dat);
 			i++;
 		}
-- 
1.7.0.4
