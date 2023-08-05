Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33B96C001DE
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Aug 2023 17:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ta8bDYIg3C14gVXYZY1fJGs9FOjN8LiIr9P4WRpi5z8=; b=KQQs64vLhvc+uQ
	6QxCmoCtN+Gv2g5PIAG1P8TfdXxzoii7j7hxBEt9hXUPvWGEimAEN/7icqEbXJ/maFlD4Qa9qyBoa
	yPpi/vZmY043PIhxqdtxCXfQ9G197LMoc0ASk/gig28/qhAz915TbaX2bw2Uw1pZGIInBrUl6ATQU
	uUWV9ZM2C8pdj0VjFNp04xto7t+VtzuHGusPXyAbXfUhFiDYodrfyRr3poukzG6KKjvYbOoVnrHo5
	UUTLf5lUCIiZpKmM/EGd2VaGD+imQqw0J7eHWpTqDbx7sWiMZQk5Z0QvGLZg8ssWf/fkeym4qXaeM
	OFCNcqAOkVXnBvip+Yvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLIA-00EOvk-3A;
	Sat, 05 Aug 2023 17:42:18 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSLI7-00EOuF-1j
	for linux-mtd@lists.infradead.org;
	Sat, 05 Aug 2023 17:42:17 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-686efb9ee3cso3005451b3a.3
        for <linux-mtd@lists.infradead.org>; Sat, 05 Aug 2023 10:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691257333; x=1691862133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWgVvz/rSzQAaNBR+0GRt5Tgri/Am0g/0Utn1T92Y2Y=;
        b=spmuW2205c4AMxvmTZqta+KfpbmGiMADfX552zTgjqqhuoU5jB50Rvj6YA5huHCmxS
         Clj8Tc/0sYIjn8v3eOqz9XQ/ICo1AOxtgTjNwJn285MAh7sCg0B6/9qmkvNTKmqY31KM
         kF1ntOt634CLv/Qdwqiiwb2WbWP5MocBnkT7Hj96LUqUuSGE8g9FdfBT64hp5UemWICs
         uwVemBDY2CR9JB7S/JBkewlSzcg2alQG4DzmdXAuZQpoTdUqiYiHwIo2cw9fbXvyOaip
         vDDwiawt5foQ3dgQ2Och6bf1DoT/UDLHoj87uHzsYv/h3mQQcFlvkFrYqiB/E/U1Bb+m
         +0Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691257333; x=1691862133;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uWgVvz/rSzQAaNBR+0GRt5Tgri/Am0g/0Utn1T92Y2Y=;
        b=Fi9EOXlHGMDw8z8uCb5EY6jMvXBK2wMWL1B5OjygL+bdU1WwkJjmkbmesdyWwFXSxT
         re+bQlBeRW+w9R/0aD5pCZt9zKzxSzvabrvkFZjtX/8RKPyu8ynb3wyq5rYMypTzKAOR
         00h7nS+OSEzo7/6zZbBgkLj6kzaW4VfX6E1Z9JS9g7niJm4WslphNDwblilEITrjUu4T
         Bjq03hQB4IACuTg9KU0WOEnVSKOzaJQrj2FT4xZ+mQ/dFUpTDKQb0CeV6swCHwuvR9LZ
         v0V7L9TRrifkQX+M5suAj9wNQ7eR/qfHlWPuo+k3GhXRswBlnmmMf//GAG529js/+AA5
         EMAA==
X-Gm-Message-State: AOJu0Yw9Ft6Nh904RuEKZEfo27K7mZ9O7n7Nf1mMm3QZk8KQxwdVEK57
	j3HCluDMNNtjvOmXLXVGzkAJ
X-Google-Smtp-Source: AGHT+IElfmMvpoXzEv7T8xFD3V6MeRB4DjmbKf0fKAgK1eie9hb1tQx+4CUQdeE1PPVXG/iSNIBwXQ==
X-Received: by 2002:a05:6a20:1456:b0:13f:5234:24ce with SMTP id a22-20020a056a20145600b0013f523424cemr6875817pzi.28.1691257333498;
        Sat, 05 Aug 2023 10:42:13 -0700 (PDT)
Received: from localhost.localdomain ([103.28.246.21])
        by smtp.gmail.com with ESMTPSA id i14-20020aa78b4e000000b006874a6850e9sm3363160pfd.215.2023.08.05.10.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Aug 2023 10:42:13 -0700 (PDT)
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
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 03/10] mtd: rawnand: qcom: Handle unsupported opcode in qcom_op_cmd_mapping()
Date: Sat,  5 Aug 2023 23:11:39 +0530
Message-Id: <20230805174146.57006-4-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
References: <20230805174146.57006-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230805_104215_575204_A8606DB4 
X-CRM114-Status: GOOD (  15.25  )
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

