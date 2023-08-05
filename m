Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D07A0C001DB
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lxl35SOkbQr/dHr/mpixAdPdcoFs/loEoGeR8U/HtB8=; b=FrLN7knGZPq6gI
	gfTwjPuOd7bT+vdSNs6u+MspqExgvbNKud4EOMTTUqsI+6XXnW8saoIIPV1beMgy+n2vAunmD9xC4
	OAdJgMTo4JH11xuTyCBhjx5f/00CEcbeQkBg3mZDqlDkTAlNP0NbaYiPHZCsoFYywSiiFm7lFoPz0
	RRElN8IuL+fQ4ka3r5UL/viTpJVTld1E4wMCK7rAfgoxWacEwEqaGRWYAkX9Rmr8pfMoMEyWUzbIB
	HbgkWq+FmMkKPYSp7YHXEE0Y51CIM/GRNoggWHrGkL0RO15jLjvSHRVC/UeQaM7zq1qToK8VXx8NR
	nmf/TIqphCSw+bwkLhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLI4-00EOty-2z;
	Sat, 05 Aug 2023 17:42:12 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLI2-00EOsy-2N
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:12 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686ba29ccb1so2111053b3a.1
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257327; x=1691862127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LzHoBg1aTtFdNgIFHIxm61nutJbPmolyU88qKYX8avE=;
        b=e1bZg3WPmbUxYy4tVUd2YabTZ8JXTzEPZRnA0bqC3L7uQXcn6U887EK3lAeNlDZyNC
         vQjEbD9X1fJLxuU5Zv/7ik4UhOHvvdSysx4b4cCOLfdSo9+IbFEQx/QDw9Zair9WhJyJ
         0pDNjZAmedfhhDhiC+hcnm6hLq+kf2Ma3ecnjHM/R6tfqcRftOpsw1bXYOrQVsOLJjas
         J4p85ACOLMtCOVfV3nW/3jAGe11uzBmQzbdlzmGs/O+TIpgy8SLk3TpWPKtYyvnk5v4d
         hkHTWzB5dWlbQWhRalHEGZghsjx5CPq/FKL3q4R5PtlvenwD61jnGfrZk9y6vn4kTYIG
         YIFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257327; x=1691862127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LzHoBg1aTtFdNgIFHIxm61nutJbPmolyU88qKYX8avE=;
        b=hMrzgTe52SGKI5pvhwX/pFyt0jG2/WgqaErWoEwWnO5EWqfzYXxJj7QZmNNdFTlgKa
         hsMmVyNFpK+l+dD2cGvRBoipEEjdQfIMWC7U81ZGMPlijQEUAcjU2X7/ZRzXg1Uwz7gl
         /rO5Bi00yw1/ZqA3soIan/jIzLe+nJsYCjVo4WhyvafaPQAvSrznwlC9IyNLft9YDioE
         yrFKGnU+rs3uEqfXT/HpjVNo64ZEMz2fZjf3iUXkPCDv4GgXTXuo6nKpfbJ7cm3BHw//
         1A9US/rgf1g4oxXwNk6fs/1XlhAVIJdHxyBiOTD97Z2EWKEw/88exMaM5NzSTxvey/Wj
         xyQA==
X-Gm-Message-State: AOJu0YwwxzUhO1dcCeFJvLvLoCuqvGNpmsC33aqcroRpc5uM4FWYHv+J
	SQye+CiIla55n3oPQlBZQmCX
X-Google-Smtp-Source: AGHT+IEOiKPKt0ItAknA4l5B8LXP+gGY8RF1sPeFYB7R7juUVo86q4NWggmSxvfpHBmQc9/dyHihKQ==
X-Received: by 2002:a05:6a20:7fa3:b0:12f:d350:8a12 with SMTP id d35-20020a056a207fa300b0012fd3508a12mr4024851pzj.21.1691257326933;
        Sat, 05 Aug 2023 10:42:06 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:06 -0700 (PDT)
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
Subject: [PATCH 01/10] mtd: rawnand: qcom: Remove superfluous initialization of "ret"
Date: Sat,  5 Aug 2023 23:11:37 +0530
Message-Id: <20230805174146.57006-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104210_775729_93225AF6 
X-CRM114-Status: GOOD (  11.05  )
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

In all the cases, "ret" variable is assigned a value before returning it.
So there is no need to explicitly initialize it with 0.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b485d8517fce..b6751fb17587 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1554,7 +1554,7 @@ check_for_erased_page(struct qcom_nand_host *host, u8 *data_buf,
 	struct mtd_info *mtd = nand_to_mtd(chip);
 	struct nand_ecc_ctrl *ecc = &chip->ecc;
 	u8 *cw_data_buf, *cw_oob_buf;
-	int cw, data_size, oob_size, ret = 0;
+	int cw, data_size, oob_size, ret;
 
 	if (!data_buf)
 		data_buf = nand_get_data_buf(chip);
@@ -2684,7 +2684,7 @@ static int qcom_read_status_exec(struct nand_chip *chip,
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id = 0;
 	unsigned int len = 0;
-	int ret = 0, num_cw, i;
+	int ret, num_cw, i;
 	u32 flash_status;
 
 	host->status = NAND_STATUS_READY | NAND_STATUS_WP;
@@ -2747,7 +2747,7 @@ static int qcom_read_id_type_exec(struct nand_chip *chip, const struct nand_subo
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id = 0;
 	unsigned int len = 0;
-	int ret = 0;
+	int ret;
 
 	qcom_parse_instructions(chip, subop, &q_op);
 
@@ -2795,7 +2795,7 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_op q_op = {};
-	int ret = 0;
+	int ret;
 
 	qcom_parse_instructions(chip, subop, &q_op);
 
@@ -2841,7 +2841,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id = 0;
 	unsigned int len = 0;
-	int ret = 0;
+	int ret;
 
 	qcom_parse_instructions(chip, subop, &q_op);
 
@@ -2935,7 +2935,7 @@ static int qcom_erase_cmd_type_exec(struct nand_chip *chip, const struct nand_su
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	struct qcom_op q_op = {};
-	int ret = 0;
+	int ret;
 
 	qcom_parse_instructions(chip, subop, &q_op);
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
