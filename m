Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CB0DCA5501
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Sep 2023 07:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tLZ5geSvijA+R5JiZTK4d6kgvRqrGxAyN6+YjRUB/I8=; b=S8RbAlNMDxfoIa
	AFWkTSWS6KAyYWcM76uJE7X3nMOCArE1k4UNmeTl0nflc8ZRLgYnZt3ps0VVned+L+uygv2ovOUS4
	n3uMszGa8k7Z5HXM+zhAzqgUI2S+ACoj8NcP38M0IxL+63cJ+Ad/RwzOW2v7c4HYw9h0y4RPpLsMU
	u9GRCq6n+leWeO3LOSqxerrahXnnDyCzi1HVEmSxsUYhvxF5Ow4ZXR6KduXTtK1kWNkZtWOMyPe0l
	T0BMgrWGoFCPL81MsVyphPJ1k0Q27/vQE/EY1+3mAjJ0iQIxEi9aICU5EpL8pSqENQmAbxHVx6rq1
	bYHbhP8Rjlc49qRIWUAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJyU-004tUH-2X;
	Wed, 13 Sep 2023 07:07:46 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgJyR-004tTH-1X
	for linux-mtd@lists.infradead.org;
	Wed, 13 Sep 2023 07:07:45 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38D6LeuN032357;
	Wed, 13 Sep 2023 07:07:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=AtULoQJOI/orWb1R9vpylxnI/QhZ91XnJHJFIIByYuE=;
 b=fL5qOsInEerQdiU2GacN+7eTN0KXwNz4W65JK9GU9nEK/3tn/ilKxR8K4lYwKJzCzQuA
 SsDtsHvm2whcULY5wyPQYeArhuXl+FpgGMxWZpteJJkG6gRkP8FuWd+Rjuc82619q527
 0c2OuApoRfMB4cJrVcd79CLhXsm9/+3H+Ut1zEwW3HlTmLFmSkPfkZW470MP1qY4slbE
 SliJeGKokGbZyjOHSTyucCR5L5GpnwaPa+Tl/mVDT3HxT5VElcgONDEMwSSGiJB3awIN
 YrnsLnjiMniaDzbG1hiIId+lZE5fjA08VGDXVNIiREHgk9JH6Y0jgKrZnwTN+r+rsGJo KA== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3t2y8jrxa0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 07:07:31 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38D77Ufj022743
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 13 Sep 2023 07:07:30 GMT
Received: from hyd-lablnx450.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 13 Sep 2023 00:07:23 -0700
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <mani@kernel.org>, <miquel.raynal@bootlin.com>, <richard@nod.at>,
        <vigneshr@ti.com>
CC: <linux-mtd@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <kernel@quicinc.com>,
        <quic_charante@quicinc.com>, <quic_kaushalk@quicinc.com>,
        <quic_pkondeti@quicinc.com>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>,
        <stable@vger.kernel.org>
Subject: [PATCH v5] mtd: rawnand: qcom: Unmap the right resource upon probe failure
Date: Wed, 13 Sep 2023 12:37:02 +0530
Message-ID: <20230913070702.12707-1-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: oiAv9tXSZ13X51HGY9mUgpjxhZ53p84x
X-Proofpoint-GUID: oiAv9tXSZ13X51HGY9mUgpjxhZ53p84x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-12_24,2023-09-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 mlxlogscore=999 malwarescore=0
 priorityscore=1501 clxscore=1011 mlxscore=0 suspectscore=0
 lowpriorityscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2308100000 definitions=main-2309130059
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230913_000743_653286_21D6C86D 
X-CRM114-Status: GOOD (  16.58  )
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

We currently provide the physical address of the DMA region
rather than the output of dma_map_resource() which is obviously wrong.

Fixes: 7330fc505af4 ("mtd: rawnand: qcom: stop using phys_to_dma()")
Cc: stable@vger.kernel.org
Reviewed-by: Manivannan Sadhasivam <mani@kernel.org>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
v5: Incorporated suggestions from Miquel/Mani
    - Added tag to automatically include this patch in stable tree.

v4: Incorporated suggestion from Miquel
    - Modified title and commit description.
    https://lore.kernel.org/all/20230912115903.1007-1-quic_bibekkum@quicinc.com/

v3: Incorporated comments from Miquel
    - Modified the commit message and title as per suggestions.
    https://lore.kernel.org/all/20230912101814.7748-1-quic_bibekkum@quicinc.com/

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
