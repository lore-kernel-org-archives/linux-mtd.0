Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYqtJ-0007oh-8f
 for linux-mtd@lists.infradead.org; Tue, 09 Jan 2018 10:12:23 +0000
From: Sascha Hauer <s.hauer@pengutronix.de>
To: linux-mtd@lists.infradead.org
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, kernel@pengutronix.de,
 Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH 6/8] mtd: nand: mxc: Add own write_page
Date: Tue,  9 Jan 2018 11:11:46 +0100
Message-Id: <20180109101148.13728-7-s.hauer@pengutronix.de>
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

Now that we have our own read_page function add a write_page function
for consistency aswell. This can be a lot easier than the generic
function since we do not have to iterate over subpages but can write
the whole page at once. Also add write_page_raw and write_oob for
proper raw and oob write support.

Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
---
 drivers/mtd/nand/mxc_nand.c | 56 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/drivers/mtd/nand/mxc_nand.c b/drivers/mtd/nand/mxc_nand.c
index 83bb01ab7079..6fbf98851a96 100644
--- a/drivers/mtd/nand/mxc_nand.c
+++ b/drivers/mtd/nand/mxc_nand.c
@@ -893,6 +893,59 @@ static int mxc_nand_read_oob(struct mtd_info *mtd, struct nand_chip *chip,
 					     page);
 }
 
+static int __mxc_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+				 const uint8_t *buf, int oob_required, int page)
+{
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+
+	host->devtype_data->send_cmd(host, NAND_CMD_SEQIN, false);
+	mxc_do_addr_cycle(mtd, 0, page);
+
+	memcpy32_toio(host->main_area0, buf, mtd->writesize);
+	copy_spare(mtd, false, chip->oob_poi);
+
+	host->devtype_data->send_page(mtd, NFC_INPUT);
+	host->devtype_data->send_cmd(host, NAND_CMD_PAGEPROG, true);
+	mxc_do_addr_cycle(mtd, 0, page);
+
+	return 0;
+}
+
+static int mxc_nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
+			       const uint8_t *buf, int oob_required, int page)
+{
+	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+
+	host->devtype_data->enable_hwecc(nand_chip, true);
+
+	return __mxc_nand_write_page(mtd, chip, buf, oob_required, page);
+}
+
+static int mxc_nand_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
+				   const uint8_t *buf, int oob_required, int page)
+{
+	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+
+	host->devtype_data->enable_hwecc(nand_chip, false);
+
+	return __mxc_nand_write_page(mtd, chip, buf, oob_required, page);
+}
+
+static int mxc_nand_write_oob(struct mtd_info *mtd, struct nand_chip *chip,
+			      int page)
+{
+	struct nand_chip *nand_chip = mtd_to_nand(mtd);
+	struct mxc_nand_host *host = nand_get_controller_data(chip);
+
+	memset(host->data_buf, 0xff, mtd->writesize);
+
+	host->devtype_data->enable_hwecc(nand_chip, false);
+
+	return __mxc_nand_write_page(mtd, chip, host->data_buf, 1, page);
+}
+
 static int mxc_nand_calculate_ecc(struct mtd_info *mtd, const u_char *dat,
 				  u_char *ecc_code)
 {
@@ -1907,6 +1960,9 @@ static int mxcnd_probe(struct platform_device *pdev)
 		this->ecc.read_page = mxc_nand_read_page;
 		this->ecc.read_page_raw = mxc_nand_read_page_raw;
 		this->ecc.read_oob = mxc_nand_read_oob;
+		this->ecc.write_page = mxc_nand_write_page;
+		this->ecc.write_page_raw = mxc_nand_write_page_raw;
+		this->ecc.write_oob = mxc_nand_write_oob;
 		this->ecc.calculate = mxc_nand_calculate_ecc;
 		this->ecc.hwctl = mxc_nand_enable_hwecc;
 		this->ecc.correct = host->devtype_data->correct_data;
-- 
2.11.0
