Received: from n61.bullet.mail.sp1.yahoo.com ([98.136.44.37])
	by bombadil.infradead.org with smtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LrR6a-0002fU-Uw
	for linux-mtd@lists.infradead.org; Wed, 08 Apr 2009 06:17:55 +0000
To: DaVinci <davinci-linux-open-source@linux.davincidsp.com>,
	Linux MTD <linux-mtd@lists.infradead.org>
Subject: [patch/rft 2.6.30-rc1] NAND: davinci_nand, 4-bit ECC for smallpage
Content-Disposition: inline
From: David Brownell <david-b@pacbell.net>
Date: Tue, 7 Apr 2009 23:17:44 -0700
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <200904072317.44700.david-b@pacbell.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Minimal support for the 4-bit ECC engine found on DM355 and
OMAP-L137 chips.  This is limited to small-page flash for now;
there are special layout issues for large page chips (which,
nowadays, are prevalent).

Note that the DM355 EVM uses a large-page chip -- unless you
swap socketed chips -- so this version will be a bit awkward
to test.  The core ECC logic is unchanged from the version
which was previously happy with most of the newish MTD tests.

CHANGES since my last version:  says byebye to ECC_HW_SYNDROME;
select this using an explicit count of how many ECC bits to use.
Add brief comment about the anticipated fix for the large page
issue.

# NYET Signed-off-...

---
 arch/arm/mach-davinci/include/mach/nand.h |    8 
 drivers/mtd/nand/davinci_nand.c           |  302 ++++++++++++++++++++++++++--
 2 files changed, 295 insertions(+), 15 deletions(-)

