Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAd7A-0004rA-4N
 for linux-mtd@lists.infradead.org; Wed, 08 Jun 2016 13:01:46 +0000
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>
Cc: Hans de Goede <hdegoede@redhat.com>, linux-kernel@vger.kernel.org,
 Aleksei Mamlin <mamlinav@gmail.com>
Subject: [PATCH v2 15/15] mtd: nand: hynix: add read-retry support for 1x nm
 MLC NANDs
Date: Wed,  8 Jun 2016 15:00:49 +0200
Message-Id: <1465390849-13199-16-git-send-email-boris.brezillon@free-electrons.com>
In-Reply-To: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
References: <1465390849-13199-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

All Hynix MLC NANDs using the produced with the 1X nm process support
read-retry.
This read retry implementation should also be reusable for other Hynix
NANDs, but the method to retrieve the read-retry parameters from the
read-retry OTP area might change a bit (some NANDs are even using a fixed
set of values instead of retrieving those information from the OTP area).

Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
---
 drivers/mtd/nand/nand_hynix.c | 361 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 360 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/nand_hynix.c b/drivers/mtd/nand/nand_hynix.c
index f73b99f..7f5b446 100644
--- a/drivers/mtd/nand/nand_hynix.c
+++ b/drivers/mtd/nand/nand_hynix.c
@@ -13,6 +13,53 @@
  */
 
 #include <linux/mtd/nand.h>
+#include <linux/slab.h>
+
+#define NAND_HYNIX_CMD_SET_PARAMS	0x36
+#define NAND_HYNIX_CMD_APPLY_PARAMS	0x16
+
+#define NAND_HYNIX_1XNM_RR_REPEAT	8
+
+/**
+ * struct hynix_read_retry - read-retry data
+ * @nregs: number of register to set when applying a new read-retry mode
+ * @regs: register offsets (NAND chip dependent)
+ * @values: array of values to set in registers. The array size is equal to
+ *	    (nregs * nmodes)
+ */
+struct hynix_read_retry {
+	int nregs;
+	const u8 *regs;
+	u8 values[0];
+};
+
+/**
+ * struct hynix_nand - private Hynix NAND struct
+ * @nand_technology: manufacturing process expressed in picometer
+ * @read_retry: read-retry information
+ */
+struct hynix_nand {
+	const struct hynix_read_retry *read_retry;
+};
+
+/**
+ * struct hynix_read_retry_otp - structure describing how the read-retry OTP
+ *				 area
+ * @nregs: number of hynix private registers to set before reading the reading
+ *	   the OTP area
+ * @regs: registers that should be configured
+ * @values: values that should be set in regs
+ * @page: the address to pass to the READ_PAGE command. Depends on the NAND
+ *	  chip
+ * @size: size of the read-retry OTP section
+ */
+struct hynix_read_retry_otp {
+	int nregs;
+	const u8 *regs;
+	const u8 *values;
+	int page;
+	int size;
+};
 
 static bool hynix_nand_has_valid_jedecid(struct nand_chip *chip)
 {
@@ -27,6 +74,292 @@ static bool hynix_nand_has_valid_jedecid(struct nand_chip *chip)
 	return !strcmp("JEDEC", jedecid);
 }
 
