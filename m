Received: from mail-wi0-f169.google.com ([209.85.212.169])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wfnld-0003su-QJ
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:59:02 +0000
Received: by mail-wi0-f169.google.com with SMTP id hi5so450239wib.2
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:39 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 47/47] mtd: nand: catch unsupported framework call-backs
Date: Thu,  1 May 2014 10:56:54 +0100
Message-Id: <1398938214-17847-48-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
References: <1398938214-17847-1-git-send-email-lee.jones@linaro.org>
Cc: Lee Jones <lee.jones@linaro.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, kernel@stlinux.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Display a BUG() message and return appropriate/expected value.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index e7a4bed..2ba1d05 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -1455,6 +1455,39 @@ static int bch_mtd_write_oob(struct mtd_info *mtd,
 	return 0;
 }
 
+static int bch_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			     uint8_t *buf, int oob_required, int page)
+{
+	BUG();
+	return 0;
+}
+
+static int bch_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+			      const uint8_t *buf, int oob_required)
+{
+	BUG();
+	return 0;
+}
+
+static void bch_hwctl(struct mtd_info *mtd, int mode)
+{
+	BUG();
+}
+
+static int bch_calculate(struct mtd_info *mtd, const uint8_t *dat,
+			 uint8_t *ecc_code)
+{
+	BUG();
+	return 0;
+}
+
+static int bch_correct(struct mtd_info *mtd, uint8_t *dat, uint8_t *read_ecc,
+		       uint8_t *calc_ecc)
+{
+	BUG();
+	return 0;
+}
+
 static int bch_block_isbad(struct mtd_info *mtd, loff_t offs, int getchip)
 {
 	struct nand_chip *chip = mtd->priv;
@@ -1612,10 +1645,16 @@ static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 	mtd->ecclayout = &info->ecclayout;
 	mtd->subpage_sft = 0;
 
+	chip->ecc.hwctl = bch_hwctl;
+	chip->ecc.calculate = bch_calculate;
+	chip->ecc.correct = bch_correct;
+
 	chip->ecc.read_oob = bch_mtd_read_oob;
 	chip->ecc.write_oob = bch_mtd_write_oob;
 
 	chip->ecc.read_page = bch_read;
+	chip->ecc.read_page_raw = bch_read_page_raw;
+	chip->ecc.write_page_raw = bch_write_page_raw;
 	chip->write_page = bch_write;
 	chip->erase = bch_erase;
 
-- 
1.8.3.2
