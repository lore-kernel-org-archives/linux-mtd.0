Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C31C2C0015E
	for <linux-mtd@archiver.kernel.org>; Mon, 17 Jul 2023 15:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPYxGm0+eh1pnTtMYCQgWVtsRxa/XQHRQnLNnhmf7XQ=; b=XCu73r+WyT1TLU
	OZClk97u80lEEeGlwq/DJlJvvWtT1UUNO/sO1bFnJrWiJ/X1Ekwr/Xzg3iE3IYBu47JDYk6pPD3yP
	Z4T9X8/FCmpVoaXgXr4rZSfiTtF9upywgqmQMn/FX0uETccsjKklB96oHzlcXBCCX5RJ8NIIVIVqN
	mi3VwUT+DPpDbwvXQG6E6TO6Ia+ApC9sXCf/0UVaqmQBNQAnwKp6fL/IATZaJHbbk8qGij1Z4hLkU
	d8Feqhxk14OIfiJyusXzrXkJmhZD++bTSYJGmAkRYiwgAC9kfVXl+wk78t0t9aHSLXUsx9xhv4AJY
	4K+M3KFBPbpX9x9LC1TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQIt-004PxW-0c;
	Mon, 17 Jul 2023 15:38:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLQIq-004Pwe-0H
	for linux-mtd@lists.infradead.org;
	Mon, 17 Jul 2023 15:38:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36HASMMG024162;
	Mon, 17 Jul 2023 15:38:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=HU+dumvfizCNawU2qaE5vID35FX9p4E1RrKO9S5kN2g=;
 b=fd1gy0rq92ecilZQX18cN2sACLuxDfmlq/gELkbWiXU+vZ/PL97g02gEinOixKkXjOzz
 SAYcWg06V4uZ16a4beXMtrrzxjuyuKGjV4MPSuT9EF46BqLsuNBPG84iO4CGwYFwd+F5
 0aHe49O6uZu48k6O5RbD0/UvE/AuMjwMK5h4jxo7CrdZ3KuJeydHLNV6iiWI5g9b2aHx
 6KoGLI5+QSd1dX1OYs0sjwyIAEyKJtbZWIG1vyOItpgbjneN/PJSNKB8ou3hSKnM6r/2
 33cSPClipwWnSBwedT3dmBXNFuQ9ejlL5YdOheZoTZTI+twnvFQB3c0TikHXUE9Q2gEK Ow== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3run0cbuhc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 15:38:19 +0000
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36HFcIuF025996
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jul 2023 15:38:18 GMT
Received: from sridsn-linux.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Mon, 17 Jul 2023 08:38:15 -0700
From: Sridharan S N <quic_sridsn@quicinc.com>
To: <tudor.ambarus@linaro.org>, <pratyush@kernel.org>, <michael@walle.cc>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: Sridharan S N <quic_sridsn@quicinc.com>,
        Md Sadre Alam
	<quic_mdalam@quicinc.com>
Subject: [PATCH 1/2] mtd: spi-nor: gigadevice: Add support for gd25lb256e and gd25d{2,4}0c
Date: Mon, 17 Jul 2023 21:05:35 +0530
Message-ID: <20230717153536.25700-2-quic_sridsn@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230717153536.25700-1-quic_sridsn@quicinc.com>
References: <20230717153536.25700-1-quic_sridsn@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2033pNI6gybkSGzLljP9uEQc3rBWgouT
X-Proofpoint-ORIG-GUID: 2033pNI6gybkSGzLljP9uEQc3rBWgouT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-17_12,2023-07-13_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 suspectscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 impostorscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2307170142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_083824_283175_E37F3020 
X-CRM114-Status: GOOD (  14.17  )
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

Add support for:
	gd25lb256e
	gd25d{2,4}0c

All these chips supports uniform 4K-byte erase.

Signed-off-by: Sridharan S N <quic_sridsn@quicinc.com>
Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 drivers/mtd/spi-nor/gigadevice.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigadevice.c
index d57ddaf1525b..aca3b2362bfd 100644
--- a/drivers/mtd/spi-nor/gigadevice.c
+++ b/drivers/mtd/spi-nor/gigadevice.c
@@ -67,6 +67,12 @@ static const struct flash_info gigadevice_nor_parts[] = {
 		FLAGS(SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6)
 		FIXUP_FLAGS(SPI_NOR_4B_OPCODES)
 		.fixups = &gd25q256_fixups },
+	{ "gd25lb256e", INFO(0xc86719, 0, 64 * 1024, 512)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_QUAD_READ) },
+	{ "gd25d20c", INFO(0xc84012, 0, 64 * 1024, 4)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
+	{ "gd25d40c", INFO(0xc84013, 0, 64 * 1024, 8)
+		NO_SFDP_FLAGS(SECT_4K | SPI_NOR_DUAL_READ) },
 };
 
 const struct spi_nor_manufacturer spi_nor_gigadevice = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
