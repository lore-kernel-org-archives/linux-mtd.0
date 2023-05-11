Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F18C7EE26
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 13:08:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1/o3RfaotXBfLAv1WYzYR5yh/I1ROro9wOYN0w6vzME=; b=PdTDeQrDNIZlU3
	uGC/8rjxum6OW8IOyxqfN8vwngSW9oMD80s2YMcPsOe3dwhg0MzDbrDGmQNHHWr0nz4UynCYYD5/s
	Ap8tsDZkLxw8oEPQFTbyanf9I2tCPmP6u3sjjNaEVmWmNHkupb8l1HohUeL5C5LjvyzDE7MVadFp5
	DJ+W5g9y9bCmlYLDV0wwtlQlDJOIxKHO9mu3oIMH6ycJmeCGpyEKDpD98YeSqVzwU00AelOMEe/6O
	ckHB0g7x6eq2Wobrz6HWQSX7BBN1hMKaAHpU7B2HYnaJaWgnlKxBp6AM7cM448i4B0jSI7vkNxRFt
	FM1vmZywd/7frR1YenTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px61Q-008oQ8-1l;
	Thu, 11 May 2023 13:07:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px61O-008oOQ-0P
	for linux-mtd@lists.infradead.org;
	Thu, 11 May 2023 13:07:51 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BBlKmr030407;
	Thu, 11 May 2023 13:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=McbrDClLAa4Ffqe7gNkDhk2tAuCUOtWI2oWivkQHYZ0=;
 b=lJiBA6TIknFsBZC+vOafbutt8WQBNpMaRFIvOD4CeTM2cNAw/1rHNYxPRbOfTkcC4+iU
 8dteZHAoFtCD7klXoYVDO9EN1YVgieshSOFr6EQv10fcYoddnVoucDd8H+UyYHHWtXcx
 E5kDrspbxymkP4aHE7B/lU+kr/pnY0NjkxTj8Wd44rS5LYsgtcwOr4VBsFg7QYkbVUmm
 rOPmu+zSXk78UpzrJpxSNWi89f8DzfsCWQBP35ygfArL4uBLiwo/l5jdy8vjUbA5QBBy
 50prH2qGLc9OBrSX5vAsoDqoTMdU14b4SHmXlngJAEN7Jr94HmwEpGcwYm+bqURGq/lT aQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgj141unu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 13:07:41 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34BD7ZEY013394;
	Thu, 11 May 2023 13:07:38 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3qdy5bq6rd-1;
	Thu, 11 May 2023 13:07:38 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BD7bKx013422;
	Thu, 11 May 2023 13:07:37 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 34BD7b7a013421;
	Thu, 11 May 2023 13:07:37 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id E539112010C1; Thu, 11 May 2023 18:37:36 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_mdalam@quicinc.com,
        0000-cover-letter.patch@qualcomm.com
Subject: [PATCH 3/5] mtd: rawnand: qcom: Add support for param_page read exec_ops
Date: Thu, 11 May 2023 18:37:28 +0530
Message-Id: <20230511130730.28689-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230511130730.28689-1-quic_mdalam@quicinc.com>
References: <20230511130730.28689-1-quic_mdalam@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 09sp2Z-sivQ2v3qbMasON0aPBUmVwPOT
X-Proofpoint-ORIG-GUID: 09sp2Z-sivQ2v3qbMasON0aPBUmVwPOT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_09,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=999
 clxscore=1015 impostorscore=0 priorityscore=1501 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305110113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_060750_173761_D00AD29C 
X-CRM114-Status: GOOD (  19.78  )
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
 drivers/mtd/nand/raw/qcom_nandc.c | 91 ++++++++++++++++++++++++++++++-
 1 file changed, 90 insertions(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d2f2a8971907..8717d5086f80 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3086,7 +3086,96 @@ static int qcom_erase_cmd_type_exec(struct nand_chip *chip, const struct nand_su
 
 static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_subop *subop)
 {
-	return 0;
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
+	pre_command(host, NAND_CMD_PARAM);
+	/*
+	 * NAND_CMD_PARAM is called before we know much about the FLASH chip
+	 * in use. we configure the controller to perform a raw read of 512
+	 * bytes to read onfi params
+	 */
+	if (nandc->props->qpic_v2)
+		nandc_set_reg(chip, NAND_FLASH_CMD, q_op.cmd_reg);
+	else
+		nandc_set_reg(chip, NAND_FLASH_CMD, q_op.cmd_reg);
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
+	nandc_set_read_loc(chip, 0, 0, 0, 512, 1);
+
+	if (!nandc->props->qpic_v2) {
+		write_reg_dma(nandc, NAND_DEV_CMD_VLD, 1, 0);
+		write_reg_dma(nandc, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
+	}
+
+	nandc->buf_count = 512;
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
+	if (ret)
+		dev_err(nandc->dev, "failure in sbumitting param page descriptor\n");
+
+	free_descs(nandc);
+
+	ret = qcom_wait_rdy_poll(chip, q_op.rdy_timeout_ms);
+
+	instr = q_op.data_instr;
+	op_id = q_op.data_instr_idx;
+	len = nand_subop_get_data_len(subop, op_id);
+	memcpy(instr->ctx.data.buf.in, nandc->data_buffer, len);
+
+	return ret;
 }
 
 static int qcom_read_id_type_exec(struct nand_chip *chip, const struct nand_subop *subop)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
