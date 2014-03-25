Received: from mail-we0-f182.google.com ([74.125.82.182])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WSMbh-00025k-Cw
 for linux-mtd@lists.infradead.org; Tue, 25 Mar 2014 08:21:14 +0000
Received: by mail-we0-f182.google.com with SMTP id p61so74995wes.41
 for <linux-mtd@lists.infradead.org>; Tue, 25 Mar 2014 01:20:50 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC 17/47] mtd: nand: stm_nand_bch: automatically set EEC mode if
 requested
Date: Tue, 25 Mar 2014 08:19:34 +0000
Message-Id: <1395735604-26706-18-git-send-email-lee.jones@linaro.org>
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

Here we automatically select the strongest ECC scheme compatible with
the size of the OOB.

Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/mtd/nand/stm_nand_bch.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_bch.c
index f5a3e80..60a7800 100644
--- a/drivers/mtd/nand/stm_nand_bch.c
+++ b/drivers/mtd/nand/stm_nand_bch.c
@@ -32,6 +32,13 @@
 /* NANDi BCH Controller properties */
 #define NANDI_BCH_SECTOR_SIZE			1024
 
+/* BCH ECC sizes */
+static int bch_ecc_sizes[] = {
+	[BCH_18BIT_ECC] = 32,
+	[BCH_30BIT_ECC] = 54,
+	[BCH_NO_ECC] = 0,
+};
+
 /* Bad Block Table (BBT) */
 struct nandi_bbt_info {
 	uint32_t	bbt_size;		/* Size of bad-block table */
@@ -135,6 +142,25 @@ static void nandi_disable_interrupts(struct nandi_controller *nandi,
 	writel(val, nandi->base + NANDBCH_INT_EN);
 }
 
+/* Select strongest ECC scheme compatible with OOB size */
+static int bch_set_ecc_auto(struct nandi_controller *nandi,
+			    struct mtd_info *mtd)
+{
+	int oob_bytes_per_sector = mtd->oobsize / nandi->sectors_per_page;
+	int try_ecc_modes[] = { BCH_30BIT_ECC, BCH_18BIT_ECC, -1 };
+	int m, ecc_mode;
+
+	for (m = 0; try_ecc_modes[m] >= 0; m++) {
+		ecc_mode = try_ecc_modes[m];
+		if (oob_bytes_per_sector >= bch_ecc_sizes[ecc_mode]) {
+			nandi->bch_ecc_mode = ecc_mode;
+			return 0;
+		}
+	}
+
+	return -EINVAL;
+}
+
 static void nandi_set_mtd_defaults(struct nandi_controller *nandi,
 				   struct mtd_info *mtd, struct nand_chip *chip)
 {
@@ -792,6 +818,20 @@ static int stm_nand_bch_probe(struct platform_device *pdev)
 			     0x10000) ? true : false;
 	mtd->writebufsize = mtd->writesize;
 
+	/* Set ECC mode */
+	if (pdata->bch_ecc_cfg == BCH_ECC_AUTO) {
+		err = bch_set_ecc_auto(nandi, mtd);
+		if (err) {
+			dev_err(nandi->dev, "insufficient OOB for BCH ECC\n");
+			return err;
+		}
+	} else {
+		nandi->bch_ecc_mode = pdata->bch_ecc_cfg;
+	}
+
+	info->ecclayout.eccbytes =
+		nandi->sectors_per_page * bch_ecc_sizes[nandi->bch_ecc_mode];
+
 	return 0;
 }
 
-- 
1.8.3.2
