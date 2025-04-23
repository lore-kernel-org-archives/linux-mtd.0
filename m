Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9DAC3DA4A
	for <linux-mtd@archiver.kernel.org>; Wed, 23 Apr 2025 06:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sg4fXs19g6JK2MrNZ33h4lZnRGZomB1seUs4obcD6lc=; b=gcOBDeUBnrLOBK
	PRRZNDMdyWCSev2fXeZyCeoGWK30oufISrkLzsISmymX0sua4CgZi/lxKXYZ9eecRALC3n1RQECMZ
	alXhO2Uc/RmbtGRWu5ydlaW0rugFWva/obPGJC6NRidArzZ7bE1Kif6RINU6/GG0xNKMtqEcnigPE
	6mx7BrElMvs/iGmqnnha/rCaT5lD4Bbl4IS+FVVh5scuuPpdRXG19S2Mj73ku/zyNX9Fi1JMhxhFK
	2OBAXXwGY+j6CxaZtPYsx/Hiu9cmOCDA2XIyVxuVcTPShWKd9oOEkqEBRDbhEVMkx/zbVyAbj2RGc
	+z/aSaMtdBejdZB27alw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7U33-00000009Q35-2GOm;
	Wed, 23 Apr 2025 06:57:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7TeN-00000009LdO-2IHn
	for linux-mtd@lists.infradead.org;
	Wed, 23 Apr 2025 06:32:04 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53N0i71C015927;
	Wed, 23 Apr 2025 06:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oylRHHtW+Az94eOZU++5RzHt
	7/PAm0TCTs+TUy8XbY0=; b=nR15LCMSvrLDdX/dQqBIugG0pFI/WF8HdB0sM++K
	ERTgEUjMwZtPOKWpCq1TxZqaml0dsTMjIMAmzwTvZcwjp0PFc9LUcYDLnK6dUXfr
	bYtf6V4mcO7bDuClke7JOSXv4EU1QYnde7+Vg2LvQXDpPM0UjotM8+Wg2Ms64Jxl
	Cuxb/Q2jwe66ziMGGKDRR0akB74hHzKRL6wShz90hqawpTdLYpy65r7wUs4C+zF1
	ozpWdUYt8orwciYBNpWpf+qelt1ht819iLonKKfCKtSUjvppcmf6xMiCgFONvky2
	0VMLmPHDiiyKWH70pQjaFSzrPZogH48rf7Si18VwQpEQ7g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh093xp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:59 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53N6Vwxx007493
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Apr 2025 06:31:58 GMT
Received: from hu-kaushalk-hyd.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Apr 2025 23:31:53 -0700
From: Kaushal Kumar <quic_kaushalk@quicinc.com>
To: <vkoul@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <manivannan.sadhasivam@linaro.org>,
        <miquel.raynal@bootlin.com>, <richard@nod.at>, <vigneshr@ti.com>,
        <andersson@kernel.org>, <konradybcio@kernel.org>, <agross@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <dmaengine@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-mtd@lists.infradead.org>,
        Kaushal Kumar <quic_kaushalk@quicinc.com>
Subject: [PATCH v3 4/5] arm64: dts: qcom: sdx75: Add QPIC NAND support
Date: Wed, 23 Apr 2025 12:00:53 +0530
Message-ID: <20250423063054.28795-5-quic_kaushalk@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
References: <20250423063054.28795-1-quic_kaushalk@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZAoodv5_g4zQIC2OLMvk78ar6DMSbeUS
X-Proofpoint-ORIG-GUID: ZAoodv5_g4zQIC2OLMvk78ar6DMSbeUS
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6808895f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=EhM7gG_zESjhUU7MHiYA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDA0MiBTYWx0ZWRfX7t+NlugXQbQR kgTu2p7NqnteG0Ik8PfIBZ+UKJ8+29UKn8vj6I5cDERax8VRlkBFOwG8aRY3uvNkPQwWIyi8763 TGyK8ENTl/evV0jHdknQd9xzcsksUBNjzlf3ddMC+YoIjZxsH7HOvsGIXax5pBVLjkPWf1jcQTp
 /pzn/32nYYjnpLY9IDW9VP3EdJGiGq0Dj23mPpAC+VJiEYgUwS1FbzKlzSEJGjbOYFzxLbUs1Al Xyl0zJxLXFoRWMaAkCWIJ+QNLM4v487zt7rbGPUaKZwdIUIE6R3PFMziyXUaFQOU5N2CWgr4Hxd 6yY/H5aFgywowILdLWbBhrRs93a4rupt+CogRSct+qhwTHmSFrqIWBuOCJjvv0t0vDy5X6ZSXKN
 2gtPXkOQkAsSnop65pZDfV6U2JDanzAFPJU0ayB1A7KdspGi+U56xO8YcGgGE95D0FdSgeBz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-23_05,2025-04-22_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=927 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_233203_590101_FE92AE16 
X-CRM114-Status: GOOD (  10.47  )
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

Add devicetree node to enable support for QPIC NAND controller on Qualcomm
SDX75 platform.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Kaushal Kumar <quic_kaushalk@quicinc.com>
---
 arch/arm64/boot/dts/qcom/sdx75.dtsi | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdx75.dtsi b/arch/arm64/boot/dts/qcom/sdx75.dtsi
index 638e07b00733..3e86b1d67130 100644
--- a/arch/arm64/boot/dts/qcom/sdx75.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdx75.dtsi
@@ -894,6 +894,25 @@
 			status = "disabled";
 		};
 
+		qpic_nand: nand-controller@1cc8000 {
+			compatible = "qcom,sdx75-nand", "qcom,sdx55-nand";
+			reg = <0x0 0x01cc8000 0x0 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&rpmhcc RPMH_QPIC_CLK>,
+				 <&sleep_clk>;
+			clock-names = "core",
+				      "aon";
+			dmas = <&qpic_bam 0>,
+			       <&qpic_bam 1>,
+			       <&qpic_bam 2>;
+			dma-names = "tx",
+				    "rx",
+				    "cmd";
+			iommus = <&apps_smmu 0x100 0x3>;
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
