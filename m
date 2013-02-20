Received: from metis.ext.pengutronix.de ([2001:6f8:1178:4:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1U8GrL-0003mr-LN
 for linux-mtd@lists.infradead.org; Wed, 20 Feb 2013 21:05:48 +0000
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: David Woodhouse <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 linux-mtd@lists.infradead.org
Subject: [PATCH RFC] mtd/nand: implement user otp for Micron chips
Date: Wed, 20 Feb 2013 22:05:32 +0100
Message-Id: <1361394332-19415-1-git-send-email-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Cc: kernel@pengutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
---
Hello,

there are some things to clean up before this patch can be applied. See
the respective comments in the code, most of them are marked with XXX,
but I'm sure you'll find things to criticize that I didn't mark :-)

About the unsuitablity of nand_do_read_ops and nand_do_write_ops I'd like to
hear your thoughts. Would you prefer a new function that does only the
necessary stuff, or should I add another parameter to make them do the
right thing for me?

BTW, to make use of this patch you'd need
	http://patchwork.ozlabs.org/patch/221191/

Best regards
Uwe

 drivers/mtd/nand/nand_base.c |  126 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
index 3766682..10e51f3 100644
--- a/drivers/mtd/nand/nand_base.c
+++ b/drivers/mtd/nand/nand_base.c
@@ -2753,6 +2753,116 @@ static int nand_onfi_get_features(struct mtd_info *mtd, struct nand_chip *chip,
 	return 0;
 }
 
+#define MICRON_SETFEATURE_ARRAYOP	0x90
+#define MICRON_SETFEATURE_ARRAYOP_NORMAL	((uint8_t[]){0,0,0,0})
+#define MICRON_SETFEATURE_ARRAYOP_OTP		((uint8_t[]){1,0,0,0})
+
+static int mt29f_get_user_prot_info(struct mtd_info *mtd, struct otp_info *buf,
+		size_t len)
+{
+	if (len < sizeof(*buf))
+		return -ENOSPC;
+
+	buf->start = 0;
+	/* XXX: should I report 30 otp_infos instead? */
+	buf->length = 30 * mtd->writesize;
+
+	/*
+	 * XXX: don't know how to find out, don't even know if the individual
+	 * pages are protectable individually.
+	 */
+	buf->locked = 0;
+
+	return sizeof(*buf);
+}
+
+static int mt29f_read_user_prot_reg(struct mtd_info *mtd, loff_t from,
+		size_t len, size_t *retlen, uint8_t *buf)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops ops;
+	int ret;
+
+	/* Valid pages in otp are 02h-1Fh. */
+	from += 2 << chip->page_shift;
+	if (from > 0x20 << chip->page_shift)
+		return -EIO;
+
+	if (from + len > 0x20 << chip->page_shift)
+		len = (0x20 << chip->page_shift) - from;
+
+	/* XXX: FL_READING? */
+	nand_get_device(chip, mtd, FL_READING);
+
+	chip->select_chip(mtd, 0);
+
+	ret = nand_onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_OTP);
+	if (ret)
+		goto out;
+
+	ops.len = len;
+	ops.datbuf = buf;
+	ops.oobbuf = NULL;
+	ops.mode = 0;
+	/*
+	 * some things in nand_do_read_ops might be wrong for OTP. e.g.
+	 * chip->pagemask, chip->pagebuf handling, caching
+	 */
+	ret = nand_do_read_ops(mtd, from, &ops);
+	*retlen = ops.retlen;
+	nand_onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_NORMAL);
+out:
+	nand_release_device(mtd);
+	return ret;
+}
+
+
+static int mt29f_write_user_prot_reg(struct mtd_info *mtd, loff_t to,
+		size_t len, size_t *retlen, uint8_t *buf)
+{
+	struct nand_chip *chip = mtd->priv;
+	struct mtd_oob_ops ops;
+	int ret;
+
+	pr_info("%s: to=%llx, len=%lx\n", __func__, to, (unsigned long)len);
+	/* Valid pages in otp are 02h-1Fh. */
+	to += 2 << chip->page_shift;
+	if (to > 0x20 << chip->page_shift)
+		return -EIO;
+
+	if (to + len > 0x20 << chip->page_shift)
+		len = (0x20 << chip->page_shift) - to;
+
+	nand_get_device(chip, mtd, FL_WRITING);
+
+	chip->select_chip(mtd, 0);
+
+	ret = nand_onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_OTP);
+	if (ret)
+		goto out;
+
+	ops.len = len;
+	ops.datbuf = buf;
+	ops.oobbuf = NULL;
+	ops.mode = 0;
+	/*
+	 * some things in nand_do_write_ops might be wrong for OTP. e.g.
+	 * chip->pagemask, chip->pagebuf handling
+	 */
+	ret = nand_do_write_ops(mtd, to, &ops);
+	*retlen = ops.retlen;
+
+	nand_onfi_set_features(mtd, chip, MICRON_SETFEATURE_ARRAYOP,
+			MICRON_SETFEATURE_ARRAYOP_NORMAL);
+out:
+	nand_release_device(mtd);
+	return ret;
+}
+
+
 /**
  * nand_suspend - [MTD Interface] Suspend the NAND flash
  * @mtd: MTD device structure
@@ -3301,6 +3411,22 @@ ident_done:
 	if (mtd->writesize > 512 && chip->cmdfunc == nand_command)
 		chip->cmdfunc = nand_command_lp;
 
+	/*
+	 * Available on (at least) Micron's MT29F2G{08,16}AB[AB]EA,
+	 * MT29F[48]G{08,16}AB[AB]DA, MT29F16G08AJADA
+	 * having device IDs:
+	 *      0xda, 0xca, 0xaa, 0xba;
+	 *      0xdc, 0xcc, 0xac, 0xbc, 0xa3, 0xb3, 0xd3, 0xc3;
+	 *      0xd3
+	 */
+	if (*maf_id == NAND_MFR_MICRON &&
+			((*dev_id + 0x20) & 0xc0) == 0xc0 &&
+			((*dev_id & 0x09) == 8 || (*dev_id & 0x0f) == 3)) {
+		mtd->_get_user_prot_info = mt29f_get_user_prot_info;
+		mtd->_read_user_prot_reg = mt29f_read_user_prot_reg;
+		mtd->_write_user_prot_reg = mt29f_write_user_prot_reg;
+	}
+
 	pr_info("NAND device: Manufacturer ID: 0x%02x, Chip ID: 0x%02x (%s %s),"
 		" %dMiB, page size: %d, OOB size: %d\n",
 		*maf_id, *dev_id, nand_manuf_ids[maf_idx].name,
-- 
1.7.10.4
