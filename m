Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 396EAD3C935
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 11:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P4TWuXSut0HcPdDt8IEN1zX64fdSA7wS7abqbT2Rzg0=; b=BEIgQUb4g4OtSw
	qTfCF5HGqYI/5bsSj/GZg4QWKlbE+S68mX1LkD/vPP+36RDs/WtEQ4TXXN366qplsX3kGlOLrWxr5
	pInDv4jwJLlrO0Ssc1d8K/uRCsGN9tflTjFcwlNOodHA2zpe+H4K2csZyxZUbAJB5HEVvyOlhBDWg
	sTzEiyKo9PIvLIvhvNftrpJHYTicexVkNy0xuga8wdHXJgVtMAUvegBLXDP2aS48+Qgczy7U4DY4h
	tGlJrROEWQv5/kzKxWY3f1nKJYZjfgqlLU3uXXGL4SFu8BxZnGdevZS8EWDuJJjLv/aa5Z3S7TUES
	l3JyWv4Nch+nIln1gDzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2r3p-000000078Hx-44Jl;
	Mon, 21 Oct 2024 11:58:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2r2A-000000077ri-1UpG
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 11:57:16 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LAV0JJ027952;
	Mon, 21 Oct 2024 11:57:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OoOx/SqHfH59ohunJgANUQd8iHA28/52g/rZMzF70qg=; b=bTt0rQxOqMsygl1+
	c4gCYvNztlnp1A/fD2g3S8OfoZuGUFeRpo4NNp+9wTRpq257px1aJ8aJh790Stvv
	Z47cOKe6QUO+GSjK98baKpQeBzigU54yFW4JRAcxKmOdkV0lptb6GAMBeBvTUvW8
	XqVOX5flbvGmq5RI4pPbyv/s9lCnhZf/FTKBC2+xqMupLEhO6/xR5XrVdc9eLMdX
	6cvcv29DLzy5LVYAPiHsWXmIPOWTMk8mEt4F5Xc6CKHqsHWY7bPCjZjY1++5OI2P
	VA9Dx48cxhxry1Wj/yIaEYScbN9NDbWecVzEjeDB8LgiTnd9O5HnbZ2Quyjn0sln
	Rud12w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6w1mhgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 11:57:08 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LBv7J2015003
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 11:57:07 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 04:57:02 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH v12 5/8] mtd: rawnand: qcom: use FIELD_PREP and GENMASK
Date: Mon, 21 Oct 2024 17:26:17 +0530
Message-ID: <20241021115620.1616617-6-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
References: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MasEK-fX4S0dXTu3tzY4kLrJl1mQBa93
X-Proofpoint-ORIG-GUID: MasEK-fX4S0dXTu3tzY4kLrJl1mQBa93
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 clxscore=1015 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_045714_466578_31561E11 
X-CRM114-Status: GOOD (  14.71  )
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

Use the bitfield macro FIELD_PREP, and GENMASK to
do the shift and mask in one go. This makes the code
more readable.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v12]

* No change

Change in [v11]

* No change

Change in [v10]

* No change

Change in [v9]

* In update_rw_regs() api added cpu_to_le32() macro to fix compilation
  issue reported by kernel test bot
* In qcom_param_page_type_exec() api added cpu_to_le32() macro to fix
  compilation issue reported by kernel test bot  

Change in [v8]

* No change

Change in [v7]

* No change

Change in [v6]

* Added FIELD_PREP() and GENMASK() macro

Change in [v5]

* This patch was not included in [v1]

Change in [v4]

* This patch was not included in [v4]

Change in [v3]

* This patch was not included in [v3]

Change in [v2]

* This patch was not included in [v2]

Change in [v1]

* This patch was not included in [v1]

 drivers/mtd/nand/raw/qcom_nandc.c    | 97 ++++++++++++++--------------
 include/linux/mtd/nand-qpic-common.h | 31 +++++----
 2 files changed, 67 insertions(+), 61 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 91f1eb781cb2..c1159dbc8eba 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -281,7 +281,7 @@ static void update_rw_regs(struct qcom_nand_host *host, int num_cw, bool read, i
 				(num_cw - 1) << CW_PER_PAGE);
 
 		cfg1 = cpu_to_le32(host->cfg1_raw);
-		ecc_bch_cfg = cpu_to_le32(1 << ECC_CFG_ECC_DISABLE);
+		ecc_bch_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
 	}
 
 	nandc->regs->cmd = cmd;
@@ -1494,42 +1494,41 @@ static int qcom_nand_attach_chip(struct nand_chip *chip)
 	host->cw_size = host->cw_data + ecc->bytes;
 	bad_block_byte = mtd->writesize - host->cw_size * (cwperpage - 1) + 1;
 
