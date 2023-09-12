Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C879CA0ECA
	for <linux-mtd@archiver.kernel.org>; Tue, 12 Sep 2023 10:19:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Xpp0kP4L3XlNfq9nOOiusjL0Ka6CNfeEBvravm98Cnw=; b=gGlvbore1x/DD8
	xes/vZ0kO/as2PfClEFRJViY0pcRcMiMudP95ZVuDVXc2awAtXEY8CrYG3Oa5HzhDq/GJG+J0T04q
	kiFpnkc3xLchLYlgHcWnSqfF3/4+EQE3cd0cf71lJBa6hXl43SDz2U5Xm3uECf3tR/TaqZwz1biSf
	EhAVozD7LOSD7fmP/Tb7Zobg32pEbH7dzAjs7mHQx+f14PuTs/0EWXJ+hpACCCwRiPzzXcaaVstGZ
	ut44zHM8cwFn/L2/DIcWIZrkX+iCMZn1iW753w1n47K+IYuzB8j0VvKozbvYa9hToYL5KfG37OtXD
	MNCypvTANYbIOErasPjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0UA-002wgd-1K;
	Tue, 12 Sep 2023 10:19:10 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qg0U5-002wei-2J
	for linux-mtd@lists.infradead.org;
	Tue, 12 Sep 2023 10:19:09 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38C6Nr0J003422;
	Tue, 12 Sep 2023 10:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=KwMsafzv2/ww22a5ZtZVea4KGSTzvTtFjtAmf8FNFHA=;
 b=MGtoudqr2HnB7oYx1aHbaiURfOeUA+fyOy4OVpbRvAQuZG8g6oUWFH9W1r21Xy8TGWUR
 sFOKW6Dp7jieOXy+dZmxrXdfmkOwG6dQQsUr2VdG6wgLgIpj1D0sGaKzrj7q5rADWMGu
 REV4w4SlsnsLKHQh3PuU6VoY78DQjJJGbJsjKfNSa90vr6UlgLYTPi1PXZSXADz+vvvB
 yXDcM0xWH/jNUVkTS7FslN58nENwN61eTygOlZ+tW9OxjVISLt47VqecapoHeTizmcN6
 st5xB9SyFq5j3ikzsbcG27NwECVEjqiGO82kAfO1AbZsuvckkV6LrY5vMB1ua8MVYTYo qA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2c4c13s7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 10:18:58 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38CAIvxp017838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Sep 2023 10:18:57 GMT
Received: from hyd-lablnx450.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Tue, 12 Sep 2023 03:18:50 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <mani@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_pkondeti@quicinc.com>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Subject: [PATCH v3] mtd: rawnand: qcom: unmap dma address during probe failure
Date: Tue, 12 Sep 2023 15:48:14 +0530
Message-ID: <20230912101814.7748-1-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 0AINW3rV-Pxeyj1GY22MGfOhVn2BTYd8
X-Proofpoint-ORIG-GUID: 0AINW3rV-Pxeyj1GY22MGfOhVn2BTYd8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_07,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0 mlxscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 spamscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309120087
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_031905_868937_792EB0CC 
X-CRM114-Status: GOOD (  16.89  )
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

Fix address argument of nand controller currently being
passed to dma_unmap_resource() in probe error path.
This address argument should be the dma address returned by
dma_map_resource() instead of the physical address of nand controller.

Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
v3: Incorporated comments from Miquel
    - Modified the commit message and title as per suggestions.

v2: Incorporated comments from Pavan/Mani.
    https://lore.kernel.org/all/20230911133026.29868-1-quic_bibekkum@quicinc.com/

v1: https://lore.kernel.org/all/20230907092854.11408-1-quic_bibekkum@quicinc.com/

 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 64499c1b3603..b079605c84d3 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3444,7 +3444,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 err_aon_clk:
 	clk_disable_unprepare(nandc->core_clk);
 err_core_clk:
-	dma_unmap_resource(dev, res->start, resource_size(res),
+	dma_unmap_resource(dev, nandc->base_dma, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
 	return ret;
 }
--
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
