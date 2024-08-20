Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379DFC5472F
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Aug 2024 10:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I1GJSnSKanQ5pLo4+P9MoiDrYF0m/aVEz1Ye/Z4mhBQ=; b=MDUSOvsAqqQe3g
	RoBuN+R2AphRJGnzl1baHmEQ1ZiaURy1jIkBn0Dyu32T4fByvqgJe9o/lcjdyb8u6Ioh5wUjMh50p
	0bzupdxVD3zhw2RRFPbA9435gVSyJ35Xz12haabeG2RmjMiVzoS8XdBEjv8LZeGqJQ+ljnBzDEOBs
	fq/tDWBFtiY4ASw3yE5STYLOCCeglzxnhqRRyMT70xz+RdFWX5k02XFI3A2r6xBIOtbQX6upLYyzX
	0ZEEmRM+EmD/92Ds6CAT7rVU3OSkN9dk79+xvBduLvBJYihj5/4IPbOS+Rl9//jOxFTzwhay9Po5s
	WcRe2Q5CZMs6RGPbYLjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgMVz-00000004ulU-2PgV;
	Tue, 20 Aug 2024 10:55:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgML8-00000004rYm-484n
	for linux-mtd@lists.infradead.org;
	Tue, 20 Aug 2024 10:43:52 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47K8tRh2026205;
	Tue, 20 Aug 2024 10:43:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	D67xtwFg9snfeSN1yUSeXQ5WIC8eNZ5U2Fk3scO2g1c=; b=DRvEsHoEMEUUKIX0
	idcmlINXAF11MRHRy3iZGvD+z7p25astYCqX3z3U7rQ6R4dCuuLALfY/KSGJd2+q
	HGKmpWi8RX6XwDuKUj2EX2WSkFnM6n4RCF9WyLrqV5WlcXmAr7Csulb5B/CzI/bF
	3krwTS0YyWn6KbXMV3KyDhZ6O5WFqn+FJ/xzmtqpNgeXHKLcWzJseds7L2gTdfyI
	BjHBvxKD2dExvT//hUFiH509ll3gbaX2O/HWDPkdMYFiLB4VG1KmaJBVEYQa2VvA
	MLzKYvzyQUemolIw1re8uqu2/xLgdL07EqU0Ok4vyecumF6l0W4CjtCbfmzVqShX
	horGsg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 413qxg54f3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 10:43:36 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47KAhZrb025399
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Aug 2024 10:43:35 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 20 Aug 2024 03:43:30 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
Subject: [PATCH v8 8/8] arm64: dts: qcom: ipq9574: Disable eMMC node
Date: Tue, 20 Aug 2024 16:12:39 +0530
Message-ID: <20240820104239.1774600-9-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
References: <20240820104239.1774600-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: XcpyyS8XPNMFp0Z0R_xNy3tRrma5ufQr
X-Proofpoint-GUID: XcpyyS8XPNMFp0Z0R_xNy3tRrma5ufQr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-20_09,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=902 malwarescore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 bulkscore=0
 adultscore=0 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2407110000 definitions=main-2408200079
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_034351_184607_AA84684B 
X-CRM114-Status: GOOD (  12.44  )
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

Disable eMMC node for rdp433, since rdp433
default boot mode is norplusnand

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
Change in [v8]

* No change

Change in [v7]

* No Change

Change in [v6]

* Updated commit message

Change in [v5]

* No Change

Change in [v4]

* No change

Change in [v3]

* Removed co-developed by 

Change in [v2]

* Posted as initial eMMC disable patch

Change in [v1]

* This patch was not included in v1

 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 1bb8d96c9a82..e33e7fafd695 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -24,7 +24,7 @@ &sdhc_1 {
 	mmc-hs400-enhanced-strobe;
 	max-frequency = <384000000>;
 	bus-width = <8>;
-	status = "okay";
+	status = "disabled";
 };
 
 &tlmm {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
