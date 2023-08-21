Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F6EEE4996
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Aug 2023 05:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CnsxcAC0DutAgNnGdf/qYuVnbiXUNlVHqKyk2X16+1o=; b=11bArkx4p+b+6w
	Wiw1BbXiCRQP0R+bDf31d55nO+pguxdnlITzQtrhP5AEDe8VCL6Munt1RkikPFKjfgqGOMDXhZfXN
	xYCJGa/WSYWGqKl8UfhCl7jH3eH/Szp2hCqpVVhpenpXYAniORdz5rHd1N2hwc7hxtIH2ME/ASZlw
	H2tKIf/q/2xqH7LmA1wA4Q8Slewe+/OvAG74Bbns6PNwx5DCb8j5TRJp0PDKuCH3CsRPUpCjJ2Bef
	lG7NRRU93RmsPY97w7ALS1dbX5qmp9p3fqM+2SQOM5HxiSY4/ZBM7B3RrniRfzhunLrFEAuZEn/yr
	IWHCBabMgZ3rrvLbnpbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qXxZb-00DAtN-1q;
	Mon, 21 Aug 2023 05:35:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qXxZZ-00DAsh-1G
	for linux-mtd@lists.infradead.org;
	Mon, 21 Aug 2023 05:35:30 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37L500XT015608;
	Mon, 21 Aug 2023 05:35:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=vZqBlmH2wGR+UOS/VlA3481JwpGSHATnLCf/CSV0MrY=;
 b=YyZiPZ/KhESrdVk0qjt8gG/bzdbaHkcA2VovSgES5OTKwmbm69pk1lGpINn0hu0UIy+c
 O6HhWEGsEAnLLF+eRP3S9H9Y7YW1rS5oPF2UIK0FVRYp+O0nw8F2ddQvb7vGaW1Xts3i
 I7sprQtqxR1VSRvSWertw5at/kYxS7KQpK+JK8TMFwvFmKT9nMH12FG2wfx+q67GJHzV
 5CLn4brG1jsTyfe86jHXEjrOB1Lakh+RpsalTpbeCP+7sMOS/HXn3qHl6BfghiB+/Cxt
 TD5U2cP2XwyXkzanS0TU/xlD0KmF2M8pbyc0Z63DS6Gjs2r/OkeiVCj+mcIR2oDUdLR5 EQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sjnu12q0k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Aug 2023 05:35:21 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37L5ZIVt019528;
	Mon, 21 Aug 2023 05:35:18 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3sjptkewpd-1;
	Mon, 21 Aug 2023 05:35:18 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37L5ZIVl019523;
	Mon, 21 Aug 2023 05:35:18 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 37L5ZHNO019521;
	Mon, 21 Aug 2023 05:35:18 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id E232A12010C6; Mon, 21 Aug 2023 11:05:16 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_mdalam@quicinc.com, quic_srichara@quicinc.com
Subject: [PATCH] mtd: rawnand: qcom: Fix build issue
Date: Mon, 21 Aug 2023 11:05:13 +0530
Message-Id: <20230821053513.13728-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Tn_DHjJjhkmqpd2QvulhN1VearquCJa6
X-Proofpoint-GUID: Tn_DHjJjhkmqpd2QvulhN1VearquCJa6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-20_15,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=795 suspectscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0
 priorityscore=1501 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2308210051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230820_223529_564264_2D10C1CC 
X-CRM114-Status: GOOD (  13.75  )
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

Fix the build issue, after removing unused variable nandc
in qcom_parse_instructions() function.

Fixes: 0bb2bd18efe8 ("mtd: rawnand: qcom: Add read/read_start ops in exec_op path")
Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index 370a779610e2..6aff45f32260 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2593,7 +2593,6 @@ static int qcom_parse_instructions(struct nand_chip *chip,
 				    const struct nand_subop *subop,
 				    struct qcom_op *q_op)
 {
-	struct qcom_nand_controller *nandc = get_qcom_nand_controller(chip);
 	const struct nand_op_instr *instr = NULL;
 	unsigned int op_id;
 	int i, ret;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
