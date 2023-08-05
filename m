Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D59DFC001DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XqIfmNJ1q9CfbHG/swGaBSS8l7OhHWSFUQGbEq7wBt8=; b=Bp5Vj9NAzFGPmt
	hbee4AA0f6VR90TuaKuZyYDyIVqm9m0JhYvGoua3PXhEktnwWiv6Jq++Ubw5cflhZBaWnSNrxBwMD
	fvT9LzTmvl3jZBkUrlRKDhnPkdvo/7bi9wozA39IHEIzyHzuZtFbtHyKrg9e3m9E9vHNS91N5FsvC
	Va5ghoHkLyxp6ZjwRlVd3WvzeW0EYs6ZfW3OJEpsniqaIlQa5xIp9BcDKm+zI8/PixqQC54yy/xe+
	vyUuWkROvdaYtE37TbKbVD0hk5fFijs/WE3rbcydmCovm9eXnFuemqW+zXicMQSKGCWZfofiAAgyA
	MkccTJy5N1MFqoNFxWjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIO-00EP22-1z;
	Sat, 05 Aug 2023 17:42:32 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIK-00EOyV-2k
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:30 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-686efa1804eso2309055b3a.3
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257346; x=1691862146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VYFveuajqMNbJCnKR8oO9CBtWwxD9/VCo5pORmPNdlI=;
        b=Z0rsGlk9CrnX6KVTupzoH16ngQguKUiMLp4IcGcF5qF83R9Sae4ptKVIGeRPYzFddo
         A4PQYtAEU4Y1mEqmjEEu0i/lUPVSw6Hvl9wDZDVjwoO1Qc7fpEFlUI5zN7gbRDwKtIzO
         7UeXU2v9CDUIuXdP6WfMQaV9Adham0dZOHzjBQqr7/Gua9r2byQzkTJE8EA9+Pb7JYt1
         uKm4tNjU6zcLt2Wfxh9nJHHoAy4Djy1gVJWbiOpl0CpDYvpBAoJlUlDdjzNmQOFq5xYI
         XPDX9hZw+LB/CkeVpTF6VWFSb/MUm+S80lupIp9hW+IaRYFGCasX8hi+rCvVffLNUhEo
         lHwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257346; x=1691862146;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VYFveuajqMNbJCnKR8oO9CBtWwxD9/VCo5pORmPNdlI=;
        b=kjgfW68EP9h/1BxXGKpjxyzaanyFcN3hDF/T+2pAGxN9VbxrajeoFtg3QblewrUgWg
         f0GO6NbNJNL/N11Owueh76QBXX/hqGJvBt2AASYN8+QBrGzcka6pypVNk1egCSBGKq2b
         jGWot1os8TXNhzz0FlcDgKIL+0RJagKT1FNn40zlER3z3i3XaCHTdNo+gw0+K48owkqe
         0iKKolKrArgf2WTtBxLTtra4roQVCQDXhyHMlveybvJo2sQd+DjfT0duHZMzWJ790ZIt
         LWIxmz9Oiypo+0ztfGGU1aQ9SUNvSwXadhZIf1tKCIZO0MkK2DI1axW2xNRH2NcM6gYC
         4wRQ==
X-Gm-Message-State: AOJu0YzzDdY3vDLpnqXMkUGt+eFufilSz9W184bVqf17hpVC4ZSdzhpD
	FMyjW/yOQQ6N8PtLJokHwBDOppvnlNsuSQNrwA==
X-Google-Smtp-Source: AGHT+IHH6+dP6OXMoFZa/czZ291Ny/1pzW1V0k09uiUaTaZbHxnwAlGEXmfTAtBzoULAhQsAFpCDhw==
X-Received: by 2002:a05:6a00:1a44:b0:687:404f:4d5a with SMTP id h4-20020a056a001a4400b00687404f4d5amr5179650pfv.13.1691257346243;
        Sat, 05 Aug 2023 10:42:26 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:25 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: miquel.raynal@bootlin.com,
	vigneshr@ti.com
