Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 950F1C369DC
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 06:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O8AkoNWZePw/Eif3XTb8BFnRNAPqHOnnhSVTA6oE9+k=; b=f31IVaMWn2G0+o
	ujRabKOrM0s3jvFcg64ti5oWJrIQKZa7c/JC+2e7KKufNeSAPYFwoFLxwXRCFjeLzfDmAOO2k2tiG
	sRCdqvH0JB3lOOKMqxPDVSy+/q17CdbPfxu3pXOtumCRslsDeRLUZsIO/e4jO5/BZNRTpSlVaGkhV
	6OTyCKLfZSM6Ye+HPae4dWFYK2LnKPV/azs8oAasvRYsC9o3pqdIe6NTR+mH7p41/gE+PhRgUTnQe
	hP9iqgZhifXwhF0GWX0nYkB8L1RqEw/cBujfKQiVm5Jkyqd8xFR+IT35AK6smLvn4g9Kc1AMh/FXX
	HI2XkaDIW5IHxWa+MroQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U33-00000009Q2c-04FT;
	Wed, 23 Apr 2025 06:57:33 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TeJ-00000009LcQ-0r55
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 06:32:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0iMJO008515;
	Wed, 23 Apr 2025 06:31:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=VK+lhKMUXiiS182KcTxUoiGP
	v9B+H+7bsk6fP3KLDPQ=; b=kw8nETgIucuKMqbrUtydzAII2rje0M9sz/SSN6od
	af82ftYTjIo5YPgybF3BYIh9F9dpjjAqSMOYKpe9zpvk02s/PcwPhbxsGwj25eBY
	y8Td8IymzmQJAT98bjIJbh+JP2lNjEoJ1K1DbaZMm6JTdMapzBhYFMxqChNvoMB9
	Xq2v8pB6soXRuZqmT8z+bMKr1AZRfLnzPuv4J6bGBwSumqiWoGjcTV1stbI75Gwk
	61rRaE0AIgVQl5LUJmXbCKLWUb73YTvhu2epcpkOFB30o3Xcdhv/SxXfcMx8Zu8E
	tt1rDihoR2y8zsizZV5Enlqub9e28bKMbKHD9dAKrgfRsw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh593hs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6Vr1w007371
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:53 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:31:48 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v3 3/5] arm64: dts: qcom: sdx75: Add QPIC BAM support
Date: Wed, 23 Apr 2025 12:00:52 +0530
Message-ID: <20250423063054.28795-4-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
References: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MyBTYWx0ZWRfX+KlFr3sGyfO3 NJVsVJWiR1YsE2/9wD4AjR5e2qHIRilNo2FVUMKHGL/dbCc60NWlkhnatb4dbWYeoOZBX/JXM7k nosj7+Z6FPg/8b1ai18iFRVOmhFvWIJpmpTNjyVYng568EXFzV3zkqWaEbD/AEmrzeLRCdEC5Cg
 hTvXi1vAdUKnmOHU7Gr0Sc5aJ03d5kXjbgBS2TJj829c6NC/VtMzpf9B04cj2NEesWrJhiDKh4f tFZ5X18DI9RDvtFcfIrDxSwSBqHRHd/0n26rmbn63VXIuD53e4pDAWWeDvm/E3/xD2/cDQ24Sn+ zZpc0rUp4EeavfU3Ng0Z9DIxPQC8pKVoizYROE2D+/mYosdTa/He7Dk6/oOIQv2mUHhU2IgCME5
 g708rncspMIl+sIU7T8dLGiopNSVPc7/ZGeEjm6lm4hk1B19x9E/qCLokjOgHgon9q16DL3o
X-Proofpoint-GUID: FYI_l902te4mlmlHywqapKKq2jemtvHV
X-Authority-Analysis: v=2.4 cv=B/S50PtM c=1 sm=1 tr=0 ts=6808895a cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=6PFQA9o1HuDwXgWONe0A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: FYI_l902te4mlmlHywqapKKq2jemtvHV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=952
 lowpriorityscore=0 bulkscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_233159_365221_319C8C64 
X-CRM114-Status: GOOD (  10.59  )
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

Add devicetree node to enable support for QPIC BAM DMA controller on
Qualcomm SDX75 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index b0a8a0fe5f39..638e07b00733 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -880,6 +880,20 @@
 			qcom,bcm-voters = <&apps_bcm_voter>;
 		};
 
+		qpic_bam: dma-controller@1c9c000 {
+			compatible = "qcom,bam-v1.7.4", "qcom,bam-v1.7.0";
+			reg = <0x0 0x01c9c000 0x0 0x1c000>;
+			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&rpmhcc RPMH_QPIC_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			qcom,controlled-remotely;
+			iommus = <&apps_smmu 0x100 0x3>;
+			dma-coherent;
+			status = "disabled";
+		};
+
 		tcsr_mutex: hwlock@1f40000 {
 			compatible = "qcom,tcsr-mutex";
 			reg = <0x0 0x01f40000 0x0 0x40000>;
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