+static int hynix_nand_setup_read_retry(struct mtd_info *mtd, int retry_mode)
+{
+	struct nand_chip *chip = mtd_to_nand(mtd);
+	struct hynix_nand *hynix = nand_get_manufacturer_data(chip);
+	const u8 *values;
+	int status;
+	int i;
+
+	values = hynix->read_retry->values +
+		 (retry_mode * hynix->read_retry->nregs);
+
+	/* Enter 'Set Hynix Parameters' mode */
+	chip->cmdfunc(mtd, NAND_HYNIX_CMD_SET_PARAMS, -1, -1);
+
+	/*
+	 * Configure the NAND in the requested read-retry mode.
+	 * This is done by setting pre-defined values in internal NAND
+	 * registers.
+	 *
+	 * The set of registers is NAND specific, and the values are either
+	 * predefined or extracted from an OTP area on the NAND (values are
+	 * probably tweaked at production in this case).
+	 */
+	for (i = 0; i < hynix->read_retry->nregs; i++) {
+		int column = hynix->read_retry->regs[i];
+
+		column |= column << 8;
+		chip->cmdfunc(mtd, NAND_CMD_NONE, column, -1);
+		chip->write_byte(mtd, values[i]);
+	}
+
+	/* Apply the new settings. */
+	chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS, -1, -1);
+
+	status = chip->waitfunc(mtd, chip);
+	if (status & NAND_STATUS_FAIL)
+		return -EIO;
+
+	return 0;
+}
+
+/**
+ * hynix_get_majority - get the value that is occurring the most in a given
+ *			set of values
+ * @in: the array of values to test
+ * @repeat: the size of the in array
+ * @out: pointer used to store the output value
+ *
+ * This function implements the 'majority check' logic that is supposed to
+ * overcome the unreliability of MLC NANDs when reading the OTP area storing
+ * the read-retry parameters.
+ *
+ * It's based on a pretty simple assumption: if we repeat the same value
+ * several times and then take the one that is occurring the most, we should
+ * find the correct value.
+ * Let's hope this dummy algorithm prevents us from losing the read-retry
+ * parameters.
+ */
+static int hynix_get_majority(const u8 *in, int repeat, u8 *out)
+{
+	int i, j, half = repeat / 2;
+
+	/*
+	 * We only test the first half of the in array because we must ensure
+	 * that the value is at least occurring repeat / 2 times.
+	 *
+	 * This loop is suboptimal since we may count the occurrences of the
+	 * same value several time, but we are doing that on small sets, which
+	 * makes it acceptable.
+	 */
+	for (i = 0; i < half; i++) {
+		int cnt = 0;
+		u8 val = in[i];
+
+		/* Count all values that are matching the one at index i. */
+		for (j = i + 1; j < repeat; j++) {
+			if (in[j] == val)
+				cnt++;
+		}
+
+		/* We found a value occurring more than repeat / 2. */
+		if (cnt > half) {
+			*out = val;
+			return 0;
+		}
+	}
+
+	return -EIO;
+}
+
+static int hynix_read_rr_otp(struct nand_chip *chip,
+			     const struct hynix_read_retry_otp *info,
+			     void *buf)
+{
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	int i;
+
+	chip->select_chip(mtd, 0);
+	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+
+	chip->cmdfunc(mtd, NAND_HYNIX_CMD_SET_PARAMS, -1, -1);
+
+	for (i = 0; i < info->nregs; i++) {
+		int column = info->regs[i];
+
+		column |= column << 8;
+		chip->cmdfunc(mtd, NAND_CMD_NONE, column, -1);
+		chip->write_byte(mtd, info->values[i]);
+	}
+
+	chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS, -1, -1);
+
+	/* Sequence to enter OTP mode? */
+	chip->cmdfunc(mtd, 0x17, -1, -1);
+	chip->cmdfunc(mtd, 0x04, -1, -1);
+	chip->cmdfunc(mtd, 0x19, -1, -1);
+
+	/* Now read the page */
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x0, info->page);
+	chip->read_buf(mtd, buf, info->size);
+
+	/* Put everything back to normal */
+	chip->cmdfunc(mtd, NAND_CMD_RESET, -1, -1);
+	chip->cmdfunc(mtd, NAND_HYNIX_CMD_SET_PARAMS, 0x38, -1);
+	chip->write_byte(mtd, 0x0);
+	chip->cmdfunc(mtd, NAND_HYNIX_CMD_APPLY_PARAMS, -1, -1);
+	chip->cmdfunc(mtd, NAND_CMD_READ0, 0x0, -1);
+	chip->select_chip(mtd, -1);
+
+	return 0;
+}
+
+#define NAND_HYNIX_1XNM_RR_COUNT_OFFS				0
+#define NAND_HYNIX_1XNM_RR_REG_COUNT_OFFS			8
+#define NAND_HYNIX_1XNM_RR_SET_OFFS(x, setsize, inv)		\
+	(16 + ((((x) * 2) + ((inv) ? 1 : 0)) * (setsize)))
+
+static int hynix_mlc_1xnm_rr_value(const u8 *buf, int nmodes, int nregs,
+				   int mode, int reg, bool inv, u8 *val)
+{
+	u8 tmp[NAND_HYNIX_1XNM_RR_REPEAT];
+	int val_offs = (mode * nregs) + reg;
+	int set_size = nmodes * nregs;
+	int i, ret;
+
+	for (i = 0; i < NAND_HYNIX_1XNM_RR_REPEAT; i++) {
+		int set_offs = NAND_HYNIX_1XNM_RR_SET_OFFS(i, set_size, inv);
+
+		tmp[i] = buf[val_offs + set_offs];
+	}
+
+
+	ret = hynix_get_majority(tmp, NAND_HYNIX_1XNM_RR_REPEAT, val);
+	if (ret)
+		return ret;
+
+	if (inv)
+		*val = ~*val;
+
+	return 0;
+}
+
+static u8 hynix_1xnm_mlc_read_retry_regs[] = {
+	0xcc, 0xbf, 0xaa, 0xab, 0xcd, 0xad, 0xae, 0xaf
+};
+
+static int hynix_mlc_1xnm_rr_init(struct nand_chip *chip,
+				  const struct hynix_read_retry_otp *info)
+{
+	struct hynix_nand *hynix = nand_get_manufacturer_data(chip);
+	struct hynix_read_retry *rr = NULL;
+	int ret, i, j;
+	u8 nregs, nmodes;
+	u8 *buf;
+
+	buf = kmalloc(info->size, GFP_KERNEL);
+	if (!buf)
+		return -ENOMEM;
+
+	ret = hynix_read_rr_otp(chip, info, buf);
+	if (ret)
+		goto out;
+
+	ret = hynix_get_majority(buf, NAND_HYNIX_1XNM_RR_REPEAT,
+				 &nmodes);
+	if (ret)
+		goto out;
+
+	ret = hynix_get_majority(buf + NAND_HYNIX_1XNM_RR_REPEAT,
+				 NAND_HYNIX_1XNM_RR_REPEAT,
+				 &nregs);
+	if (ret)
+		goto out;
+
+	rr = kzalloc(sizeof(*rr) + (nregs * nmodes), GFP_KERNEL);
+	if (!rr)
+		goto out;
+
+	for (i = 0; i < nmodes; i++) {
+		for (j = 0; j < nregs; j++) {
+			u8 *val = rr->values + (i * nregs);
+
+			ret = hynix_mlc_1xnm_rr_value(buf, nmodes, nregs, i, j,
+						      false, val);
+			if (!ret)
+				continue;
+
+			ret = hynix_mlc_1xnm_rr_value(buf, nmodes, nregs, i, j,
+						      true, val);
+			if (ret)
+				goto out;
+		}
+	}
+
+	rr->nregs = nregs;
+	rr->regs = hynix_1xnm_mlc_read_retry_regs;
+	hynix->read_retry = rr;
+	chip->setup_read_retry = hynix_nand_setup_read_retry;
+	chip->read_retries = nmodes;
+
+out:
+	kfree(buf);
+
+	if (ret)
+		kfree(rr);
+
+	return ret;
+}
+
+static const u8 hynix_mlc_1xnm_rr_otp_regs[] = { 0x38 };
+static const u8 hynix_mlc_1xnm_rr_otp_values[] = { 0x52 };
+
+static const struct hynix_read_retry_otp hynix_mlc_1xnm_rr_otps[] = {
+	{
+		.nregs = ARRAY_SIZE(hynix_mlc_1xnm_rr_otp_regs),
+		.regs = hynix_mlc_1xnm_rr_otp_regs,
+		.values = hynix_mlc_1xnm_rr_otp_values,
+		.page = 0x21f,
+		.size = 784
+	},
+	{
+		.nregs = ARRAY_SIZE(hynix_mlc_1xnm_rr_otp_regs),
+		.regs = hynix_mlc_1xnm_rr_otp_regs,
+		.values = hynix_mlc_1xnm_rr_otp_values,
+		.page = 0x200,
+		.size = 528,
+	},
+};
+
+static int hynix_nand_rr_init(struct nand_chip *chip)
+{
+	int i, ret = 0;
+	bool valid_jedecid;
+
+	valid_jedecid = hynix_nand_has_valid_jedecid(chip);
+
+	/*
+	 * We only support read-retry for 1xnm NANDs, and those NANDs all
+	 * expose a valid JEDEC ID.
+	 */
+	if (valid_jedecid) {
+		u8 nand_tech = chip->id.data[5] >> 4;
+
+		/* 1xnm technology */
+		if (nand_tech == 4) {
+			for (i = 0; i < ARRAY_SIZE(hynix_mlc_1xnm_rr_otps);
+			     i++) {
+
+				/*
+				 * FIXME: Hynix recommend to copy the
+				 * read-retry OTP area into a normal page.
+				 */
+				ret = hynix_mlc_1xnm_rr_init(chip,
+						hynix_mlc_1xnm_rr_otps);
+				if (!ret)
+					break;
+			}
+		}
+	}
+
+	if (ret)
+		pr_warn("failed to initialize read-retry infrastructure");
+
+	return 0;
+}
+
 static void hynix_nand_extract_oobsize(struct nand_chip *chip,
 				       bool valid_jedecid)
 {
@@ -254,17 +587,43 @@ static void hynix_nand_decode_id(struct nand_chip *chip)
 	hynix_nand_extract_scrambling_requirements(chip, valid_jedecid);
 }
 
