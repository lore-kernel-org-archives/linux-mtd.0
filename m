Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0F4BCCA482
	for <linux-mtd@archiver.kernel.org>; Wed, 15 Jun 2022 01:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wjqAgVtIHSXmRdXG4vk7xMSkMSxuzBBohPDDu4Drhgs=; b=ApLGsjfG7JIgtz
	vDNfvEhJ2eMf/slrameZZwhowRTRoKdJ7j+8yGTM9jFe7DK/nGkadhd4nlo5w5IfY+OpmAPJf4Sl4
	cfAU7FT6gU+Y6udBcKB7JaRrc6ZUifGIAlIB8hFxsNvaJTr2idAjAwaFZ+cBep+sthOSDMhtY2q7u
	SmBQmSU8zh/AHgFCuvgPz/KHR8hCeeuAyRYSIDyVf5KlO+kK9KTMsXVoA+dKP10c2jYUMYjtUfI1C
	NsHaWHltrJq0ILmxc68l9w6YfB4GSgAKh38mUvOe4ibRMLGaOjW3t4NyS3b9ApResTH5MJ3vKz42s
	s0v8IprYq/ln1jgKk55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOO-00ByQY-L2; Wed, 15 Jun 2022 01:00:20 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1HOK-00ByNk-Mr
	for linux-mtd@lists.infradead.org; Wed, 15 Jun 2022 01:00:18 +0000
Received: by mail-wm1-x32c.google.com with SMTP id z17so5517552wmi.1
        for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2022 18:00:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hOdZeYuV7GkVqPupZgAuMtBvoLOoa6tTUb0OkZyxymA=;
        b=Nv0nYBGoq7tegE1ol2SjNki1h5G5Y7jh5Wm73h/8XoqloNBd1OBlUnZwwOhh2zuFZ9
         gBK1eiNsmKpdkfUnlXYrWNjBnyDPbgCgqd+Wiy4aR9qDWNGZXaLsPmySiX4yk165AGHa
         nvflai1vFlZfgIhPOhrW3qCVWowqhL/WB+Ar0Nk34FLKltf+LVRWM58WH+cQu9oIR3OK
         ZkQhm7lQJF5ScILm13ZdNQsgBceE0GxL8fD3Sp1OQHMjuLX1bZn1QygueoGGy57DOpR1
         C0zewGYJQt/ezMe11Bng+jBuKYKwJi64fVvj0RW1rl1qkdErdI0tK+LhJ9YnDocFQLOE
         p90w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hOdZeYuV7GkVqPupZgAuMtBvoLOoa6tTUb0OkZyxymA=;
        b=AYXc2J66Ct1MkSFGZ1Cjemfl45fZGFprQ/WA8NN+UdyKK2HJRK01ZU7dnho2OK4jTE
         3qqEn5JHRdHEJnhzSQJs5TcKKiPLq4dGDqpglY9oCb680qbo6Kaul/ksRUfS9kdw7UzQ
         dNdNPT7qWZJ/0BcQP/iQD1hQjO88IHJQsWRilbNO10C87izg0oRXpVQJBVv/PkWcRl7Z
         mBpVKZC4NPda+P9xjWla2AAY+PZiUFvmMHcKBXtq9B56MxnGO5xtuZdFEqGmabOVrIrT
         Ca9yTRvoBWHifTT9RcAzZTlHiwAbzRAIP4ilRx7zgZuNxhZK0MOOZ+pEuSfDaHOAKWi5
         LZqQ==
X-Gm-Message-State: AOAM532MvKDkxlEzCdJaPoItHvrhFX68oM7NOJvWvwGgf6xZmID6FWZ4
	v3Tzm78ATXsD+XtfcJIwfqU=
X-Google-Smtp-Source: ABdhPJwQP0BoteErIIYKSZXkUAbooYehYXX0N2VWnvyqkgRp/1zdb+MCFFuKXtIxa280F4WF0P6sJw==
X-Received: by 2002:a05:600c:4fcb:b0:39c:64cd:cc89 with SMTP id o11-20020a05600c4fcb00b0039c64cdcc89mr7002797wmq.197.1655254814400;
        Tue, 14 Jun 2022 18:00:14 -0700 (PDT)
