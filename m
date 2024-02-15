Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C5B9C4829E
	for <linux-mtd@archiver.kernel.org>; Thu, 15 Feb 2024 13:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kasbRtr1KrgSeZw5g5EZstHrsYtMPfG1chx9xMHgPU0=; b=ri/Cur5THenCBC
	5O1MYAUNDrQeOuVy4VCD4U/zUozBrzwUSQkmoMKQk2P8rZlCwHewSlITvMkRisHxkfy1tWLtNvFzp
	lBH52qoW8WbJJTPuEyGhYeNdOJAsoHWeDQfJVhmtCbXCZBLZqz+dvKsk3sx6Kme/mJmnm96gC1C9P
	MLnXuyd8OciKwy/nt/j714lGlogvLuTCXV5HdTXu7Z7QAdZTLQQm2v9dGiyhpKzxV7XAUwfvdAcUG
	OrV9xkHx6XZ63paqLUd5vOhkQWO7IwFgRbFWcqa+VMZKunZWB7ZloMq20ASN5WmKS5tRTXqLZIwbU
	3ZABkbtBGAD+dsraEuMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac79-0000000GRjF-3Q82;
	Thu, 15 Feb 2024 13:49:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rac77-0000000GRhQ-0iMM
	for linux-mtd@lists.infradead.org;
	Thu, 15 Feb 2024 13:49:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 41F7dSa3020044;
	Thu, 15 Feb 2024 13:49:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=qcppdkim1; bh=o3yh+AK
	jvLI03nbojYLfsnAL6ZAu+V6Vwa7HDGmBstc=; b=dGyoxR1qq7zeWBqxqIezPsa
	ppj/Da7NIHFXAHwqvPKxCjHtqlAS8GE9RFKd3RYqWUTw8AcSD612Y9OfAR1my6zC
	T2eNpKeyv9gGbM4rK6nVqaMrJPwtO6wENouOo24I/Qfo/lNy8Y3LgqhwzEeN2B6u
	UZ4ihaMZHNRBcOTn4cMVmk0DbnVJ0XXjcw2nPb6mp0tzMAv2AJnoaXDJTMNGlqyk
	Q45uyOal6w48JZd3mtkBsftZOodXF7+ISIH+m3QsWEhxcsE8sLsaRy36qrTQPcF/
	4as1IPekMK/bDMJlrHj7iTWZFKFS73JfpaZg6TnmdzGN0jgxXsPBEShPQfXaC6w=
	=
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3w9e4h0uf2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:12 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 41FDn8x9009959;
	Thu, 15 Feb 2024 13:49:08 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 3w627mb92a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:08 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 41FDn8qK009929;
	Thu, 15 Feb 2024 13:49:08 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 41FDn8fw009922
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 15 Feb 2024 13:49:08 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 6D721414AE; Thu, 15 Feb 2024 19:19:07 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: andersson@kernel.org, konrad.dybcio@linaro.org, broonie@kernel.org,
        robh@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
        vigneshr@ti.com, manivannan.sadhasivam@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mtd@lists.infradead.org
Cc: quic_srichara@quicinc.com, quic_varada@quicinc.com,
        quic_mdalam@quicinc.com
Subject: [PATCH 4/5] arm64: dts: qcom: ipq9574: Add SPI nand support
Date: Thu, 15 Feb 2024 19:18:55 +0530
Message-Id: <20240215134856.1313239-5-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
References: <20240215134856.1313239-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: aD-mdvpOgIgPD0lXegfx6Bn1HNnkZlxD
X-Proofpoint-ORIG-GUID: aD-mdvpOgIgPD0lXegfx6Bn1HNnkZlxD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-02-15_12,2024-02-14_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 impostorscore=0 adultscore=0 mlxscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxlogscore=848
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401310000 definitions=main-2402150111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240215_054921_243616_07A90937 
X-CRM114-Status: GOOD (  10.19  )
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

Add SPI NAND support for ipq9574 SoC.

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
---
 .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 43 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/ipq9574.dtsi         | 27 ++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
index 91e104b0f865..5b54a027fa5d 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
@@ -139,6 +139,49 @@ gpio_leds_default: gpio-leds-default-state {
 		drive-strength = <8>;
 		bias-pull-up;
 	};
+
+	qpic_snand_default_state: qpic-snand-default-state {
+		clock-pins {
+			pins = "gpio5";
+			function = "qspi_clk";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		cs-pins {
+			pins = "gpio4";
+			function = "qspi_cs";
+			drive-strength = <8>;
+			bias-disable;
+		};
+
+		data-pins {
+			pins = "gpio0", "gpio1", "gpio2";
+			function = "qspi_data";
+			drive-strength = <8>;
+			bias-disable;
+		};
+	};
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	pinctrl-0 = <&qpic_snand_default_state>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	flash@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-engine = <&qpic_nand>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+	};
 };
 
 &usb_0_dwc3 {
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index 7f2e5cbf3bbb..d963dd2035dd 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -319,6 +319,33 @@ tcsr: syscon@1937000 {
 			reg = <0x01937000 0x21000>;
 		};
 
+		qpic_bam: dma-controller@7984000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x7984000 0x1c000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: spi@79b0000 {
+			compatible = "qcom,ipq9574-snand";
+			reg = <0x79b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+			<&gcc GCC_QPIC_AHB_CLK>,
+			<&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core", "aon", "iom";
+			dmas = <&qpic_bam 0>,
+				<&qpic_bam 1>,
+				<&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			status = "disabled";
+		};
+
 		sdhc_1: mmc@7804000 {
 			compatible = "qcom,ipq9574-sdhci", "qcom,sdhci-msm-v5";
 			reg = <0x07804000 0x1000>,
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
