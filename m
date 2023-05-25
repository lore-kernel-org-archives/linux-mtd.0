Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD96FC7EE29
	for <linux-mtd@archiver.kernel.org>; Thu, 25 May 2023 11:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=S6wqYLxgxFITepaFqJQFrJVYhI4nP5GD6XAQ6W38mfw=; b=EnZN3kjciagOCv
	jm3xk1vv+8hnAQCaKUhKRmYepanlkJZvldzu0dx8VClcvMacPb6U9aafI2Zv7kZR6E3H5HSJvOZvi
	R537L7+vZn79S2y9Q+Iy7vbvntl0qOiAdOy+Iu7Ysi4T8H9rR9cxY5rYy6v4Zg0u50nv9AXw/53s9
	GUBxW1Edtg6TWuo57b7TpzA3qScPzk9Fqcknko7J4n6rlYVHH7HBpu6qfX86vB7bG7kHg/BU0hIA3
	5DowLXP4YbnPJqW5gcZO8MVkcL1JeYgeZVAUEh5qGZ2bQRpCkQdH61YyDDkTB6hnmYrBB9d/n+lck
	iFMCcGi/+i4ZCE6Qg8Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q28ms-00GS4r-2y;
	Thu, 25 May 2023 11:05:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q28mp-00GRx6-0V
	for linux-mtd@lists.infradead.org;
	Thu, 25 May 2023 11:05:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34PAEwP6030373;
	Thu, 25 May 2023 11:05:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=EiUyoewa5hZFq14dAG4x+ZjQ/Ju95hT9AR0Yxo1ACGU=;
 b=kxA72LFU0TpyoBTskvj+g/R8nWiWh1Rl5sNHp3XB/LE6+xNmTHlHtNSRPK6E7URAm4/x
 XUhXuetMonDut0HdUz0Ib+WkjY4e1Fd7sfjE464WMx9MjhsaXtfs1bwuLfFCaAfiPpcf
 D74WOVcNCCBQQ8v2H7Rxv5otHBEMTJ421VMpCfDJ9NdIDczaRnieyMqhx9nMQcsETPgg
 YcBphmUjTKEH1xKa0/2O+ZL9VyJUQHThNi+dtNsZflrtl0x48R6ftxbnVST1itceCg8W
 8cBkR3HX7RiPYerQYQtY9/7191BEg250iD316V+cv6VnRfMTC4mGbncdxThnFGG3ldHV 8Q== 
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qsqqj9s9g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 May 2023 11:05:34 +0000
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 34PB5U5v020340;
	Thu, 25 May 2023 11:05:30 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3qpq9m8hjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 25 May 2023 11:05:30 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34PB5USR020334;
	Thu, 25 May 2023 11:05:30 GMT
Received: from mdalam-linux.qualcomm.com (mdalam-linux.qualcomm.com [10.201.2.71])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTP id 34PB5TwA020332;
	Thu, 25 May 2023 11:05:30 +0000
Received: by mdalam-linux.qualcomm.com (Postfix, from userid 466583)
	id 1326112010CA; Thu, 25 May 2023 16:35:29 +0530 (IST)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: quic_srichara@quicinc.com, quic_mdalam@quicinc.com
Subject: [PATCH] mtd: spinand: gigadevice: add support for GD5F2GQ5xExxH
Date: Thu, 25 May 2023 16:35:26 +0530
Message-Id: <20230525110526.21998-1-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: MmcUh4iC3BSe1ro-XDVqmk7DSVZ9U2xG
X-Proofpoint-ORIG-GUID: MmcUh4iC3BSe1ro-XDVqmk7DSVZ9U2xG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-25_06,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 adultscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 phishscore=0 mlxscore=0 malwarescore=0
 mlxlogscore=860 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305250091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_040539_324684_C9D9FA4A 
X-CRM114-Status: GOOD (  12.47  )
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

This is 2Gb SLC NAND flash with 4b/512b on-die ECC capability.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/nand/spi/gigadevice.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/mtd/nand/spi/gigadevice.c b/drivers/mtd/nand/spi/gigadevice.c
index 6b043e24855f..cfd7c3b26dc4 100644
--- a/drivers/mtd/nand/spi/gigadevice.c
+++ b/drivers/mtd/nand/spi/gigadevice.c
@@ -501,6 +501,16 @@ static const struct spinand_info gigadevice_spinand_table[] = {
 		     SPINAND_HAS_QE_BIT,
 		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
 				     gd5fxgq4uexxg_ecc_get_status)),
+	SPINAND_INFO("GD5F2GQ5xExxH",
+		     SPINAND_ID(SPINAND_READID_METHOD_OPCODE_DUMMY, 0x22),
+		     NAND_MEMORG(1, 2048, 64, 64, 2048, 40, 1, 1, 1),
+		     NAND_ECCREQ(4, 512),
+		     SPINAND_INFO_OP_VARIANTS(&read_cache_variants_2gq5,
+					      &write_cache_variants,
+					      &update_cache_variants),
+		     SPINAND_HAS_QE_BIT,
+		     SPINAND_ECCINFO(&gd5fxgqx_variant2_ooblayout,
+				     gd5fxgq4uexxg_ecc_get_status)),
 };
 
 static const struct spinand_manufacturer_ops gigadevice_spinand_manuf_ops = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
