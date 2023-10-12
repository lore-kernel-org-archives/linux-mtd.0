Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 339BBCDB482
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Oct 2023 05:52:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t1LncLhGJnCsK/jI2mgWCs4uVzc+pyxC7uEV++/sTnQ=; b=BQQLzsmg7aZFc5
	cweMl4PxlfaHshh7VzF1wKwwtSBkWkEjUh2bZVaA5SJPjLdcbmBi5+4YmdNjFKOWNb/kF1dN4V4PY
	A/7b2yEjSOGNRgl4JsN7gwSn9Bfp1tTcqC8Z1GabiI9iWt8FLmIoJvmhNDLjP6aqFlkfGj3TfzoM1
	muaL4oPPFSIud2oaUvTYOeOGfL6BRVOkfKADwxQuUDToD89vdPEcL36/p3AHXLFTm8+D3vW+j61fB
	Btldes7ebjp2lBGc0u2eK4Fwb1T/W1A61xLadmwv4htUoHDz41+cUroUdAmU2DxC4eiMy1nmiLt6y
	n+A473aMQ/AjMyo9MNVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqocH-00HUVs-2u;
	Thu, 12 Oct 2023 05:52:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqocD-00HUUn-2e
	for linux-mtd@lists.infradead.org;
	Thu, 12 Oct 2023 05:52:12 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39C3tN9U029359;
	Thu, 12 Oct 2023 05:51:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=qcppdkim1; bh=iLOCYuFvToEXWyeuR0V8GCWiuhk3vAizBPUCQ5xahXM=;
 b=SqD58/68G3dpgIliEWraaA7vG1gs7AMdtOvEALKYiFT49hRR1D9bk28wp++xiD0yGT4O
 mP/MDZifrM+FG6/tuMu7tCYwe8y5pArZQrMtgcwKbAxX+gLwLXfrTh24i91UCdI7FUW3
 s2RGJd88Mql1ikIkBcxoPaF/kokTHkwm35rC0hiiD8eUIsSn8pjxUhlsrMCtVWfZzh8a
 7CkUXrQtN5iQKkXh0UxXrmA9LrIUW9jxfU53l8UqcRFJVufsC0G4JESIcO1G7m5ba20h
 m/9P76qUZYNSAhRdEKLk0LINzcLp6cNmKc2nEROV0O2py78mFAEhlQWjDU+JEhwECB0Y VA== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tnstytfaw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 05:51:57 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 39C5md07023136;
	Thu, 12 Oct 2023 05:51:52 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3tk0dksk0c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 05:51:52 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39C5pqnB025355;
	Thu, 12 Oct 2023 05:51:52 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 39C5pqEg025354
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Oct 2023 05:51:52 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 409B0412D9; Thu, 12 Oct 2023 11:21:51 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: tudor.ambarus@linaro.org, pratyush@kernel.org, michael@walle.cc,
        miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        Md Sadre Alam <quic_mdalam@quicinc.com>
Subject: [PATCH] mtd: spi-nor: Ensure operation completion before shutdown
Date: Thu, 12 Oct 2023 11:21:48 +0530
Message-Id: <20231012055148.2445303-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VgoyhuabBfVMOAxOj4MsziCZBct1asUr
X-Proofpoint-GUID: VgoyhuabBfVMOAxOj4MsziCZBct1asUr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-12_02,2023-10-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxscore=0
 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=728 lowpriorityscore=0 clxscore=1011
 spamscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310120049
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_225209_914287_6E639F9D 
X-CRM114-Status: GOOD (  12.39  )
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

Ensure that there are no pending spi operation inprogress
when system halts.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/spi-nor/core.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
index 1c443fe568cf..adc4d2c68695 100644
--- a/drivers/mtd/spi-nor/core.c
+++ b/drivers/mtd/spi-nor/core.c
@@ -3690,6 +3690,9 @@ static void spi_nor_shutdown(struct spi_mem *spimem)
 {
 	struct spi_nor *nor = spi_mem_get_drvdata(spimem);
 
+	/* Ensure no pending spi operation in progress */
+	spi_nor_wait_till_ready(nor);
+
 	spi_nor_restore(nor);
 }
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
