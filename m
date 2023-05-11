Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2BF0C7EE23
	for <linux-mtd@archiver.kernel.org>; Thu, 11 May 2023 13:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mwfG00G2mF43IuPdFswaoNVbCsKJwRuh0B6CrSHEHnY=; b=CVOK+4xjPFk7Ym
	hjYRzCRzdBX3t/BlISYIzEX/AamF+WB1Hlkc1FWhjnY0KYqdjwbkw+7EHUCu5zqjfuGvzFIdTuhOW
	hfComo3++0jBj+16jslA4ToyYnbKZNDw+42QJM6w36qh5VoQoyrHtx7jXOQV0Q/zPeCFvIZ4ZTakl
	XiXuZKraHRRR2m9ffDLWlbeNyZs20H3JkuV79MNvMr72vzrZashF2aE0FGHBvdqACkMXZ9CVoiGwk
	wZONyw8vzSwCB93rXLqDytW7UWvTy84LCznBCjhJ18YEyi/UHrRj0eUnvSdexIoGIp2SmSzrGxe9q
	xn7BblAsgvMargQTna8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1px6NO-008sGe-0q;
	Thu, 11 May 2023 13:30:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1px6NM-008sEo-0T
	for linux-mtd@lists.infradead.org;
	Thu, 11 May 2023 13:30:33 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34BDMVEo025180;
	Thu, 11 May 2023 13:30:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=4H6cg9/svGMCwZGXxTBtcYg0ozMTszd85OG5cGMvj7Q=;
 b=PlrJhQ3LqJhtTm+obYnYcWOaAmDaKKxjOZVmNnGu/Gx6mgie+8+Z33InbQsJB/aE19LM
 u0FfUtl8KcaVHgO/YQkTNj7hOxcycG+qwlACnnlgB1c8fLnQc+KJyvAE3hmfujNR9Csk
 GBsYkxywzNHmkMosl5Cy7034OZ54yr1yikGHv16X7vxkfkCmR1q1BTuA0bqeY4OooPrS
 C00WXDEt1YO+AYY7JsPrjFcN/svdlmuZnXuaOVI0fuUPz7pUAZHnI4yIqVWdfyaBg71y
 1+oD3zDN4JxzlGs9Qc8bhB7Fk49fhWRRjIDY45zRtUCJojvEHXTlQa0Hyi7rTB+Xllce dw== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qgv1t8v2e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 May 2023 13:30:25 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34BDULZx001532;
	Thu, 11 May 2023 13:30:21 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 3qdy5bq8kn-1;
	Thu, 11 May 2023 13:30:21 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34BDULeF001526;
	Thu, 11 May 2023 13:30:21 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTP id 34BDUKuZ001525;
	Thu, 11 May 2023 13:30:21 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id AC8B512010C1; Thu, 11 May 2023 19:00:19 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: mani@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, linux-mtd@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_mdalam@quicinc.com
Subject: [PATCH 0/5] mtd: rawnand: qcom: Implement exec_op()
Date: Thu, 11 May 2023 19:00:12 +0530
Message-Id: <20230511133017.6307-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: nQB32vKZAAlEPhsVUHYMWHeqLZ43SzsH
X-Proofpoint-GUID: nQB32vKZAAlEPhsVUHYMWHeqLZ43SzsH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-11_10,2023-05-05_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=611 malwarescore=0 suspectscore=0 clxscore=1015
 priorityscore=1501 mlxscore=0 adultscore=0 spamscore=0 phishscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2304280000 definitions=main-2305110116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230511_063032_190107_0C0A0B9B 
X-CRM114-Status: UNSURE (   9.43  )
X-CRM114-Notice: Please train this message.
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

These series of patches will add exec_ops support in qpic nand
driver. Earlier posted patches V1,V2 will be discontinued ,after
addrissing Mani and Miquel comment. These all patches are split
of single patche posted earlier for exec_ops.


Md Sadre Alam (5):
  mtd: rawnand: qcom: Implement exec_op()
  mtd: rawnand: qcom: Add support for reset, readid, status exec_op
  mtd: rawnand: qcom: Add support for param_page read exec_ops
  mtd: rawnand: qcom: Add support for read, write, erase exec_ops
  mtd: rawnand: qcom: Remove legacy interface implementation.

 drivers/mtd/nand/raw/qcom_nandc.c | 857 ++++++++++++++++++------------
 1 file changed, 510 insertions(+), 347 deletions(-)

-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
