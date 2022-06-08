Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22164C43334
	for <linux-mtd@archiver.kernel.org>; Wed,  8 Jun 2022 00:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0jR1Y5QKrGEKxEoQGbcckFyFZl7Eh/fu4mrI+Zb69GE=; b=CgLWqPAH67FNhB
	/c90RQt3EVb4tH0gZKkLfFTnLDJo4aoNR7o7hf2hhVD92qaoGwVm4Ve57Vp21frU5RowT3m0i2h13
	99Ui5tmsRFlBU/Is2EnSaAMzNANYgFmfh1WLfG8dWy441mW4NCR/wTfAOA1UbmYBvhdjDp0+T+VBA
	SnD9MYnrXaVgFwBlF8KYbUDX99c/JhWO18i7SxCyegUX0wLXK/f7S3/zDOdlXurSRO80FJGcWW3S5
	EIheJOY247S0njwP4P54/FbhxSatpE7REUYghLt61GXJTp3vk0OLDQsKC53RqhI3inRDZE6n5UCE5
	CGUHwOkA3NjDMQHuAsSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIS-00A4VJ-9T; Wed, 08 Jun 2022 00:11:40 +0000
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyjIO-00A4Se-VT
	for linux-mtd@lists.infradead.org; Wed, 08 Jun 2022 00:11:39 +0000
Received: by mail-ed1-x52b.google.com with SMTP id z7so24952862edm.13
        for <linux-mtd@lists.infradead.org>; Tue, 07 Jun 2022 17:11:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tll2fCaN78MIGvxzfGVAf3AAotU9jIgWvlVPfP8AhT8=;
        b=pdViDrjZaQwEwsDhsabeayR90OX9InQJlMAu7A2tP6qtV8+w2IAmOt78wWYCZZakG1
         8v/j9A6UyJcsIQIuW27SWYimYawk4aPWNnppOZltb2jsfF8wNITbqbMJaXda+nwo79eK
         N1vaH0g8V6Y3bjbE/WVCDM7mSOCU/juPTljIDPIhkXJUaTCxnOK2BT3T9EhKk7KIX1+T
         YjyDS6cSf1hLtr3pWg+8HwhGddf/nhTVdOHAUyV6ux9Lh/JzIKA3ESAAlHB4zckDxnQT
         b6D0FCYAwYqMRgib2vC/JD7ioFiZVZ4m5GPmV2mSyYSkz6BhbCjhp92hxftSzsw62ijA
         ndsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tll2fCaN78MIGvxzfGVAf3AAotU9jIgWvlVPfP8AhT8=;
        b=3P0FfpT9CI4ur/TTP7c9BZzMltW8Cv8RoEzN9GnEerg9wvIYL1+ppfw4z1le2IxQOw
         ZizqYhALota4NADTv8/Hab2np9slcVwlZHNx6o+754KyDG/bhv0RVyqToj4EZHUawtYw
         wup8m1Ln9S+SdykgMoCK+YxDTP1t0oDPgHBryoydcRhVaCKHBGNeQh5/tUHUC/JbUsI+
         DmyqQQk6f1fFze/pZBNJx0FS0OP3Qtx2ZHYgL13NFlprPtVdwtR1Oh3oz5Pn8nkrKcr7
         jtjcXzgc9xnLgvifv52lBlqCFE9W/fEkZWuxlXrYql0428JZqamB8Zlo70zjNIo6t1AQ
         4ROQ==
X-Gm-Message-State: AOAM530D9EQLMBrmDf5RIoEgsknkX5M0UcvvDQbEOIoOYSr3kwE36uI1
	d7WgGQtWJNfAMWghSDUxs1s=
X-Google-Smtp-Source: ABdhPJxT0561GRephF2kopVtVVx9/haAuk/Wum4uzMEa7sRhPT/1NaYuz90C7KTE+XxTBC52vjCZuA==
X-Received: by 2002:aa7:d481:0:b0:42d:d5fd:f963 with SMTP id b1-20020aa7d481000000b0042dd5fdf963mr36448765edr.209.1654647093071;
        Tue, 07 Jun 2022 17:11:33 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id o19-20020a1709061b1300b006fed85c1a8fsm8434947ejg.202.2022.06.07.17.11.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Jun 2022 17:11:32 -0700 (PDT)