-	host->cfg0 = (cwperpage - 1) << CW_PER_PAGE
-				| host->cw_data << UD_SIZE_BYTES
-				| 0 << DISABLE_STATUS_AFTER_WRITE
-				| 5 << NUM_ADDR_CYCLES
-				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_RS
-				| 0 << STATUS_BFR_READ
-				| 1 << SET_RD_MODE_AFTER_STATUS
-				| host->spare_bytes << SPARE_SIZE_BYTES;
-
-	host->cfg1 = 7 << NAND_RECOVERY_CYCLES
-				| 0 <<  CS_ACTIVE_BSY
-				| bad_block_byte << BAD_BLOCK_BYTE_NUM
-				| 0 << BAD_BLOCK_IN_SPARE_AREA
-				| 2 << WR_RD_BSY_GAP
-				| wide_bus << WIDE_FLASH
-				| host->bch_enabled << ENABLE_BCH_ECC;
-
-	host->cfg0_raw = (cwperpage - 1) << CW_PER_PAGE
-				| host->cw_size << UD_SIZE_BYTES
-				| 5 << NUM_ADDR_CYCLES
-				| 0 << SPARE_SIZE_BYTES;
-
-	host->cfg1_raw = 7 << NAND_RECOVERY_CYCLES
-				| 0 << CS_ACTIVE_BSY
-				| 17 << BAD_BLOCK_BYTE_NUM
-				| 1 << BAD_BLOCK_IN_SPARE_AREA
-				| 2 << WR_RD_BSY_GAP
-				| wide_bus << WIDE_FLASH
-				| 1 << DEV0_CFG1_ECC_DISABLE;
-
-	host->ecc_bch_cfg = !host->bch_enabled << ECC_CFG_ECC_DISABLE
-				| 0 << ECC_SW_RESET
-				| host->cw_data << ECC_NUM_DATA_BYTES
-				| 1 << ECC_FORCE_CLK_OPEN
-				| ecc_mode << ECC_MODE
-				| host->ecc_bytes_hw << ECC_PARITY_SIZE_BYTES_BCH;
+	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, (cwperpage - 1)) |
+		     FIELD_PREP(UD_SIZE_BYTES_MASK, host->cw_data) |
+		     FIELD_PREP(DISABLE_STATUS_AFTER_WRITE, 0) |
+		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+		     FIELD_PREP(ECC_PARITY_SIZE_BYTES_RS, host->ecc_bytes_hw) |
+		     FIELD_PREP(STATUS_BFR_READ, 0) |
+		     FIELD_PREP(SET_RD_MODE_AFTER_STATUS, 1) |
+		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, host->spare_bytes);
+
+	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, bad_block_byte) |
+		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 0) |
+		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+		     FIELD_PREP(WIDE_FLASH, wide_bus) |
+		     FIELD_PREP(ENABLE_BCH_ECC, host->bch_enabled);
+
+	host->cfg0_raw = FIELD_PREP(CW_PER_PAGE_MASK, (cwperpage - 1)) |
+			 FIELD_PREP(UD_SIZE_BYTES_MASK, host->cw_size) |
+			 FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+			 FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
+
+	host->cfg1_raw = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+			 FIELD_PREP(CS_ACTIVE_BSY, 0) |
+			 FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+			 FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+			 FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+			 FIELD_PREP(WIDE_FLASH, wide_bus) |
+			 FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
+
+	host->ecc_bch_cfg = FIELD_PREP(ECC_CFG_ECC_DISABLE, !host->bch_enabled) |
+			    FIELD_PREP(ECC_SW_RESET, 0) |
+			    FIELD_PREP(ECC_NUM_DATA_BYTES_MASK, host->cw_data) |
+			    FIELD_PREP(ECC_FORCE_CLK_OPEN, 1) |
+			    FIELD_PREP(ECC_MODE_MASK, ecc_mode) |
+			    FIELD_PREP(ECC_PARITY_SIZE_BYTES_BCH_MASK, host->ecc_bytes_hw);
 
 	if (!nandc->props->qpic_version2)
 		host->ecc_buf_cfg = 0x203 << NUM_STEPS;
@@ -1882,21 +1881,21 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	nandc->regs->addr0 = 0;
 	nandc->regs->addr1 = 0;
 
-	nandc->regs->cfg0 = cpu_to_le32(0 << CW_PER_PAGE
-			    | 512 << UD_SIZE_BYTES
-			    | 5 << NUM_ADDR_CYCLES
-			    | 0 << SPARE_SIZE_BYTES);
+	host->cfg0 = FIELD_PREP(CW_PER_PAGE_MASK, 0) |
+		     FIELD_PREP(UD_SIZE_BYTES_MASK, 512) |
+		     FIELD_PREP(NUM_ADDR_CYCLES_MASK, 5) |
+		     FIELD_PREP(SPARE_SIZE_BYTES_MASK, 0);
 
