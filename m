Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7DE0D15D83
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Oct 2024 11:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4rTiREQtmPqmXxRqkWYXx5aE6J6cD4iYdylhvSDiNrQ=; b=wkTbDeZIJe4Lc8
	c4fvhCaszQsQDoWN1qXjqMoooD0WD3li4qqUf5rzeNub4z5NmXkKwa2xgmHDlDqDObJrYDBG4h7nD
	8blHZ0JU09hVIZ3JqNiD/HqvY4HN9JSiL7SOZ3z9DL53vpGVibfebQMu17DC18bO3V4Eectw4YS6X
	DRjYhoYUtii0r4kEIA7fp2PMpZ3ip+XB4Mk5n+yh5pOsUJiuiVpsa2wPT5QoMegnewqR5W0x4BMe/
	hyagKMxXsXZbzkqPoqEEba09H0N9CsA6DH4lw4CoLqSX2wX429C4ftcqGeVlFdkMnzNgPv15I1zBF
	Ykcj+ZkNiXZQXQ6AwRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2r3t-000000078Jo-0Nel;
	Mon, 21 Oct 2024 11:59:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2r2P-000000077w1-3THN
	for linux-mtd@lists.infradead.org;
	Mon, 21 Oct 2024 11:57:31 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49LAfqPV026569;
	Mon, 21 Oct 2024 11:57:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pbr+kpcekDk7H3+i3QQpglOu11PBbfEMDlaz70GM/2g=; b=FDAmz3LM97pdH7gp
	whQLv2sQI/OKGeZuW72cosXYn3OMLnVv8rotYLRAYOz09AjhfZLyX05f8eug5htt
	vHBqtnrwbgBrSFBrODPDwjwwtOSym8hBaweeUcX9hs8HhNpOYxjKR+Gtn9BFnr7Y
	4DKe4sMeLXbmCREYDnalL1/ys4qA5Jnev1XrdpYEliU/xDP/xpEzF7sBvfkwm39Z
	Wvx4B2ezbCMc3tHWkeFo3shw78g0fXsSeKt0z1Vw3kSxYAEf0TiXZXwoHtl9rFrQ
	xsHCwf16kA6D0t4AfxwEcYz3yjk3lSaISwwrbTcbRvYhjEYPcpzwGvCgHUzVC1Ru
	jNEjqQ==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42c6tsmgvq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 11:57:24 +0000 (GMT)
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49LBvNwN017333
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Oct 2024 11:57:23 GMT
Received: from hu-mdalam-blr.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 21 Oct 2024 04:57:18 -0700
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: <broonie@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <miquel.raynal@bootlin.com>,
        <richard@nod.at>, <vigneshr@ti.com>,
        <manivannan.sadhasivam@linaro.org>, <linux-arm-msm@vger.kernel.org>,
        <linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
CC: <quic_srichara@quicinc.com>, <quic_varada@quicinc.com>,
        <quic_mdalam@quicinc.com>
Subject: [PATCH v12 8/8] arm64: dts: qcom: ipq9574: Remove eMMC node
Date: Mon, 21 Oct 2024 17:26:20 +0530
Message-ID: <20241021115620.1616617-9-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
References: <20241021115620.1616617-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3FzxB4XtOctpp5BDsjpEZKdYGyjPQyFn
X-Proofpoint-ORIG-GUID: 3FzxB4XtOctpp5BDsjpEZKdYGyjPQyFn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 spamscore=0 mlxlogscore=991 phishscore=0 adultscore=0
 mlxscore=0 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410210085
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_045729_896858_50810EBD 
X-CRM114-Status: GOOD (  11.13  )
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

Remove eMMC node for rdp433, since rdp433
default boot mode is norplusnand

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---

Change in [v12]

* Updated commit header and commit message

* Removed sdhci node from rdp433.dts file
 
Change in [v11]

* No change

Change in [v10]

* No change

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

 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 1bb8d96c9a82..7b5e417f9b8d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -15,18 +15,6 @@ / {
 	compatible = "qcom,ipq9574-ap-al02-c7", "qcom,ipq9574";
 };
 
-&sdhc_1 {
-	pinctrl-0 = <&sdc_default_state>;
-	pinctrl-names = "default";
-	mmc-ddr-1_8v;
-	mmc-hs200-1_8v;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-	max-frequency = <384000000>;
-	bus-width = <8>;
-	status = "okay";
-};
-
 &tlmm {
 	sdc_default_state: sdc-default-state {
 		clk-pins {
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
