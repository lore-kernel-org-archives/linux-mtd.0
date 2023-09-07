Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9873DEE14D0
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Sep 2023 09:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TIws9rt+STOp/yBEvY5h8m5c9kTyU6bOJGFj5qxUY4A=; b=xk4IkWHLfvcmuE
	D11Y8J9RZ7Sk9uMUpm50SBkiAjWdsVobJvJNSeYTLlpJzK/5JE0NjJN12r1hfK3fYWRoJfNaB9jtr
	NoA50+EPW/z/5Pm4kF+Whe07Qe03TPMTvidG6/j5Vva5bqtCbGwbYl7s6PLD5yc2s0M2c8KLPPhg3
	NugMEaLqsL39h4d1k/9o6xNqCb9Q/o1hqKW4vNipjZmiFWcwAgAQ85oHSfx2Nj7SBV3ocUCBSjZSA
	VGVNyB5zzgq0gT5IJqJfWX+WSJyVeRYsfGJmq0UUIK3WY41rC8afe9M9EkNtLvi3/4Fn2u7UNOztD
	7t9TeDYEebS2SU4hX3MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBL9-00Bgbb-0Z;
	Thu, 07 Sep 2023 09:30:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeBL6-00Bgb7-1L
	for linux-mtd@lists.infradead.org;
	Thu, 07 Sep 2023 09:30:17 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3877vFIA025118;
	Thu, 7 Sep 2023 09:30:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=QrXJz4dJUffrNRYdAEDIG6I7uPRmEn2DD6U7u8sQw3Y=;
 b=TaljCKOETUsJTUT8JjtzUvAIBVCtn6ukEZL6p6pTKnJ951pmi94A/4QZFhinCoP9fwAG
 6O4TcKYIUJF6nZsjWFpzBFptEKFPjH+6YERL8qXDMimzXonQHt6kBqRR1RG70vpIPC0t
 YmSEDBqWDF4WMiIbrk0pw+DKVNif2rBGRn8vOVA6zjYtAsvOoVC2FyBE0XLjKsgtAiy+
 RrmPZshFLmKxRw/OiCslpes+1CYXjn3JE/U0eTvqLkSaPRqOM1PBVYV2ZrT9gamom8uP
 8e33N3YaeqIdPzMnCC816eOO2FLrbrfkigJcKDiXSI/cqexN30JXdT7meQZoFCisK2q0 Vg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sy4bqgwpq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 07 Sep 2023 09:30:03 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3879U2OT000540
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 7 Sep 2023 09:30:02 GMT
Received: from hyd-lablnx450.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Thu, 7 Sep 2023 02:29:56 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <mani@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>,
        Bibek Kumar Patro
	<quic_bibekkum@quicinc.com>
Subject: [PATCH] mtd: nand: qcom: Fix the node for nand unmap resource
Date: Thu, 7 Sep 2023 14:58:54 +0530
Message-ID: <20230907092854.11408-1-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4Yjc-YFMK1Ei4hh2M2tQ6aWzZMEBs6LC
X-Proofpoint-ORIG-GUID: 4Yjc-YFMK1Ei4hh2M2tQ6aWzZMEBs6LC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-07_01,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 suspectscore=0
 phishscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309070083
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_023016_468288_5FE31570 
X-CRM114-Status: GOOD (  17.16  )
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

While unmapping the nand resource in case of err_core_clk
the dev node being passed is res_start instead of nand->dma_base
(where the iova returned from map operation is stored) causing
failure in unmap operation. Hence modifying the unmap operation
to pass the nand->base_dma instead of res_start.

Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index f583022755a2..e085a0f588eb 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3322,7 +3322,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 err_aon_clk:
 	clk_disable_unprepare(nandc->core_clk);
 err_core_clk:
-	dma_unmap_resource(dev, res->start, resource_size(res),
+	dma_unmap_resource(dev, nandc->base_dma, resource_size(res),
 			   DMA_BIDIRECTIONAL, 0);
 	dev_err(&pdev->dev, "DEBUG: probe failed for nandc module\n");
 	return ret;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