Received: from localhost.localdomain (93-42-70-190.ip85.fastwebnet.it. [93.42.70.190])
        by smtp.googlemail.com with ESMTPSA id g10-20020a5d698a000000b0021020517639sm12890265wru.102.2022.06.14.18.00.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jun 2022 18:00:12 -0700 (PDT)
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
Subject: [PATCH v7 2/3] mtd: nand: raw: qcom_nandc: add support for unprotected spare data pages
Date: Wed, 15 Jun 2022 02:06:11 +0200
Message-Id: <20220615000612.3119-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220615000612.3119-1-ansuelsmth@gmail.com>
References: <20220615000612.3119-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220614_180016_779822_FDD7BF89 
X-CRM114-Status: GOOD (  37.94  )
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
 drivers/mtd/nand/raw/qcom_nandc.c | 203 +++++++++++++++++++++++++++++-
 1 file changed, 198 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f2990d721733..0dbfe32888ff 100644
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
@@ -431,13 +434,32 @@ struct qcom_nand_controller {
 	u32 cmd1, vld;
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
+ * @boot_partitions:		array of boot partitions where offset and size of the
+ *				boot partitions are stored
+ *
  * @chip:			base NAND chip structure
  * @node:			list node to add itself to host_list in
  *				qcom_nand_controller
  *
+ * @nr_boot_partitions:		count of the boot partitions where spare data is not
+ *				protected by ECC
+ *
  * @cs:				chip select value for this chip
  * @cw_size:			the number of bytes in a single step/codeword
  *				of a page, consisting of all data, ecc, spare
@@ -456,14 +478,20 @@ struct qcom_nand_controller {
  *
  * @status:			value to be returned if NAND_CMD_STATUS command
  *				is executed
+ * @codeword_fixup:		keep track of the current layout used by
+ *				the driver for read/write operation.
  * @use_ecc:			request the controller to use ECC for the
  *				upcoming read/write
  * @bch_enabled:		flag to tell whether BCH ECC mode is used
  */
 struct qcom_nand_host {
+	struct qcom_nand_boot_partition *boot_partitions;
+
 	struct nand_chip chip;
 	struct list_head node;
 
+	int nr_boot_partitions;
+
 	int cs;
 	int cw_size;
 	int cw_data;
@@ -481,6 +509,7 @@ struct qcom_nand_host {
 	u32 clrreadstatus;
 
 	u8 status;
+	bool codeword_fixup;
 	bool use_ecc;
 	bool bch_enabled;
 };
@@ -493,6 +522,7 @@ struct qcom_nand_host {
  * @is_bam - whether NAND controller is using BAM
  * @is_qpic - whether NAND CTRL is part of qpic IP
  * @qpic_v2 - flag to indicate QPIC IP version 2
+ * @use_codeword_fixup - whether NAND has different layout for boot partitions
  */
 struct qcom_nandc_props {
 	u32 ecc_modes;
@@ -500,6 +530,7 @@ struct qcom_nandc_props {
 	bool is_bam;
 	bool is_qpic;
 	bool qpic_v2;
+	bool use_codeword_fixup;
 };
 
 /* Frees the BAM transaction memory */
@@ -1718,7 +1749,7 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 	oob_size1 = host->bbm_size;
 
-	if (qcom_nandc_is_last_cw(ecc, cw)) {
+	if (qcom_nandc_is_last_cw(ecc, cw) && !host->codeword_fixup) {
 		data_size2 = ecc->size - data_size1 -
 			     ((ecc->steps - 1) * 4);
 		oob_size2 = (ecc->steps * 4) + host->ecc_bytes_hw +
@@ -1799,7 +1830,7 @@ check_for_erased_page(struct qcom_nand_host *host, u8 *data_buf,
 	}
 
 	for_each_set_bit(cw, &uncorrectable_cws, ecc->steps) {
-		if (qcom_nandc_is_last_cw(ecc, cw)) {
+		if (qcom_nandc_is_last_cw(ecc, cw) && !host->codeword_fixup) {
 			data_size = ecc->size - ((ecc->steps - 1) * 4);
 			oob_size = (ecc->steps * 4) + host->ecc_bytes_hw;
 		} else {
@@ -1957,7 +1988,7 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (qcom_nandc_is_last_cw(ecc, i)) {
+		if (qcom_nandc_is_last_cw(ecc, i) && !host->codeword_fixup) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2054,6 +2085,70 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	return ret;
 }
 
+static bool qcom_nandc_is_boot_partition(struct qcom_nand_host *host, int page)
+{
+	struct qcom_nand_boot_partition *boot_partition;
+	u32 start, end;
+	int i;
+
+	/*
+	 * Since the frequent access will be to the non-boot partitions like rootfs,
+	 * optimize the page check by:
+
+	 * 1. Checking if the page lies after the last boot partition.
+	 * 2. Checking from the boot partition end.
+	 */
+
+	/* First check the last boot partition */
+	boot_partition = &host->boot_partitions[host->nr_boot_partitions - 1];
+	start = boot_partition->page_offset;
+	end = start + boot_partition->page_size;
+
+	/* Page is after the last boot partition end. This is NOT a boot partition */
+	if (page > end)
+		return false;
+
+	/* Actually check if it's a boot partition */
+	if (page < end && page >= start)
+		return true;
+
+	/* Check the other boot partition starting from the second-last partition */
+	for (i = host->nr_boot_partitions - 2; i >= 0; i--) {
+		boot_partition = &host->boot_partitions[i];
+		start = boot_partition->page_offset;
+		end = start + boot_partition->page_size;
+
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
+	bool codeword_fixup = qcom_nandc_is_boot_partition(host, page);
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
+	host->ecc_buf_cfg = (host->cw_data - 1) << NUM_STEPS;
+}
+
 /* implements ecc->read_page() */
 static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
 				int oob_required, int page)
@@ -2062,6 +2157,9 @@ static int qcom_nandc_read_page(struct nand_chip *chip, uint8_t *buf,
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	u8 *data_buf, *oob_buf = NULL;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	nand_read_page_op(chip, page, 0, NULL, 0);
 	data_buf = buf;
 	oob_buf = oob_required ? chip->oob_poi : NULL;
@@ -2081,6 +2179,9 @@ static int qcom_nandc_read_page_raw(struct nand_chip *chip, uint8_t *buf,
 	int cw, ret;
 	u8 *data_buf = buf, *oob_buf = chip->oob_poi;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	for (cw = 0; cw < ecc->steps; cw++) {
 		ret = qcom_nandc_read_cw_raw(mtd, chip, data_buf, oob_buf,
 					     page, cw);
@@ -2101,6 +2202,9 @@ static int qcom_nandc_read_oob(struct nand_chip *chip, int page)
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	clear_read_regs(nandc);
 	clear_bam_transaction(nandc);
 
@@ -2121,6 +2225,9 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	u8 *data_buf, *oob_buf;
 	int i, ret;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 
 	clear_read_regs(nandc);
@@ -2136,7 +2243,7 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const uint8_t *buf,
 	for (i = 0; i < ecc->steps; i++) {
 		int data_size, oob_size;
 
-		if (qcom_nandc_is_last_cw(ecc, i)) {
+		if (qcom_nandc_is_last_cw(ecc, i) && !host->codeword_fixup) {
 			data_size = ecc->size - ((ecc->steps - 1) << 2);
 			oob_size = (ecc->steps << 2) + host->ecc_bytes_hw +
 				   host->spare_bytes;
@@ -2193,6 +2300,9 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 	u8 *data_buf, *oob_buf;
 	int i, ret;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	nand_prog_page_begin_op(chip, page, 0, NULL, 0);
 	clear_read_regs(nandc);
 	clear_bam_transaction(nandc);
@@ -2211,7 +2321,7 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 		data_size1 = mtd->writesize - host->cw_size * (ecc->steps - 1);
 		oob_size1 = host->bbm_size;
 
-		if (qcom_nandc_is_last_cw(ecc, i)) {
+		if (qcom_nandc_is_last_cw(ecc, i) && !host->codeword_fixup) {
 			data_size2 = ecc->size - data_size1 -
 				     ((ecc->steps - 1) << 2);
 			oob_size2 = (ecc->steps << 2) + host->ecc_bytes_hw +
@@ -2271,6 +2381,9 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	int data_size, oob_size;
 	int ret;
 
+	if (host->nr_boot_partitions)
+		qcom_nandc_codeword_fixup(host, page);
+
 	host->use_ecc = true;
 	clear_bam_transaction(nandc);
 
@@ -2919,6 +3032,77 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 
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
+	if (!of_find_property(dn, "qcom,boot-partitions", NULL))
+		return 0;
+
+	partitions_count = of_property_count_u32_elems(dn, "qcom,boot-partitions");
+	if (partitions_count <= 0) {
+		dev_err(dev, "Error parsing boot partition\n");
+		if (partitions_count == 0)
+			return -EINVAL;
+		else
+			return partitions_count;
+	}
+
+	host->nr_boot_partitions = partitions_count / 2;
+	host->boot_partitions = devm_kcalloc(dev, host->nr_boot_partitions,
+					     sizeof(*host->boot_partitions), GFP_KERNEL);
+	if (!host->boot_partitions) {
+		host->nr_boot_partitions = 0;
+		return -ENOMEM;
+	}
+
+	for (i = 0, j = 0; i < host->nr_boot_partitions; i++, j += 2) {
+		boot_partition = &host->boot_partitions[i];
+
+		ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j,
+						 &boot_partition->page_offset);
+		if (ret) {
+			dev_err(dev, "Error parsing boot partition offset at index %d\n", i);
+			host->nr_boot_partitions = 0;
+			return ret;
+		}
+
+		if (boot_partition->page_offset % mtd->writesize) {
+			dev_err(dev, "Boot partition offset not multiple of writesize at index %i\n",
+				i);
+			host->nr_boot_partitions = 0;
+			return -EINVAL;
+		}
+		/* Convert offset to nand pages */
+		boot_partition->page_offset /= mtd->writesize;
+
+		ret = of_property_read_u32_index(dn, "qcom,boot-partitions", j + 1,
+						 &boot_partition->page_size);
+		if (ret) {
+			dev_err(dev, "Error parsing boot partition size at index %d\n", i);
+			host->nr_boot_partitions = 0;
+			return ret;
+		}
+
+		if (boot_partition->page_size % mtd->writesize) {
+			dev_err(dev, "Boot partition size not multiple of writesize at index %i\n",
+				i);
+			host->nr_boot_partitions = 0;
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
@@ -2987,6 +3171,14 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	if (ret)
 		nand_cleanup(chip);
 
+	if (nandc->props->use_codeword_fixup) {
+		ret = qcom_nand_host_parse_boot_partitions(nandc, host, dn);
+		if (ret) {
+			nand_cleanup(chip);
+			return ret;
+		}
+	}
+
 	return ret;
 }
 
@@ -3152,6 +3344,7 @@ static int qcom_nandc_remove(struct platform_device *pdev)
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
