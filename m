Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75AC369BA
	for <linux-mtd@archiver.kernel.org>; Tue, 15 Apr 2025 07:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nxA96uA8w2PyGUqFB838QefSJU1URZzUsrZZd3WSmAk=; b=D869MXwcrmUEJ0
	2Aw6XM5t+VNF0U6pCv3h5nVELqPypj2BFLBGaSnKD35V8J3YtoAyyWoT6kwH8X/oI+8jUoJx7QyTt
	aj2vfaBaqMp4BvSdJNCgqldfj3aBLccCbdbT7pvXd/JcuTB3N4Md0JzwLSAxLcREA58iVWkrncHFS
	00tnYgos+jFhCz5BmQ4v2NaQT/TNemNs5oHFNWSqOepY7vEeI4w3I08c8RZ3pCC8TMhi1SYBAVJMS
	H3t7k8HTJlN62rBbv14bfr9L1OlRrj5/lJBZhAYeBeakY3PtGV9zOhniJFqDMAeEICPyEHo6tNc05
	yU1qaMeW9lziQmQaNAPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4b3d-00000004rys-2N4f;
	Tue, 15 Apr 2025 07:50:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4ajA-00000004o2S-2uoC
	for linux-mtd@lists.infradead.org;
	Tue, 15 Apr 2025 07:29:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15LY2020388;
	Tue, 15 Apr 2025 07:28:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=d9avIRiA25O8uzGJG1UGNF6h
	vjXDXPnhyx9AvxcUsxU=; b=fjN5wUERdLCZvInoy5yya3IYtQOMDB7MhdcHlmZo
	WxSyjs4VlzbuKJ2sxr1Mvc/zgcHDOu7YF0FWL5SfY7vRcLbeGrN9nFHnJgYGTRnm
	y2eMK5tEKg3RQyBq2D99ITO7LIIsil36LMOb0CG9RBjyY6KHVQB0sS1cVtVr40XF
	6MhvQ26vHyG2ZoK2/dtRRDm0+JJ5f34p4CNkX2QpwHWpz9L05dLsyw2ev6FLIEEQ
	E9JX1iXTtzCmtkVb973ewWh+wCXjHSjnUnZf+REj2tmwkB8s5smN3wXpeI9XLWk/
	Fkn2KQLtAry/CKdCajKpQvsn49j9FdOItJS+hY3rqEWw3Q==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj971dt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 07:28:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53F7SwmM000945
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 15 Apr 2025 07:28:58 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 15 Apr 2025 00:28:53 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v2 5/5] arm64: dts: qcom: sdx75-idp: Enable QPIC BAM & QPIC NAND support
Date: Tue, 15 Apr 2025 12:57:56 +0530
Message-ID: <20250415072756.20046-6-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
References: <20250415072756.20046-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9LcVZfinQL0iv283_qeB8gYMkDuXKLW8
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=67fe0abb cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=If1_SzIGY1zK-Kd_n0kA:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9LcVZfinQL0iv283_qeB8gYMkDuXKLW8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=818
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_002904_858939_F39D3EE7 
X-CRM114-Status: GOOD (  11.25  )
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

Enable QPIC BAM and QPIC NAND devicetree nodes for Qualcomm SDX75-IDP
board.

Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75-idp.dts | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75-idp.dts b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
index f1bbe7ab01ab..06cacec3461f 100644
--- a/arch/arm64/boot/dts/qcom/sdx75-idp.dts
+++ b/arch/arm64/boot/dts/qcom/sdx75-idp.dts
@@ -278,6 +278,24 @@
 	vdd3-supply = <&vreg_l10b_3p08>;
 };
 
+&qpic_bam {
+	status = "okay";
+};
+
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