From: Ansuel Smith <ansuelsmth@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <bjorn.andersson@linaro.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ansuel Smith <ansuelsmth@gmail.com>
Subject: [PATCH v5 1/3] mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages
Date: Wed,  8 Jun 2022 02:10:28 +0200
Message-Id: <20220608001030.18813-2-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220608001030.18813-1-ansuelsmth@gmail.com>
References: <20220608001030.18813-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_171137_064572_F7F39279 
X-CRM114-Status: GOOD (  36.63  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

IPQ8064 nand have special pages where a different layout scheme is used.
These special page are used by boot partition and on reading them
lots of warning are reported about wrong ECC data and if written to
results in broken data and not bootable device.

The layout scheme used by these special page consist in using 512 bytes
as the codeword size (even for the last codeword) while writing to CFG0
register. This forces the NAND controller to unprotect the 4 bytes of
spare data.

Since the kernel is unaware of this different layout for these special
page, it does try to protect the spare data too during read/write and
warn about CRC errors.

Add support for this by permitting the user to declare these special
pages in dts by declaring offset and size of the partition. The driver
internally will convert these value to nand pages.

On user read/write the page is checked and if it's a boot page the
correct layout is used.

Signed-off-by: Ansuel Smith <ansuelsmth@gmail.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 174 +++++++++++++++++++++++++++++-
 1 file changed, 169 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 1a77542c6d67..06ee9a836a3b 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -80,8 +80,10 @@
 #define	DISABLE_STATUS_AFTER_WRITE	4
 #define	CW_PER_PAGE			6
 #define	UD_SIZE_BYTES			9
+#define	UD_SIZE_BYTES_MASK		GENMASK(18, 9)
 #define	ECC_PARITY_SIZE_BYTES_RS	19
 #define	SPARE_SIZE_BYTES		23
+#define	SPARE_SIZE_BYTES_MASK		GENMASK(26, 23)
 #define	NUM_ADDR_CYCLES			27
 #define	STATUS_BFR_READ			30
 #define	SET_RD_MODE_AFTER_STATUS	31
@@ -102,6 +104,7 @@
 #define	ECC_MODE			4
 #define	ECC_PARITY_SIZE_BYTES_BCH	8
 #define	ECC_NUM_DATA_BYTES		16
+#define	ECC_NUM_DATA_BYTES_MASK		GENMASK(25, 16)
 #define	ECC_FORCE_CLK_OPEN		30
 
 /* NAND_DEV_CMD1 bits */
@@ -418,6 +421,19 @@ struct qcom_nand_controller {
 	const struct qcom_nandc_props *props;
 };
 
+/*
+ * NAND special boot partitions
+ *
+ * @page_offset:		offset of the partition where spare data is not protected
+ *				by ECC (value in pages)
+ * @page_offset:		size of the partition where spare data is not protected
+ *				by ECC (value in pages)
+ */
+struct qcom_nand_boot_partition {
+	u32 page_offset;
+	u32 page_size;
+};
+
 /*
  * NAND chip structure
  *
@@ -444,6 +460,13 @@ struct qcom_nand_controller {
  * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
  *				ecc/non-ecc mode for the current nand flash
  *				device
+ *
+ * @codeword_fixup:		keep track of the current layout used by
+ *				the driver for read/write operation.
+ * @nr_boot_partitions:		count of the boot partitions where spare data is not
+ *				protected by ECC
+ * @boot_pages:			array of boot partitions where offset and size of the
+ *				boot partitions are stored
  */
 struct qcom_nand_host {
 	struct nand_chip chip;
@@ -466,6 +489,10 @@ struct qcom_nand_host {
 	u32 ecc_bch_cfg;
 	u32 clrflashstatus;
 	u32 clrreadstatus;
+
+	bool codeword_fixup;
+	int nr_boot_partitions;
+	struct qcom_nand_boot_partition *boot_partitions;
 };
 
 /*
@@ -475,6 +502,7 @@ struct qcom_nand_host {
  * @is_bam - whether NAND controller is using BAM
  * @is_qpic - whether NAND CTRL is part of qpic IP
  * @qpic_v2 - flag to indicate QPIC IP version 2
+ * @use_codeword_fixup - whether NAND has different layout for boot partitions
  * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  */
 struct qcom_nandc_props {
@@ -482,6 +510,7 @@ struct qcom_nandc_props {
 	bool is_bam;
 	bool is_qpic;
 	bool qpic_v2;
+	bool use_codeword_fixup;
 	u32 dev_cmd_reg_start;
 };
 
@@ -1701,7 +1730,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
 
-	if (qcom_nandc_is_last_cw(ecc, cw)) {
+	if (qcom_nandc_is_last_cw(ecc, cw) && !host->codeword_fixup) {
 		data_size2 = ecc->size - data_size1 -
 			     ((ecc->steps - 1) * 4);
 		oob_size2 = (ecc->steps * 4) + host->ecc_bytes_hw +
@@ -1782,7 +1811,7 @@ check_for_erased_page(struct qcom_nand_host *host, u8 *data_buf,
 	}
 
 	for_each_set_bit(cw, &uncorrectable_cws, ecc->steps) {
-		if (qcom_nandc_is_last_cw(ecc, cw)) {
+		if (qcom_nandc_is_last_cw(ecc, cw) && !host->codeword_fixup) {
 			data_size = ecc->size - ((ecc->steps - 1) * 4);
 			oob_size = (ecc->steps * 4) + host->ecc_bytes_hw;
 		} else {
@@ -1940,7 +1969,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (qcom_nandc_is_last_cw(ecc, i)) {
+		if (qcom_nandc_is_last_cw(ecc, i) && !host->codeword_fixup) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2037,6 +2066,55 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	return ret;
 }
 
+static bool
+qcom_nandc_is_boot_page(struct qcom_nand_host *host, int page)
+{
+	struct qcom_nand_boot_partition *boot_partition;
+	u32 start, end;
+	int i;
+
+	for (i = 0; i < host->nr_boot_partitions; i++) {
+		boot_partition = &host->boot_partitions[i];
+		start = boot_partition->page_offset;
+		end = start + boot_partition->page_size;
+
+		/* Boot pages are normally at the start of
+		 * the nand in various partition.
+		 * Check the page from the boot page end first
+		 * to save one extra check and optimize this
+		 * in case real no-boot partition are used.
+		 */
+		if (page < end && page >= start)
+			return true;
+	}
+
+	return false;
+}
+
+static void
+qcom_nandc_codeword_fixup(struct qcom_nand_host *host, int page)
+{
+	bool codeword_fixup = qcom_nandc_is_boot_page(host, page);
+
+	/* Skip conf write if we are already in the correct mode */
+	if (codeword_fixup == host->codeword_fixup)
+		return;
+
+	host->codeword_fixup = codeword_fixup;
+
+	host->cw_data = codeword_fixup ? 512 : 516;
+	host->spare_bytes = host->cw_size - host->ecc_bytes_hw -
+			    host->bbm_size - host->cw_data;
+
+	host->cfg0 &= ~(SPARE_SIZE_BYTES_MASK | UD_SIZE_BYTES_MASK);
+	host->cfg0 |= host->spare_bytes << SPARE_SIZE_BYTES |
+		      host->cw_data << UD_SIZE_BYTES;
+
+	host->ecc_bch_cfg &= ~ECC_NUM_DATA_BYTES_MASK;
+	host->ecc_bch_cfg |= host->cw_data << ECC_NUM_DATA_BYTES;
+	host->ecc_buf_cfg = (codeword_fixup ? 0x1ff : 0x203) << NUM_STEPS;
+}
+
 /* implements ecc->read_page() */
 static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
 				int oob_required, int page)
@@ -2045,6 +2123,9 @@ static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	u8 *data_buf, *oob_buf = NULL;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	nand_read_page_op(chip, page, 0, NULL, 0);
 	data_buf = buf;
 	oob_buf = oob_required ? chip->oob_poi : NULL;
@@ -2064,6 +2145,9 @@ static int qcom_nandc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	int cw, ret;
 	u8 *data_buf = buf, *oob_buf = chip->oob_poi;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	for (cw = 0; cw < ecc->steps; cw++) {
 		ret = qcom_nandc_read_cw_raw(mtd, chip, data_buf, oob_buf,
 					     page, cw);
@@ -2084,6 +2168,9 @@ static int qcom_nandc_read_oob(struct nand_chip *chip, int page)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	clear_read_regs(nandc);
 	clear_bam_transaction(nandc);
 
@@ -2104,6 +2191,9 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	u8 *data_buf, *oob_buf;
 	int i, ret;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 
 	clear_read_regs(nandc);
@@ -2119,7 +2209,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (qcom_nandc_is_last_cw(ecc, i)) {
+		if (qcom_nandc_is_last_cw(ecc, i) && !host->codeword_fixup) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2176,6 +2266,9 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 	u8 *data_buf, *oob_buf;
 	int i, ret;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 	clear_read_regs(nandc);
 	clear_bam_transaction(nandc);
@@ -2194,7 +2287,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 		data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 		oob_size1 = host->bbm_size;
 
-		if (qcom_nandc_is_last_cw(ecc, i)) {
+		if (qcom_nandc_is_last_cw(ecc, i) && !host->codeword_fixup) {
 			data_size2 = ecc->size - data_size1 -
 				     ((ecc->steps - 1) << 2);
 			oob_size2 = (ecc->steps << 2) + host->ecc_bytes_hw +
@@ -2254,6 +2347,9 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	int data_size, oob_size;
 	int ret;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	host->use_ecc = true;
 	clear_bam_transaction(nandc);
 
@@ -2902,6 +2998,71 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 
 static const char * const probes[] = { "cmdlinepart", "ofpart", "qcomsmem", NULL };
 
+static int qcom_nand_host_parse_boot_partitions(struct qcom_nand_controller *nandc,
+						struct qcom_nand_host *host,
+						struct device_node *dn)
+{
+	struct nand_chip *chip = &host->chip;
+	struct mtd_info *mtd = nand_to_mtd(chip);
+	struct qcom_nand_boot_partition *boot_partition;
+	struct device *dev = nandc->dev;
+	int partitions_count, i, j, ret;
+
+	if (!nandc->props->use_codeword_fixup)
+		return 0;
+
+	if (!of_find_property(dn, "qcom,boot-partitions", NULL))
+		return 0;
+
+	partitions_count = of_property_count_u32_elems(dn, "qcom,boot-partitions");
+	if (partitions_count < 0) {
+		dev_err(dev, "Error parsing boot partition.");
+		return ret;
+	}
+
+	host->nr_boot_partitions = partitions_count / 2;
+	host->boot_partitions = devm_kcalloc(dev, host->nr_boot_partitions,
+					     sizeof(*host->boot_partitions), GFP_KERNEL);
+	if (!host->boot_partitions)
+		return -ENOMEM;
+
+	for (i = 0, j = 0; i < host->nr_boot_partitions; i++, j += 2) {
+		boot_partition = &host->boot_partitions[i];
+
+		ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j,
+						 &boot_partition->page_offset);
+		if (ret) {
+			dev_err(dev, "Error parsing boot partition offset at index %d", i);
+			return ret;
+		}
+
+		if (boot_partition->page_offset % mtd->writesize) {
+			dev_err(dev, "Boot partition offset not multiple of writesize at index %i",
+				i);
+			return -EINVAL;
+		}
+		/* Convert offset to nand pages */
+		boot_partition->page_offset /= mtd->writesize;
+
+		ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j + 1,
+						 &boot_partition->page_size);
+		if (ret) {
+			dev_err(dev, "Error parsing boot partition size at index %d", i);
+			return ret;
+		}
+
+		if (boot_partition->page_size % mtd->writesize) {
+			dev_err(dev, "Boot partition size not multiple of writesize at index %i",
+				i);
+			return -EINVAL;
+		}
+		/* Convert size to nand pages */
+		boot_partition->page_size /= mtd->writesize;
+	}
+
+	return 0;
+}
+
 static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 					    struct qcom_nand_host *host,
 					    struct device_node *dn)
@@ -2970,6 +3131,8 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		nand_cleanup(chip);
 
+	qcom_nand_host_parse_boot_partitions(nandc, host, dn);
+
 	return ret;
 }
 
@@ -3135,6 +3298,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
 static const struct qcom_nandc_props ipq806x_nandc_props = {
 	.ecc_modes = (ECC_RS_4BIT | ECC_BCH_8BIT),
 	.is_bam = false,
+	.use_codeword_fixup = true,
 	.dev_cmd_reg_start = 0x0,
 };
 
-- 
2.36.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
