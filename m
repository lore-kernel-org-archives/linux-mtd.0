Return-Path: <SRS0=UneP=HY=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35D8EC433DB
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:04:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D181364E24
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Feb 2021 12:04:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D181364E24
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=92zWF3kni4ujUgsOLo6kJ8mGEyGcUbGvuuyu9zXMx5c=; b=mkNGMaYGB2ETWgon0Wc9aqxx2
	Uty25RLTXb/0F0/xhIjVzkJ+0W4u1ZgJS/gHZlcpYSNLkpowqNdvYu95nyhWc31erDsKbjfcGtCCb
	mkdM8p/RXuQb73cXu3X/3x5Zu37DG5t6or9yaKSidBKBtCmNXinW54KYl4fIJOZUiJiQrzD6tc5/J
	NWFFeP4b9qWoN3WIwkWz/LsOBoBJPo0sh6GBPDq9aci+eBujtKrs8kvnHcrbtjohcnEIpqQnBEnQb
	Fq1A/9rj8sfhf188NuOBMykCzbqTb81/ToY5IPP24rwdeSk1a0ya3wYKuqUca/SIx4oUCI01rN381
	cFeior9Ug==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lE9w5-0000kX-7t; Mon, 22 Feb 2021 12:03:33 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lE9w1-0000jd-MT
 for linux-mtd@lists.infradead.org; Mon, 22 Feb 2021 12:03:31 +0000
Received: by mail-pj1-x102a.google.com with SMTP id ds5so1084039pjb.2
 for <linux-mtd@lists.infradead.org>; Mon, 22 Feb 2021 04:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4Pi4RICUPERxVib7ATa4y6NDrmG0hUUGuXvqZvmv7GM=;
 b=o+nPFFw8gzzkrY7iDoeO2QwCKh/blOWdEOBWVD/YOYH4ghX5PAwMsISWoufTyKVJf3
 POqUMmVv8rB7tFvXcvx4BeD2nfqzqFSpdTvGU0b5z5sOAbAFCjz1YEkA4v/aHguc442B
 wLHcoesQ0nURqp/Y1GilR9kQp2diJUFYQ8OaLU5hhndmBuD9Kd7baQTjaKME0+c3G+RD
 rgAjjmIhvbDdB7wokYzbAILAHGlvnE6NrhWCPD5pc0WN7XAFHV0ZMf9e2T973LfIqaCi
 B74lvGrUcDlPHYghjt4tUGBxEOnpCtGz91Y8D9sUO03cCr0rm38RRD5/IKOcGgwLm2T9
 Refg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4Pi4RICUPERxVib7ATa4y6NDrmG0hUUGuXvqZvmv7GM=;
 b=AMlHj4h3fAN8PhqRuHTThL1SfiDaiRnT1TD8RF+81E/OKhZfOWtnkGJp2CUZnxCwDA
 kUk/5xH6IHXaDOjiDBY42aw5x8feqp5JngPZcRAJcTyAkuHTQoXaWs+F3fgRx1vnAhYC
 5e3myQ9y5wPZihB2s+bRhozeiSs+WqszwCqL1jAg0Udt6/l15MVoQ5jZC3foNrejDokR
 +3Y7GPr/ZiDUoJ48/ifKvQZ8IvGpeShBcB1TAVT/B2BcekAw7piG9GEAUi97+V6k67Bz
 Qhq1iC6XxuqJ1ndn/GJenq5nZEmBtdsacOdlPPG5hDoNkfd54+asDpQDABG1M5tuyLHK
 FIeg==
X-Gm-Message-State: AOAM531cmHTkSj3pV6lI8tjrxTP/FtXHe2G3njm9/LshD7IQ9fE4EN/b
 3sytErJoApkChaw7ak4WBELw
X-Google-Smtp-Source: ABdhPJwN3SoMOeZmOczWxOS1M/sfsSVlHrIE3xm23xgMZfMAhmyMkXPU5OtUOIey8LBvhXl0SUAXRg==
X-Received: by 2002:a17:90a:1990:: with SMTP id
 16mr14301715pji.26.1613995406821; 
 Mon, 22 Feb 2021 04:03:26 -0800 (PST)
Received: from localhost.localdomain
 ([2409:4072:6215:cc7b:cb8f:abf4:d1c9:3864])
 by smtp.gmail.com with ESMTPSA id g17sm17017221pfh.14.2021.02.22.04.03.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 04:03:26 -0800 (PST)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
 robh+dt@kernel.org
Subject: [PATCH 3/3] mtd: rawnand: qcom: Add support for secure regions in
 NAND memory
Date: Mon, 22 Feb 2021 17:32:59 +0530
Message-Id: <20210222120259.94465-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
References: <20210222120259.94465-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210222_070329_798022_6AEDC05A 
X-CRM114-Status: GOOD (  19.98  )
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, boris.brezillon@collabora.com,
 linux-mtd@lists.infradead.org,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

On a typical end product, a vendor may choose to secure some regions in
the NAND memory which are supposed to stay intact between FW upgrades.
The access to those regions will be blocked by a secure element like
Trustzone. So the normal world software like Linux kernel should not
touch these regions (including reading).

The regions are declared using a DT property, "qcom,secure-regions".
So let's make use of this property and skip access to the secure regions
present in a system.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 72 +++++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 9 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index fd4c318b520f..c2dc99c1b2f1 100644
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
+	prop = of_find_property(dn, "qcom,secure-regions", &length);
+	if (prop) {
+		nr_elem = length / sizeof(u32);
+		host->nr_sec_regions = nr_elem / 2;
+
+		host->sec_regions = devm_kcalloc(dev, nr_elem, sizeof(u32), GFP_KERNEL);
+		if (!host->sec_regions)
+			return -ENOMEM;
+
+		of_property_read_u32_array(dn, "qcom,secure-regions", host->sec_regions, nr_elem);
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