--- a/arch/arm/mach-davinci/include/mach/nand.h
+++ b/arch/arm/mach-davinci/include/mach/nand.h
@@ -68,10 +68,14 @@ struct davinci_nand_pdata {		/* platform
 
 	/* none  == NAND_ECC_NONE (strongly *not* advised!!)
 	 * soft  == NAND_ECC_SOFT
-	 * 1-bit == NAND_ECC_HW
-	 * 4-bit == NAND_ECC_HW_SYNDROME (not on all chips)
+	 * else  == NAND_ECC_HW, according to ecc_bits
+	 *
+	 * All DaVinci-family chips support 1-bit hardware ECC.
+	 * Newer ones support 4 bits ECC, but are awkward using
+	 * it with large page chips.
 	 */
 	nand_ecc_modes_t	ecc_mode;
+	u8			ecc_bits;
 
 	/* e.g. NAND_BUSWIDTH_16 or NAND_USE_FLASH_BBT */
 	unsigned		options;
--- a/drivers/mtd/nand/davinci_nand.c
+++ b/drivers/mtd/nand/davinci_nand.c
@@ -44,7 +44,7 @@
  * and some flavors of secondary chipselect (e.g. based on A12) as used
  * with multichip packages.
  *
- * The 1-bit ECC hardware is supported, but not yet the newer 4-bit ECC
+ * The 1-bit ECC hardware is supported, as well as the newer 4-bit ECC
  * available on chips like the DM355 and OMAP-L137 and needed with the
  * more error-prone MLC NAND chips.
  *
@@ -54,11 +54,14 @@
 struct davinci_nand_info {
 	struct mtd_info		mtd;
 	struct nand_chip	chip;
+	struct nand_ecclayout	ecclayout;
 
 	struct device		*dev;
 	struct clk		*clk;
 	bool			partitioned;
 
+	bool			is_readmode;
+
 	void __iomem		*base;
 	void __iomem		*vaddr;
 
@@ -73,6 +76,7 @@ struct davinci_nand_info {
 };
 
 static DEFINE_SPINLOCK(davinci_nand_lock);
+static bool ecc4_busy;
 
 #define to_davinci_nand(m) container_of(m, struct davinci_nand_info, mtd)
 
@@ -218,6 +222,188 @@ static int nand_davinci_correct_1bit(str
 /*----------------------------------------------------------------------*/
 
 /*
+ * 4-bit hardware ECC ... context maintained over entire AEMIF
+ *
+ * This is a syndrome engine, but we avoid NAND_ECC_HW_SYNDROME
+ * since that forces use of a problematic "infix OOB" layout.
+ * Among other things, it trashes manufacturer bad block markers;
+ * and while having ECC protection for parts of OOB would seem
+ * useful, the current MTD stack sometimes wants to update the OOB
+ * without recomputing ECC.
+ */
+
+static void nand_davinci_hwctl_4bit(struct mtd_info *mtd, int mode)
+{
+	struct davinci_nand_info *info = to_davinci_nand(mtd);
+	unsigned long flags;
+	u32 val;
+
+	spin_lock_irqsave(&davinci_nand_lock, flags);
+
+	/* Start 4-bit ECC calculation for read/write */
+	val = davinci_nand_readl(info, NANDFCR_OFFSET);
+	val &= ~(0x03 << 4);
+	val |= (info->core_chipsel << 4) | BIT(12);
+	davinci_nand_writel(info, NANDFCR_OFFSET, val);
+
+	info->is_readmode = (mode == NAND_ECC_READ);
+
+	spin_unlock_irqrestore(&davinci_nand_lock, flags);
+}
+
+/* read raw ECC code (NAND writes) or syndrome (NAND reads) */
+static void
+nand_davinci_readecc_4bit(struct davinci_nand_info *info, u32 code[4])
+{
+	const u32 mask = 0x03ff03ff;
+
+	code[0] = davinci_nand_readl(info, NAND_4BIT_ECC1_OFFSET) & mask;
+	code[1] = davinci_nand_readl(info, NAND_4BIT_ECC2_OFFSET) & mask;
+	code[2] = davinci_nand_readl(info, NAND_4BIT_ECC3_OFFSET) & mask;
+	code[3] = davinci_nand_readl(info, NAND_4BIT_ECC4_OFFSET) & mask;
+}
+
+/* terminate ECC; or return ECC as bytes for data written to NAND */
+static int nand_davinci_calculate_4bit(struct mtd_info *mtd,
+		const u_char *dat, u_char *ecc_code)
+{
+	struct davinci_nand_info *info = to_davinci_nand(mtd);
+	u32 raw_ecc[4], *p;
+	unsigned i;
+
+	if (info->is_readmode) {
+		/* Terminate ECC calculation by performing a dummy read of
+		 * some 4-bit ECC register.  ECC covers everything read.
+		 * The correct() method just uses the hardware state.
+		 */
+		davinci_nand_readl(info, NAND_4BIT_ECC1_OFFSET);
+		return 0;
+	}
+
+	/* Pack eight raw 10-bit ecc values into ten bytes, making
+	 * two passes which each convert four values into five bytes
+	 */
+	nand_davinci_readecc_4bit(info, raw_ecc);
+	for (i = 0, p = raw_ecc; i < 2; i++, p += 2) {
+		*ecc_code++ =   p[0]        & 0xff;
+		*ecc_code++ = ((p[0] >>  8) & 0x03) | ((p[0] >> 14) & 0xfc);
+		*ecc_code++ = ((p[0] >> 22) & 0x0f) | ((p[1] <<  4) & 0xf0);
+		*ecc_code++ = ((p[1] >>  4) & 0x3f) | ((p[1] >> 10) & 0xc0);
+		*ecc_code++ =  (p[1] >> 18) & 0xff;
+	}
+
+	return 0;
+}
+
+/* correct up to 4 bits in data we read, using hardware state and ecc_code */
+static int nand_davinci_correct_4bit(struct mtd_info *mtd,
+		u_char *data, u_char *ecc_code, u_char *null)
+{
+	int i;
+	struct davinci_nand_info *info = to_davinci_nand(mtd);
+	unsigned short ecc10[8];
+	unsigned short *ecc16;
+	u32 syndrome[4];
+	unsigned num_errors, corrected;
+
+	/* All bytes 0xff?  It's an erased page; ignore its ECC. */
+	for (i = 0; i < 10; i++) {
+		if (ecc_code[i] != 0xff)
+			goto compare;
+	}
+	return 0;
+
+compare:
+	/* Unpack ten bytes into eight 10 bit values.  We know we're
+	 * little-endian, and use type punning for less shifting/masking.
+	 */
+	if (WARN_ON(0x01 & (unsigned) ecc_code))
+		return -EINVAL;
+	ecc16 = (unsigned short *)ecc_code;
+
+	ecc10[0] =  (ecc16[0] >>  0) & 0x3ff;
+	ecc10[1] = ((ecc16[0] >> 10) & 0x3f) | ((ecc16[1] << 6) & 0x3c0);
+	ecc10[2] =  (ecc16[1] >>  4) & 0x3ff;
+	ecc10[3] = ((ecc16[1] >> 14) & 0x3)  | ((ecc16[2] << 2) & 0x3fc);
+	ecc10[4] =  (ecc16[2] >>  8)         | ((ecc16[3] << 8) & 0x300);
+	ecc10[5] =  (ecc16[3] >>  2) & 0x3ff;
+	ecc10[6] = ((ecc16[3] >> 12) & 0xf)  | ((ecc16[4] << 4) & 0x3f0);
+	ecc10[7] =  (ecc16[4] >>  6) & 0x3ff;
+
+	/* Tell ECC controller about the expected ECC codes. */
+	for (i = 7; i >= 0; i--)
+		davinci_nand_writel(info, NAND_4BIT_ECC_LOAD_OFFSET, ecc10[i]);
+
+	/* Allow time for syndrome calculation ... then read it.
+	 * A syndrome of all zeroes 0 means no detected errors.
+	 */
+	davinci_nand_readl(info, NANDFSR_OFFSET);
+	nand_davinci_readecc_4bit(info, syndrome);
+	if (!syndrome[0] && !syndrome[1] && !syndrome[2] && !syndrome[3])
+		return 0;
+
+	/* Start address calculation, and wait for it to complete.
+	 * We _could_ start reading more data while this is working,
+	 * to speed up the overall page read.
+	 */
+	davinci_nand_writel(info, NANDFCR_OFFSET,
+			davinci_nand_readl(info, NANDFCR_OFFSET) | BIT(13));
+	for (;;) {
+		u32	fsr = davinci_nand_readl(info, NANDFSR_OFFSET);
+
+		switch ((fsr >> 8) & 0x0f) {
+		case 0:		/* no error, should not happen */
+			return 0;
+		case 1:		/* five or more errors detected */
+			return -EIO;
+		case 2:		/* error addresses computed */
+		case 3:
+			num_errors = 1 + ((fsr >> 16) & 0x03);
+			break;
+		default:	/* still working on it */
+			cpu_relax();
+			continue;
+		}
+
+		/* ready to correct up to four errors */
+		break;
+	}
+
+	/* correct each error */
+	for (i = 0, corrected = 0; i < num_errors; i++) {
+		int error_address, error_value;
+
+		if (i > 1) {
+			error_address = davinci_nand_readl(info,
+						NAND_ERR_ADD2_OFFSET);
+			error_value = davinci_nand_readl(info,
+						NAND_ERR_ERRVAL2_OFFSET);
+		} else {
+			error_address = davinci_nand_readl(info,
+						NAND_ERR_ADD1_OFFSET);
+			error_value = davinci_nand_readl(info,
+						NAND_ERR_ERRVAL1_OFFSET);
+		}
+
+		if (i & 1) {
+			error_address >>= 16;
+			error_value >>= 16;
+		}
+		error_address &= 0x3ff;
+		error_address = (512 + 7) - error_address;
+
+		if (error_address < 512) {
+			data[error_address] ^= error_value;
+			corrected++;
+		}
+	}
+
+	return corrected;
+}
+
+/*----------------------------------------------------------------------*/
+
+/*
  * NOTE:  NAND boot requires ALE == EM_A[1], CLE == EM_A[2], so that's
  * how these chips are normally wired.  This translates to both 8 and 16
  * bit busses using ALE == BIT(3) in byte addresses, and CLE == BIT(4).
@@ -294,6 +480,21 @@ static void __init nand_dm6446evm_flash_
 
 /*----------------------------------------------------------------------*/
 
+/* An ECC layout for using 4-bit ECC with small-page flash,
+ * which won't trash manufacturer bad block markers.
+ */
+static struct nand_ecclayout hwecc4_small __initconst = {
+	.eccbytes = 10,
+	.eccpos = { 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, },
+	.oobfree = {
+		{.offset = 0, .length = 4, },
+		/* offset 5 holds the badblock marker */
+		{.offset = 6, .length = 1, },
+		{.offset = 16, },
+	},
+};
+
+
 static int __init nand_davinci_probe(struct platform_device *pdev)
 {
 	struct davinci_nand_pdata	*pdata = pdev->dev.platform_data;
@@ -378,24 +579,40 @@ static int __init nand_davinci_probe(str
 	/* Use board-specific ECC config */
 	ecc_mode		= pdata->ecc_mode;
 
+	ret = -EINVAL;
 	switch (ecc_mode) {
 	case NAND_ECC_NONE:
 	case NAND_ECC_SOFT:
 		break;
 	case NAND_ECC_HW:
-		info->chip.ecc.calculate = nand_davinci_calculate_1bit;
-		info->chip.ecc.correct = nand_davinci_correct_1bit;
-		info->chip.ecc.hwctl = nand_davinci_hwctl_1bit;
+		if (pdata->ecc_bits == 4) {
+			/* No sanity checks:  CPUs must support this,
+			 * and the chips may not use NAND_BUSWIDTH_16.
+			 */
+
+			/* No sharing 4-bit hardware between chipselects yet */
+			spin_lock_irq(&davinci_nand_lock);
+			if (ecc4_busy)
+				ret = -EBUSY;
+			else
+				ecc4_busy = true;
+			spin_unlock_irq(&davinci_nand_lock);
+
+			if (ret == -EBUSY)
+				goto err_ecc;
+
+			info->chip.ecc.calculate = nand_davinci_calculate_4bit;
+			info->chip.ecc.correct = nand_davinci_correct_4bit;
+			info->chip.ecc.hwctl = nand_davinci_hwctl_4bit;
+			info->chip.ecc.bytes = 10;
+		} else {
+			info->chip.ecc.calculate = nand_davinci_calculate_1bit;
+			info->chip.ecc.correct = nand_davinci_correct_1bit;
+			info->chip.ecc.hwctl = nand_davinci_hwctl_1bit;
+			info->chip.ecc.bytes = 3;
+		}
 		info->chip.ecc.size = 512;
-		info->chip.ecc.bytes = 3;
 		break;
-	case NAND_ECC_HW_SYNDROME:
-		/* FIXME implement */
-		info->chip.ecc.size = 512;
-		info->chip.ecc.bytes = 10;
-
-		dev_warn(&pdev->dev, "4-bit ECC nyet supported\n");
-		/* FALL THROUGH */
 	default:
 		ret = -EINVAL;
 		goto err_ecc;
@@ -435,12 +652,61 @@ static int __init nand_davinci_probe(str
 	spin_unlock_irq(&davinci_nand_lock);
 
 	/* Scan to find existence of the device(s) */
-	ret = nand_scan(&info->mtd, pdata->mask_chipsel ? 2 : 1);
+	ret = nand_scan_ident(&info->mtd, pdata->mask_chipsel ? 2 : 1);
 	if (ret < 0) {
 		dev_dbg(&pdev->dev, "no NAND chip(s) found\n");
 		goto err_scan;
 	}
 
+	/* update ECC layout if needed ... for ECC_HW, the default is OK,
+	 * but it allocates twice as much space as needed:  6 bytes ECC
+	 * every 512 bytes, vs just 3.
+	 */
+	if (pdata->ecc_bits == 4) {
+		int	chunks = info->mtd.writesize / 512;
+
+		if (!chunks || info->mtd.oobsize < 16) {
+			dev_dbg(&pdev->dev, "too small\n");
+			ret = -EINVAL;
+			goto err_scan;
+		}
+
+		/* For small page chips, preserve the manufacturer's
+		 * badblock marking data ... and reject flash BBT tables
+		 * for now, since the defaults want to write table tags
+		 * over the ECC data.
+		 */
+		if (chunks == 1) {
+			if (info->chip.options & NAND_USE_FLASH_BBT) {
+				dev_dbg(&pdev->dev, "using FLASH_BBT?\n");
+				ret = -EOPNOTSUPP;
+				goto err_scan;
+			}
+			info->ecclayout = hwecc4_small;
+			info->ecclayout.oobfree[2].length =
+				info->mtd.oobsize - 16;
+			goto syndrome_done;
+		}
+
+		/* For large page chips we'll be wanting to use a
+		 * not-yet-implemented mode that reads OOB data
+		 * before reading the body of the page, to avoid
+		 * the "infix OOB" model of NAND_ECC_HW_SYNDROME
+		 * (and preserve manufacturer badblock markings).
+		 */
+		dev_warn(&pdev->dev, "no 4-bit ECC support yet "
+				"for large page NAND\n");
+		ret = -EIO;
+		goto err_scan;
+
+syndrome_done:
+		info->chip.ecc.layout = &info->ecclayout;
+	}
+
+	ret = nand_scan_tail(&info->mtd);
+	if (ret < 0)
+		goto err_scan;
+
 	if (mtd_has_partitions()) {
 		struct mtd_partition	*mtd_parts = NULL;
 		int			mtd_parts_nb = 0;
@@ -503,6 +769,11 @@ err_scan:
 err_clk_enable:
 	clk_put(info->clk);
 
+	spin_lock_irq(&davinci_nand_lock);
+	if (ecc_mode == NAND_ECC_HW_SYNDROME)
+		ecc4_busy = false;
+	spin_unlock_irq(&davinci_nand_lock);
+
 err_ecc:
 err_clk:
 err_ioremap:
@@ -526,6 +797,11 @@ static int __exit nand_davinci_remove(st
 	else
 		status = del_mtd_device(&info->mtd);
 
+	spin_lock_irq(&davinci_nand_lock);
+	if (info->chip.ecc.mode == NAND_ECC_HW_SYNDROME)
+		ecc4_busy = false;
+	spin_unlock_irq(&davinci_nand_lock);
+
 	iounmap(info->base);
 	iounmap(info->vaddr);
 
