Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DF7DC61DA4
	for <linux-mtd@archiver.kernel.org>; Mon,  6 Mar 2023 14:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=C+OqHioDSSpsxFRD1LCuRhWtWxGbZGkWj3wEmPbDaKk=; b=b7i1qaJb+gqrBb
	pbGtmXcpuUFU1duxLDajEabqNrt4i6cuhbS+//dTbiATIRXWiMTAOBKrgDbu/+AqW9mFt2sraJ7ts
	5pc3lQltMq6UiO6XUoMQoXwYI27HGs7vcF/iHutfUTI/EW0FBJ60eA/HM8tlcVcty9wtFN73dFa6n
	qbnoMhiC6ln55aldLmALGA4UYVk4pb1NhAg8UjwYOis4o+r78Hw7A5NXmN0kYQLHxRuOndwVvslTh
	BUroAFXiHWVzyI9e1rzqy2eXMymbqFO/WAyP2R+0F/ggnRqKr7ANUGcFJ4q61omOQYSH8Ry6IUEa4
	1Ih78/UUa69eF+16WzHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZCCb-00DRY8-Re; Mon, 06 Mar 2023 14:52:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZC2H-00DMUF-LT
	for linux-mtd@lists.infradead.org; Mon, 06 Mar 2023 14:41:59 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 326Dgfil005007;
	Mon, 6 Mar 2023 14:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=/2QNenuQo6MbSF7cRXmwd59aJmgafR20m5SsTmAQTOU=;
 b=Nk34kNHI75clCX0DD2icUXU5HDxodW80So7KgJibghJSbWxHN3WzTX2+NQKdOGTZ7avl
 FV2M50DYYZAeBBUtlan5ZeMDQrTmD9CPnRMTaePbKpbEQd1sDnJK3atbODzFM4ntjXqx
 64TE0PCsybNj3/JlXAqojxf8jhhCM/34VddaW8Uw8KcfKXfgm0euEeYvc7XXOcxnrrCM
 xopl4pgLphfKSISmEgOXgua0eEMgehjLZ9Ei592PtL6ycx5A+fYD/MMROyzFnUF8KS8K
 24XCqaHTCr4XwczbxlwwRFXCrsGX6TA42dU4zGRPwi92YDXlUGS9WsEaMuLjopnmM9nf IA== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3p418751mm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Mar 2023 14:41:50 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 326EfjpM011970;
	Mon, 6 Mar 2023 14:41:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3p4fft5hsq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 06 Mar 2023 14:41:45 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 326EfjQE011965;
	Mon, 6 Mar 2023 14:41:45 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 326EfiSw011964;
	Mon, 06 Mar 2023 14:41:45 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id D735412010CA; Mon,  6 Mar 2023 20:11:43 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, mani@kernel.org
Cc: quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com, Md Sadre Alam <quic_mdalam@quicinc.com>
Subject: [PATCH 1/5] mtd: nand: raw: qcom_nandc: Use devm_platform_get_and_ioremap_resource()
Date: Mon,  6 Mar 2023 20:11:41 +0530
Message-Id: <20230306144141.15360-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ag-00pLbdU9YvMST_nueD7Ca12fmZqS_
X-Proofpoint-ORIG-GUID: ag-00pLbdU9YvMST_nueD7Ca12fmZqS_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_08,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 adultscore=0
 priorityscore=1501 mlxscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=821 bulkscore=0 suspectscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2303060129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230306_064157_761000_6C10EC81 
X-CRM114-Status: GOOD (  13.35  )
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

Convert platform_get_resource(), devm_ioremap_resource() to a single
call to devm_platform_get_and_ioremap_resource(), as this is exactly
what this function does.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 198a44794d2d..5cc1cbc9517d 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -3269,8 +3269,7 @@ static int qcom_nandc_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	nandc->base = devm_ioremap_resource(dev, res);
+	nandc->base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
 	if (IS_ERR(nandc->base))
 		return PTR_ERR(nandc->base);
 
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
