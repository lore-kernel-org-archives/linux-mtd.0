Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC9B5CD8C92
	for <linux-mtd@archiver.kernel.org>; Mon,  8 Jun 2026 13:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lzgf78Kfgan3acXnMrS6dqt95yIcOWvSogG7qZRS+/M=; b=0aRWf+i/YlNMjC
	lMXeG/ednAWX4NeKZInsIsffHQ4FwsJ5KcoNOXFQU0wYUBh26iSkoh938UYyx9ChBs4VW9RMRNX+S
	XxS0FH7jdDMzTV2qyBzqAeDnbSAEJ907j+IiVBLMqAniJuVKYAmbdMqPpb6k++o2lu2ljOaH6nBWw
	6XJd4cIN5JpfWAdvyvskpVyq6hh2SEBshVvJbArADCKsAVZTcQFFKdT7LCpkZNERl1CDC9+v36gmQ
	jaaGlInH9fJ7zAFssqkx/GpIGPAFgtDo1X7lzi6CaaG7agPr5/a0EwI0t3RaPXVRPTyOEMoayeGZW
	q35snhu6mw+arSf21sDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuQ-00000003bV4-3lpu;
	Mon, 08 Jun 2026 13:20:54 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWZuO-00000003bTV-0pmS
	for linux-mtd@lists.infradead.org;
	Mon, 08 Jun 2026 13:20:53 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-490ae94a89eso35994585e9.1
        for <linux-mtd@lists.infradead.org>; Mon, 08 Jun 2026 06:20:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780924850; x=1781529650; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=88tm0oNdAQ/v6RDKBRvrToGlaWSuSntV+oNt6Zj/FRs=;
        b=HiJI+js0M2mTWorPXOCCbNjstBB2u9VOjyKdwSgZKw93PS0h+XPRpz8MCMBY1URmRW
         mu317vOJWpihDCwUw5Xkbdb7qONu7jSm3N01GR59xGqTtcL/5UHXXErT0obfp6/7D2hH
         b7ENbUxclmPeqjYlAIu3Ti4JHG7cutBMBd8fs9er7EXzMwRmvJt76ekGaf2wBfwiMv5F
         EtPjeJPlZGx4TOdp/FvBVPpMd95ty7yd6zuoCMvU/xN8DFAsoOEUQ+Wql4Q5XMVtBt+K
         ugAGIfq1k8KtqynswkGkEi7LYXTysgEQUj9oGo9vQITMMi8YvszJ5sNbGGXwQjxOYqVw
         AakQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780924850; x=1781529650;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=88tm0oNdAQ/v6RDKBRvrToGlaWSuSntV+oNt6Zj/FRs=;
        b=oRhnmpWkyQjDMpUwrMDtEuMow+JqHyuBBqMgUXhW1gAULA86UZcCPWDkD0fOg7bDiI
         Bni5Ck2AIEXyb8ZWQYFDLoeh5iFOEKXc/v44vo55JXE5ZWbgtW4I2b9PeSNjglCdXydU
         WxHgrYQ70FCn51CeE1ilLdQqnLJ5Q29l72ALQV0BFs9waKfpbezU+6aJO+GTa6XqxDA0
         corgFIIhlwYyb54bTpm3Kjxtsg7NeyZNwMRPeb0Z/8egSyb5JA7Zw8n6CSpzjRYIudpe
         aEbXePHXdEjXGm641Szg4Sr2mPVR2FPUXPO9XwOD5pqKOhq9RJGPX2ef/aCDYRzBkRZu
         58CQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ItAEULijZCPWmmtnnA5xNSZtBrQYnMVC9jBbwXC+vflyDuBHLTeRsPssyoXL2fVIXe7Ppb+plh3o=@lists.infradead.org
X-Gm-Message-State: AOJu0YziPv71RoVaXtxtIBb5B3m5tIjZODhJW8MtCdWYQ81W3KXqXNsQ
	e3O3ujiMDx7Q7JViA2noDHnp9GiRC0yRshM9FpvNEj9qZ4YDKYLxK4C8tbB0rSIwp68=
X-Gm-Gg: Acq92OER/VLNSPLQYKCtu0YDf0ASA42X4pLY3ItF1tyOjbWSXUQ0+8h4jT2HhgbLp51
	Iqd+1ynlZ+5t8DFwEOnq26dsBm5ltagU9GcTm1z+WK9ymTy69IB766xKdLi4VRu1ibGCGm4rHPh
	qrNSKKaUdDB+HCAbHHizGo1dT5X3hywKyRkhD/57IlKxXp5SSiXOkqUs7iEdwpYL7qrMYkMooL/
	yPoURgl0fGV/LEQBOcGjlOP4e2sQAdU4VNDnr6u1qsWhtWpsVy2hegES2YNGgfC64rBeRaUJ/Jv
	K+qsJHraBbOjAu5WxhNadiRvkR4dtGkPNCSifJmp8rzeUlfvqznUOBGXK9XR+Tb74j0I8c+tbd0
	dmYpV7p0DasXjuCxBr53yZNsoPg5fwPPnRVNrpicfu52IhZKKYp4ufn8OMwfPVMG46nxTqtIZND
	t1sHtF5TUSPx2UGofNztII3QSFJXtgUwZZmTADQB5Jez0d6fY=
