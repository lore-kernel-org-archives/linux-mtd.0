From: Xiaolei Li <xiaolei.li@mediatek.com>
To: <boris.brezillon@free-electrons.com>, <richard@nod.at>
CC: <matthias.bgg@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <rogercc.lin@mediatek.com>,
 <bayi.cheng@mediatek.com>, <jie.wu@mediatek.com>,
 <srv_heupstream@mediatek.com>, <xiaolei.li@mediatek.com>
Subject: [PATCH 5/5] mtd: nand: mtk: add ->setup_data_interface() hook
Date: Fri, 23 Jun 2017 15:12:28 +0800
Message-ID: <1498201948-39088-6-git-send-email-xiaolei.li@mediatek.com>
In-Reply-To: <1498201948-39088-1-git-send-email-xiaolei.li@mediatek.com>
References: <1498201948-39088-1-git-send-email-xiaolei.li@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Currently, we use the fixed ACC timing 0x10804211. This is not the best
setting for each case. Actually, MTK NAND controller can adapt ACC timings
dynamically according to nfi clock frequence.
Implement the ->setup_data_interface() hook to optimize driver performance.

Signed-off-by: Xiaolei Li <xiaolei.li@mediatek.com>
---
 drivers/mtd/nand/mtk_nand.c | 90 +++++++++++++++++++++++++++++++++++++--------
 1 file changed, 75 insertions(+), 15 deletions(-)

diff --git a/drivers/mtd/nand/mtk_nand.c b/drivers/mtd/nand/mtk_nand.c
index d51c58e..f7ae994 100644
--- a/drivers/mtd/nand/mtk_nand.c
+++ b/drivers/mtd/nand/mtk_nand.c
@@ -100,11 +100,15 @@
 #define MTK_MAX_SECTOR		(16)
 #define MTK_NAND_MAX_NSELS	(2)
 #define MTK_NFC_MIN_SPARE	(16)
+#define ACCTIMING(tpoecs, tprecs, tc2r, tw2r, twh, twst, trlt) \
+	((tpoecs) << 28 | (tprecs) << 22 | (tc2r) << 16 | \
+	(tw2r) << 12 | (twh) << 8 | (twst) << 4 | (trlt))
 
 struct mtk_nfc_caps {
 	const u8 *spare_size;
 	u8 num_spare_size;
 	u8 pageformat_spare_shift;
+	u8 nfi_clk_div;
 };
 
 struct mtk_nfc_bad_mark_ctl {
@@ -495,6 +499,74 @@ static void mtk_nfc_write_buf(struct mtd_info *mtd, const u8 *buf, int len)
 		mtk_nfc_write_byte(mtd, buf[i]);
 }
 
