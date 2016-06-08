Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAkbo-00047i-Di
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 21:01:53 +0000
Received: by mail-pf0-x242.google.com with SMTP id 62so1287305pfd.3
 for <linux-mtd@lists.infradead.org>; Wed, 08 Jun 2016 14:01:31 -0700 (PDT)
From: Kamal Dasu <kdasu.kdev@gmail.com>
To: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com
Cc: f.fainelli@gmail.com, bcm-kernel-feedback-list@broadcom.com,
 Kamal Dasu <kdasu.kdev@gmail.com>
Subject: [V2, 1/2] mtd: brcmnand: Add check for erased page bitflips
Date: Wed,  8 Jun 2016 17:01:20 -0400
Message-Id: <1465419681-6162-1-git-send-email-kdasu.kdev@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Check for erased page bitflips in a page. And if well within
threshold return data as all 0xff. Apply sw check for controller
version < 7.2. Controller vesion >= 7.2 has hw support.

Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
---
V2 changes 
 Added use of nand_check_erased_ecc_chunk
 Restrict change to older controller < 7.2
---
 drivers/mtd/nand/brcmnand/brcmnand.c | 61 ++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/drivers/mtd/nand/brcmnand/brcmnand.c b/drivers/mtd/nand/brcmnand/brcmnand.c
index b76ad7c..212acb4 100644
--- a/drivers/mtd/nand/brcmnand/brcmnand.c
+++ b/drivers/mtd/nand/brcmnand/brcmnand.c
@@ -1545,6 +1545,55 @@ static int brcmnand_read_by_pio(struct mtd_info *mtd, struct nand_chip *chip,
 	return ret;
 }
 
+/*
+ * Check a page to see if it is erased (w/ bitflips) after an uncorrectable ECC
+ * error
+ *
+ * Because the HW ECC signals an ECC error if an erase paged has even a single
+ * bitflip, we must check each ECC error to see if it is actually an erased
+ * page with bitflips, not a truly corrupted page.
+ *
+ * On a real error, return a negative error code (-EBADMSG for ECC error), and
+ * buf will contain raw data.
+ * Otherwise, buf gets filled with 0xffs and return the maximum number of
+ * bitflips-per-ECC-sector to the caller.
+ *
+ */
+static int brcmstb_nand_verify_erased_page(struct mtd_info *mtd,
+		  struct nand_chip *chip, void *buf, u64 addr)
+{
+	int i, sas;
+	void *oob = chip->oob_poi;
+	int bitflips = 0;
+	int page = addr >> chip->page_shift;
+	int ret;
+
+	if (!buf) {
+		buf = chip->buffers->databuf;
+		/* Invalidate page cache */
+		chip->pagebuf = -1;
+	}
+
+	sas = mtd->oobsize / chip->ecc.steps;
+
+	/* read without ecc for verification */
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x00, page);
+	ret = chip->ecc.read_page_raw(mtd, chip, buf, true, page);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < chip->ecc.steps; i++, oob += sas) {
+		bitflips = nand_check_erased_ecc_chunk(buf, chip->ecc.size,
+						       oob, sas, NULL, 0,
+						       chip->ecc.strength);
+		/* Too many bitflips */
+		if (bitflips < 0)
+			break;
+	}
+
+	return bitflips;
+}
+
 static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 			 u64 addr, unsigned int trans, u32 *buf, u8 *oob)
 {
@@ -1575,6 +1624,18 @@ static int brcmnand_read(struct mtd_info *mtd, struct nand_chip *chip,
 	}
 
 	if (mtd_is_eccerr(err)) {
+		/*
+		 * Controller version 7.2 has hw encoder to detect erased page
+		 * bitflips, apply sw verification for older controllers only
+		 */
+		if (ctrl->nand_version < 0x0702) {
+			err = brcmstb_nand_verify_erased_page(mtd, chip, buf,
+							      addr);
+			/* erased page bitflips corrected */
+			if (err > 0)
+				return err;
+		}
+
 		dev_dbg(ctrl->dev, "uncorrectable error at 0x%llx\n",
 			(unsigned long long)err_addr);
 		mtd->ecc_stats.failed++;
-- 
1.9.1
