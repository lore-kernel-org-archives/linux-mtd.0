Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC3AEE7FF4
	for <linux-mtd@archiver.kernel.org>; Mon, 11 Sep 2023 13:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S6GbBiROgyAV3Ds7612fsKK5o1BIV0bon3nadJXjXF8=; b=gjto1rwpG6eLzZ
	aEoxyaMEz2bjEbn9bi2FGh7d4MoAL6TEZAzU8MjTo0JrDQVvroYfzGonfOxqdRl8udBqVcfEI1Oea
	hc8OEtlPsWXc6hLmEBlRp4AxqCliqgRA2ERsFKBPQYeYtM+B1MU09c3Gkvi49cUQGMsqq7UdNIaRM
	uqXkV2jY+LacDKFgO3FmPlDRnMv7OFyZx0jhTo1z4vP0THd9uvTGiVuEL8ZbiJnJhAxe3Pk33033X
	PZs+c+tOY60/wtUL/fqzwBcggzmmtJZtB+2gL2H7mPwA6NGRl3XzItFPbLQN6kk0y3PXglF3I3grV
	btOl6AI/TCgcSQoZnjUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qfh11-000c1K-0G;
	Mon, 11 Sep 2023 13:31:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qfh0x-000c0E-1r
	for linux-mtd@lists.infradead.org;
	Mon, 11 Sep 2023 13:31:45 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38BCV4ZU007447;
	Mon, 11 Sep 2023 13:31:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=O63r+J28cNbGOpiNq4cMLtaHF6nnRo/Cxol0qirBkXc=;
 b=a3kHObqdCk/G2NIJKJ/5fC8uOFdPV2Btib9SiES1K6DZFS+OXY4mkRN1wYxhLBjIzxap
 h8jj+FwswXZXUdopk1D29QaQDqfRPeIrxqKucE1PE7qhhFNwSji+NWnt6x4b6BHyR2yj
 CT/24JMaSBuiu23f6k8ueBVjIwWHwmv+9kgA5kJbqLN8wOdDAyyQuJ0ckooUkhlfDHmb
 Ss0kdCz794ZmbVOhwfioWEyMfm28/6QEWbhgF4UNTTYWu5zzxt34ke44YS5dMwDA3fFg
 azDGOq9C3e+yGNo0v4srDrOScT3JmJeqEsLdZZbMPdusUzZ4Nvuo9Z52xGkieG3K5Yoc gQ== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t22kp8523-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 13:31:31 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38BDVUDN005956
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Sep 2023 13:31:30 GMT
Received: from hyd-lablnx450.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 11 Sep 2023 06:31:24 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <mani@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charnte@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_pkondeti@quicinc.com>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Subject: [PATCH v2] mtd: nand: qcom: Fix the node for nand unmap resource
Date: Mon, 11 Sep 2023 19:00:26 +0530
Message-ID: <20230911133026.29868-1-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: osf6R_TXGXnkkWxYpRDvk0unVrq8VOXf
X-Proofpoint-ORIG-GUID: osf6R_TXGXnkkWxYpRDvk0unVrq8VOXf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-11_08,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 phishscore=0
 impostorscore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 lowpriorityscore=0 suspectscore=0 mlxlogscore=999 priorityscore=1501
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2308100000 definitions=main-2309110123
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230911_063143_741562_732F416F 
X-CRM114-Status: GOOD (  15.39  )
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

Fix addr argument to dma_unmap_resource() in the error path of probe.
The addr argument should be dma address instead of physical address.

Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
v2: Incorporated comments from Pavan/Mani.

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
