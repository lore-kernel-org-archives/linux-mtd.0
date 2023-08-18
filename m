Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D611C71156
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X4uWB3btnC3jbb8o4kGIP7/tFjB67TKc543zeAp6S64=; b=hKUK7g3rb4/y/1
	npfnJ8PUmIy4detG35Q8Lc4c7Tvok7TAlAioP8nWBNKVkdPgA+FrNKPosouyvzftODJZGHwnLUJ04
	8EIkNtwjuyhg1JT+XT9iKMeDjyxMkAY9SN3KxTS103Tqlk+1h6x33SKhf456+o6Kys6ulJSzLyC4V
	D5km8jbzTliqt9SZ3nI3/ue1ivVwZ9z9FXkyeuVnlu2bsJGMYmnWT/YTRLp0+sUT69copaBrY5Q5Z
	5qjiQacj9y3KjTWo+6K1VIuTamz5yTOnO23LFJCfzyaTLbBHyZZtvu4xeKEupDmpjBiPyWZJtVpuE
	f86Z5KbKXF2U9O7nEYig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0oq-009Y0D-18;
	Fri, 18 Aug 2023 14:51:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0oj-009Xz7-2v
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:51:16 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IBsMfX015058;
	Fri, 18 Aug 2023 14:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=9krhDG92KmrwGfVOyaysSlXM/A2GxevjIrQYdObfOpI=;
 b=K2xt0b2ABu2g8JwSu3zd4wSlmW8RX2RDQsyc3oBy4EZp/ocQxUkpEehwhhniMOLhuVwK
 p/7hXm3Dc7Ef5S7zMxGllHF9cdtU/vlYeYaqOcVKo8lLPn9OAV+Pnf64E0rMI1Vg+LHi
 t+Ek5YN0oSm54bkH+CGD/C4aigEypntUSezswJeabWFIw3MhFUD5UwZn1iTe8a1/wVBK
 IrCkWL+0aFAXh1fv/JtUxWtzW5cDxx1ftcikWLc5m4bKGS7nC2Mv2y1q15le7cviW6dL
 8U5b23RiA/u6gDQQrXfDzfBm5JCL9lgKFnvHYTy73QsJMSSH6NH9tg0tGBsXmFvPSRJk nA== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sj6140jh3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 14:51:09 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37IEp6Ag000321;
	Fri, 18 Aug 2023 14:51:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3se35mqdy4-1;
	Fri, 18 Aug 2023 14:51:06 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37IEp4Qs000300;
	Fri, 18 Aug 2023 14:51:05 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 37IEp4UQ032767;
	Fri, 18 Aug 2023 14:51:05 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id ECC7512010CE; Fri, 18 Aug 2023 20:21:04 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_mdalam@quicinc.com, quic_srichara@quicinc.com
Subject: [PATCH 3/3] mtd: rawnand: qcom: Add read/read_start ops in exec_op path
Date: Fri, 18 Aug 2023 20:21:01 +0530
Message-Id: <20230818145101.23825-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230818145101.23825-1-quic_mdalam@quicinc.com>
References: <20230818145101.23825-1-quic_mdalam@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ghE0kJoYG9k2M4PbFHW5ZD9abiubilfk
X-Proofpoint-ORIG-GUID: ghE0kJoYG9k2M4PbFHW5ZD9abiubilfk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_18,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 suspectscore=0 mlxlogscore=999 phishscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1015 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_075113_951085_03BABB15 
X-CRM114-Status: GOOD (  19.66  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Sricharan Ramabadhran <quic_srichara@quicinc.com>

READ/READ_START opcodes are not set in exec_op path.
Fixing that here.

While there, Steps to program the controller is common for
erase/reset/read/program page. So use a common pattern and
pull them under one function.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 93 ++++++++++++-------------------
 1 file changed, 35 insertions(+), 58 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 73dd1b4e4e31..370a779610e2 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2541,9 +2541,11 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	return 0;
 }
 
