Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65BC2C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed, 31 May 2023 12:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bf+jQM020wk3kmd99UKFmQLZMDyO/KqMC3EXbvQvAQY=; b=idBpyZSlm++TkD
	VVrayYSdQiRpVWm8prspOmB+i8wGC3l1A2o4J5H/drjJ8j1Ez7I8N31smIKxIDeJBjJPlsPWzZeJM
	8pDc0fRfqzcymZq6+qO2bVmiN+r1WJL9794ZGVXQScY8OSMNEIU8JUc0NeN0vMuB9b9B4cdVboWrT
	pHNy6d4R344Ne5UBMcA87Vpaej4+r9rks2qOrbuz0XGSlx64DTHcDQ+yLAr1vob0fmNaupG3Tkg2y
	DSMHwSi4UlY3aeBzaan4cmIg/D9+CLUwfMM0Eqs54FdreJckJpMl6hnUOOUxMTK4TEO3n//NfdOXC
	AOzbqtsdM2H6gPENaiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LHL-00HPmj-0k;
	Wed, 31 May 2023 12:50:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q4LHG-00HPji-1y
	for linux-mtd@lists.infradead.org;
	Wed, 31 May 2023 12:50:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34V8jJVG005400;
	Wed, 31 May 2023 12:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=+Pnhk5GIyl/VAZMcKl98t8zH74pqJ2uHHdBLgcQBRe8=;
 b=jybOIOkfEzEJUxKI0VV8UFyGT+yccbdCpjrGfcvT8G/urOKRcyLjJKWWLhHrMJfA3eXE
 2eYBF+zdOHvvbwYefqQEdEWDUQ947HJh3GnS3ZMFT/blFVyBkx7dJ1Qkh7wjiPv56CPP
 P19AUwlN0q2bPCR2NBkBb738wIfTGFjAAoMJsKrQLSUKjdd2wKuDmd7/LoiWe40rzGEu
 LBbggeIvgdLAxdSOFqQ/4HhjmOujDWq3SolTWOprXoacp/OnxuDKC5HIWNrZMMpVXr33
 lXCQFk18ByD5+VQlDpw2CJLL+lKEIU+M4PKjIHykM9UaOKMyKU+H2HCOmmYtslqYE+7J rA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qww9c98s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 May 2023 12:50:03 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34VCnxcD021039;
	Wed, 31 May 2023 12:50:00 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3quaxkdw05-1;
	Wed, 31 May 2023 12:50:00 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34VCnxEK021048;
	Wed, 31 May 2023 12:49:59 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 34VCnxDe021047;
	Wed, 31 May 2023 12:49:59 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id DF76512010C1; Wed, 31 May 2023 18:19:58 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_mdalam@quicinc.com
Subject: [PATCH v3 3/5] mtd: rawnand: qcom: Add support for param_page read exec_ops
Date: Wed, 31 May 2023 18:19:51 +0530
Message-Id: <20230531124953.21007-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230531124953.21007-1-quic_mdalam@quicinc.com>
References: <20230531124953.21007-1-quic_mdalam@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: bV2wo_zqvCyH-sRE-rAOliw7nex_mk2g
X-Proofpoint-GUID: bV2wo_zqvCyH-sRE-rAOliw7nex_mk2g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-31_08,2023-05-31_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 mlxscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305310109
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230531_055010_776808_23ECB413 
X-CRM114-Status: GOOD (  19.77  )
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

This change will add exec_ops for PARAM_PAGE_READ command.

Co-developed-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
Change in [v3]

* Removed hard coded value in param_page exec_op API, and used whatever
  passed by core.

* Removed nandc->props->qpic_v2 condition , since its not needed at all.

* Updated nandc->buf_count = len , len provided by core.

Change in [v2]

* Missed to post Cover-letter, so posting v2 patch with cover-letter

Change in [v1]

* Added initial support for exec_ops.

 drivers/mtd/nand/raw/qcom_nandc.c | 105 +++++++++++++++++++++++++++++-
 1 file changed, 104 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 659ba923b68a..b4823b72fe73 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1546,7 +1546,7 @@ static void pre_command(struct qcom_nand_host *host, int command)
 
 	clear_read_regs(nandc);
 
-	if (command == NAND_CMD_PARAM || command == NAND_CMD_ERASE1)
+	if (command == NAND_CMD_ERASE1)
 		clear_bam_transaction(nandc);
 }
 
@@ -3177,6 +3177,103 @@ static int qcom_misc_cmd_type_exec(struct nand_chip *chip, const struct nand_sub
 	return ret;
 }
 
