Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03989C46CD3
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Dec 2023 13:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uQu6b8KmHveO6lmPqXNTw/GLIRvIpARHWqJjjHdiEWE=; b=mEqXlr6a8zwRDh
	7QbPYbOYf33hPK/z3NQxblZTKiwbR23TPhmeoGjse6QJWkautsAQivSBI/52CwsMjMDRg4MAatFbJ
	fiYrDf416gbmmg9iK8ZOGbgeJKHnzw6TiRWFH75Xs7vY3UaIeRYdQlztOa1kFWQSCwGOdz4cSJme0
	zbTAIIvZ2eXkzE0nPZFlHheQX3iCh7MIRRcRaL3phdvHwCQ0WMV9Y/0w3CaU9jWMX8dpg+XTn/ZDI
	PPfliU3s0FCjQC9G8t/FWkCrJlni8tCm3DN3y7b7yWDQQ8AWX+sKZNDF3y6D51R0rni3kKoJ+WnKM
	PSiyiNuRORduI4mlDVqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDLX-00An5z-2C;
	Mon, 18 Dec 2023 13:07:47 +0000
Received: from mout.gmx.net ([212.227.15.18])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rFDLT-00An2P-0k;
	Mon, 18 Dec 2023 13:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=s31663417; t=1702904843; x=1703509643; i=wahrenst@gmx.net;
	bh=eWQKR2FtSC0mAYUpjLMP4NNSyJU/Xf/aGfPCIB1TQFw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=ed5//+cAG8mZsnk2B11Pd7SVJ8wEjU7QqfvYzWiliTGc/yyEamU7VP9WTe0pM2BS
	 Uln2nnV9UJfTMxJldPVm3C6Wd25rY19ibTH989Ch/fCYdmQZxZVdXGgLQBZLMtzyQ
	 z3LlGa4C0WgMQYFOCfO2Y4oek43KnRrjCngECi0kXuTwHN1szWvqzWxbdhycrlbml
	 CYM/CVteg4Q0V+Wyaj1tgPanLOJVYEc3UX/q4WTEr+csQUTw3KiueyViDHtL1LcBc
	 3Th/M0ujpYmtKm2sUib4Z6aF91r9Zn84/EXOUyKEYupCfXOc6wwlVoBMBMkCLKHP6
	 9WxZgIb7r/+BP1tKuw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from stefanw-SCHENKER ([37.4.248.43]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N3bSj-1r7LZY0AFP-010Z6P; Mon, 18
 Dec 2023 14:07:23 +0100
From: Stefan Wahren <wahrenst@gmx.net>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Han Xu <han.xu@nxp.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Marek Vasut <marex@denx.de>,
	=?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
	linux-imx@nxp.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Stefan Wahren <wahrenst@gmx.net>
Subject: [PATCH RFT 2/2] ARM: dts: mxs: imx28: Fix NAND hierarchy description
Date: Mon, 18 Dec 2023 14:06:56 +0100
Message-Id: <20231218130656.9020-2-wahrenst@gmx.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231218130656.9020-1-wahrenst@gmx.net>
References: <20231218130656.9020-1-wahrenst@gmx.net>
MIME-Version: 1.0
X-Provags-ID: V03:K1:nYVZsxOZtPW24WMzXP6O5WRlqpD7PEDcnsr6JMLaxiLZgFnyiFi
 IclrqBeUyjmV7jnQrB5bOPlcZL0wVjlXp/AmOC1aLdENtjeXiTH3U3ijb0x0kyUcln0PD4H
 A3CX0CwWpnYI8h7Ifb7AXv/VKYkLSj3PjzjRjEewXeN7XnNAMu6awuy3lr2G8FbDNjuDzB1
 /CjmrdDafoHwRFHH2013Q==
UI-OutboundReport: notjunk:1;M01:P0:sewIBT55R3c=;yrRpFoVRA3+n4q1ty0y6h5Jn1Cl
 avaPbc8Ud1AXkfEWccQDI4Yffx8AGfb1hJRQZ4WluChhIJOBwtd7RaND6bdmVnxoYhTSs7EZL
 koW/KF2AMTBygXP1Ixbw/ARw4amQhmEL8scN1KhYLXM6/9Dayl70wKeVum/nrlsBwuQQSqJ9F
 ZV5jXTcv8Hl2XWAMFWd4kpwwWr9/K6fTMkYly8stK7YuTYXMR6LrcUmOOK5L0A6sW8TdANAfd
 GDZz2OCL6+2HvkzMaKFHJv4xi1HLJwCMMes7BPGeOhqhb312ij3y3H8EaLidEDRjOiYDGgOsu
 78BbcwzSwcHFObJ/gjvGuOWWZ6VrN5muRSD+V4Lc6DjDm1q0CVapAqR4dDzKEeATnejC58MEj
 YhTamBUtz21ZJ427ifRXhDw/KHJ3G05GWMyApXSZUBJwYG3/MybaSRvMMcXfEYfPfvp5JDCX6
 rQ7Nm7bd9N2tInVMUk71D/0H7C+gwZ6NVcckjNSdkFkQClWQ2+WvqhJPrwH+vp9CzhAab/xBm
 GQgu5rRRENX3pVVA2pY7BRG+BUXWi+CYhdmgUhGJV3aIj3qBzZQ18FCXJEbf9/EyImHq1R8kY
 Ir/pD+Q6qldC3pFmXhFqJ5+Cm1+CunB04I54D6DQpi3TwOrl6EY5k3mTi3B1vzjSqxfGv1LnP
 JZ7m3X+KmpM2Omh5zqxqrrqpXCFxvrez0cg8P+OpzpQSSTk+tbvWnx+e4OnYwrC6NnV7DTZgV
 gAMo+6CqYAV5GWqp9W0De1fr0O9ILYM3WfFke/aZXg7CP+J45g5Wknod86gBp32sQdBubS7JT
 9CeDN3UaHlnGNDahFNji1RbtGZw573y71i80a1LfSBaKWVR+Cm5iLnJvUCX7FIx3ugQLBhI4P
 +orqKBzFzIheDUX9FXy1hTMsPq6jj5Jow2rYEvgflpvNRiTV1E9uC2SkB9uD0eGGQ3LT5bmGW
 cTR5ZQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231218_050743_574334_86298464 
X-CRM114-Status: GOOD (  13.18  )
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

The size-cells for GPMI are wrong in imx28.dtsi, which causes the
following warning:

    nand-controller@8000c000: #size-cells:0:0: 0 was expected

The reason for this is the definition of the partitions directly
below the nand controller node. According to nand-controller.yaml
the NAND chip must be defined as a child of the controller. Even
the fixed partitions must be kept in a partitions container.

Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
---

Hi,
unfortunately i don't have access to MSR M28CU3 or an Armadeus Systems APF28
so it would be nice if someone can give a try.

 arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts  | 64 +++++++++++++---------
 arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi   |  2 -
 arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts | 28 ++++++----
 arch/arm/boot/dts/nxp/mxs/imx28.dtsi       |  2 +-
 4 files changed, 56 insertions(+), 40 deletions(-)

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts b/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts
index 98672932e41b..10bfac31f672 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-apf28.dts
@@ -27,39 +27,49 @@ &gpmi {
 	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
 	status = "okay";

-	partition@0 {
-		label = "u-boot";
-		reg = <0x0 0x300000>;
-	};
+	nand@0 {
+		reg = <0>;

-	partition@300000 {
-		label = "env";
-		reg = <0x300000 0x80000>;
-	};
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;

-	partition@380000 {
-		label = "env2";
-		reg = <0x380000 0x80000>;
-	};
+			partition@0 {
+				label = "u-boot";
+				reg = <0x0 0x300000>;
+			};

-	partition@400000 {
-		label = "dtb";
-		reg = <0x400000 0x80000>;
-	};
+			partition@300000 {
+				label = "env";
+				reg = <0x300000 0x80000>;
+			};

-	partition@480000 {
-		label = "splash";
-		reg = <0x480000 0x80000>;
-	};
+			partition@380000 {
+				label = "env2";
+				reg = <0x380000 0x80000>;
+			};

-	partition@500000 {
-		label = "kernel";
-		reg = <0x500000 0x800000>;
-	};
+			partition@400000 {
+				label = "dtb";
+				reg = <0x400000 0x80000>;
+			};
+
+			partition@480000 {
+				label = "splash";
+				reg = <0x480000 0x80000>;
+			};
+
+			partition@500000 {
+				label = "kernel";
+				reg = <0x500000 0x800000>;
+			};

-	partition@d00000 {
-		label = "rootfs";
-		reg = <0xd00000 0xf300000>;
+			partition@d00000 {
+				label = "rootfs";
+				reg = <0xd00000 0xf300000>;
+			};
+		};
 	};
 };

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
index 66facef10ba9..54b0f715f091 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28.dtsi
@@ -24,8 +24,6 @@ reg_3p3v: regulator-0 {
 };

 &gpmi {
-	#address-cells = <1>;
-	#size-cells = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
 	status = "okay";
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
index 34b4d3246db1..d069ac907490 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-m28cu3.dts
@@ -93,21 +93,29 @@ &duart {
 };

 &gpmi {
-	#address-cells = <1>;
-	#size-cells = <1>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&gpmi_pins_a &gpmi_status_cfg>;
 	status = "okay";

-	partition@0 {
-		label = "gpmi-nfc-0-boot";
-		reg = <0x00000000 0x01400000>;
-		read-only;
-	};
+	nand@0 {
+		reg = <0>;

-	partition@1 {
-		label = "gpmi-nfc-general-use";
-		reg = <0x01400000 0x0ec00000>;
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "gpmi-nfc-0-boot";
+				reg = <0x00000000 0x01400000>;
+				read-only;
+			};
+
+			partition@1 {
+				label = "gpmi-nfc-general-use";
+				reg = <0x01400000 0x0ec00000>;
+			};
+		};
 	};
 };

diff --git a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
index 4817fba2d938..9655403b7f90 100644
--- a/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
+++ b/arch/arm/boot/dts/nxp/mxs/imx28.dtsi
@@ -99,7 +99,7 @@ perfmon: perfmon@80006000 {
 			gpmi: nand-controller@8000c000 {
 				compatible = "fsl,imx28-gpmi-nand";
 				#address-cells = <1>;
-				#size-cells = <1>;
+				#size-cells = <0>;
 				reg = <0x8000c000 0x2000>, <0x8000a000 0x2000>;
 				reg-names = "gpmi-nand", "bch";
 				interrupts = <41>;
--
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
