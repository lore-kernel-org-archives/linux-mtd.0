Return-Path: <SRS0=yokd=EK=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E587C2D0A3
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 16:35:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9AE56206CA
	for <linux-mtd@archiver.kernel.org>; Wed,  4 Nov 2020 16:35:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g5hE9oBZ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="BWPkh50U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9AE56206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nNtQHhVQ7X8pAmxGPn3QCBeZDI/3tesXd5oKXCaamn0=; b=g5hE9oBZjavQc53JSZQlZzhAhe
	Ne2gyN0b82aHaFK/ZFsJR1328XKWgK34X3BqiaiHXDXhbwI5xHho1QtaARYUiRPUfq4oxqbg3eAsj
	hKr28VtULsiBK8qWwB00PvBXxgap+bKrewEgbDQ/cnawS2E2h0EPj236zqISqIA/4/GA4amuSO2/b
	u/vINIlP12xauZO5KYRTh5fnImxMtSeTlIswBP7StHMj1VsMwssSEXhZChV2eaws0aqpR1937eV0R
	CYpm/xE7aVmYl2YJPVI9+Opyfjd+eh6DRQt3qtk+74/HpFKe6mFzmS5mpR5C2lJ5F9m4UgAjRkRlE
	AkHhfFVQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kaLkh-0004mA-Cu; Wed, 04 Nov 2020 16:35:15 +0000
Received: from m42-4.mailgun.net ([69.72.42.4])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kaLka-0004hl-Mz
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2020 16:35:13 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1604507712; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=A7JCIGqgZ7YxmwQMyHpFCOWujVa32j1DWMzu/rWMlfM=;
 b=BWPkh50UHrxYt8bOegSrNpinr6kMKwbVX6u30kic2YT9eqlNB0JVX3noigs7zpgsVPLRyEDz
 1/fnT1+l3IGRbcQ8peHoewgKImy3/ogoDgnm2S6l5uzVbBa6UazvTr7wDCYfkzNSRxLtD3gL
 VgpccqyRhIeFW4jCEz5pFGZ1H2A=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa2d81b552e53bb435bf254 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 04 Nov 2020 16:34:34
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 49CEDC433C8; Wed,  4 Nov 2020 16:34:34 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kathirav)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 7E954C43382;
 Wed,  4 Nov 2020 16:34:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7E954C43382
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org;
 spf=fail smtp.mailfrom=kathirav@codeaurora.org
From: Kathiravan T <kathirav@codeaurora.org>
To: agross@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
 vigneshr@ti.com, robh+dt@kernel.org, sivaprak@codeaurora.org,
 peter.ujfalusi@ti.com, boris.brezillon@collabora.com,
 linux-arm-msm@vger.kernel.org, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH V2 1/1] arm64: dts: ipq6018: Add the QPIC peripheral nodes
Date: Wed,  4 Nov 2020 22:04:13 +0530
Message-Id: <1604507653-24999-2-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1604507653-24999-1-git-send-email-kathirav@codeaurora.org>
References: <1604507653-24999-1-git-send-email-kathirav@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201104_113513_196061_61EBD881 
X-CRM114-Status: GOOD (  15.11  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: kathirav@codeaurora.org,
 Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Add the QPIC BAM and QPIC NAND controller support and
enable the same in board DTS file.

Co-developed-by: Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>
Signed-off-by: Anusha Canchi Ramachandra Rao <anusharao@codeaurora.org>
Signed-off-by: Kathiravan T <kathirav@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts | 16 ++++++++
 arch/arm64/boot/dts/qcom/ipq6018.dtsi        | 41 ++++++++++++++++++++
 2 files changed, 57 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
index e8eaa958c199..99cefe88f6f2 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -62,3 +62,19 @@ spi_0_pins: spi-0-pins {
 		bias-pull-down;
 	};
 };
+
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
+		nand-ecc-strength = <4>;
+		nand-ecc-step-size = <512>;
+		nand-bus-width = <8>;
+	};
+};
diff --git a/arch/arm64/boot/dts/qcom/ipq6018.dtsi b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
index 1aa8d8579463..6b13e390ee29 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq6018.dtsi
@@ -173,6 +173,17 @@ serial_3_pins: serial3-pinmux {
 				drive-strength = <8>;
 				bias-pull-down;
 			};
+
+			qpic_pins: qpic-pins {
+				pins = "gpio1", "gpio3", "gpio4",
+					"gpio5", "gpio6", "gpio7",
+					"gpio8", "gpio10", "gpio11",
+					"gpio12", "gpio13", "gpio14",
+					"gpio15", "gpio17";
+				function = "qpic_pad";
+				drive-strength = <8>;
+				bias-disable;
+			};
 		};
 
 		gcc: gcc@1800000 {
@@ -274,6 +285,36 @@ i2c_1: i2c@78b7000 { /* BLSP1 QUP2 */
 			status = "disabled";
 		};
 
+		qpic_bam: dma@7984000 {
+			compatible = "qcom,bam-v1.7.0";
+			reg = <0x07984000 0x1a000>;
+			interrupts = <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "iface_clk", "bam_clk";
+			#dma-cells = <1>;
+			qcom,ee = <0>;
+			status = "disabled";
+		};
+
+		qpic_nand: nand@79b0000 {
+			compatible = "qcom,ipq6018-nand";
+			reg = <0x079b0000 0x10000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&gcc GCC_QPIC_CLK>,
+				 <&gcc GCC_QPIC_AHB_CLK>;
+			clock-names = "core", "aon";
+
+			dmas = <&qpic_bam 0>,
+				<&qpic_bam 1>,
+				<&qpic_bam 2>;
+			dma-names = "tx", "rx", "cmd";
+			pinctrl-0 = <&qpic_pins>;
+			pinctrl-names = "default";
+			status = "disabled";
+		};
+
 		intc: interrupt-controller@b000000 {
 			compatible = "qcom,msm-qgic2";
 			interrupt-controller;
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
