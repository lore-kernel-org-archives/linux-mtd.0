Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BA6EC00142
	for <linux-mtd@archiver.kernel.org>; Tue, 31 Oct 2023 12:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6yLdG0ELckfqnibuDr7rLwWfiAt+9+au4dyVadsN0uk=; b=Puai2sagjhFbyQ
	pagmP/kw8U7DVu7oorVrVsdPFgcvTpx4ne8J1JnQVg6s6G+3FwtmyDxpcf3lY2sqdlQ69WR9uj2Bt
	DwruJ01wSpWYuMtAWNBsJRy7ReE4dn4AWIaWp4P5GONW9XfLyPsw0dpfPPKNzGyQeBPdsqfpZPaIo
	Ff3NFKzTwEueU1glz2aVkKGJF3hOQtKGkZlMawyFTbh2/qx0iNX972swsHQVpdfAlKwG9HT87Y362
	WegDSiJteJevkV4dYR+tdCvVnjmVcb2MbFJEMYosxkyk6oM/5Tka8qUoM6zAk+nMxT+pDAODM3BFT
	QaOj4i3NhKUNLTWENIRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qxnT5-005EsT-1T;
	Tue, 31 Oct 2023 12:03:35 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qxnSy-005Epf-20
	for linux-mtd@lists.infradead.org;
	Tue, 31 Oct 2023 12:03:31 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39VA9RQ1028243;
	Tue, 31 Oct 2023 12:03:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=qcppdkim1;
 bh=qtUqTgzQz/X6OXajNpTGiJjqSqC/Bp2kFW5ZPsnmIdI=;
 b=U+0xTrYb4INDqcogLq0XdzDTFVVJVXNCRmTVFzjimW26Oe1DB+8b4zcvUO9Db6vTpit/
 6nEZHk7sogaJ2bCHztPKHx4qKKzlC/Yr212BBFzCJ1bB8FthhORl6lgV3UQYrGIv9f19
 vKZrNN5RXYCXL9no/bu5phETw1zhvJ94Pc42ElUw0ChGFPL4u+ZmY2ABwqWn84mAA41N
 ej67webd1SqT+6BXWhGBZVj/dUYeGJe2cKQ0hhIUBsyKjfXu1yRXeuiYsWHrK8ya6VRb
 iXeEHC9sWBnVNL4w0LawrcLhRxoooTpe2/Dptsfj0MVp7xrv5miNFCTuTp/AkkkzK9In nQ== 
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u2mcyhp8h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:03:16 +0000
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 39VC3D92005310;
	Tue, 31 Oct 2023 12:03:13 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 3u0uckvvpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:03:13 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 39VC3AjH005252;
	Tue, 31 Oct 2023 12:03:13 GMT
Received: from hu-devc-blr-u22-a.qualcomm.com (hu-mdalam-blr.qualcomm.com [10.131.36.157])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 39VC3Dp3005300
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 31 Oct 2023 12:03:13 +0000
Received: by hu-devc-blr-u22-a.qualcomm.com (Postfix, from userid 466583)
	id 3F0E94162D; Tue, 31 Oct 2023 17:33:12 +0530 (+0530)
From: Md Sadre Alam <quic_mdalam@quicinc.com>
To: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, conor+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, miquel.raynal@bootlin.com,
        richard@nod.at, vigneshr@ti.com, broonie@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-spi@vger.kernel.org, quic_srichara@quicinc.com,
        qpic_varada@quicinc.com
Cc: quic_mdalam@quicinc.com
Subject: [RFC PATCH 5/5] arm64: dts: qcom: ipq9574: Add support for SPI nand
Date: Tue, 31 Oct 2023 17:33:07 +0530
Message-Id: <20231031120307.1600689-6-quic_mdalam@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
References: <20231031120307.1600689-1-quic_mdalam@quicinc.com>
MIME-Version: 1.0
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: PQfZ8XCUGpMR_GKZ7TRZR8wmCWmWjqrc
X-Proofpoint-ORIG-GUID: PQfZ8XCUGpMR_GKZ7TRZR8wmCWmWjqrc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-31_01,2023-10-31_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 mlxlogscore=888 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2310310094
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231031_050328_808739_3B3F2A12 
X-CRM114-Status: GOOD (  14.98  )
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

Add support for QPIC SPI NAND for IPQ9574

Signed-off-by: Md Sadre Alam <quic_mdalam@quicinc.com>
Signed-off-by: Sricharan R <quic_srichara@quicinc.com>
---
 arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts | 56 ++++++++++-----------
 arch/arm64/boot/dts/qcom/ipq9574.dtsi       | 30 ++++++++++-
 2 files changed, 57 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
index 1bb8d96c9a82..5e4200edb873 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
+++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433.dts
@@ -15,48 +15,48 @@ / {
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
-	sdc_default_state: sdc-default-state {
-		clk-pins {
+	qspi_nand_pins: qspi_nand_pins {
+		spi_clock {
 			pins = "gpio5";
-			function = "sdc_clk";
+			function = "qspi_clk";
 			drive-strength = <8>;
 			bias-disable;
 		};
 
-		cmd-pins {
+		qspi_cs {
 			pins = "gpio4";
-			function = "sdc_cmd";
+			function = "qspi_cs";
 			drive-strength = <8>;
 			bias-pull-up;
 		};
 
-		data-pins {
-			pins = "gpio0", "gpio1", "gpio2",
-			       "gpio3", "gpio6", "gpio7",
-			       "gpio8", "gpio9";
-			function = "sdc_data";
+		qspi_data {
+			pins = "gpio0", "gpio1", "gpio2";
+			function = "qspi_data";
 			drive-strength = <8>;
 			bias-pull-up;
 		};
 
-		rclk-pins {
-			pins = "gpio10";
-			function = "sdc_rclk";
-			drive-strength = <8>;
-			bias-pull-down;
-		};
+	};
+};
+
+&qpic_bam {
+	status = "okay";
+};
+
+&qpic_nand {
+	status = "okay";
+	pinctrl-0 = <&qspi_nand_pins>;
+	pinctrl-names = "default";
+	spi_nand: spi_nand@0 {
+		compatible = "spi-nand";
+		nand-ecc-engine = <&qpic_nand>;
+		reg = <0>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		spi-max-frequency = <8000000>;
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/ipq9574.dtsi b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
index b44acb1fac74..f9c21373f5e6 100644
--- a/arch/arm64/boot/dts/qcom/ipq9574.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq9574.dtsi
@@ -336,10 +336,38 @@ sdhc_1: mmc@7804000 {
 			status = "disabled";
 		};
 
+		qpic_bam: dma@7984000 {
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
+			compatible = "qcom,ipq9574-nand";
+			reg = <0x79b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+			<&gcc GCC_QPIC_AHB_CLK>,
+			<&gcc GCC_QPIC_IO_MACRO_CLK>;
+			clock-names = "core", "aon", "io_macro";
+			dmas = <&qpic_bam 0>,
+				<&qpic_bam 1>,
+				<&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			nand-ecc-engine = <&bch>;
+			status = "disabled";
+		};
+
 		bch: qpic_ecc {
 			compatible = "qcom,ipq9574-ecc";
 			status = "ok";
-		}
+		};
 
 		blsp_dma: dma-controller@7884000 {
 			compatible = "qcom,bam-v1.7.0";
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
