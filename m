Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446F2EE644D
	for <linux-mtd@archiver.kernel.org>; Thu, 12 Sep 2024 06:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6/FiQ52b38r+ez4gO8JsFTgxdsDtaXzsfYgUyMq3XVg=; b=J/8CsSN8jmYbYk
	Klx3bjwWG5bDhFVLAVBRoXmjw3H934cFEHUDZdrHAySOoyICidKc7xAIhTaMTQLHPdZZGUZHi96bI
	ZvX8CsvQHrRyRXhHdPs8aOCbudhHprLKLuyz8rJ5DpnM3bxYtO4gmqr+sylW0Jvb2xs4rUKpHPWJy
	GP+JQMokObKjxBwiCWXpo2lo7GrUHL26OSGs4Yg0bWxZQWD8i3LhwMVpOooNgIq4DEgmXPE+R8Npc
	orGRu8Zo8me1zPQKnIqclL40qOkcwdryZ5dF0qDJ7PtJbrh4PpIbhh1P6/+Lms3oaeNNLONZxqp+Z
	IcZMsb9pjLY/hzjxKIAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sod82-0000000BzKd-0FEq;
	Thu, 12 Sep 2024 06:16:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sod7x-0000000BzHK-2S8g
	for linux-mtd@lists.infradead.org;
	Thu, 12 Sep 2024 06:16:27 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48C2LI7L007211;
	Thu, 12 Sep 2024 06:16:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	j66Xa7Bm5CnZXbgXQmRSMIf9SWiNNByo/Q92kn4b2KQ=; b=S+UaguIreZKkfkI1
	Qe4eMCEd5hh+vnJDbrhag5C7IXm/IDTLM/bGM15yTF4iKzkwAPRk/0nJaDJE1aax
	tu+SpPqlvp7arYFrLcofO74CFOIvNKtYN7c1FHnFsMVADESG5D1YHHWr8/saXO1B
	1QbvuuU/7AfYkc3Sr+Sj4bFtNiZJGPW9KISDI/rUMsa5L7eIFerxhphXhiWOSI2v
	qaBkvwiv+aYDPCGXg3LNtytbOcO2ARn+87cjbJYLKtALVQrWK8AnzcZRDd1OKvxC
	LIYFyW0TSKocZQcKKZccnQYC49H63cZQL92y31KMSnZyNdBl81D0XDwaQ2Azt7fA
	IKzlAQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41gy5rm16w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 06:16:10 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48C6G9Xj004238
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Sep 2024 06:16:09 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 11 Sep 2024 23:16:03 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <esben@geanix.com>,
        <linux-arm-msm@vger.kernel.org>, <linux-spi@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>
CC: <quic_mdalam@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_srichara@quicinc.com>
Subject: [PATCH v9 8/8] arm64: dts: qcom: ipq9574: Disable eMMC node
Date: Thu, 12 Sep 2024 11:45:03 +0530
Message-ID: <20240912061503.3468147-9-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912061503.3468147-1-quic_mdalam@quicinc.com>
References: <20240912061503.3468147-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: JMxGteYv-sro9AA6ITzddkaf4PuJPGoX
X-Proofpoint-ORIG-GUID: JMxGteYv-sro9AA6ITzddkaf4PuJPGoX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 mlxscore=0 impostorscore=0 priorityscore=1501 mlxlogscore=880 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2408220000
 definitions=main-2409120043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_231625_861570_F370B022 
X-CRM114-Status: GOOD (  12.88  )
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

Change in [v9]

* No change

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
