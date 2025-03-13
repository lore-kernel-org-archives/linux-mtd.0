Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95783C282EC
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Mar 2025 13:10:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jZ/7kuaS+ktNZ553Vt2yeAEYrKtMAyYFdi0wKt4oU58=; b=qOmR0pF5c57Rod
	G7jgLAYuizV1ZNSeAu6T8mjuq+LFQ/+EzIEHSEF/dMFaSk9ObihcPviCGsniXsEUoD23GwlNI+kn2
	jnnHhhkzVthGSeeZq/N2z+qXN4AURlQaerZO654MAmW6wak9N+S/A2wcs2FjbC2uxhVkNtAhProRk
	xCsUz44j/YY9welWhAA18nF9kLTR0tFUJc9Npe9qhXHBiPqwzO0bm2clcrVCQWN06aHNVsIMYGXqe
	CYQOudCEfM+5Kl2oc/lueo2imbcS3FpvROCb+8J+g5kuQCT9J9dFQObFoGkAwaRj3M2p/FP15+C4I
	yWWqQNJCaDoigXPrDqgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiKd-0000000BLRl-06UC;
	Thu, 13 Mar 2025 13:10:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsiKZ-0000000BLOU-3gVF
	for linux-mtd@lists.infradead.org;
	Thu, 13 Mar 2025 13:10:37 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52D9h2L7032388;
	Thu, 13 Mar 2025 13:10:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=gPmU8hfw3OjyuvFw4C76f+C+
	TOsZTG9SChvM5SPpV2w=; b=A1lY/bp3xGMoTU9yayLjaHySeYDc/1rF10xSw6lK
	qzAJ26mq8XplTh7kRVbvjrvjlvuvevpIPLP8ipxTBYXXA4O4Chqb1yC3C7Th8kHJ
	8fEtK8lEYqxMM6ULgzRSLq5mrSEzGGA5+NvSFoudflHuTPzc2yeKP1v+QNRQLDFl
	lgbXe3Dld2EVtgu75CXDD8oe4VRQ1KQR30ASVUATQQB1ry3tbn1Ia4qJbX/Yu77e
	jFNhoob/ewQJCkvQAUXyFFE/QNhG9t3ROQ1BDLPwNYsrbHbUxG88VAfN00J3prUQ
	X5pLLhe/Kj+lJd+XZQ6uRcYZZPYwtrNNoM1T0u9KcTYIFQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45au2qnxtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 13:10:30 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DDATwW021905
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 13:10:29 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 06:10:24 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH 6/6] ARM: dts: qcom: sdx75-idp: Enable QPIC NAND support
Date: Thu, 13 Mar 2025 18:39:18 +0530
Message-ID: <20250313130918.4238-7-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
References: <20250313130918.4238-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: kAzWUQ7QUhUQOr98MbqwUrjzKeOOPO2G
X-Proofpoint-GUID: kAzWUQ7QUhUQOr98MbqwUrjzKeOOPO2G
X-Authority-Analysis: v=2.4 cv=TIhFS0la c=1 sm=1 tr=0 ts=67d2d947 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=FJNihrFfxRNLkEo54-QA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_06,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 adultscore=0 mlxlogscore=771 mlxscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_061036_045763_76E16432 
X-CRM114-Status: GOOD (  10.97  )
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

Enable QPIC NAND devicetree node for Qualcomm SDX75-IDP board.

Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index 26f7e38b8a6e..06cacec3461f 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -282,6 +282,20 @@
 	status = "okay";
 };
 
+&qpic_nand {
+	status = "okay";
+
+	nand@0 {
+		reg = <0>;
+
+		nand-ecc-strength = <8>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+		/* efs2 partition is secured */
+		secure-regions = /bits/ 64 <0x680000 0xb00000>;
+	};
+};
+
 &qupv3_id_0 {
 	status = "okay";
 };
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
