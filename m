Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF362C369A8
	for <linux-mtd@archiver.kernel.org>; Thu, 10 Apr 2025 11:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NLzKdkcrZGPGguHkF4CjNBcJmAkB9jVPhMIAwNMacJM=; b=Oh31X3DNfOcGv0
	R/euvZIqAbjNt4RyAgpx5LX4hWJM4Pa5vHRFoc5lECjKNU8H17xBcjmMrIyRc8a1+/B2mOGFesbgS
	NkpkE1HWPfI7eWV7JBZZ3gITKj3+DPKTpI2rgZvCnUseERlTtLCmDY30P58scgg4oz6aC2qpUzvMQ
	9HF7bS44PWPsTBr3XNG+q7T59vJIQESuHD8FrmFBuCR3BnbF00iuA/Ep8u7rgoWRKVJ31UgOZX/F4
	banFrJN3UfdiS+gwxzlCZW5tHevQJHLJmLcumgRD05My4a9HDjjYCBbg/i/BYXoDSRmpPgEjWnXuN
	RMz4z4MgGU9sNFHzxOkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pvQ-0000000AFJa-43Jn;
	Thu, 10 Apr 2025 11:18:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ois-0000000A1b1-1q62
	for linux-mtd@lists.infradead.org;
	Thu, 10 Apr 2025 10:01:27 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53A75phu014128;
	Thu, 10 Apr 2025 10:00:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2VzEiYKLuTYoxrE/1SYBBmjOa2eW5ZrUtYjIkqtV5tg=; b=F4OG3agzIT0I7IYj
	RI80JOfa7tEOKuvNWkFWCc4AMzsx6/ZKtYc/m1v+8YmsSXg37jqpLYPcVz9QUhnu
	e+hskc0kutOOy5ryAwzPsvaEyHjoEYUXOnyP8RZrTYAJzHuppHClSyE9CYeBlLpM
	TyudUmOwo41XJlarNTc6yymT23evjIuWEd2SkoP1Ug43AycmFIE46zom2b0DhENo
	POGFjp0KtZ+yTKK+fDtUa3pOEwIOgcd2ZqGFzcPiNrod3WWQn0HZ9DbMqRNiGm/t
	+uY1CrdmK30f0KE1nzmjvgkoNsRf/Wfn3RXMH4x11oe2okHiyo15koZcZwqeWDSg
	t2k9oA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twbeej9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 10:00:48 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53AA0mlx019497
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 10 Apr 2025 10:00:48 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 10 Apr 2025 03:00:44 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <broonie@kernel.org>,
        <absahu@codeaurora.org>, <bbrezillon@kernel.org>,
        <architt@codeaurora.org>, <quic_srichara@quicinc.com>,
        <quic_mdalam@quicinc.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v4 2/3] mtd: rawnand: qcom: Fix last codeword read in qcom_param_page_type_exec()
Date: Thu, 10 Apr 2025 15:30:18 +0530
Message-ID: <20250410100019.2872271-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
References: <20250410100019.2872271-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: POXgbt_7y9zdFjgDL_X9OONDnpMqTucS
X-Authority-Analysis: v=2.4 cv=T7OMT+KQ c=1 sm=1 tr=0 ts=67f796d0 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=OhSYzIeDMC8V1oLpjEAA:9
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: POXgbt_7y9zdFjgDL_X9OONDnpMqTucS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-10_01,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=999 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1011 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_030126_493174_E7662F6E 
X-CRM114-Status: GOOD (  15.72  )
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

For QPIC V2 onwards there is a separate register to read
last code word "QPIC_NAND_READ_LOCATION_LAST_CW_n".

qcom_param_page_type_exec() is used to read only one code word
If it configures the number of code words to 1 in QPIC_NAND_DEV0_CFG0
register then QPIC controller thinks its reading the last code word,
since we are having separate register to read the last code word,
we have to configure "QPIC_NAND_READ_LOCATION_LAST_CW_n" register
to fetch data from QPIC buffer to system memory.

Without this change page read was failing with timeout error

/ # hexdump -C /dev/mtd1
[  129.206113] qcom-nandc 1cc8000.nand-controller: failure to read page/oob
hexdump: /dev/mtd1: Connection timed out

This issue only seen on SDX targets since SDX target used QPICv2. But
same working on IPQ targets since IPQ used QPICv1.

Cc: stable@vger.kernel.org
Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v4]

* No Change
 
Change in [v3]

* Updated commit header and message

* Added condition check for location register
  and location_last register based on qpic_version2

* Added Reviewed-by tag

Change in [v2]

* Updated commit message

* Added stable kernel tag

* Replaced the buf_count value of 512 with the len in bytes.

Change in [v1]

* Resolved the issue with reading a single code word in the parameter
  page read

 drivers/mtd/nand/raw/qcom_nandc.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index ef2dd158ca34..a73bb154353f 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1863,7 +1863,12 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id = 0;
 	unsigned int len = 0;
-	int ret;
+	int ret, reg_base;
+
+	reg_base = NAND_READ_LOCATION_0;
+
+	if (nandc->props->qpic_version2)
+		reg_base = NAND_READ_LOCATION_LAST_CW_0;
 
 	ret = qcom_parse_instructions(chip, subop, &q_op);
 	if (ret)
@@ -1915,7 +1920,10 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	op_id = q_op.data_instr_idx;
 	len = nand_subop_get_data_len(subop, op_id);
 
-	nandc_set_read_loc(chip, 0, 0, 0, len, 1);
+	if (nandc->props->qpic_version2)
+		nandc_set_read_loc_last(chip, reg_base, 0, len, 1);
+	else
+		nandc_set_read_loc_first(chip, reg_base, 0, len, 1);
 
 	if (!nandc->props->qpic_version2) {
 		qcom_write_reg_dma(nandc, &nandc->regs->vld, NAND_DEV_CMD_VLD, 1, 0);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
