Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3D9EC433E6
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 04:13:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8C57564ECE
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 04:13:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8C57564ECE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gqYpQ1ZrAbeVnJAQeq56CakVsjUt+f+xsx6eBa6aHsg=; b=YTZNG2M/ZvPM/5AhnY+224wCc
	aLykE0C5zkITERdKzXQVU/+lJVmHF13b3G1jxmLzawZ+kwa85NzAtGUmRuko+fDRLJwspy1xN63iZ
	coxaBcBVlQP/3QlqdDRZWhZtlJBQ2Qa+KLLVjC/mz+ka4Jkywd+5P9i05xjrk8Pcf5TddM4thQGiN
	MglmkLlZmbcV3b0J5Xhq4dTHs7Ih1JzMPoZv07fWbCT9EQyXGXwbRmS56jWzfcmVm7odzyDesCne1
	FPRgkSwYRmaX15Oo2D4iplWVHLTp2j6+XwdRt9nKTsvkd7Sfy4Qh9yNn1ew0Ch7PEe45gcbAFbYDq
	zaOvmLjoQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lF80O-0001Ck-SM; Thu, 25 Feb 2021 04:12:00 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lF80L-0001Bi-L1
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 04:11:58 +0000
Received: by mail-pj1-x1033.google.com with SMTP id t9so2708697pjl.5
 for <linux-mtd@lists.infradead.org>; Wed, 24 Feb 2021 20:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=DB7bfEzcxye4XzMIV7ocpbFJ+y9Nf45pd30AunXv5Sc=;
 b=CO0Oyb2cACmh+nHgpf1wA7dUhchi5iJqDkUJejDLq1pYZoN3jP/zWgsMtpgppKVYng
 eMl7e2TUZP/ewkMz4dv75eXcYCsHDRU0oNzS5m8rFGOsTZ+XL2DKC98gelKWBgTnFsif
 A7K194iYkkQncMrihmqxHRtHqzoweuslEGe6lSTXQEI+sRTgdpG3GdJg/Fo1flTiIMd/
 Yzied55omB/H9nRnWqBUQlrxvu4cldY1KSfZSmIiCyxXqjs+b5Phnyi7dL5U51IKrzdb
 RwznV5jpMxXXGdlgfMzcgoQK/i+SuRBmAN+McKuyv/Mx8L2j02XJqNNT5SVxuYMCfHd5
 Xq4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=DB7bfEzcxye4XzMIV7ocpbFJ+y9Nf45pd30AunXv5Sc=;
 b=BaY9yYAxQSKM8GTUyMiACzquCK8Xyh/3WnJtZZB53vdAW9ruwy3HoZII4Ecf1XqTOy
 b7QugKmL8zBEtpWy+O7yMdeqNdgkhVM01esOYW+4Cc8oMqEUx/wPZuMgililU/qLUOtd
 KB9kpoVG432rVsHYUpiCRIZnh/o5jBaiv4e760lMMbiR7EV7MsAszBr2MZZaLwAwh+4K
 g3VEiTBNQ4dEpax2wFa/9tigvAOl/VprPFDtyprUAO86TlWVseaFLOtKbaI24hA8YnEX
 uJ8O+8Je08ZYaTDRqH7NanY56ptN3kkqf2Q28NbnlxV5+ulo7qY+08ODMHJM9KFjGL2e
 kv6Q==
X-Gm-Message-State: AOAM533jAINZoai0W8LO+DxeRUjYxw6gBwbv/5esHPwUobZM6Pf/KBlm
 xaosgZoMBxleThIhfJDXSjVM
X-Google-Smtp-Source: ABdhPJz0zA6h57DvGxap7iIQJVEfdzu+zHw9E31jRADQ1bH+dwlzuBDzNtH177RJfB9wY4nvCXTDSg==
X-Received: by 2002:a17:90a:65c4:: with SMTP id
 i4mr1291824pjs.132.1614226315475; 
 Wed, 24 Feb 2021 20:11:55 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
 by smtp.gmail.com with ESMTPSA id c12sm4155494pjq.48.2021.02.24.20.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Feb 2021 20:11:54 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v2 3/3] mtd: rawnand: qcom: Add support for secure regions in
 NAND memory
