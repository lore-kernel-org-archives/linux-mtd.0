Return-Path: <SRS0=Emx/=DU=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B94DEC433DF
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 05:16:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5EDD820872
	for <linux-mtd@archiver.kernel.org>; Tue, 13 Oct 2020 05:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1c0hNpDC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="oOyKJ1Qm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5EDD820872
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PgZtv7eU3JEq6NuTxZ4DycE14zXRfQbd4Uowhixe+74=; b=1c0hNpDCS00oKscZFpWOt98QB/
	BGW9a6EsKT4foTuMrrwy+ZCTsl6BXg0WusliOEGcpLbRw7tqtsC8YYrPy+hi0jiZv+7X8+pHvVqRB
	rsxoE92+9n4R/x57ebVJap90GpFUknCdp/ktKNxCFHh0nx/a4ogVcD946qwyaFFrrFwba3cLO9vMs
	fSjzwwaP9929TdrG2TOTOV5pM0RSdYot5AetsG6rlFUi+rQx9sm53Y+36qNarBG7TEH3kmSYV0BzV
	9pUXltivwre5r+hdO3szkmfbXuk73TH3mQPr9fm6TiVOySowzJU2GtnMQsyxBnBGxC1D1vyjYL9y4
	EZ2kgoOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kSCfG-0001nr-Ek; Tue, 13 Oct 2020 05:15:58 +0000
Received: from z5.mailgun.us ([104.130.96.5])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kSCfE-0001nD-Bq
 for linux-mtd@lists.infradead.org; Tue, 13 Oct 2020 05:15:57 +0000
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1602566156; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=mLzptLEzGt3ap5c0T2QJDDwVUFSR6Rbgs8XlUGD7pbo=;
 b=oOyKJ1Qmp5nosi7FzE3HYMl90aqKtntbyY8SJI8qF1vPspLt+tuif/u/Cnxe4pnby5C2UTWm
 S1krjeSLjPq/ZcXUjgSwEfd9CvElQaI2rfa8zxNA6azfnETqFOqAqSWHeRLWijcVswx99x3g
 ISE4KADWVdJU/14D/lLVwf7aodI=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyJkZDQ0ZiIsICJsaW51eC1tdGRAbGlzdHMuaW5mcmFkZWFkLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n04.prod.us-west-2.postgun.com with SMTP id
 5f85380b42f9861fb124dbbd (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 05:15:55
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id 36715C4339C; Tue, 13 Oct 2020 05:15:55 +0000 (UTC)
Received: from kathirav-linux.qualcomm.com
 (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: kathirav)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3D47CC433CB;
 Tue, 13 Oct 2020 05:15:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3D47CC433CB
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
Subject: [PATCH 3/3] arm64: dts: ipq6018: Add the QPIC peripheral nodes
Date: Tue, 13 Oct 2020 10:45:24 +0530
Message-Id: <1602566124-13456-4-git-send-email-kathirav@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
References: <1602566124-13456-1-git-send-email-kathirav@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201013_011556_455817_46255BD1 
X-CRM114-Status: GOOD (  14.61  )
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
index b31117a93995..6e68de1a0b0a 100644
--- a/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
+++ b/arch/arm64/boot/dts/qcom/ipq6018-cp01-c1.dts
@@ -62,3 +62,19 @@ spi_0_pins: spi-0-pins {
 		bias-pull-down;
 	};
 };
+
+&qpic_bam {
+	status = "ok";
+};
+
+&qpic_nand {
+	status = "ok";
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
