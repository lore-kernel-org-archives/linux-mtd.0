Received: from mail-we0-f179.google.com ([74.125.82.179])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMcM-0008E1-2m
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:54 +0000
Received: by mail-we0-f179.google.com with SMTP id x48so81213wes.10
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:21:28 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 37/47] mtd: nand: stm_nand_bch: fetch the bit-flips threshold
Date: Tue, 25 Mar 2014 08:19:54 +0000
Message-Id: <1395735604-26706-38-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
Cc: angus.clark@st.com, kernel@stlinux.com, lee.jones@linaro.org,
 linux-mtd@lists.infradead.org, pekon@ti.com, computersforpeace@gmail.com,
 dwmw2@infradead.org
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
index a0f0ae2..3853e7a 100644
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
@@ -1843,6 +1849,21 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
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