-	nandc->regs->cfg1 = cpu_to_le32(7 << NAND_RECOVERY_CYCLES
-			    | 0 << CS_ACTIVE_BSY
-			    | 17 << BAD_BLOCK_BYTE_NUM
-			    | 1 << BAD_BLOCK_IN_SPARE_AREA
-			    | 2 << WR_RD_BSY_GAP
-			    | 0 << WIDE_FLASH
-			    | 1 << DEV0_CFG1_ECC_DISABLE);
+	host->cfg1 = FIELD_PREP(NAND_RECOVERY_CYCLES_MASK, 7) |
+		     FIELD_PREP(BAD_BLOCK_BYTE_NUM_MASK, 17) |
+		     FIELD_PREP(CS_ACTIVE_BSY, 0) |
+		     FIELD_PREP(BAD_BLOCK_IN_SPARE_AREA, 1) |
+		     FIELD_PREP(WR_RD_BSY_GAP_MASK, 2) |
+		     FIELD_PREP(WIDE_FLASH, 0) |
+		     FIELD_PREP(DEV0_CFG1_ECC_DISABLE, 1);
 
 	if (!nandc->props->qpic_version2)
-		nandc->regs->ecc_buf_cfg = cpu_to_le32(1 << ECC_CFG_ECC_DISABLE);
+		nandc->regs->ecc_buf_cfg = cpu_to_le32(ECC_CFG_ECC_DISABLE);
 
 	/* configure CMD1 and VLD for ONFI param probing in QPIC v1 */
 	if (!nandc->props->qpic_version2) {
diff --git a/include/linux/mtd/nand-qpic-common.h b/include/linux/mtd/nand-qpic-common.h
index 425994429387..e79c79775eb8 100644
--- a/include/linux/mtd/nand-qpic-common.h
+++ b/include/linux/mtd/nand-qpic-common.h
@@ -70,35 +70,42 @@
 #define	BS_CORRECTABLE_ERR_MSK		0x1f
 
 /* NAND_DEVn_CFG0 bits */
-#define	DISABLE_STATUS_AFTER_WRITE	4
+#define	DISABLE_STATUS_AFTER_WRITE	BIT(4)
 #define	CW_PER_PAGE			6
+#define	CW_PER_PAGE_MASK		GENMASK(8, 6)
 #define	UD_SIZE_BYTES			9
 #define	UD_SIZE_BYTES_MASK		GENMASK(18, 9)
-#define	ECC_PARITY_SIZE_BYTES_RS	19
+#define	ECC_PARITY_SIZE_BYTES_RS	GENMASK(22, 19)
 #define	SPARE_SIZE_BYTES		23
 #define	SPARE_SIZE_BYTES_MASK		GENMASK(26, 23)
 #define	NUM_ADDR_CYCLES			27
-#define	STATUS_BFR_READ			30
-#define	SET_RD_MODE_AFTER_STATUS	31
+#define	NUM_ADDR_CYCLES_MASK		GENMASK(29, 27)
+#define	STATUS_BFR_READ			BIT(30)
+#define	SET_RD_MODE_AFTER_STATUS	BIT(31)
 
 /* NAND_DEVn_CFG0 bits */
-#define	DEV0_CFG1_ECC_DISABLE		0
-#define	WIDE_FLASH			1
+#define	DEV0_CFG1_ECC_DISABLE		BIT(0)
+#define	WIDE_FLASH			BIT(1)
 #define	NAND_RECOVERY_CYCLES		2
-#define	CS_ACTIVE_BSY			5
+#define	NAND_RECOVERY_CYCLES_MASK	GENMASK(4, 2)
+#define	CS_ACTIVE_BSY			BIT(5)
 #define	BAD_BLOCK_BYTE_NUM		6
-#define	BAD_BLOCK_IN_SPARE_AREA		16
+#define	BAD_BLOCK_BYTE_NUM_MASK		GENMASK(15, 6)
+#define	BAD_BLOCK_IN_SPARE_AREA		BIT(16)
 #define	WR_RD_BSY_GAP			17
-#define	ENABLE_BCH_ECC			27
+#define	WR_RD_BSY_GAP_MASK		GENMASK(22, 17)
+#define	ENABLE_BCH_ECC			BIT(27)
 
 /* NAND_DEV0_ECC_CFG bits */
-#define	ECC_CFG_ECC_DISABLE		0
-#define	ECC_SW_RESET			1
+#define	ECC_CFG_ECC_DISABLE		BIT(0)
+#define	ECC_SW_RESET			BIT(1)
 #define	ECC_MODE			4
+#define	ECC_MODE_MASK			GENMASK(5, 4)
 #define	ECC_PARITY_SIZE_BYTES_BCH	8
+#define	ECC_PARITY_SIZE_BYTES_BCH_MASK	GENMASK(12, 8)
 #define	ECC_NUM_DATA_BYTES		16
 #define	ECC_NUM_DATA_BYTES_MASK		GENMASK(25, 16)
-#define	ECC_FORCE_CLK_OPEN		30
+#define	ECC_FORCE_CLK_OPEN		BIT(30)
 
 /* NAND_DEV_CMD1 bits */
 #define	READ_ADDR			0
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
