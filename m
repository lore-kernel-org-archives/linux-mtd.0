Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA4EC98321
	for <linux-mtd@archiver.kernel.org>; Thu, 24 Sep 2026 20:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GAZ0CrITd/kiFkoiTqsg1VgBN1W72+ZY408ZTPI6AUs=; b=qbnvnoD1hY2pP7
	8c1IcCOdyhMaVUnUjjMtudsncg/AzHZlmJA3wQczb2bC+ISxuidfcjPP5ovYBu9zVRuaMw2EO6szC
	RQx4J1gh6s1Vutf0aMklGqJOmT7udR2ru1O37DhLfmylT+ZZLwdnUq7Qyu0hN5vkG2mpBvSoQh07U
	TsMrzLBZs5stPNCkxepm7JxZwJEiUcUqBvb7o522ThBsO0kXUp3RRaHcNCuYukEIvXdxqpCgPRIeY
	/fZ93HOUle6RATYO+SJ8pRZDV07HfcTuwRGQr90kwh3P2OYFQ5mrnO6oIdEohxoSBBgl/jaCFkQjp
	rX7uT8J/OBra6AXFu6aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgb-0000000C6P7-0Fr2;
	Thu, 24 Sep 2026 20:04:53 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9pgV-0000000C6Hy-21C4
	for linux-mtd@lists.infradead.org;
	Thu, 24 Sep 2026 20:04:49 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e6c0fce17so1236255e9.1
        for <linux-mtd@lists.infradead.org>; Thu, 24 Sep 2026 13:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790280286; x=1790885086; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=brmCNhyneEOagKuBVY37ScCGkg7oOLEAO4altKaW2BE=;
        b=CIn2/zS6sBU+asHjw79Vg73GNaX3LOY50wiAEqjUAmXy1qZw7pnr5nRrqF8HYvK+ef
         L/1NClRkJ70hVrXO76gy71VnXWvQjTjALU/KBwfwMiojLZhpqzuz8Cu9h6Btz+eUWtN1
         HxAOrAkUfgzl8XjJpmVQE+BuoLqJ86REWEgvG3sT23Jq9bP8PHNWPBCYu2nHhJp2U7i4
         RKTWI6lJ0bY+KJo9eYT094V5X3+B2L7YYufGN0KpXQM2ufCublf7HQxg7Dxf2KSKDXIs
         SiR3fFXMl7MC8SYzO6ao5eKLUHVah0myWoV6DeWH8YkXVN/id1LC/Q3IBgbAd9qvtXWE
         o1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790280286; x=1790885086;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=brmCNhyneEOagKuBVY37ScCGkg7oOLEAO4altKaW2BE=;
        b=ap+nInS37YGujIRBBFzPHErJQHV5ocOihP1MD45f985JNGdNlC0UKVaWlgomjW5Qo+
         btAMMKyBv4mwQ6AgfZoyw5ZpkHVF3OM7ioCmBOeAfWpw1ZCsNvgmmVozXKUVZI5r5gVm
         Pw9xhhAjIJayt91fDOyeV76rmCq1jQTEcpCxOSenqlt96WnNqJzP7budVb0nBrj9nlHh
         vuolC3cDXtPvgQJqcEwA4l3YIBRbq9asIajmeYdoOSHi9Z/9M1gT0ALJBKh9iQPGExJX
         ySsKGnITaXLnzCBhsMOnx8+nA9rvo9OuPGJ9vq0W2jYiIvByUjFOhyqYTvj30ykE/6cP
         7I2A==
X-Forwarded-Encrypted: i=1; AKwUvByv/DFaQSyWyUk9oNLO09AiTDbqupako+8859qQEuVmBo68uHbawZKWerZrX4X//CFkzgOt+OEDWFE=@lists.infradead.org
X-Gm-Message-State: AFuF++mF0QbtTAmQHKxbt7Q6Uh/1wKG6TP9oKHDyPLjwuX72QJ4i3P75
	04wSyVfXVBwftfD/67quVb6ATBoU5yTiZH5rG7oe4x3c5bU6VIhpmfD2
X-Gm-Gg: AYBFou1OzwOrerv59gCdDqj3kqHFigGnHGPjNUh9EFMHtyDYMPpKMpJt5z9ghzFqvPr
	/yDiuG/QOAvzMR9SkzpkQsIPClJM7sNRtOfArAd9rLjkDwAA92pQmsn0/7SyjDPuQ5Np5Y9e0Jv
	WXANKDTMAiFVyrIKcK79AZezqKhKmPophGc3tD67AZDY84OHaZLZn5eMQkteJ3wdRWsWsKG9ZPj
	/2r9jnc94GsDUfPhTif7pdq6rLS5AluRq0S5BI9bvsoMj4H5Ua3+wp1W9BgLpOftKrtx5uvzPvJ
	DFk0q5wY8w2GKsdrgRpNeEpCWKuHFwPjvR9Cfcr2vuVBTAnyg0jPz4cTrTWXV7mNJwoRdwwEvy1
	l8qQT3MrJz/l5eUBOXsZQ/piaBtkRYg1dV6Kd1w+CGFx/s5A3Xxgt5pOKrC1DHsz8ZVgMKRi9EU
	pqD4D3Jy2hGsh61lhvLEpsiReWv3PbHxKMpkhIe0TlNp+6r1FFDwYrdgadEa8gPTjAIW/r/0za3
	lHgy93B2+YnJdH23k2KChgbFF8=
X-Received: by 2002:a05:600c:8411:b0:49c:fc6e:a3da with SMTP id 5b1f17b1804b1-49fe66ef334mr59626725e9.25.1790280285674;
        Thu, 24 Sep 2026 13:04:45 -0700 (PDT)
Received: from [192.168.0.253] (5403F394.catv.pool.telekom.hu. [84.3.243.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-4887a30b1dfsm1551603f8f.4.2026.09.24.13.04.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 13:04:45 -0700 (PDT)
From: Gabor Juhos <j4g8y7@gmail.com>
Date: Thu, 24 Sep 2026 22:04:23 +0200
Subject: [PATCH 8/8] mtd: rawnand: qcom: move common code to the
 'qpic_common' module
MIME-Version: 1.0
Message-Id: <20260924-qcom_nandc-share-more-code-v1-8-f3012199b161@gmail.com>
References: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
In-Reply-To: <20260924-qcom_nandc-share-more-code-v1-0-f3012199b161@gmail.com>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Cc: Md Sadre Alam <md.alam@oss.qualcomm.com>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Gabor Juhos <j4g8y7@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_130447_849807_08B3563E 
X-CRM114-Status: GOOD (  18.81  )
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
index 437448995187..87bf9f67b267 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -458,6 +458,12 @@ struct qcom_nandc_props {
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
@@ -483,5 +489,16 @@ int qcom_submit_descs(struct qcom_nand_controller *nandc);
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