+static int mtk_nfc_setup_data_interface(struct mtd_info *mtd, int csline,
+					const struct nand_data_interface *conf)
+{
+	struct mtk_nfc *nfc = nand_get_controller_data(mtd_to_nand(mtd));
+	const struct nand_sdr_timings *timings;
+	u32 rate, tpoecs, tprecs, tc2r, tw2r, twh, twst, trlt;
+
+	timings = nand_get_sdr_timings(conf);
+	if (IS_ERR(timings))
+		return -ENOTSUPP;
+
+	if (csline == NAND_DATA_IFACE_CHECK_ONLY)
+		return 0;
+
+	rate = clk_get_rate(nfc->clk.nfi_clk);
+	/* There is a frequency divider in some IPs */
+	rate /= nfc->caps->nfi_clk_div;
+
+	/* turn clock rate into KHZ */
+	rate /= 1000;
+
+	tpoecs = max(timings->tALH_min, timings->tCLH_min) / 1000;
+	tpoecs = DIV_ROUND_UP(tpoecs * rate, 1000000);
+	tpoecs &= 0xf;
+
+	tprecs = max(timings->tCLS_min, timings->tALS_min) / 1000;
+	tprecs = DIV_ROUND_UP(tprecs * rate, 1000000);
+	tprecs &= 0x3f;
+
+	/* sdr interface has no tCR which means CE# low to RE# low */
+	tc2r = 0;
+
+	tw2r = timings->tWHR_min / 1000;
+	tw2r = DIV_ROUND_UP(tw2r * rate, 1000000);
+	tw2r = DIV_ROUND_UP(tw2r - 1, 2);
+	tw2r &= 0xf;
+
+	twh = max(timings->tREH_min, timings->tWH_min) / 1000;
+	twh = DIV_ROUND_UP(twh * rate, 1000000) - 1;
+	twh &= 0xf;
+
+	twst = timings->tWP_min / 1000;
+	twst = DIV_ROUND_UP(twst * rate, 1000000) - 1;
+	twst &= 0xf;
+
+	trlt = max(timings->tREA_max, timings->tRP_min) / 1000;
+	trlt = DIV_ROUND_UP(trlt * rate, 1000000) - 1;
+	trlt &= 0xf;
+
+	/*
+	 * ACCON: access timing control register
+	 * -------------------------------------
+	 * 31:28: tpoecs, minimum required time for CS post pulling down after
+	 *        accessing the device
+	 * 27:22: tprecs, minimum required time for CS pre pulling down before
+	 *        accessing the device
+	 * 21:16: tc2r, minimum required time from NCEB low to NREB low
+	 * 15:12: tw2r, minimum required time from NWEB high to NREB low.
+	 * 11:08: twh, write enable hold time
+	 * 07:04: twst, write wait states
+	 * 03:00: trlt, read wait states
+	 */
+	trlt = ACCTIMING(tpoecs, tprecs, tc2r, tw2r, twh, twst, trlt);
+	nfi_writel(nfc, trlt, NFI_ACCCON);
+
+	return 0;
+}
+
 static int mtk_nfc_sector_encode(struct nand_chip *chip, u8 *data)
 {
 	struct mtk_nfc *nfc = nand_get_controller_data(chip);
@@ -952,21 +1024,6 @@ static int mtk_nfc_read_oob_std(struct mtd_info *mtd, struct nand_chip *chip,
 static inline void mtk_nfc_hw_init(struct mtk_nfc *nfc)
 {
 	/*
-	 * ACCON: access timing control register
-	 * -------------------------------------
-	 * 31:28: minimum required time for CS post pulling down after accessing
-	 *	the device
-	 * 27:22: minimum required time for CS pre pulling down before accessing
-	 *	the device
-	 * 21:16: minimum required time from NCEB low to NREB low
-	 * 15:12: minimum required time from NWEB high to NREB low.
-	 * 11:08: write enable hold time
-	 * 07:04: write wait states
-	 * 03:00: read wait states
-	 */
-	nfi_writel(nfc, 0x10804211, NFI_ACCCON);
-
-	/*
 	 * CNRNB: nand ready/busy register
 	 * -------------------------------
 	 * 7:4: timeout register for polling the NAND busy/ready signal
@@ -1240,6 +1297,7 @@ static int mtk_nfc_nand_chip_init(struct device *dev, struct mtk_nfc *nfc,
 	nand->read_byte = mtk_nfc_read_byte;
 	nand->read_buf = mtk_nfc_read_buf;
 	nand->cmd_ctrl = mtk_nfc_cmd_ctrl;
+	nand->setup_data_interface = mtk_nfc_setup_data_interface;
 
 	/* set default mode in case dt entry is missing */
 	nand->ecc.mode = NAND_ECC_HW;
@@ -1330,12 +1388,14 @@ static int mtk_nfc_nand_chips_init(struct device *dev, struct mtk_nfc *nfc)
 	.spare_size = spare_size_mt2701,
 	.num_spare_size = 16,
 	.pageformat_spare_shift = 4,
+	.nfi_clk_div = 1,
 };
 
 static const struct mtk_nfc_caps mtk_nfc_caps_mt2712 = {
 	.spare_size = spare_size_mt2712,
 	.num_spare_size = 19,
 	.pageformat_spare_shift = 16,
+	.nfi_clk_div = 2,
 };
 
 static const struct of_device_id mtk_nfc_id_table[] = {
-- 
1.9.1
