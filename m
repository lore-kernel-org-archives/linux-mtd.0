Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385E4C98331
	for <linux-mtd@archiver.kernel.org>; Fri, 25 Sep 2026 19:06:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OLc2Xf2j44yEsTsYA8xlDvTKYGfhY7l2BstYFY5t77Q=; b=m5iQpdQSqejS4J
	om5MpvRJEZvct/AwPgwX+TQWxhOBhQgJrbtyv+xQKPDOXYmkPfTI44h2xJlGYqJPAemiyEbfrY9Eb
	rHKS2uA/p/Am0WaIpHX3QxEDFOM3y6GnfOTtidNn2TxD27frfj9bY6mFI81yLGOhOYdCf518V5cuR
	IzF5i+iSG7TrOnpYCQMKhTc8bIvoITADGT7hz997FAi849Jy489iezzrZvczbnYjWswY3qEV9jg0f
	2mEvYKv/690+ja/G7fdHG/1/yDdf3+j9L/2ua6gvgCK+1F6D+KHnOQ4jPnOPDtOoRrsF9wpiRdpYl
	ZFcSY1dc9Frgq/nzhS/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFo-0000000EDc1-1qs7;
	Fri, 25 Sep 2026 19:06:40 +0000
Received: from mail-wr2-x11.google.com ([2a00:1450:4864:30::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xABFl-0000000EDZL-2GPK
	for linux-mtd@lists.infradead.org;
	Fri, 25 Sep 2026 19:06:39 +0000
Received: by mail-wr2-x11.google.com with SMTP id ffacd0b85a97d-4843c3ee4cfso609108f8f.2
        for <linux-mtd@lists.infradead.org>; Fri, 25 Sep 2026 12:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790363195; x=1790967995; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=79hwgqqwJM7rcF16m3dJoWOkkqY9Z7AIYmJSq7v9w4I=;
        b=pQICLGpV/WjT55wfN/Iu8thqJrCeILbQBuRHW0r31+RZyPRkYlj4WKjO6ZI1tpyHjQ
         WF5BZZT0H9t4WtA/jtc6F6PVjk5XK6wHVrkumsTAd6vmWz/G7J+ay90jtSIFrhBYJEuu
         9rX9V6wNPsmvqJtqWOoeXpNG4MiVJb9Y+xd4Mw9+tJr74KL1izq/PVdFJzC9SJC137Y7
         JwONgLc89oAIXhULNvuQjmYZdaqqLmgQ8FxasW51Ob4tNWDMecuL8M+QasCeul1GHv+N
         Vu/ugSqdVyIxZtbHvx4xBiFtj8H5n+sJhOwu/P7PAtSUIe7S9KZc4gUBCW1z2X0mv/Vq
         BiNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790363195; x=1790967995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=79hwgqqwJM7rcF16m3dJoWOkkqY9Z7AIYmJSq7v9w4I=;
        b=CFVlrNLtVFRO6nOddo1RgU++a1oNdtR0V2A4kuy0PZQ2duLy7LEiEymfZWrJmWvFwJ
         bRj5V1sEB25m9fxB0l7MtfRllbPc6TZCDlvC4vxV0s9ak/RN5OWcP5G9okh0ccGx+k1c
         prMkIYE1shVV9onB3Bp5JuA2ReA3h4fmyEUKA/JMBlP4b5qDoRtyRIThNprX7WQbunp7
         1NHF4pyZrHiwd/4tq46XpRUpizOn99Lcdi15h/kg13hwzhMnLVbUMmmU8xXLvHl9/FiS
         brWdVzlbdtm99Y8BL+acsQjgcpxjKUtlwGSvaSsfP3h8WAepWoPC4ajb+BrjAhYkklcB
         lVvQ==
X-Forwarded-Encrypted: i=1; AKwUvByoaiclGsvH9kLvTrhAh3miDufwnxWKD6ZxsTbvYxeVPPe/nsifjIjN0WZdjwZEeYf5luzP/nYZZGU=@lists.infradead.org
X-Gm-Message-State: AFuF++nftj2HziiKLSTpoe9S5zPfCwNwWPbRp6tnCDQD3uWNJDr5JHAn
	EYUXjFtIzAX0lI01Fe16Ph/uPhnt7+0XHJLtc8fsVSrpIUWVKh6K5apt
X-Gm-Gg: AYBFou13vPBJ/atp0y9lYKnBMGBkV/pAhTZnKIPraD/mdpRV0YybNQitSMr0soJAR79
	x+Aa6hl3spBgWyjS9eY87c8dK1RNkwJLAVC5QaMW/Aj3BjsLCavMQbgD/eZp5JpBhqzwqrgxHeJ
	KA8eHiP9uuOH4RS2hpRE0ZN/8NJSolh6DlbXYmQLSjIwspvAOf/KsnO2odnycJ6VALyiJUj2d+q
	93ZizAYJDjDfwJVv0H54GSXnE1vy5FH5CfYwainZ9Lmk7VJH2lNmwa8m3XpX0B+d+wiolSk/YfM
	Zc8dn9c9UlQn2jtP1SvEBJRZzXpTy69BLP8cR7Xuoo+vnomSdenTM8cS3ZUHu+DVBs1hIgIhhZ9
	gz+hrsW/CRam2dNQMTFqgDThnosY27LmZDb9cNR9rWGBdg5W2fKu+39oeyP+NcldovpvL446ZkO
	A5cGNUPxUaXBwexdaX4zbiGmyI9d+AZ+YDfAOaDQL6c4Bty7PneqnmM1G/atv5uA/gQ7pETw3ja
	B4NGdHHpxozQbN9YUtJDDmy4/C/
X-Received: by 2002:a05:6000:4b0a:b0:488:823d:507b with SMTP id ffacd0b85a97d-488823d5296mr3689507f8f.52.1790363195404;
        Fri, 25 Sep 2026 12:06:35 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm9467234f8f.4.2026.09.25.12.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 12:06:34 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Fri, 25 Sep 2026 21:06:17 +0200
Subject: [PATCH v2 8/8] mtd: rawnand: qcom: move common code to the
 'qpic_common' module
MIME-Version: 1.0
Message-Id: <20260925-qcom_nandc-share-more-code-v2-8-a1b088052d6a@gmail.com>
References: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
In-Reply-To: <20260925-qcom_nandc-share-more-code-v2-0-a1b088052d6a@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_120638_000665_64B8A629 
X-CRM114-Status: GOOD (  19.33  )
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

The 'qpic_common' module provides some generic functions which are
usable by both the 'qcom_nandc' and by the 'spi-qpic-snand' driver.
Move more code from the 'qcom_nandc' driver to there in order to
allow using those also from the 'spi-qpic-snand' driver.

No functional changes.

Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
---
Changes in v2:
  - No changes.
---
 drivers/mtd/nand/qpic_common.c       | 131 +++++++++++++++++++++++++++++++++++
 drivers/mtd/nand/raw/qcom_nandc.c    | 131 -----------------------------------
 include/linux/mtd/nand-qpic-common.h |  17 +++++
 3 files changed, 148 insertions(+), 131 deletions(-)

diff --git a/drivers/mtd/nand/qpic_common.c b/drivers/mtd/nand/qpic_common.c
index 4f3e4dd766da..91ae970734f8 100644
--- a/drivers/mtd/nand/qpic_common.c
+++ b/drivers/mtd/nand/qpic_common.c
@@ -775,5 +775,136 @@ int qcom_nandc_alloc(struct qcom_nand_controller *nandc)
 }
 EXPORT_SYMBOL(qcom_nandc_alloc);
 
+/* reads back FLASH_STATUS register set by the controller */
+int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+				  int cw_cnt)
+{
+	int i;
+
+	qcom_nandc_dev_to_mem(nandc, true);
+
+	for (i = 0; i < cw_cnt; i++) {
+		u32 flash = le32_to_cpu(nandc->reg_read_buf[i]);
+
+		if (flash & (FS_OP_ERR | FS_MPU_ERR))
+			return -EIO;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL(qcom_nandc_check_flash_errors);
+
+/*
+ * Helper to prepare DMA descriptors for configuring registers
+ * before reading a NAND page.
+ */
+void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
+{
+	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
+	if (!nandc->props->qpic_version2)
+		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_clr,
+			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_set,
+			   NAND_ERASED_CW_DETECT_CFG, 1, NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
+}
+EXPORT_SYMBOL(qcom_nandc_config_page_read);
+
+/*
+ * Helper to prepare DMA descriptors used to configure registers needed for
+ * before writing a NAND page.
+ */
+void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
+{
+	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
+	if (!nandc->props->qpic_version2)
+		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1,
+				   NAND_BAM_NEXT_SGL);
+}
+EXPORT_SYMBOL(qcom_nandc_config_page_write);
+
+/*
+ * Helper to prepare DMA descriptors for configuring registers
+ * before writing each codeword in NAND page.
+ */
+void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc)
+{
+	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
+	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
+
+	qcom_read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
+
+	qcom_write_reg_dma(nandc, &nandc->regs->clrflashstatus, NAND_FLASH_STATUS, 1, 0);
+	qcom_write_reg_dma(nandc, &nandc->regs->clrreadstatus, NAND_READ_STATUS, 1,
+			   NAND_BAM_NEXT_SGL);
+}
+EXPORT_SYMBOL(qcom_nandc_config_cw_write);
+
+/**
+ * qcom_nandc_set_read_loc_first() - to set read location first register
+ * @nandc:		NAND controller's private data
+ * @reg_base:		location register base
+ * @cw_offset:		code word offset
+ * @read_size:		code word read length
+ * @is_last_read_loc:	is this the last read location
+ *
+ * This function will set location register value
+ */
+void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
+				   int reg_base, u32 cw_offset,
+				   u32 read_size, u32 is_last_read_loc)
+{
+	__le32 locreg_val;
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
+
+	locreg_val = cpu_to_le32(val);
+
+	if (reg_base == NAND_READ_LOCATION_0)
+		nandc->regs->read_location0 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_1)
+		nandc->regs->read_location1 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_2)
+		nandc->regs->read_location2 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_3)
+		nandc->regs->read_location3 = locreg_val;
+}
+EXPORT_SYMBOL(qcom_nandc_set_read_loc_first);
+
+/**
+ * qcom_nandc_set_read_loc_last - to set read location last register
+ * @nandc:		NAND controller's private data
+ * @reg_base:		location register base
+ * @cw_offset:		code word offset
+ * @read_size:		code word read length
+ * @is_last_read_loc:	is this the last read location
+ *
+ * This function will set location last register value
+ */
+void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+				  int reg_base, u32 cw_offset,
+				  u32 read_size, u32 is_last_read_loc)
+{
+	__le32 locreg_val;
+	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
+		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
+		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
+
+	locreg_val = cpu_to_le32(val);
+
+	if (reg_base == NAND_READ_LOCATION_LAST_CW_0)
+		nandc->regs->read_location_last0 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_LAST_CW_1)
+		nandc->regs->read_location_last1 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_LAST_CW_2)
+		nandc->regs->read_location_last2 = locreg_val;
+	else if (reg_base == NAND_READ_LOCATION_LAST_CW_3)
+		nandc->regs->read_location_last3 = locreg_val;
+}
+EXPORT_SYMBOL(qcom_nandc_set_read_loc_last);
+
 MODULE_DESCRIPTION("QPIC controller common api");
 MODULE_LICENSE("GPL");
diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 99fe2c434ce7..d65c0101f471 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -149,68 +149,6 @@ static bool qcom_nandc_is_last_cw(struct nand_ecc_ctrl *ecc, int cw)
 	return cw == (ecc->steps - 1);
 }
 
-/**
- * qcom_nandc_set_read_loc_first() - to set read location first register
- * @nandc:		NAND controller's private data
- * @reg_base:		location register base
- * @cw_offset:		code word offset
- * @read_size:		code word read length
- * @is_last_read_loc:	is this the last read location
- *
- * This function will set location register value
- */
-static void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
-					  int reg_base, u32 cw_offset,
-					  u32 read_size, u32 is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg_base == NAND_READ_LOCATION_0)
-		nandc->regs->read_location0 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_1)
-		nandc->regs->read_location1 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_2)
-		nandc->regs->read_location2 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_3)
-		nandc->regs->read_location3 = locreg_val;
-}
-
-/**
- * qcom_nandc_set_read_loc_last - to set read location last register
- * @nandc:		NAND controller's private data
- * @reg_base:		location register base
- * @cw_offset:		code word offset
- * @read_size:		code word read length
- * @is_last_read_loc:	is this the last read location
- *
- * This function will set location last register value
- */
-static void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
-					 int reg_base, u32 cw_offset,
-					 u32 read_size, u32 is_last_read_loc)
-{
-	__le32 locreg_val;
-	u32 val = FIELD_PREP(READ_LOCATION_OFFSET_MASK, cw_offset) |
-		  FIELD_PREP(READ_LOCATION_SIZE_MASK, read_size) |
-		  FIELD_PREP(READ_LOCATION_LAST_MASK, is_last_read_loc);
-
-	locreg_val = cpu_to_le32(val);
-
-	if (reg_base == NAND_READ_LOCATION_LAST_CW_0)
-		nandc->regs->read_location_last0 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_LAST_CW_1)
-		nandc->regs->read_location_last1 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_LAST_CW_2)
-		nandc->regs->read_location_last2 = locreg_val;
-	else if (reg_base == NAND_READ_LOCATION_LAST_CW_3)
-		nandc->regs->read_location_last3 = locreg_val;
-}
-
 /* helper to configure location register values */
 static void nandc_set_read_loc(struct nand_chip *chip, int cw, int reg,
 			       u32 cw_offset, u32 read_size, u32 is_last_read_loc)
