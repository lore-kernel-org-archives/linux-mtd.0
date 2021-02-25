Return-Path: <SRS0=cHBa=H3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCB67C433E0
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:10:10 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A4F464EC3
	for <linux-mtd@archiver.kernel.org>; Thu, 25 Feb 2021 14:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A4F464EC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=MvpQ65JTBMNEFTz/lKZrOyFnXHGTRA7jybNfoSL7nPk=; b=ygIPboaJxbVXBChU7I5L94zbp
	PT0nlaSawrpFIrSBTqSquUGLXL6X0B+v7dA6DKkEIMdhEKXlagB1OpUtP+/iiPG5DIkAaHfMNvdqp
	QekrIWHHyBKkrmKsm453O6tel8fuPZdBrUJ65Q61atdL1f0JqCsb3hCzdF2Q+3aZArNvmZEZ3yuQh
	Adcr0qLcrheYpGRA95AmiGY47dwIcTOiw66nBG900N+5uz74WVEs79lYzFztkp1BzKBqzntTI3Qj1
	ThEeWWKShTSWEx6wJ9diSLQ7KubJ6H4JUcpMUO4heqgEn3cwot1zY3NFpJs/rVRfPncvimMCbHmbj
	ItKzNT6Kw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFHKc-00070u-GF; Thu, 25 Feb 2021 14:09:30 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFHKZ-0006zi-KH
 for linux-mtd@lists.infradead.org; Thu, 25 Feb 2021 14:09:28 +0000
Received: by mail-pl1-x629.google.com with SMTP id p5so3253126plo.4
 for <linux-mtd@lists.infradead.org>; Thu, 25 Feb 2021 06:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Gns+oGwweFpLJw9fw6Q0vriDhzajyJ2Mb8yXaKxQ4RE=;
 b=wTckrcguoxKj4foYptjSfAvNvZTCY39RkmXp2f838POMrXrH0180nRPbg6RPDpdDpj
 rPvsUveSIH14Hl3Ks4DXs+esMzR6bO/2NOJc2+xL9f8GKG6Mtf4yIvWyD/MUR03Ho4MO
 Q3LGOjA3MZb7Yg5WUS+S6DFGI5Pzn+lpxzpMNKUeru4xkntMhPeEJQWQBpKVOF6ax+5b
 sDOW3ms9aPIN0HYOoBLaG1u3Ad+KTKxrZWjinEGTxtKdVF9noG0rvEGLkzZ0siHP23IU
 SfYLbNza7yaYQxvWaBouEg2cckSJvEQmevOzCXew755oWzKFQJEi9/J268sV0gnCODFP
 rtjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Gns+oGwweFpLJw9fw6Q0vriDhzajyJ2Mb8yXaKxQ4RE=;
 b=YJ9iiSg5TbRW1X9E0cW8lN34oZJQkCLqdihZtu2fE0A+2qle8my2EmGvuaeFtbBATc
 IM24NJK0ljckWQDwOcV+EG1WnuEsEWkXMcVpKrtIXIAlKCwmv5SYFlhClamQ/hjP++gB
 7ipQYBBv38szbhl2ZEoWM2a2N/py6EPrARrEauVLsOgwiwMjDtubJeEBAMm8RxEu6zMY
 sKk86956krrstYhVkSNSEkFKXQFAAytt8TUt+PHwIX82PU+Y0Uk/tmkAumoh37Kqko1A
 z/STs4smh6sBYplfYlgsNxQfqSnTyRMewozdDPzVg7qJSTXOncTSalWZSIo1b8XQmceM
 VtxQ==
X-Gm-Message-State: AOAM531T/5vvAaTVbIBM+i4rqWZd4xltPZEB/8rmhMixb2reSsDbuUCP
 vJLZE9KeAPXGRTtBM0SbSCAE
X-Google-Smtp-Source: ABdhPJzKNnOOB2nuXVzK6+G8Q3GBg8PsnHZ21Jt0IyKhTJiZoYVwCRBMhKQv8z61j4acOxjGGCT3UQ==
X-Received: by 2002:a17:90a:aa8b:: with SMTP id
 l11mr3552492pjq.225.1614262165315; 
 Thu, 25 Feb 2021 06:09:25 -0800 (PST)
Received: from localhost.localdomain ([103.66.79.45])
 by smtp.gmail.com with ESMTPSA id f3sm6228918pfe.25.2021.02.25.06.09.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 06:09:24 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH v3 3/3] mtd: rawnand: qcom: Add support for secure regions in
 NAND memory
Date: Thu, 25 Feb 2021 19:38:42 +0530
Message-Id: <20210225140842.66927-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
References: <20210225140842.66927-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_090927_678279_C84A8204 
X-CRM114-Status: GOOD (  20.19  )
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
"secure-regions". So let's make use of this property and skip
access to the secure regions present in a system.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 72 +++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index fd4c318b520f..d43a6d8b8779 100644
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
@@ -2872,6 +2908,24 @@ static int qcom_nand_host_init_and_register(struct qcom_nand_controller *nandc,
 	/* set up initial status value */
 	host->status = NAND_STATUS_READY | NAND_STATUS_WP;
 
+	/*
+	 * Look for secure regions in the NAND chip. These regions are supposed
+	 * to be protected by a secure element like Trustzone. So the read/write
+	 * accesses to these regions will be blocked in the runtime by this
+	 * driver.
+	 */
+	prop = of_find_property(dn, "secure-regions", &length);
+	if (prop) {
+		nr_elem = length / sizeof(u32);
+		host->nr_sec_regions = nr_elem / 2;
+
+		host->sec_regions = devm_kcalloc(dev, nr_elem, sizeof(u32), GFP_KERNEL);
+		if (!host->sec_regions)
+			return -ENOMEM;
+
+		of_property_read_u32_array(dn, "secure-regions", host->sec_regions, nr_elem);
+	}
+
 	ret = nand_scan(chip, 1);
 	if (ret)
 		return ret;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