+static void hynix_nand_cleanup(struct nand_chip *chip)
+{
+	struct hynix_nand *hynix = nand_get_manufacturer_data(chip);
+
+	if (!hynix)
+		return;
+
+	kfree(hynix->read_retry);
+	kfree(hynix);
+	nand_set_manufacturer_data(chip, NULL);
+}
+
 static int hynix_nand_init(struct nand_chip *chip)
 {
+	struct hynix_nand *hynix;
+	int ret;
+
 	if (!nand_is_slc(chip))
 		chip->bbt_options |= NAND_BBT_SCANLASTPAGE;
 	else
 		chip->bbt_options |= NAND_BBT_SCAN2NDPAGE;
 
-	return 0;
+	hynix = kzalloc(sizeof(*hynix), GFP_KERNEL);
+	if (!hynix)
+		return -ENOMEM;
+
+	nand_set_manufacturer_data(chip, hynix);
+
+	ret = hynix_nand_rr_init(chip);
+	if (ret)
+		hynix_nand_cleanup(chip);
+
+	return ret;
 }
 
 const struct nand_manufacturer_ops hynix_nand_manuf_ops = {
 	.detect = hynix_nand_decode_id,
 	.init = hynix_nand_init,
+	.cleanup = hynix_nand_cleanup,
 };
-- 
2.7.4
