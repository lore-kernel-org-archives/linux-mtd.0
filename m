Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 960E4E65D36
	for <linux-mtd@archiver.kernel.org>; Fri, 22 Nov 2024 09:00:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1eLWM8FzsMbnODc1r+q11e4YYBIkyngG9N2HUeaLbI=; b=n12r5GdDF1nUDI
	+vTNATusDZelNuKB1tL28CBzOpMGY8n7Bxl2moNpzgkK7WhXKPWy4MI8WDD2TzJaEYZdQB5Srs5lE
	FnL53gD6/BsEVogcskzli9r+a49dZdj1fj/OXNeKOMJ6W3rnQ5SK+KUY0loYXcjx+J90jDxT6HFr0
	to5KtZAKta11B/rONaRNvYxPJaZ42imD2VfURC6GpvBuabQ/rIIRvJq+kpp54T07eEtKUJnv199M4
	aLN3JQhC7upMwKrRAeair3rYzd+2G0NR+Dzy9j3A1DEGEPssX2XhiTD3YsrcNdrrR8b/ZaRLg2dvY
	uctMAaB4+gsbZfWhQc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPWM-0000000209q-0YJH;
	Fri, 22 Nov 2024 09:00:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tEPWJ-00000002099-3ZAT
	for linux-mtd@lists.infradead.org;
	Fri, 22 Nov 2024 09:00:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AM2MwJ9027721;
	Fri, 22 Nov 2024 09:00:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VONkYfjy0I+6ovntvwwQZ8DWBbOjQW91xna3prVvaKU=; b=NXecoCDYjxzO+O5P
	bhyxazw0ZDw+c5m4FOanWn3412gSHmH1fPYXpl51u7Vv/uBPa6hkg0QjgK4uVf/W
	IF9IlwqoU/qzYLIBEQoh6SPv/L/96wVkFSZxshPGfDWeb7G6BFYarBbi8pAw4BZX
	KoO2jwQywwItM3mWOJJHhzF6Xa2gau1N1qLALqFAhUvSXMPKl0TtN6207p1AhL+9
	BYgqlxNik1CfGo8sJXTP5Kc9EPfI5jYRpksbaNhGCRMFInw0ML0bAXUZ8rn4ifFC
	aqnjy+fNhnTgWxaC238isaZsAiCpNXVIM7rtQKP24UPSQaQI1Ill1A7eispbXVDK
	wxAY3w==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 432h4drvbq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 09:00:00 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AM8xxee012860
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 22 Nov 2024 08:59:59 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 22 Nov 2024 00:59:54 -0800
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <bbrezillon@kernel.org>,
        <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>, <quic_nainmeht@quicinc.com>,
        <quic_laksd@quicinc.com>
Subject: [PATCH v2 1/3] mtd: rawnand: qcom: Pass 18 bit offset from QPIC base address to BAM
Date: Fri, 22 Nov 2024 14:29:31 +0530
Message-ID: <20241122085933.2663927-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
References: <20241122085933.2663927-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: q18ZRClQBdoAICs92S5DLDb7c-UwB6fC
X-Proofpoint-GUID: q18ZRClQBdoAICs92S5DLDb7c-UwB6fC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 clxscore=1015 phishscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 adultscore=0 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241122_010008_008398_251E5CC4 
X-CRM114-Status: GOOD (  18.83  )
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

Currently we are configuring lower 24 bits of address in descriptor
whereas QPIC design expects 18 bit register offset from QPIC base
address to be configured in cmd descriptors. This is leading to a
different address actually being used in HW, leading to wrong value
read.

the actual issue is that the NANDc base address is different from the
QPIC base address. But the driver doesn't take it into account and just
used the QPIC base as the NANDc base. This used to work as the NANDc IP
only considers the lower 18 bits of the address passed by the driver to
derive the register offset. Since the base address of QPIC used to contain
all 0 for lower 18 bits (like 0x07980000), the driver ended up passing the
actual register offset in it and NANDc worked properly. But on newer SoCs
like SDX75, the QPIC base address doesn't contain all 0 for lower 18 bits
(like 0x01C98000). So NANDc sees wrong offset as per the current logic

Older targets also used same configuration (lower 24 bits) like SDX55,
SDX65, IPQ8074, IPQ6018  etc. but issue is masked in older targets due
to lower 18 bits of QPIC base address being zero leading to expected
address generation.

The address should be passed to BAM 0x30000 + offset. In older targets
the lower 18-bits are zero so that correct address being paased. But
in newer targets the lower 18-bits are non-zero in QPIC base so that
0x300000 + offset giving the wrong value.

SDX75 : QPIC_QPIC | 0x01C98000 (Lower 18 bits are non zero)
SDX55 : QPIC_QPIC | 0x07980000 (Lower 18 bits are zero) Same for
older targets.

Cc: stable@vger.kernel.org
Fixes: 8d6b6d7e135e ("mtd: nand: qcom: support for command descriptor formation")
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v2]

* Updated commit message

* Added Fixes tag

* Added stable kernel tag

* Renamed the variable from offset_from_qpic to nandc_offset

Change in [v1]

* Preliminary correction for the register address forwarded to BAM
 
 drivers/mtd/nand/raw/qcom_nandc.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index b8cff9240b28..cc59461df72e 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -207,7 +207,7 @@ nandc_set_reg(chip, reg,			\
 #define dev_cmd_reg_addr(nandc, reg) ((nandc)->props->dev_cmd_reg_start + (reg))
 
 /* Returns the NAND register physical address */
-#define nandc_reg_phys(chip, offset) ((chip)->base_phys + (offset))
+#define nandc_reg_phys(chip, offset)  ((nandc)->props->nandc_offset + (offset))
 
 /* Returns the dma address for reg read buffer */
 #define reg_buf_dma_addr(chip, vaddr) \
@@ -561,6 +561,7 @@ struct qcom_nandc_props {
 	bool is_qpic;
 	bool qpic_v2;
 	bool use_codeword_fixup;
+	u32 nandc_offset;
 };
 
 /* Frees the BAM transaction memory */
@@ -3477,6 +3478,7 @@ static const struct qcom_nandc_props ipq806x_nandc_props = {
 	.is_bam = false,
 	.use_codeword_fixup = true,
 	.dev_cmd_reg_start = 0x0,
+	.nandc_offset = 0x30000,
 };
 
 static const struct qcom_nandc_props ipq4019_nandc_props = {
@@ -3484,6 +3486,7 @@ static const struct qcom_nandc_props ipq4019_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x0,
+	.nandc_offset = 0x30000,
 };
 
 static const struct qcom_nandc_props ipq8074_nandc_props = {
@@ -3491,6 +3494,7 @@ static const struct qcom_nandc_props ipq8074_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.dev_cmd_reg_start = 0x7000,
+	.nandc_offset = 0x30000,
 };
 
 static const struct qcom_nandc_props sdx55_nandc_props = {
@@ -3498,7 +3502,8 @@ static const struct qcom_nandc_props sdx55_nandc_props = {
 	.is_bam = true,
 	.is_qpic = true,
 	.qpic_v2 = true,
-	.dev_cmd_reg_start = 0x7000,
+	.dev_cmd_reg_start = 0x0,
+	.nandc_offset = 0x30000,
 };
 
 /*
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
