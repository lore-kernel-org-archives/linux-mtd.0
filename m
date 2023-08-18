Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E02C0C71159
	for <linux-mtd@archiver.kernel.org>; Fri, 18 Aug 2023 14:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BhbM3MAs/9zFXMQFcpJdNTwd1mrYu6g1kN6oTtV8IhE=; b=hqbVe2gjJMGlnK
	6P07B8QKq3NYyMA3fJbuID7t2niTpptVpGVctG2L8K3L/I+e1vAvDPDot/rGDcwl8LyXvmrL9eLHA
	5A2Mk1IrGFjlGaa500tIhBuTjH1SVZ1gFnuqqHZFVMwqCvubjIE43vXG5lN5No2KEszwYLWXjKf0X
	RTQPtVTHkxYBMTnJ050lwmcWEtT8KJeBRO8Y8HcWsZ/VOECi9EptsW1a7hm25ZnGvqAHhuJorPg4g
	3Mk3myyj9fp+5DRS7UWfG8H86zp+G2ZY3T8vF42Ax1/5/2YX9kcqkiXijOSDUTlI7bxVOEN/d8ZCD
	QbCfCq0o/EHcFHfi+92Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0on-009Xzb-0l;
	Fri, 18 Aug 2023 14:51:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qX0oj-009XyQ-1M
	for linux-mtd@lists.infradead.org;
	Fri, 18 Aug 2023 14:51:14 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37IEKQVm007391;
	Fri, 18 Aug 2023 14:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=qcppdkim1;
 bh=q2D9GIaAAlCUQ4JULRnkcFFCMLwT+SEPQZvPIfxDzcI=;
 b=VpO0cMA3y5fXdCmrMssz30apR+7lRSWJxzBIYtcSzrPte0Gu5PxRAAXEs5zN1qsrGvwu
 DbFRj5KqezgS24oltvok9EEoBJLYDfcybwXI+qwALmHWjzgCxJw3l8rEq6OT2bY2WW9a
 p8tSu630hp93YACjGMI0abi7c2dSDTzdIoQR7+PuvbcEz7rK4FJLH1o9bOBNKQNP89eA
 arxc2O196lUZCmmjz1oqse7WhE1gEWYspaZLChjh9wlUDQIYZZHN9xXSlS4IFm2FKutb
 0og5bZObcrVt04FEs9Gr6A4Ngp88DliEIU+KfAByMEVj9Y0tjYkCflnKkauCzxePH33P Tg== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3sj92qg719-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 18 Aug 2023 14:51:07 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 37IEp4Ol032759;
	Fri, 18 Aug 2023 14:51:04 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 3se35mqdxt-1;
	Fri, 18 Aug 2023 14:51:04 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 37IEp4wV032752;
	Fri, 18 Aug 2023 14:51:04 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 37IEp42t032747;
	Fri, 18 Aug 2023 14:51:04 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id 55F0512010CE; Fri, 18 Aug 2023 20:21:03 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_mdalam@quicinc.com, quic_srichara@quicinc.com
Subject: [PATCH 1/3] mtd: rawnand: qcom: Update read_loc size to 512
Date: Fri, 18 Aug 2023 20:20:59 +0530
Message-Id: <20230818145101.23825-2-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230818145101.23825-1-quic_mdalam@quicinc.com>
References: <20230818145101.23825-1-quic_mdalam@quicinc.com>
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: tztXp1AfNqywYSYYM1Q5xYpOcGcfxWbF
X-Proofpoint-ORIG-GUID: tztXp1AfNqywYSYYM1Q5xYpOcGcfxWbF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-18_18,2023-08-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0
 clxscore=1015 mlxlogscore=999 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2306200000 definitions=main-2308180135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230818_075113_466186_E031EFAE 
X-CRM114-Status: GOOD (  13.47  )
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

For parameter page read upper layer is passing len
as 256 bytes and if we try to configure 256 bytes
size in read loaction register then subsequent bam
transaction is getting timed out for 4K nand devices.
So update this length as one step size if its
less than NANDC_STEP_SIZE.

Signed-off-by: Sricharan Ramabadhran <quic_srichara@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/raw/qcom_nandc.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/nand/raw/qcom_nandc.c b/drivers/mtd/nand/raw/qcom_nandc.c
index d4ba0d04c970..413e214c8e87 100644
--- a/drivers/mtd/nand/raw/qcom_nandc.c
+++ b/drivers/mtd/nand/raw/qcom_nandc.c
@@ -2885,6 +2885,9 @@ static int qcom_param_page_type_exec(struct nand_chip *chip,  const struct nand_
 	op_id = q_op.data_instr_idx;
 	len = nand_subop_get_data_len(subop, op_id);
 
+	if (len < NANDC_STEP_SIZE)
+		len = NANDC_STEP_SIZE;
+
 	nandc_set_read_loc(chip, 0, 0, 0, len, 1);
 
 	if (!nandc->props->qpic_v2) {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
