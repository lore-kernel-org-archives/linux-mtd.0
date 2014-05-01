Received: from mail-we0-f180.google.com ([74.125.82.180])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WfnlQ-0003bP-Ub
 for linux-mtd@lists.infradead.org; Thu, 01 May 2014 09:58:49 +0000
Received: by mail-we0-f180.google.com with SMTP id t61so2823416wes.25
 for <linux-mtd@lists.infradead.org>; Thu, 01 May 2014 02:58:27 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 40/47] mtd: nand: stm_nand_bch: fetch the bit-flips threshold
Date: Thu,  1 May 2014 10:56:47 +0100
Message-Id: <1398938214-17847-41-git-send-email-lee.jones@linaro.org>
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

If none is provided by the platform, the default ECC mode will be used.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 0f96f75..e742655 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -44,6 +44,12 @@ static int bch_ecc_sizes[] = {
 	[BCH_NO_ECC] = 0,
 };
 
+static int bch_ecc_strength[] = {
+	[BCH_18BIT_ECC] = 18,
+	[BCH_30BIT_ECC] = 30,
+	[BCH_NO_ECC] = 0,
+};
+
 /*
  * Inband Bad Block Table (IBBT)
  */
@@ -2030,6 +2036,21 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 	info->ecclayout.eccbytes =
 		nandi->sectors_per_page * bch_ecc_sizes[nandi->bch_ecc_mode];
 
+	/*
+	 * Get bit-flips threshold. A value of '0' is interpreted as
+	 * <ecc_strength>.
+	 */
+	if (pdata->bch_bitflip_threshold) {
+		nandi->bitflip_threshold = pdata->bch_bitflip_threshold;
+	} else {
+		dev_warn(nandi->dev,
+			 "WARNING: bit-flips threshold not specified.\n"
+			 "         Defaulting to ECC strength [%d]\n",
+			 bch_ecc_strength[nandi->bch_ecc_mode]);
+		nandi->bitflip_threshold =
+			bch_ecc_strength[nandi->bch_ecc_mode];
+	}
+
 	compatible = bch_check_compatibility(nandi, mtd, chip);
 	if (!compatible) {
 		dev_err(nandi->dev,
-- 
1.8.3.2