Cc: richard@nod.at,
	linux-mtd@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	quic_mdalam@quicinc.com,
	quic_srichara@quicinc.com,
	dan.carpenter@linaro.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 07/10] mtd: rawnand: qcom: Unmap sg_list and free desc within submic_descs()
Date: Sat,  5 Aug 2023 23:11:43 +0530
Message-Id: <20230805174146.57006-8-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104228_886488_4C6A297F 
X-CRM114-Status: GOOD (  17.80  )
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

There are two types of dma descriptors being used in this driver allocated
by, prepare_bam_async_desc() and prep_adm_dma_desc() helper functions.
These functions map and prepare the descriptors to be used for dma
transfers.

And all the descriptors are submitted inside the submit_descs() function.
Once the transfer completion happens, those descriptors should be unmapped
and freed as a part of cleanup.

Currently, free_descs() function is doing the said cleanup of descriptors.
But the callers of submit_descs() are required to call free_descs() in both
the success and error cases.

Since there are no other transactions need to be done after submit_descs(),
let's just move the contents of free_descs() inside submit_descs() itself.

This makes sure that the cleanup is handled within the submit_descs()
thereby offloading the cleanup part from callers.

While at it, let's also rename the return variable from "r" to "ret".

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 65 ++++++++++---------------------
 1 file changed, 20 insertions(+), 45 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 4f38579ae03e..1dbe17dcdb84 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1306,30 +1306,30 @@ static void config_nand_cw_write(struct nand_chip *chip)
 /* helpers to submit/free our list of dma descriptors */
 static int submit_descs(struct qcom_nand_controller *nandc)
 {
-	struct desc_info *desc;
+	struct desc_info *desc, *n;
 	dma_cookie_t cookie = 0;
 	struct bam_transaction *bam_txn = nandc->bam_txn;
-	int r;
+	int ret = 0;
 
 	if (nandc->props->is_bam) {
 		if (bam_txn->rx_sgl_pos > bam_txn->rx_sgl_start) {
-			r = prepare_bam_async_desc(nandc, nandc->rx_chan, 0);
-			if (r)
-				return r;
+			ret = prepare_bam_async_desc(nandc, nandc->rx_chan, 0);
+			if (ret)
+				goto err_unmap_free_desc;
 		}
 
 		if (bam_txn->tx_sgl_pos > bam_txn->tx_sgl_start) {
-			r = prepare_bam_async_desc(nandc, nandc->tx_chan,
+			ret = prepare_bam_async_desc(nandc, nandc->tx_chan,
 						   DMA_PREP_INTERRUPT);
-			if (r)
-				return r;
+			if (ret)
+				goto err_unmap_free_desc;
 		}
 
 		if (bam_txn->cmd_sgl_pos > bam_txn->cmd_sgl_start) {
-			r = prepare_bam_async_desc(nandc, nandc->cmd_chan,
+			ret = prepare_bam_async_desc(nandc, nandc->cmd_chan,
 						   DMA_PREP_CMD);
-			if (r)
-				return r;
+			if (ret)
+				goto err_unmap_free_desc;
 		}
 	}
 
@@ -1351,19 +1351,17 @@ static int submit_descs(struct qcom_nand_controller *nandc)
 
 		if (!wait_for_completion_timeout(&bam_txn->txn_done,
 						 QPIC_NAND_COMPLETION_TIMEOUT))
-			return -ETIMEDOUT;
+			ret = -ETIMEDOUT;
 	} else {
 		if (dma_sync_wait(nandc->chan, cookie) != DMA_COMPLETE)
-			return -ETIMEDOUT;
+			ret = -ETIMEDOUT;
 	}
 
-	return 0;
-}
-
-static void free_descs(struct qcom_nand_controller *nandc)
-{
-	struct desc_info *desc, *n;
-
+err_unmap_free_desc:
+	/*
+	 * Unmap the dma sg_list and free the desc allocated by both
+	 * prepare_bam_async_desc() and prep_adm_dma_desc() functions.
+	 */
 	list_for_each_entry_safe(desc, n, &nandc->desc_list, node) {
 		list_del(&desc->node);
 
@@ -1376,6 +1374,8 @@ static void free_descs(struct qcom_nand_controller *nandc)
 
 		kfree(desc);
 	}
+
+	return ret;
 }
 
 /* reset the register read buffer for next NAND operation */
@@ -1521,7 +1521,6 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	read_data_dma(nandc, reg_off, oob_buf + oob_size1, oob_size2, 0);
 
 	ret = submit_descs(nandc);
-	free_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure to read raw cw %d\n", cw);
 		return ret;
@@ -1775,8 +1774,6 @@ static int read_page_ecc(struct qcom_nand_host *host, u8 *data_buf,
 	}
 
 	ret = submit_descs(nandc);
-	free_descs(nandc);
-
 	if (ret) {
 		dev_err(nandc->dev, "failure to read page/oob\n");
 		return ret;
@@ -1815,8 +1812,6 @@ static int copy_last_cw(struct qcom_nand_host *host, int page)
 	if (ret)
 		dev_err(nandc->dev, "failed to copy last codeword\n");
 
-	free_descs(nandc);
-
 	return ret;
 }
 
@@ -2024,8 +2019,6 @@ static int qcom_nandc_write_page(struct nand_chip *chip, const u8 *buf,
 	if (ret)
 		dev_err(nandc->dev, "failure to write page\n");
 
-	free_descs(nandc);
-
 	if (!ret)
 		ret = nand_prog_page_end_op(chip);
 
@@ -2100,8 +2093,6 @@ static int qcom_nandc_write_page_raw(struct nand_chip *chip,
 	if (ret)
 		dev_err(nandc->dev, "failure to write raw page\n");
 
-	free_descs(nandc);
-
 	if (!ret)
 		ret = nand_prog_page_end_op(chip);
 
@@ -2149,9 +2140,6 @@ static int qcom_nandc_write_oob(struct nand_chip *chip, int page)
 	config_nand_cw_write(chip);
 
 	ret = submit_descs(nandc);
-
-	free_descs(nandc);
-
 	if (ret) {
 		dev_err(nandc->dev, "failure to write oob\n");
 		return -EIO;
@@ -2228,9 +2216,6 @@ static int qcom_nandc_block_markbad(struct nand_chip *chip, loff_t ofs)
 	config_nand_cw_write(chip);
 
 	ret = submit_descs(nandc);
-
-	free_descs(nandc);
-
 	if (ret) {
 		dev_err(nandc->dev, "failure to update BBM\n");
 		return -EIO;
@@ -2722,10 +2707,8 @@ static int qcom_read_status_exec(struct nand_chip *chip,
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure in submitting status descriptor\n");
-		free_descs(nandc);
 		goto err_out;
 	}
-	free_descs(nandc);
 
 	nandc_read_buffer_sync(nandc, true);
 
@@ -2787,10 +2770,8 @@ static int qcom_read_id_type_exec(struct nand_chip *chip, const struct nand_subo
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure in submitting read id descriptor\n");
-		free_descs(nandc);
 		goto err_out;
 	}
-	free_descs(nandc);
 
 	instr = q_op.data_instr;
 	op_id = q_op.data_instr_idx;
@@ -2835,10 +2816,8 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure in submitting misc descriptor\n");
-		free_descs(nandc);
 		goto err_out;
 	}
-	free_descs(nandc);
 
 wait_rdy:
 	qcom_delay_ns(q_op.rdy_delay_ns);
@@ -2932,10 +2911,8 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure in submitting param page descriptor\n");
-		free_descs(nandc);
 		goto err_out;
 	}
-	free_descs(nandc);
 
 	ret = qcom_wait_rdy_poll(chip, q_op.rdy_timeout_ms);
 	if (ret)
@@ -2981,10 +2958,8 @@ static int qcom_erase_cmd_type_exec(struct nand_chip *chip, const struct nand_su
 	ret = submit_descs(nandc);
 	if (ret) {
 		dev_err(nandc->dev, "failure in submitting erase descriptor\n");
-		free_descs(nandc);
 		goto err_out;
 	}
-	free_descs(nandc);
 
 	ret = qcom_wait_rdy_poll(chip, q_op.rdy_timeout_ms);
 	if (ret)
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