Date: Thu, 25 Feb 2021 09:41:29 +0530
Message-Id: <20210225041129.58576-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
References: <20210225041129.58576-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210224_231157_755371_584B51A2 
X-CRM114-Status: GOOD (  20.41  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Daniele.Palmas@telit.com,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 linux-kernel@vger.kernel.org, bjorn.andersson@linaro.org,
 boris.brezillon@collabora.com, linux-mtd@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

The regions are declared using a NAND chip DT property,
"nand-secure-regions". So let's make use of this property and skip
access to the secure regions present in a system.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 72 +++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index fd4c318b520f..aa4ca298d357 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -431,6 +431,11 @@ struct qcom_nand_controller {
  * @cfg0, cfg1, cfg0_raw..:	NANDc register configurations needed for
  *				ecc/non-ecc mode for the current nand flash
  *				device
+ *
+ * @sec_regions:		Array representing the secure regions in the
+ *				NAND chip
+ *
+ * @nr_sec_regions:		Number of secure regions in the NAND chip
  */
 struct qcom_nand_host {
 	struct nand_chip chip;
@@ -453,6 +458,9 @@ struct qcom_nand_host {
 	u32 ecc_bch_cfg;
 	u32 clrflashstatus;
 	u32 clrreadstatus;
+
+	u32 *sec_regions;
+	u8 nr_sec_regions;
 };
 
 /*
@@ -662,16 +670,27 @@ static void nandc_set_reg(struct qcom_nand_controller *nandc, int offset,
 }
 
 /* helper to configure address register values */
-static void set_address(struct qcom_nand_host *host, u16 column, int page)
+static int set_address(struct qcom_nand_host *host, u16 column, int page)
 {
 	struct nand_chip *chip = &host->chip;
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	u32 offs = page << chip->page_shift;
+	int i, j;
+
+	/* Skip touching the secure regions if present */
+	for (i = 0, j = 0; i < host->nr_sec_regions; i++, j += 2) {
+		if (offs >= host->sec_regions[j] &&
+		    (offs <= host->sec_regions[j] + host->sec_regions[j + 1]))
+			return -EIO;
+	}
 
 	if (chip->options & NAND_BUSWIDTH_16)
 		column >>= 1;
 
 	nandc_set_reg(nandc, NAND_ADDR0, page << 16 | column);
 	nandc_set_reg(nandc, NAND_ADDR1, page >> 16 & 0xff);
+
+	return 0;
 }
 
 /*
@@ -1491,13 +1510,13 @@ static void qcom_nandc_command(struct nand_chip *chip, unsigned int command,
 		WARN_ON(column != 0);
 
 		host->use_ecc = true;
-		set_address(host, 0, page_addr);
+		ret = set_address(host, 0, page_addr);
 		update_rw_regs(host, ecc->steps, true);
 		break;
 
 	case NAND_CMD_SEQIN:
 		WARN_ON(column != 0);
-		set_address(host, 0, page_addr);
+		ret = set_address(host, 0, page_addr);
 		break;
 
 	case NAND_CMD_PAGEPROG:
@@ -1615,7 +1634,10 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	host->use_ecc = false;
 
 	clear_bam_transaction(nandc);
-	set_address(host, host->cw_size * cw, page);
+	ret = set_address(host, host->cw_size * cw, page);
+	if (ret)
+		return ret;
+
 	update_rw_regs(host, 1, true);
 	config_nand_page_read(nandc);
 
@@ -1943,7 +1965,10 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	/* prepare a clean read buffer */
 	memset(nandc->data_buffer, 0xff, size);
 
-	set_address(host, host->cw_size * (ecc->steps - 1), page);
+	ret = set_address(host, host->cw_size * (ecc->steps - 1), page);
+	if (ret)
+		return ret;
+
 	update_rw_regs(host, 1, true);
 
 	config_nand_single_cw_page_read(nandc, host->use_ecc);
@@ -2005,12 +2030,16 @@ static int qcom_nandc_read_oob(struct nand_chip *chip, int page)
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
+	int ret;
 
 	clear_read_regs(nandc);
 	clear_bam_transaction(nandc);
 
 	host->use_ecc = true;
-	set_address(host, 0, page);
+	ret = set_address(host, 0, page);
+	if (ret)
+		return ret;
+
 	update_rw_regs(host, ecc->steps, true);
 
 	return read_page_ecc(host, NULL, chip->oob_poi, page);
@@ -2188,7 +2217,10 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	mtd_ooblayout_get_databytes(mtd, nandc->data_buffer + data_size, oob,
 				    0, mtd->oobavail);
 
-	set_address(host, host->cw_size * (ecc->steps - 1), page);
+	ret = set_address(host, host->cw_size * (ecc->steps - 1), page);
+	if (ret)
+		return ret;
+
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
@@ -2267,7 +2299,10 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 
 	/* prepare write */
 	host->use_ecc = false;
-	set_address(host, host->cw_size * (ecc->steps - 1), page);
+	ret = set_address(host, host->cw_size * (ecc->steps - 1), page);
+	if (ret)
+		return ret;
+
 	update_rw_regs(host, 1, false);
 
 	config_nand_page_write(nandc);
@@ -2830,7 +2865,8 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	struct nand_chip *chip = &host->chip;
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct device *dev = nandc->dev;
-	int ret;
+	struct property *prop;
+	int ret, length, nr_elem;
 
 	ret = of_property_read_u32(dn, "reg", &host->cs);
 	if (ret) {
@@ -2886,6 +2922,24 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 		}
 	}
 
+	/*
+	 * Look for secure regions in the NAND chip. These regions are supposed
+	 * to be protected by a secure element like Trustzone. So the read/write
+	 * accesses to these regions will be blocked in the runtime by this
+	 * driver.
+	 */
+	prop = of_find_property(dn, "nand-secure-regions", &length);
+	if (prop) {
+		nr_elem = length / sizeof(u32);
+		host->nr_sec_regions = nr_elem / 2;
+
+		host->sec_regions = devm_kcalloc(dev, nr_elem, sizeof(u32), GFP_KERNEL);
+		if (!host->sec_regions)
+			return -ENOMEM;
+
+		of_property_read_u32_array(dn, "nand-secure-regions", host->sec_regions, nr_elem);
+	}
+
 	ret = mtd_device_parse_register(mtd, probes, NULL, NULL, 0);
 	if (ret)
 		nand_cleanup(chip);
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
