Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FE0C7115C
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BJ5qHX1wLdc57bBUOhYHz+QHg7FZm9vJyMiEwgtvwCc=; b=jrRQETu6RlqyG4
	Z9R22ICGFWNlXfIWGJzZCOO71XWs20xSajSIOr+zJreZmxbPUUNgKGogcb5PtCREaQre0S4CzLB1y
	sS3tbiSb8OKPCLj09fYqgKjjybg7Eg5BX5CaXwVTdaDsuFZKXNJBa/dRIdHbVML9FLNOZTDupETlW
	OD845iSx7qSbCskgppORxvMeBqrnVGt1q3BKBFRqz1AeBX09sWT60/o18FwMmSiHwyncyZwFBqIbi
	Se0D9EocjkYrVEek2grm5MgzB5jWLUOQZKSkHBA54pnXApbA/Yg0wn8VDXZU9S8a/B8h4nhGyLGeL
	1bU3CLzvAzNHqYzoWY/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0op-009Y01-1o;
	Fri, 18 Aug 2023 14:51:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0oj-009XyT-1l
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:51:15 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37ICodLF029456;
	Fri, 18 Aug 2023 14:51:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=3cEdf1BA9mkJH1vSngadWzODUbmNb0BncU2g8daHDO4=;
 b=KiQIXldu01/G/cn2oKgO9LFffqI7LhD/DwkWy3M0wTW6bDcSfCfNCEzO//dfkMhtmqYf
 o79G3LjQi4a6VV4NwNR9UQhD3BwMnr3fg9mnUHqICNg04TDbhEJaDlDKgHp61cizZ5CJ
 waN1LxwPwLP+6RrQG1KiWwjFz9Qp6hRyPFdpFTRF+L2O031C2VyRBJOFPPYgvB92BgQ3
 Le27nO1be3G7Z7/F1ClIm778trfqCtFuai0926j64W1zVRedpU4YgB5KohemBXFdbua1
 rkqahylooBHwABZDLeVLJdBxFhEW1IW6m5W6OIFoLs3PY18eDZz3BOPBx2HPPpx+H81j 9w== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sj6320j30-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 14:51:08 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37IEp5ej000308;
	Fri, 18 Aug 2023 14:51:05 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3se35mqdxy-1;
	Fri, 18 Aug 2023 14:51:05 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37IEp4Qq000300;
	Fri, 18 Aug 2023 14:51:05 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 37IEp4UO032767;
	Fri, 18 Aug 2023 14:51:04 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id 1F0C31200077; Fri, 18 Aug 2023 20:21:04 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_mdalam@quicinc.com, quic_srichara@quicinc.com
Subject: [PATCH 2/3] mtd: rawnand: qcom: Clear buf_count and buf_start in raw read
Date: Fri, 18 Aug 2023 20:21:00 +0530
Message-Id: <20230818145101.23825-3-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230818145101.23825-1-quic_mdalam@quicinc.com>
References: <20230818145101.23825-1-quic_mdalam@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: XiZaebA4NENsixwCBFJIeIMP7-4RAVTQ
X-Proofpoint-ORIG-GUID: XiZaebA4NENsixwCBFJIeIMP7-4RAVTQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_18,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 mlxscore=0 priorityscore=1501
 mlxlogscore=882 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_075113_587564_97CC0B22 
X-CRM114-Status: GOOD (  13.88  )
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

Initialize buf_count and buf_start to 0 before starting the
raw read. If we will not initialize then read staus will get
updated with wrong value and we will see failure for even
successful raw read transaction.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 413e214c8e87..73dd1b4e4e31 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -1471,6 +1471,9 @@ qcom_nandc_read_cw_raw(struct mtd_info *mtd, struct nand_chip *chip,
 	int raw_cw = cw;
 
 	nand_read_page_op(chip, page, 0, NULL, 0);
+	nandc->buf_count = 0;
+	nandc->buf_start = 0;
+	clear_read_regs(nandc);
 	host->use_ecc = false;
 
 	if (nandc->props->qpic_v2)
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
