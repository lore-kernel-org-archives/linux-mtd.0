Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCF71C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 23 Jun 2023 04:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xgTE9I1W7msap3aE4DSFUMPbDcw+b56rVdANb90VClM=; b=xLMWbG+fBac9Ui
	56RqaserXTDUZxjWID4e1KgVXifip9/257W2+WsJs+EyfzPtH8Vh/PO4r7MleXNB00EQLsebuv1ce
	gRFkrcaY6cXohaiSklItplL/YrKtCLn04FWkQkcJLKGd7ROSdWLaryhJgmXrQZmCBc7mAO+7LNpQV
	49VSM9t1q9ONUwiowSAGmUCHOa2qXiB/8zvHYU6Q9H/MZ7/YGETt95oAKoFO8Sm3NiOdbixw+eS46
	uw92aIdRDgrNE5r0UjANNHeLHNhNHHbiFZJXm/wWY38AqJ7onX1ObTx8/199BnVTil2Hh6e7VWP3H
	UNfS0mWaKtByeY8vh4fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCYt6-002YPz-20;
	Fri, 23 Jun 2023 04:59:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCYt3-002YPJ-2h
	for linux-mtd@lists.infradead.org;
	Fri, 23 Jun 2023 04:59:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35N4fCEo013342;
	Fri, 23 Jun 2023 04:59:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=/JxhzUPDuAy9we7oDTakzdyrNayH9Q7H8mJUGrAzzn4=;
 b=pLTU/Xk4fpKPwmvoU4xttocCE6OaPD9LoEA5enxYOPuG2jbNMyA/4QIsdM63hQSKRx5M
 TYlxB1A5AJ9avqoH5jkOFcPLRS6nqwzbfVcMP+oZrZEVArXlTaEOfUIO+jLgBpOtlIr5
 CC1TfndcLaPKQ+wUKMELdAdR+3c3He0jrQtDyJyeX2mxuj0tBXBY+7ysZjahXzE6JCfU
 e0RAGK3Sv6/UCJCR++Zq4YhgFMFeCn1OTPZi4g8ZoSugIA1pG1IF8Ccfo88z+txXeN//
 lNpP2FRNP6yB2Ex0PrgkPZKWmwafsnsT/UCUmKADYj0X0q9z7F/3A6UgsVGP8KfsZ0r6 oA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rc6b2bva1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 04:59:07 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 35N4x6n7009975
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Jun 2023 04:59:06 GMT
Received: from sridsn-linux.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.42; Thu, 22 Jun 2023 21:59:02 -0700
From: Sridharan S N <quic_sridsn@quicinc.com>
To: <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <quic_sridsn@quicinc.com>, <ddrokosov@sberdevices.ru>,
        <gch981213@gmail.com>, <mmkurbanov@sberdevices.ru>,
        <quic_mdalam@quicinc.com>, <linux-mtd@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH 2/3] mtd: spinand: add support for ESMT F50D2G41KA
Date: Fri, 23 Jun 2023 10:27:56 +0530
Message-ID: <20230623045757.30055-3-quic_sridsn@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230623045757.30055-1-quic_sridsn@quicinc.com>
References: <20230623045757.30055-1-quic_sridsn@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: QaMt0-4-9cyBXZNcRdo7f4_0xgQSgSzs
X-Proofpoint-GUID: QaMt0-4-9cyBXZNcRdo7f4_0xgQSgSzs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-23_02,2023-06-22_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 bulkscore=0
 malwarescore=0 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=851 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230622_215909_992385_033FA819 
X-CRM114-Status: GOOD (  13.41  )
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

This adds support for ESMT F50D2G41KA. This is 2Gb SLC NAND flash
with 8b/512b on-die ECC capability.

Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/spi/esmt.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/mtd/nand/spi/esmt.c b/drivers/mtd/nand/spi/esmt.c
index 1a3ffb982335..31c439a557b1 100644
--- a/drivers/mtd/nand/spi/esmt.c
+++ b/drivers/mtd/nand/spi/esmt.c
@@ -121,6 +121,15 @@ static const struct spinand_info esmt_c8_spinand_table[] = {
 					      &update_cache_variants),
 		     0,
 		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
+	SPINAND_INFO("F50D2G41KA",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_ADDR, 0x51),
+		     NAND_MEMORG(1, 2048, 128, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(8, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     0,
+		     SPINAND_ECCINFO(&f50l1g41lb_ooblayout, NULL)),
 };
 
 static const struct spinand_manufacturer_ops esmt_spinand_manuf_ops = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
