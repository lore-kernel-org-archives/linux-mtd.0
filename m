Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dAfKX-000077-U5
 for linux-mtd@lists.infradead.org; Tue, 16 May 2017 16:28:15 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Wenyou Yang <wenyou.yang@microchip.com>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Subject: [PATCH] mtd: nand: Wait for PAGEPROG to finish in drivers setting
 NAND_ECC_CUSTOM_PAGE_ACCESS
Date: Tue, 16 May 2017 18:27:49 +0200
Message-Id: <1494952069-3914-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Drivers setting NAND_ECC_CUSTOM_PAGE_ACCESS are supposed to handle the
full read/write page sequence, and waiting for a page to actually be
programmed is part of this write-page sequence.
This is also what is done in ->write_oob_xxx() hooks, so let's do that in
->write_page_xxx() as well to make it consistent.

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/atmel/nand-controller.c |  6 +++++-
 drivers/mtd/nand/nand_base.c             | 10 ++++++----
 drivers/mtd/nand/nand_micron.c           | 10 ++++++++--
 drivers/mtd/nand/tango_nand.c            | 13 ++++++++++++-
 4 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/atmel/nand-controller.c b/drivers/mtd/nand/atmel/nand-controller.c
index 3b2446896147..e5122539d4f1 100644
--- a/drivers/mtd/nand/atmel/nand-controller.c
+++ b/drivers/mtd/nand/atmel/nand-controller.c
@@ -912,7 +912,7 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct atmel_nand *nand = to_atmel_nand(chip);
 	struct atmel_hsmc_nand_controller *nc;
-	int ret;
+	int ret, status;
 
 	nc = to_hsmc_nand_controller(chip->controller);
 
@@ -954,6 +954,10 @@ static int atmel_hsmc_nand_pmecc_write_pg(struct nand_chip *chip,
 		dev_err(nc->base.dev, "Failed to program NAND page (err = %d)\n",
 			ret);
 
+	status = chip->waitfunc(mtd, chip);
+	if (status & NAND_STATUS_FAIL)
+		return -EIO;
+
 	return ret;
 }
 
diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 8dafd2a54e11..08ff98c47e1f 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2574,11 +2574,13 @@ static int nand_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (status < 0)
 		return status;
 
-	if (nand_standard_page_accessors(&chip->ecc))
+	if (nand_standard_page_accessors(&chip->ecc)) {
 		chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
-	status = chip->waitfunc(mtd, chip);
-	if (status & NAND_STATUS_FAIL)
-		return -EIO;
+
+		status = chip->waitfunc(mtd, chip);
+		if (status & NAND_STATUS_FAIL)
+			return -EIO;
+	}
 
 	return 0;
 }
diff --git a/drivers/mtd/nand/nand_micron.c b/drivers/mtd/nand/nand_micron.c
index 0987f32dc6f7..f3c35fafd51a 100644
--- a/drivers/mtd/nand/nand_micron.c
+++ b/drivers/mtd/nand/nand_micron.c
@@ -151,15 +151,18 @@ micron_nand_write_page_on_die_ecc(struct mtd_info *mtd, struct nand_chip *chip,
 				  const uint8_t *buf, int oob_required,
 				  int page)
 {
+	int status;
+
 	micron_nand_on_die_ecc_setup(chip, true);
 
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
 	nand_write_page_raw(mtd, chip, buf, oob_required, page);
 	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status = chip->waitfunc(mtd, chip);
 
 	micron_nand_on_die_ecc_setup(chip, false);
 
-	return 0;
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
 
 static int
@@ -180,11 +183,14 @@ micron_nand_write_page_raw_on_die_ecc(struct mtd_info *mtd,
 				      const uint8_t *buf, int oob_required,
 				      int page)
 {
+	int status;
+
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0x00, page);
 	nand_write_page_raw(mtd, chip, buf, oob_required, page);
 	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+	status = chip->waitfunc(mtd, chip);
 
-	return 0;
+	return status & NAND_STATUS_FAIL ? -EIO : 0;
 }
 
 enum {
diff --git a/drivers/mtd/nand/tango_nand.c b/drivers/mtd/nand/tango_nand.c
index a2150b15d4c1..8498fa36e533 100644
--- a/drivers/mtd/nand/tango_nand.c
+++ b/drivers/mtd/nand/tango_nand.c
@@ -295,7 +295,7 @@ static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 			    const u8 *buf, int oob_required, int page)
 {
 	struct tango_nfc *nfc = to_tango_nfc(chip->controller);
-	int err, len = mtd->writesize;
+	int err, status, len = mtd->writesize;
 
 	/* Calling tango_write_oob() would send PAGEPROG twice */
 	if (oob_required)
@@ -306,6 +306,10 @@ static int tango_write_page(struct mtd_info *mtd, struct nand_chip *chip,
 	if (err)
 		return err;
 
+	status = chip->waitfunc(mtd, chip);
+	if (status & NAND_STATUS_FAIL)
+		return -EIO;
+
 	return 0;
 }
 
@@ -423,9 +427,16 @@ static int tango_read_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 static int tango_write_page_raw(struct mtd_info *mtd, struct nand_chip *chip,
 				const u8 *buf, int oob_required, int page)
 {
+	int status;
+
 	chip->cmdfunc(mtd, NAND_CMD_SEQIN, 0, page);
 	raw_write(chip, buf, chip->oob_poi);
 	chip->cmdfunc(mtd, NAND_CMD_PAGEPROG, -1, -1);
+
+	status = chip->waitfunc(mtd, chip);
+	if (status & NAND_STATUS_FAIL)
+		return -EIO;
+
 	return 0;
 }
 
-- 
2.7.4