@@ -301,22 +239,6 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 				   host->cw_data : host->cw_size, 1);
 }
 
-/*
- * Helper to prepare DMA descriptors for configuring registers
- * before reading a NAND page.
- */
-static void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc)
-{
-	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	if (!nandc->props->qpic_version2)
-		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_clr,
-			   NAND_ERASED_CW_DETECT_CFG, 1, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->erased_cw_detect_cfg_set,
-			   NAND_ERASED_CW_DETECT_CFG, 1, NAND_ERASED_CW_SET | NAND_BAM_NEXT_SGL);
-}
-
 /*
  * Helper to prepare DMA descriptors for configuring registers
  * before reading each codeword in NAND page.
@@ -361,35 +283,6 @@ config_nand_single_cw_page_read(struct nand_chip *chip,
 	config_nand_cw_read(chip, use_ecc, cw);
 }
 
-/*
- * Helper to prepare DMA descriptors used to configure registers needed for
- * before writing a NAND page.
- */
-static void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc)
-{
-	qcom_write_reg_dma(nandc, &nandc->regs->addr0, NAND_ADDR0, 2, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->cfg0, NAND_DEV0_CFG0, 3, 0);
-	if (!nandc->props->qpic_version2)
-		qcom_write_reg_dma(nandc, &nandc->regs->ecc_buf_cfg, NAND_EBI2_ECC_BUF_CFG, 1,
-				   NAND_BAM_NEXT_SGL);
-}
-
-/*
- * Helper to prepare DMA descriptors for configuring registers
- * before writing each codeword in NAND page.
- */
-static void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc)
-{
-	qcom_write_reg_dma(nandc, &nandc->regs->cmd, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-	qcom_write_reg_dma(nandc, &nandc->regs->exec, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
-
-	qcom_read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
-
-	qcom_write_reg_dma(nandc, &nandc->regs->clrflashstatus, NAND_FLASH_STATUS, 1, 0);
-	qcom_write_reg_dma(nandc, &nandc->regs->clrreadstatus, NAND_READ_STATUS, 1,
-			   NAND_BAM_NEXT_SGL);
-}
-
 /*
  * when using BCH ECC, the HW flags an error in NAND_FLASH_STATUS if it read
  * an erased CW, and reports an erased CW in NAND_ERASED_CW_DETECT_STATUS.
@@ -438,30 +331,6 @@ static bool erased_chunk_check_and_fixup(u8 *data_buf, int data_len)
 	return true;
 }
 
-struct qcom_nandc_read_stats {
-	__le32 flash;
-	__le32 buffer;
-	__le32 erased_cw;
-};
-
-/* reads back FLASH_STATUS register set by the controller */
-static int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
-					 int cw_cnt)
-{
-	int i;
-
-	qcom_nandc_dev_to_mem(nandc, true);
-
-	for (i = 0; i < cw_cnt; i++) {
-		u32 flash = le32_to_cpu(nandc->reg_read_buf[i]);
-
-		if (flash & (FS_OP_ERR | FS_MPU_ERR))
-			return -EIO;
-	}
-
-	return 0;
-}
-
 /* performs raw read for one codeword */
 static int
 qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 0f40964eefe7..f31fd18d837f 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -457,6 +457,12 @@ struct qcom_nandc_props {
 	bool use_codeword_fixup;
 };
 
+struct qcom_nandc_read_stats {
+	__le32 flash;
+	__le32 buffer;
+	__le32 erased_cw;
+};
+
 void qcom_free_bam_transaction(struct qcom_nand_controller *nandc);
 struct bam_transaction *qcom_alloc_bam_transaction(struct qcom_nand_controller *nandc);
 void qcom_clear_bam_transaction(struct qcom_nand_controller *nandc);
@@ -482,5 +488,16 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc);
 void qcom_clear_read_regs(struct qcom_nand_controller *nandc);
 void qcom_nandc_unalloc(struct qcom_nand_controller *nandc);
 int qcom_nandc_alloc(struct qcom_nand_controller *nandc);
+int qcom_nandc_check_flash_errors(struct qcom_nand_controller *nandc,
+				  int cw_cnt);
+void qcom_nandc_config_page_read(struct qcom_nand_controller *nandc);
+void qcom_nandc_config_page_write(struct qcom_nand_controller *nandc);
+void qcom_nandc_config_cw_write(struct qcom_nand_controller *nandc);
+void qcom_nandc_set_read_loc_first(struct qcom_nand_controller *nandc,
+				   int reg_base, u32 cw_offset,
+				   u32 read_size, u32 is_last_read_loc);
+void qcom_nandc_set_read_loc_last(struct qcom_nand_controller *nandc,
+				  int reg_base, u32 cw_offset,
+				  u32 read_size, u32 is_last_read_loc);
 #endif
 

-- 
2.55.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