-static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 opcode,
+static int qcom_op_cmd_mapping(struct nand_chip *chip, u8 opcode,
 			       struct qcom_op *q_op)
 {
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	int cmd;
 
 	switch (opcode) {
@@ -2571,6 +2573,13 @@ static int qcom_op_cmd_mapping(struct qcom_nand_controller *nandc, u8 opcode,
 		q_op->flag = OP_PROGRAM_PAGE;
 		nandc->exec_opwrite = true;
 		break;
+	case NAND_CMD_READ0:
+	case NAND_CMD_READSTART:
+		if (host->use_ecc)
+			cmd = OP_PAGE_READ_WITH_ECC;
+		else
+			cmd = OP_PAGE_READ;
+		break;
 	default:
 		dev_err(nandc->dev, "Opcode not supported: %u\n", opcode);
 		return -EOPNOTSUPP;
@@ -2597,7 +2606,7 @@ static int qcom_parse_instructions(struct nand_chip *chip,
 
 		switch (instr->type) {
 		case NAND_OP_CMD_INSTR:
-			ret = qcom_op_cmd_mapping(nandc, instr->ctx.cmd.opcode, q_op);
+			ret = qcom_op_cmd_mapping(chip, instr->ctx.cmd.opcode, q_op);
 			if (ret < 0)
 				return ret;
 
@@ -2791,13 +2800,25 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 	struct qcom_nand_host *host = to_qcom_nand_host(chip);
 	struct qcom_op q_op = {};
 	int ret;
+	int instrs = 1;
 
 	ret = qcom_parse_instructions(chip, subop, &q_op);
 	if (ret)
 		return ret;
 
-	if (q_op.flag == OP_PROGRAM_PAGE)
+	if (q_op.flag == OP_PROGRAM_PAGE) {
 		goto wait_rdy;
+	} else if (q_op.cmd_reg == OP_BLOCK_ERASE) {
+		q_op.cmd_reg |= PAGE_ACC | LAST_PAGE;
+		nandc_set_reg(chip, NAND_ADDR0, q_op.addr1_reg);
+		nandc_set_reg(chip, NAND_ADDR1, q_op.addr2_reg);
+		nandc_set_reg(chip, NAND_DEV0_CFG0,
+			      host->cfg0_raw & ~(7 << CW_PER_PAGE));
+		nandc_set_reg(chip, NAND_DEV0_CFG1, host->cfg1_raw);
+		instrs = 3;
+	} else {
+		return 0;
+	}
 
 	nandc->buf_count = 0;
 	nandc->buf_start = 0;
@@ -2809,9 +2830,12 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 	nandc_set_reg(chip, NAND_FLASH_CMD, q_op.cmd_reg);
 	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
 
-	write_reg_dma(nandc, NAND_FLASH_CMD, 1, NAND_BAM_NEXT_SGL);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
+	write_reg_dma(nandc, NAND_FLASH_CMD, instrs, NAND_BAM_NEXT_SGL);
+	(q_op.cmd_reg == OP_BLOCK_ERASE) ? write_reg_dma(nandc, NAND_DEV0_CFG0,
+	2, NAND_BAM_NEXT_SGL) : read_reg_dma(nandc,
+	NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
+	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
 	read_reg_dma(nandc, NAND_FLASH_STATUS, 1, NAND_BAM_NEXT_SGL);
 
 	ret = submit_descs(nandc);
@@ -2928,56 +2952,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	return ret;
 }
 
-static int qcom_erase_cmd_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
-{
-	struct qcom_nand_host *host = to_qcom_nand_host(chip);
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
-	struct qcom_op q_op = {};
-	int ret;
-
-	ret = qcom_parse_instructions(chip, subop, &q_op);
-	if (ret)
-		return ret;
-
-	q_op.cmd_reg |= PAGE_ACC | LAST_PAGE;
-
-	nandc->buf_count = 0;
-	nandc->buf_start = 0;
-	host->use_ecc = false;
-	clear_read_regs(nandc);
-	clear_bam_transaction(nandc);
-
-	nandc_set_reg(chip, NAND_FLASH_CMD, q_op.cmd_reg);
-	nandc_set_reg(chip, NAND_ADDR0, q_op.addr1_reg);
-	nandc_set_reg(chip, NAND_ADDR1, q_op.addr2_reg);
-	nandc_set_reg(chip, NAND_DEV0_CFG0,
-		      host->cfg0_raw & ~(7 << CW_PER_PAGE));
-	nandc_set_reg(chip, NAND_DEV0_CFG1, host->cfg1_raw);
-	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
-
-	write_reg_dma(nandc, NAND_FLASH_CMD, 3, NAND_BAM_NEXT_SGL);
-	write_reg_dma(nandc, NAND_DEV0_CFG0, 2, NAND_BAM_NEXT_SGL);
-	write_reg_dma(nandc, NAND_EXEC_CMD, 1, NAND_BAM_NEXT_SGL);
-
-	ret = submit_descs(nandc);
-	if (ret) {
-		dev_err(nandc->dev, "failure in submitting erase descriptor\n");
-		goto err_out;
-	}
-
-	ret = qcom_wait_rdy_poll(chip, q_op.rdy_timeout_ms);
-	if (ret)
-		goto err_out;
-
-err_out:
-	return ret;
-}
-
 static const struct nand_op_parser qcom_op_parser = NAND_OP_PARSER(
-		NAND_OP_PARSER_PATTERN(
-			qcom_misc_cmd_type_exec,
-			NAND_OP_PARSER_PAT_CMD_ELEM(false),
-			NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
 		NAND_OP_PARSER_PATTERN(
 			qcom_read_id_type_exec,
 			NAND_OP_PARSER_PAT_CMD_ELEM(false),
@@ -2994,10 +2969,10 @@ static const struct nand_op_parser qcom_op_parser = NAND_OP_PARSER(
 			NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
 			NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 512)),
 		NAND_OP_PARSER_PATTERN(
-			qcom_erase_cmd_type_exec,
-			NAND_OP_PARSER_PAT_CMD_ELEM(false),
-			NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDRESS_CYCLE),
+			qcom_misc_cmd_type_exec,
 			NAND_OP_PARSER_PAT_CMD_ELEM(false),
+			NAND_OP_PARSER_PAT_ADDR_ELEM(true, MAX_ADDRESS_CYCLE),
+			NAND_OP_PARSER_PAT_CMD_ELEM(true),
 			NAND_OP_PARSER_PAT_WAITRDY_ELEM(false)),
 		);
 
@@ -3018,7 +2993,9 @@ static int qcom_check_op(struct nand_chip *chip,
 			    instr->ctx.cmd.opcode != NAND_CMD_ERASE1 &&
 			    instr->ctx.cmd.opcode != NAND_CMD_ERASE2 &&
 			    instr->ctx.cmd.opcode != NAND_CMD_STATUS &&
-			    instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG)
+			    instr->ctx.cmd.opcode != NAND_CMD_PAGEPROG &&
+			    instr->ctx.cmd.opcode != NAND_CMD_READ0 &&
+			    instr->ctx.cmd.opcode != NAND_CMD_READSTART)
 				return -EOPNOTSUPP;
 			break;
 		default:
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
