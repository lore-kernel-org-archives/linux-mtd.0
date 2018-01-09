Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by casper.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYqt4-0007RQ-Tu
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 10:12:14 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 5/8] mtd: nand: mxc: Fix failed/corrected values for v1
 controllers
Date: Tue,  9 Jan 2018 11:11:45 +0100
Message-Id: <20180109101148.13728-6-s.hauer@pengutronix.de>
In-Reply-To: <20180109101148.13728-1-s.hauer@pengutronix.de>
References: <20180109101148.13728-1-s.hauer@pengutronix.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

The v1 controller code has several flaws:
- We do not forward the number of corrected bitflips to the upper layers
- For 2k page NAND chips only the status results from the fourth subpage
  read are evaluated, so ECC failures in the other subpages remain
  uncovered
- When there are uncorrectable errors we have to increase the statistics
  counter, but still have to return successfully. Currently we return
  an error

This patch fixes this by introducing a v1 specific read_page function.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 78 +++++++++++++++++++++++++++++++++++----------
 1 file changed, 62 insertions(+), 16 deletions(-)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index d698f7c6666c..83bb01ab7079 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -738,22 +738,68 @@ static void mxc_nand_enable_hwecc(struct mtd_info *mtd, int mode)
 static int mxc_nand_correct_data_v1(struct mtd_info *mtd, u_char *dat,
 				 u_char *read_ecc, u_char *calc_ecc)
 {
+	return 0;
+}
+
+static int mxc_nand_read_page_v1(struct mtd_info *mtd, struct nand_chip *chip,
+				 void *buf, void *oob, bool ecc, int page)
+{
 	struct nand_chip *nand_chip = mtd_to_nand(mtd);
-	struct mxc_nand_host *host = nand_get_controller_data(nand_chip);
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+	unsigned int max_bitflips = 0;
+	int no_subpages;
+	int i;
 
-	/*
-	 * 1-Bit errors are automatically corrected in HW.  No need for
-	 * additional correction.  2-Bit errors cannot be corrected by
-	 * HW ECC, so we need to return failure
-	 */
-	uint16_t ecc_status = get_ecc_status_v1(host);
+	host->devtype_data->enable_hwecc(nand_chip, ecc);
+
+	host->devtype_data->send_cmd(host, NAND_CMD_READ0, false);
+	mxc_do_addr_cycle(mtd, 0, page);
+
+	if (mtd->writesize > 512)
+		host->devtype_data->send_cmd(host, NAND_CMD_READSTART, true);
 
-	if (((ecc_status & 0x3) == 2) || ((ecc_status >> 2) == 2)) {
-		dev_dbg(host->dev, "HWECC uncorrectable 2-bit ECC error\n");
-		return -EBADMSG;
+	no_subpages = mtd->writesize >> 9;
+
+	for (i = 0; i < no_subpages; i++) {
+		int flips = 0;
+		uint16_t ecc_stats;
+
+		/* NANDFC buffer 0 is used for page read/write */
+		writew((host->active_cs << 4) | i, NFC_V1_V2_BUF_ADDR);
+
+		writew(NFC_OUTPUT, NFC_V1_V2_CONFIG2);
+
+		/* Wait for operation to complete */
+		wait_op_done(host, true);
+
+		ecc_stats = get_ecc_status_v1(host);
+
+		ecc_stats >>= 2;
+
+		if (buf && ecc) {
+			switch (ecc_stats & 0x3) {
+			case 0:
+			default:
+				break;
+			case 1:
+				mtd->ecc_stats.corrected++;
+				flips++;
+				break;
+			case 2:
+				mtd->ecc_stats.failed++;
+				break;
+			}
+		}
+
+		max_bitflips = max_t(unsigned int, max_bitflips, flips);
 	}
 
-	return 0;
+	if (buf)
+		memcpy32_fromio(buf, host->main_area0, mtd->writesize);
+	if (oob)
+		copy_spare(mtd, true, oob);
+
+	return max_bitflips;
 }
 
 static int mxc_nand_correct_data_v2_v3(struct mtd_info *mtd, u_char *dat,
@@ -1494,6 +1540,7 @@ static struct nand_bbt_descr bbt_mirror_descr = {
 /* v1 + irqpending_quirk: i.MX21 */
 static const struct mxc_nand_devtype_data imx21_nand_devtype_data = {
 	.preset = preset_v1,
+	.read_page = mxc_nand_read_page_v1,
 	.send_cmd = send_cmd_v1_v2,
 	.send_addr = send_addr_v1_v2,
 	.send_page = send_page_v1,
@@ -1518,6 +1565,7 @@ static const struct mxc_nand_devtype_data imx21_nand_devtype_data = {
 /* v1 + !irqpending_quirk: i.MX27, i.MX31 */
 static const struct mxc_nand_devtype_data imx27_nand_devtype_data = {
 	.preset = preset_v1,
+	.read_page = mxc_nand_read_page_v1,
 	.send_cmd = send_cmd_v1_v2,
 	.send_addr = send_addr_v1_v2,
 	.send_page = send_page_v1,
@@ -1856,11 +1904,9 @@ static int mxcnd_probe(struct platform_device *pdev)
 
 	switch (this->ecc.mode) {
 	case NAND_ECC_HW:
-		if (host->devtype_data->read_page) {
-			this->ecc.read_page = mxc_nand_read_page;
-			this->ecc.read_page_raw = mxc_nand_read_page_raw;
-			this->ecc.read_oob = mxc_nand_read_oob;
-		}
+		this->ecc.read_page = mxc_nand_read_page;
+		this->ecc.read_page_raw = mxc_nand_read_page_raw;
+		this->ecc.read_oob = mxc_nand_read_oob;
 		this->ecc.calculate = mxc_nand_calculate_ecc;
 		this->ecc.hwctl = mxc_nand_enable_hwecc;
 		this->ecc.correct = host->devtype_data->correct_data;
-- 
2.11.0
