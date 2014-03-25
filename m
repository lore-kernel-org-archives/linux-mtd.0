Received: from mail-wi0-f172.google.com ([209.85.212.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbi-0002Ay-KD
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:27 +0000
Received: by mail-wi0-f172.google.com with SMTP id hi5so3184190wib.5
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:52 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 18/47] mtd: nand: stm_nand_bch: ensure configuration is
 compatible with this driver
Date: Tue, 25 Mar 2014 08:19:35 +0000
Message-Id: <1395735604-26706-19-git-send-email-lee.jones@linaro.org>
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

Some chip characteristics have known incompatibilities with the function
of this driver. Here we check for this characteristics and refuse to run
if they are present.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 39 ++++++++++++++++++++++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index 60a7800..365a73b 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -142,6 +142,36 @@ static void nandi_disable_interrupts(struct nandi_controller *nandi,
 	writel(val, nandi->base + NANDBCH_INT_EN);
 }
 
+/*
+ * Initialisation
+ */
+static int bch_check_compatibility(struct nandi_controller *nandi,
+				   struct mtd_info *mtd,
+				   struct nand_chip *chip)
+{
+	if (chip->bits_per_cell > 1)
+		dev_warn(nandi->dev, "MLC NAND not fully supported\n");
+
+	if (chip->options & NAND_BUSWIDTH_16) {
+		dev_err(nandi->dev, "x16 NAND not supported\n");
+		return false;
+	}
+
+	if (nandi->blocks_per_device / 4 > mtd->writesize) {
+		/* Need to implement multi-page BBT support... */
+		dev_err(nandi->dev, "BBT too big to fit in single page\n");
+		return false;
+	}
+
+	if (bch_ecc_sizes[nandi->bch_ecc_mode] * nandi->sectors_per_page >
+	    mtd->oobsize) {
+		dev_err(nandi->dev, "insufficient OOB for selected ECC\n");
+		return false;
+	}
+
+	return true;
+}
+
 /* Select strongest ECC scheme compatible with OOB size */
 static int bch_set_ecc_auto(struct nandi_controller *nandi,
 			    struct mtd_info *mtd)
@@ -737,7 +767,7 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 	struct nandi_info *info;
 	struct nand_chip *chip;
 	struct mtd_info *mtd;
-	int err;
+	int compatible, err;
 
 	if (!pdata) {
 		if (!np) {
@@ -832,6 +862,13 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 	info->ecclayout.eccbytes =
 		nandi->sectors_per_page * bch_ecc_sizes[nandi->bch_ecc_mode];
 
+	compatible = bch_check_compatibility(nandi, mtd, chip);
+	if (!compatible) {
+		dev_err(nandi->dev,
+			"NAND device incompatible with NANDi/BCH Controller\n");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
1.8.3.2
