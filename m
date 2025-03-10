Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE92AC2BA1B
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Mar 2025 12:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfZw9qGBYBnveZD3Q/9V1XVJc8CwuoOMYU5hAu6WrDs=; b=Rtf6mfZSpK1e1U
	x5mzBaW4dzhkT4QKFVZEHS076arKuuGiK9lsS66F3ZCPfvqqdlL4UouePYcCfIEFFHd73BODOmIXx
	8ek/NMiHRiWxNOTCE/WolHuytram9VET4BIuS2SGyc3eMAsavT+FFN+rPUC/qi0qe/YwMdG+ELQu1
	/wL/qpakehvSAdmP0zH1zrGQ9aDVSSRuX7uDc8NVxILxAIRAprjuhP2O8iN8RdJKjMokR23I+bAx8
	pNFeUNBIrqon/QzIS/4dK/MX0nLHHRzDd505yb7qG9zUDnk5nurPPikc98rPiKLz8/OYxOvcbmqyR
	8FdMTDnQHdESyfbvrMVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trc5i-00000002Zs9-02y2;
	Mon, 10 Mar 2025 12:18:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trbx1-00000002XpG-346i
	for linux-mtd@lists.infradead.org;
	Mon, 10 Mar 2025 12:09:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52A9ujwq024744;
	Mon, 10 Mar 2025 12:09:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zrTnM0Fve5fUTlJHvpQwbTFY+eg/oU2A5W1AzhdIjpw=; b=Qi0f11iaA0UGtZkN
	6N/bz2oZGnbvjvIYEm670iXYSM22zjRNUT6EcdY7xBaVVM9/8f6yIpUNcE3zR3sL
	jULrzsPeN51ELMrCrK4sMb6t2jNQ8+q3BV9wor7YYz/DhaFx50jkUiPcWx9A8y8F
	qPKwtFdS21s+jcElByTVmIlcxkd3bq/BED1W2gqsFn2UEi+TYGhuJ0+8zLS34CtT
	tyBRnLQFgDVYX+NyKRykSDHe3NjpHjrXQIftEOXZVu0U0XwQ8zAciy47XrdQcY7I
	iybkv5L5QZlKBfEgMOI+464TpZJu8sdbp5Gsw/fb9Wj1IgtT9yVrozQHwRuYcd4u
	Ie88Tg==
Received: from nasanppmta01.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 458f2mcqxf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:09:37 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52AC9b0B024931
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Mar 2025 12:09:37 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Mar 2025 05:09:34 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <manivannan.sadhasivam@linaro.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>, <broonie@kernel.org>,
        <bbrezillon@kernel.org>, <linux-mtd@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-spi@vger.kernel.org>
Subject: [PATCH v3 4/4] spi: spi-qpic-snand: set nandc_offset for ipq9574
Date: Mon, 10 Mar 2025 17:39:06 +0530
Message-ID: <20250310120906.1577292-5-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
References: <20250310120906.1577292-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gLsQJTIzA5iegtj2Gj6I81OeBN4tKBcR
X-Proofpoint-ORIG-GUID: gLsQJTIzA5iegtj2Gj6I81OeBN4tKBcR
X-Authority-Analysis: v=2.4 cv=ab+bnQot c=1 sm=1 tr=0 ts=67ced681 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=PIZUERMwkWLMlXSLb_cA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-10_05,2025-03-07_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 mlxlogscore=999 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503100096
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_050943_773272_95F1437F 
X-CRM114-Status: GOOD (  11.61  )
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

The BAM block expects NAND register addresses to be computed based on
the NAND register offset from QPIC base. This value is 0x30000 for
ipq9574. Update the 'nandc_offset' value in the qcom_nandc_props
appropriately.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v3]

* Added nand_offset for proper address calculation
  for newer Socs

Change in [v2]

* This patch was not part of v2

Change in [v1]

* This patch was not part of v1

 drivers/spi/spi-qpic-snand.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/spi/spi-qpic-snand.c b/drivers/spi/spi-qpic-snand.c
index 8c413a6a5152..85a742e21cf9 100644
--- a/drivers/spi/spi-qpic-snand.c
+++ b/drivers/spi/spi-qpic-snand.c
@@ -1604,6 +1604,7 @@ static void qcom_spi_remove(struct platform_device *pdev)
 static const struct qcom_nandc_props ipq9574_snandc_props = {
 	.dev_cmd_reg_start = 0x7000,
 	.supports_bam = true,
+	.nandc_offset = 0x30000,
 };
 
 static const struct of_device_id qcom_snandc_of_match[] = {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