+static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_subop *subop)
+{
+	struct qcom_nand_host *host = to_qcom_nand_host(chip);
+	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
+	struct qcom_op q_op;
+	const struct nand_op_instr *instr = NULL;
+	unsigned int op_id = 0;
+	unsigned int len = 0;
+	int ret = 0;
+
+	qcom_parse_instructions(chip, subop, &q_op);
+
+	q_op.cmd_reg |= PAGE_ACC | LAST_PAGE;
+
+	nandc->buf_count = 0;
+	nandc->buf_start = 0;
+	host->use_ecc = false;
+	clear_read_regs(nandc);
+	clear_bam_transaction(nandc);
+
+	nandc_set_reg(chip, NAND_FLASH_CMD, q_op.cmd_reg);
+
+	nandc_set_reg(chip, NAND_ADDR0, 0);
+	nandc_set_reg(chip, NAND_ADDR1, 0);
+	nandc_set_reg(chip, NAND_DEV0_CFG0, 0 << CW_PER_PAGE
+					| 512 << UD_SIZE_BYTES
+					| 5 << NUM_ADDR_CYCLES
+					| 0 << SPARE_SIZE_BYTES);
+	nandc_set_reg(chip, NAND_DEV0_CFG1, 7 << NAND_RECOVERY_CYCLES
+					| 0 << CS_ACTIVE_BSY
+					| 17 << BAD_BLOCK_BYTE_NUM
+					| 1 << BAD_BLOCK_IN_SPARE_AREA
+					| 2 << WR_RD_BSY_GAP
+					| 0 << WIDE_FLASH
+					| 1 << DEV0_CFG1_ECC_DISABLE);
+	if (!nandc->props->qpic_v2)
+		nandc_set_reg(chip, NAND_EBI2_ECC_BUF_CFG, 1 << ECC_CFG_ECC_DISABLE);
+
+	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
+	if (!nandc->props->qpic_v2) {
+		nandc_set_reg(chip, NAND_DEV_CMD_VLD,
+			      (nandc->vld & ~READ_START_VLD));
+		nandc_set_reg(chip, NAND_DEV_CMD1,
+			      (nandc->cmd1 & ~(0xFF << READ_ADDR))
+			      | NAND_CMD_PARAM << READ_ADDR);
+	}
+
+	nandc_set_reg(chip, NAND_EXEC_CMD, 1);
+
+	if (!nandc->props->qpic_v2) {
+		nandc_set_reg(chip, NAND_DEV_CMD1_RESTORE, nandc->cmd1);
+		nandc_set_reg(chip, NAND_DEV_CMD_VLD_RESTORE, nandc->vld);
+	}
+
+	instr = q_op.data_instr;
+	op_id = q_op.data_instr_idx;
+	len = nand_subop_get_data_len(subop, op_id);
+
+	nandc_set_read_loc(chip, 0, 0, 0, len, 1);
+
+	if (!nandc->props->qpic_v2) {
+		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
+		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
+	}
+
+	nandc->buf_count = len;
+	memset(nandc->data_buffer, 0xff, nandc->buf_count);
+
+	config_nand_single_cw_page_read(chip, false, 0);
+
+	read_data_dma(nandc, FLASH_BUF_ACC, nandc->data_buffer,
+		      nandc->buf_count, 0);
+
+	/* restore CMD1 and VLD regs */
+	if (!nandc->props->qpic_v2) {
+		write_reg_dma(nandc, NAND_DEV_CMD1_RESTORE, 1, 0);
+		write_reg_dma(nandc, NAND_DEV_CMD_VLD_RESTORE, 1, NAND_BAM_NEXT_SGL);
+	}
+
+	ret = submit_descs(nandc);
+	if (ret) {
+		dev_err(nandc->dev, "failure in sbumitting param page descriptor\n");
+		free_descs(nandc);
+		goto err_out;
+	}
+	free_descs(nandc);
+
+	ret = qcom_wait_rdy_poll(chip, q_op.rdy_timeout_ms);
+	if (ret)
+		goto err_out;
+
+	memcpy(instr->ctx.data.buf.in, nandc->data_buffer, len);
+
+err_out:
+	return ret;
+}
+
 static const struct nand_op_parser qcom_op_parser = NAND_OP_PARSER(
 		NAND_OP_PARSER_PATTERN(
 			qcom_misc_cmd_type_exec,
@@ -3191,6 +3288,12 @@ static const struct nand_op_parser qcom_op_parser = NAND_OP_PARSER(
 			qcom_read_status_exec,
 			NAND_OP_PARSER_PAT_CMD_ELEM(false),
 			NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 1)),
+		NAND_OP_PARSER_PATTERN(
+			qcom_param_page_type_exec,
+			NAND_OP_PARSER_PAT_CMD_ELEM(false),
+			NAND_OP_PARSER_PAT_ADDR_ELEM(false, MAX_ADDRESS_CYCLE),
+			NAND_OP_PARSER_PAT_WAITRDY_ELEM(true),
+			NAND_OP_PARSER_PAT_DATA_IN_ELEM(false, 512)),
 		);
 
 static int qcom_check_op(struct nand_chip *chip,
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
