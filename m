Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90627C28B2E
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Mar 2025 12:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HiiKOEfR+wyR//3NkbtUifofzdqm/V+vIeilIizZq2g=; b=RkLVwI/2d2d8nM
	3EJ+UUcHrd2snJf5vgs7v6jnNRl+EutXlyjAOHBsYFWZzlZEDfitBBOUuNwSQZHO6Q0J1Sm9d+UIh
	kMTBFpQvpCAxY9YUNIvsJQxUwl+lD2LzZR4ABI1IZZOc/Ip8oWFp5sXyoZeS/ekk8PDW+jGtP+2rj
	nDb0WPTW+2Ph7ORep+DW5VgwkauoUscAVeFtmLqYwLEO7aEBJ05lsXHGPPWjyt1dIytQCW60r9EzT
	YlawQTtNNwx8u+WWcWmv2gWZp0Igz2PkGFzRwBcv1ITnrcdNBZuqKlNz39k47Qd3sPQ/1cWsXx8z2
	HQYH6hiTwLwjywIqsC8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trc5h-00000002Zrt-22Bn;
	Mon, 10 Mar 2025 12:18:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trbwx-00000002Xoa-250W
	for linux-mtd@lists.infradead.org;
	Mon, 10 Mar 2025 12:09:41 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A8m2Lv027354;
	Mon, 10 Mar 2025 12:09:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AQsRj/kwofHWJ1I76e2nIYWsi5tjCpN7F23mCnzpC+o=; b=NIDzwFN/Fq7qkp0X
	XTiJ2NffxqAj0HNykef7OEkNRSpV+2TTQgftX2PPRijU0GsOl4dDvFyA1GYv/vsN
	VUMiVtKGGITXyTAoiploEgn8QP43TE7t2PAZc2dH5qOng4a11/eC92vZ9I8NuQ34
	oF3ZozaZJwx0OdAars37uMFG5fXEDiOXhtrmc41aX8qnj2EsSOCdLmHsw7kDI+DN
	dZlT87NWDKk+EC6xHVGuQoJhIi/19mf7dfFIT4myBbVQ/cTLN9x17fFrSZQmnOl2
	CcctT5bM1cIUEr4lFb4xLzHJTxsjKK7dcIFHc73MG5qOppDy5VsBOWmrBZTnWnM8
	9swylQ==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f6actd5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:09:34 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52AC9X9F024847
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:09:33 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 05:09:30 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v3 3/4] mtd: rawnand: qcom: Fix read len for onfi param page
Date: Mon, 10 Mar 2025 17:39:05 +0530
Message-ID: <20250310120906.1577292-4-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=WsDRMcfv c=1 sm=1 tr=0 ts=67ced67e cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=09C-ZdBHwT7nDx1AlKIA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2V41MEVTYQtpzWjR6JkvwGBKFk28rHiG
X-Proofpoint-ORIG-GUID: 2V41MEVTYQtpzWjR6JkvwGBKFk28rHiG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 mlxscore=0 mlxlogscore=999 clxscore=1015
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_050939_546007_EB2C0848 
X-CRM114-Status: GOOD (  12.62  )
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

The minimum size to fetch the data from device to QPIC buffer
is 512-bytes. If size is less than 512-bytes the data will not be
protected by ECC as per QPIC standard. So while reading onfi parameter
page from NAND device set nandc->buf_count = 512.

Cc: stable@vger.kernel.org
Fixes: 89550beb098e ("mtd: rawnand: qcom: Implement exec_op()")
Tested-by: Lakshmi Sowjanya D <quic_laksd@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v3]

* No change

Change in [v2]

* Set buf_count to 512 in the parameter page read

Change in [v1]

 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d41c0e3926ed..c3fdafb7e9eb 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1930,7 +1930,7 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 		qcom_write_reg_dma(nandc, &nandc->regs->cmd1, NAND_DEV_CMD1, 1, NAND_BAM_NEXT_SGL);
 	}
 
-	nandc->buf_count = len;
+	nandc->buf_count = 512;
 	memset(nandc->data_buffer, 0xff, nandc->buf_count);
 
 	config_nand_single_cw_page_read(chip, false, 0);
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