Handle the scenario where the caller has passed an unsupported opcode to
qcom_op_cmd_mapping(). In that case, log the error and return the
-EOPNOTSUPP errono. Also, let's propagate this error code all the way up.

This also fixes the following smatch warning:

drivers/mtd/nand/raw/qcom_nandc.c:2941 qcom_op_cmd_mapping() error: uninitialized symbol 'ret'.

Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
Closes: https://lore.kernel.org/r/202308032022.SnXkKyFs-lkp@intel.com/
Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 35 ++++++++++++++++++++++++-------
 1 file changed, 27 insertions(+), 8 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index be428b80a39b..4957e9253878 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2585,20 +2585,23 @@ static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 opcode,
 		q_op->flag = OP_PROGRAM_PAGE;
 		nandc->exec_opwrite = true;
 		break;
+	default:
+		dev_err(nandc->dev, "Opcode not supported: %u\n", opcode);
+		return -EOPNOTSUPP;
 	}
 
 	return cmd;
 }
 
 /* NAND framework ->exec_op() hooks and related helpers */
-static void qcom_parse_instructions(struct nand_chip *chip,
+static int qcom_parse_instructions(struct nand_chip *chip,
 				    const struct nand_subop *subop,
 				    struct qcom_op *q_op)
 {
 	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id;
-	int i;
+	int i, ret;
 
 	for (op_id = 0; op_id < subop->ninstrs; op_id++) {
 		unsigned int offset, naddrs;
@@ -2608,7 +2611,11 @@ static void qcom_parse_instructions(struct nand_chip *chip,
 
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
-			q_op->cmd_reg = qcom_op_cmd_mapping(nandc, instr->ctx.cmd.opcode, q_op);
+			ret = qcom_op_cmd_mapping(nandc, instr->ctx.cmd.opcode, q_op);
+			if (ret < 0)
+				return ret;
+
+			q_op->cmd_reg = ret;
 			q_op->rdy_delay_ns = instr->delay_ns;
 			break;
 
@@ -2641,6 +2648,8 @@ static void qcom_parse_instructions(struct nand_chip *chip,
 			break;
 		}
 	}
+
+	return 0;
 }
 
 static void qcom_delay_ns(unsigned int ns)
@@ -2689,7 +2698,9 @@ static int qcom_read_status_exec(struct nand_chip *chip,
 
 	host->status = NAND_STATUS_READY | NAND_STATUS_WP;
 
-	qcom_parse_instructions(chip, subop, &q_op);
+	ret = qcom_parse_instructions(chip, subop, &q_op);
+	if (ret)
+		return ret;
 
 	num_cw = nandc->exec_opwrite ? ecc->steps : 1;
 	nandc->exec_opwrite = false;
@@ -2749,7 +2760,9 @@ static int qcom_read_id_type_exec(struct nand_chip *chip, const struct nand_subo
 	unsigned int len = 0;
 	int ret;
 
-	qcom_parse_instructions(chip, subop, &q_op);
+	ret = qcom_parse_instructions(chip, subop, &q_op);
+	if (ret)
+		return ret;
 
 	nandc->buf_count = 0;
 	nandc->buf_start = 0;
@@ -2797,7 +2810,9 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 	struct qcom_op q_op = {};
 	int ret;
 
-	qcom_parse_instructions(chip, subop, &q_op);
+	ret = qcom_parse_instructions(chip, subop, &q_op);
+	if (ret)
+		return ret;
 
 	if (q_op.flag == OP_PROGRAM_PAGE)
 		goto wait_rdy;
@@ -2843,7 +2858,9 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	unsigned int len = 0;
 	int ret;
 
-	qcom_parse_instructions(chip, subop, &q_op);
+	ret = qcom_parse_instructions(chip, subop, &q_op);
+	if (ret)
+		return ret;
 
 	q_op.cmd_reg |= PAGE_ACC | LAST_PAGE;
 
@@ -2937,7 +2954,9 @@ static int qcom_erase_cmd_type_exec(struct nand_chip *chip, const struct nand_su
 	struct qcom_op q_op = {};
 	int ret;
 
-	qcom_parse_instructions(chip, subop, &q_op);
+	ret = qcom_parse_instructions(chip, subop, &q_op);
+	if (ret)
+		return ret;
 
 	q_op.cmd_reg |= PAGE_ACC | LAST_PAGE;
 
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