X-Received: by 2002:a05:600c:b93:b0:48a:93f8:dd02 with SMTP id 5b1f17b1804b1-490c4e0414emr237867275e9.14.1780924850120;
        Mon, 08 Jun 2026 06:20:50 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff23:4410:963d:8b06:4a7b:c38f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f34413csm51684983f8f.21.2026.06.08.06.20.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 06:20:49 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Date: Mon, 08 Jun 2026 15:20:24 +0200
Subject: [PATCH 3/4] mtd: rawnand: qcom: Make has_onfi_read_op separate
 from qpic_version2
MIME-Version: 1.0
Message-Id: <20260608-qcom-nandc-mdm9607-v1-3-4639a0492274@linaro.org>
References: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
In-Reply-To: <20260608-qcom-nandc-mdm9607-v1-0-4639a0492274@linaro.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_062052_268813_0D4BF6C6 
X-CRM114-Status: GOOD (  16.72  )
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

QPIC v1.5 requires using the OP_PAGE_READ_ONFI_READ command, but is missing
the rest of the hardware changes that are currently covered by the QPIC v2
(qpic_version2) check in the driver. Split that into an extra
has_onfi_read_op feature flag so it can be separately enabled.

No functional change.

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c    | 15 ++++++++-------
 include/linux/mtd/nand-qpic-common.h |  2 ++
 2 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 0251dd591d40..9217e8de5512 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1564,7 +1564,7 @@ static int qcom_op_cmd_mapping(struct nand_chip *chip, u8 opcode,
 		cmd = OP_FETCH_ID;
 		break;
 	case NAND_CMD_PARAM:
-		if (nandc->props->qpic_version2)
+		if (nandc->props->has_onfi_read_op)
 			cmd = OP_PAGE_READ_ONFI_READ;
 		else
 			cmd = OP_PAGE_READ;
@@ -1903,7 +1903,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->vld = cpu_to_le32((nandc->vld & ~READ_START_VLD));
 		nandc->regs->cmd1 = cpu_to_le32((nandc->cmd1 & ~READ_ADDR_MASK) |
 						FIELD_PREP(READ_ADDR_MASK, NAND_CMD_PARAM));
@@ -1911,7 +1911,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 
 	nandc->regs->exec = cpu_to_le32(1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->regs->orig_cmd1 = cpu_to_le32(nandc->cmd1);
 		nandc->regs->orig_vld = cpu_to_le32(nandc->vld);
 	}
@@ -1925,7 +1925,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	else
 		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
 
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->cmd1, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 	}
@@ -1939,7 +1939,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 			   nandc->buf_count, 0);
 
 	/* restore CMD1 and VLD regs */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_cmd1, NAND_DEV_CMD1_RESTORE, 1, 0);
 		qcom_write_reg_dma(nandc, &nandc->regs->orig_vld, NAND_DEV_CMD_VLD_RESTORE, 1,
 				   NAND_BAM_NEXT_SGL);
@@ -2041,7 +2041,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	if (!nandc->props->nandc_part_of_qpic)
 		nandc_write(nandc, SFLASHC_BURST_CFG, 0);
 
-	if (!nandc->props->qpic_version2)
+	if (!nandc->props->has_onfi_read_op)
 		nandc_write(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD_VLD),
 			    NAND_DEV_CMD_VLD_VAL);
 
@@ -2063,7 +2063,7 @@ static int qcom_nandc_setup(struct qcom_nand_controller *nandc)
 	}
 
 	/* save the original values of these registers */
-	if (!nandc->props->qpic_version2) {
+	if (!nandc->props->has_onfi_read_op) {
 		nandc->cmd1 = nandc_read(nandc, dev_cmd_reg_addr(nandc, NAND_DEV_CMD1));
 		nandc->vld = NAND_DEV_CMD_VLD_VAL;
 	}
@@ -2385,6 +2385,7 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
 	.ecc_modes = (ECC_BCH_4BIT | ECC_BCH_8BIT),
 	.supports_bam = true,
 	.nandc_part_of_qpic = true,
+	.has_onfi_read_op = true,
 	.qpic_version2 = true,
 	.dev_cmd_reg_start = 0x7000,
 	.bam_offset = 0x30000,
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 006ca8c978a9..437448995187 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -443,6 +443,7 @@ struct qcom_nand_controller {
  * @dev_cmd_reg_start - NAND_DEV_CMD_* registers starting offset
  * @supports_bam - whether NAND controller is using BAM
  * @nandc_part_of_qpic - whether NAND controller is part of qpic IP
+ * @has_onfi_read_op - whether ONFI param page read command is supported
  * @qpic_version2 - flag to indicate QPIC IP version 2
  * @use_codeword_fixup - whether NAND has different layout for boot partitions
  */
@@ -452,6 +453,7 @@ struct qcom_nandc_props {
 	u32 bam_offset;
 	bool supports_bam;
 	bool nandc_part_of_qpic;
+	bool has_onfi_read_op;
 	bool qpic_version2;
 	bool use_codeword_fixup;
 };

-- 
2.54.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
