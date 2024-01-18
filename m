Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 940B3C47DAF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 19:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9FdKZzSCCwDaUlP40zfYSUog6uLifmCYs5LzeTtTvI=; b=NDjOzQDQVqNceq
	B28lpgsGoF3LZoudJyhICqYPuThGBmUn7idbzzWX5q0yh2SmVWuw/1e+AovlR/Cqj21y3CSuHE+OV
	LKaZZoVr8NSzYH5C7jcEynp7xqof2TRC79fZfDMHk3Wbr4vIg0t3mjKnjocMpJKL7yFdje1bVhmM3
	64yyg4P375VhXRxvrDJNCe0QvmwKigfXxplX3u4MzmJ9NbT22taooq6Dq8H0Uq6bUz/qjJzVnGeCG
	TYmXty6H5Y0QZgmxlC0NW+K2JnXsoaqXLPTHoPMZTw9eqnpySH7gpyTPPii/kmghg+LQ0/rOBWs2d
	n2iA8IeVk6gKmzJyUowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYTJ-003gOg-0O;
	Thu, 18 Jan 2024 19:54:41 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQYT7-003gFO-0n
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jan 2024 19:54:34 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-28be8ebcdc1so87195a91.0
        for <linux-mtd@lists.infradead.org>; Thu, 18 Jan 2024 11:54:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1705607666; x=1706212466; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=P7YdlaHtDicZ9S/nNPczTdCxtxFMN2pJg3+moTPaeDY=;
        b=SfK8Km3ChPduuGvOEp/UnTinqmlg541z+DS4Qk4NOtCOeBkFwNRGoN4MvrW5JWlQES
         XKmM9EkiaUx9zlG+8UpQtYIt0eB3EIUfRXpdpP5Ehu3gmtKTc0abEVOZALUxO47wyhqi
         wjIc7EbKEdZNfHVxhaMIjPulKvJyt3cyWlvcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705607666; x=1706212466;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P7YdlaHtDicZ9S/nNPczTdCxtxFMN2pJg3+moTPaeDY=;
        b=aY5ZgM+b9oVTNjhBNoZHTM8MYONeXMCu56G2uZROyuof/zuVmNGa1G6ihkCQCfS5+e
         wldtaT9FmqDamOO227zus6tfs4YDU671RYxSAKL/PSLzzCPyJ3m0y/5yVxKgFtA0sIBG
         kwEimcEWZfEKbnJEgDVn6o5AQuO0F/xTTtLV/3vnns0RB8xtn+kYAeXSaXoCLL57u3VZ
         t/gIdTcBttCPbUZPYNIDFLkk2ikuMWGeVMK+8hOPdOEfpfHhoK+ugs4CNXmAduB75IYj
         OxNyr5H+5q7kdIe78em5NV6x4HLFObjn0WgW6aVgzViesru3aYrXK0aE34YCpShEZtZ9
         2oIQ==
X-Gm-Message-State: AOJu0YyhDrwXL0zX3pxh5Cd5UNKzqqPT14rll7AExY36I7ufdhNEebwT
	7tZr0tp4JwtsPJ2gS1TvKmo51KnKMXkcey9WEAr3G9n7NZ3EqJb6NzMwy9LVUw==
X-Google-Smtp-Source: AGHT+IEoxUIUXKVf4ieGnqL9RGAv8SCgN30MM0zhDQgEa5AiaT4yw1zAbStUyQ7x7a1Q5OBDK+J3iA==
X-Received: by 2002:a17:90a:c292:b0:28d:280a:7e4e with SMTP id f18-20020a17090ac29200b0028d280a7e4emr1045900pjt.56.1705607666218;
        Thu, 18 Jan 2024 11:54:26 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp.gmail.com with ESMTPSA id rr12-20020a17090b2b4c00b0028d9b5d41edsm2263805pjb.38.2024.01.18.11.54.24
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 18 Jan 2024 11:54:25 -0800 (PST)
From: dregan@broadcom.com
To: dregan@broadcom.com,
	dregan@mail.com,
	miquel.raynal@bootlin.com,
	richard@nod.at,
	vigneshr@ti.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	computersforpeace@gmail.com,
	kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	william.zhang@broadcom.com,
	anand.gore@broadcom.com,
	kursad.oney@broadcom.com,
	florian.fainelli@broadcom.com,
	rafal@milecki.pl,
	bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com,
	baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org,
	dan.carpenter@linaro.org
Subject: [PATCH v2 02/10] ARM: dts: broadcom: bcmbca: Add NAND controller node
Date: Thu, 18 Jan 2024 11:53:48 -0800
Message-Id: <20240118195356.133391-3-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240118195356.133391-1-dregan@broadcom.com>
References: <20240118195356.133391-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_115429_354806_000066C8 
X-CRM114-Status: GOOD (  10.38  )
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

From: William Zhang <william.zhang@broadcom.com>

Add support for Broadcom STB NAND controller in BCMBCA ARMv7 chip dts
files.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
Reviewed-by: David Regan <dregan@broadcom.com>
---
Changes in v2: None
---
 arch/arm/boot/dts/broadcom/bcm47622.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm63138.dtsi    | 10 +++++++++-
 arch/arm/boot/dts/broadcom/bcm63148.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm63178.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6756.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6846.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6855.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm6878.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/broadcom/bcm947622.dts    |  4 ++++
 arch/arm/boot/dts/broadcom/bcm963138.dts    |  4 ++++
 arch/arm/boot/dts/broadcom/bcm963138dvt.dts | 12 +++++-------
 arch/arm/boot/dts/broadcom/bcm963148.dts    |  4 ++++
 arch/arm/boot/dts/broadcom/bcm963178.dts    |  4 ++++
 arch/arm/boot/dts/broadcom/bcm96756.dts     |  4 ++++
 arch/arm/boot/dts/broadcom/bcm96846.dts     |  4 ++++
 arch/arm/boot/dts/broadcom/bcm96855.dts     |  4 ++++
 arch/arm/boot/dts/broadcom/bcm96878.dts     |  4 ++++
 17 files changed, 165 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/broadcom/bcm47622.dtsi b/arch/arm/boot/dts/broadcom/bcm47622.dtsi
index 7cd38de118c3..55ff18043d96 100644
--- a/arch/arm/boot/dts/broadcom/bcm47622.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm47622.dtsi
@@ -138,6 +138,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg = <0x1800 0x600>, <0x2000 0x10>;
+			reg-names = "nand", "nand-int-base";
+			brcm,nand-use-wp = <0>;
+			status = "disabled";
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
+		};
+
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
diff --git a/arch/arm/boot/dts/broadcom/bcm63138.dtsi b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
index 4ef02283612b..3aaee1c6994e 100644
--- a/arch/arm/boot/dts/broadcom/bcm63138.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63138.dtsi
@@ -229,7 +229,15 @@ nand_controller: nand-controller@2000 {
 			reg-names = "nand", "nand-int-base";
 			status = "disabled";
 			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
-			interrupt-names = "nand";
+			interrupt-names = "nand_ctlrdy";
+			brcm,nand-use-wp = <0>;
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
 		};
 
 		serial@4400 {
diff --git a/arch/arm/boot/dts/broadcom/bcm63148.dtsi b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
index 24431de1810e..6ecd530a7225 100644
--- a/arch/arm/boot/dts/broadcom/bcm63148.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63148.dtsi
@@ -119,5 +119,22 @@ hsspi: spi@1000 {
 			num-cs = <8>;
 			status = "disabled";
 		};
+
+		nand_controller: nand-controller@2000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg = <0x2000 0x600>, <0xf0 0x10>;
+			reg-names = "nand", "nand-int-base";
+			brcm,nand-use-wp = <0>;
+			status = "disabled";
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm63178.dtsi b/arch/arm/boot/dts/broadcom/bcm63178.dtsi
index 3f9aed96babf..742991fc7544 100644
--- a/arch/arm/boot/dts/broadcom/bcm63178.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm63178.dtsi
@@ -129,6 +129,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg = <0x1800 0x600>, <0x2000 0x10>;
+			reg-names = "nand", "nand-int-base";
+			brcm,nand-use-wp = <0>;
+			status = "disabled";
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
+		};
+
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
diff --git a/arch/arm/boot/dts/broadcom/bcm6756.dtsi b/arch/arm/boot/dts/broadcom/bcm6756.dtsi
index 1d8d957d65dd..0f08b99d93c2 100644
--- a/arch/arm/boot/dts/broadcom/bcm6756.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6756.dtsi
@@ -139,6 +139,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg = <0x1800 0x600>, <0x2000 0x10>;
+			reg-names = "nand", "nand-int-base";
+			brcm,nand-use-wp = <0>;
+			status = "disabled";
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
+		};
+
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
diff --git a/arch/arm/boot/dts/broadcom/bcm6846.dtsi b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
index cf92cf8c4693..856fd2352cca 100644
--- a/arch/arm/boot/dts/broadcom/bcm6846.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6846.dtsi
@@ -119,5 +119,22 @@ hsspi: spi@1000 {
 			num-cs = <8>;
 			status = "disabled";
 		};
+
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg = <0x1800 0x600>, <0x2000 0x10>;
+			reg-names = "nand", "nand-int-base";
+			brcm,nand-use-wp = <0>;
+			status = "disabled";
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
+		};
 	};
 };
diff --git a/arch/arm/boot/dts/broadcom/bcm6855.dtsi b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
index 52d6bc89f9f8..ad6f63a92c3a 100644
--- a/arch/arm/boot/dts/broadcom/bcm6855.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6855.dtsi
@@ -129,6 +129,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg = <0x1800 0x600>, <0x2000 0x10>;
+			reg-names = "nand", "nand-int-base";
+			brcm,nand-use-wp = <0>;
+			status = "disabled";
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
+		};
+
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
diff --git a/arch/arm/boot/dts/broadcom/bcm6878.dtsi b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
index 2c5d706bac7e..540aac1b82f9 100644
--- a/arch/arm/boot/dts/broadcom/bcm6878.dtsi
+++ b/arch/arm/boot/dts/broadcom/bcm6878.dtsi
@@ -120,6 +120,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			reg = <0x1800 0x600>, <0x2000 0x10>;
+			reg-names = "nand", "nand-int-base";
+			brcm,nand-use-wp = <0>;
+			status = "disabled";
+
+			nandcs: nand@0 {
+				compatible = "brcm,nandcs";
+				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
+			};
+		};
+
 		uart0: serial@12000 {
 			compatible = "arm,pl011", "arm,primecell";
 			reg = <0x12000 0x1000>;
diff --git a/arch/arm/boot/dts/broadcom/bcm947622.dts b/arch/arm/boot/dts/broadcom/bcm947622.dts
index 93b8ce22678d..22e3c4508e1a 100644
--- a/arch/arm/boot/dts/broadcom/bcm947622.dts
+++ b/arch/arm/boot/dts/broadcom/bcm947622.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm963138.dts b/arch/arm/boot/dts/broadcom/bcm963138.dts
index 1b405c249213..450289d47dc7 100644
--- a/arch/arm/boot/dts/broadcom/bcm963138.dts
+++ b/arch/arm/boot/dts/broadcom/bcm963138.dts
@@ -29,3 +29,7 @@ &serial0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm963138dvt.dts b/arch/arm/boot/dts/broadcom/bcm963138dvt.dts
index b5af61853a07..22107d14a120 100644
--- a/arch/arm/boot/dts/broadcom/bcm963138dvt.dts
+++ b/arch/arm/boot/dts/broadcom/bcm963138dvt.dts
@@ -33,14 +33,12 @@ &serial1 {
 
 &nand_controller {
 	status = "okay";
+};
 
-	nand@0 {
-		compatible = "brcm,nandcs";
-		reg = <0>;
-		nand-ecc-strength = <4>;
-		nand-ecc-step-size = <512>;
-		brcm,nand-oob-sectors-size = <16>;
-	};
+&nandcs {
+	nand-ecc-strength = <4>;
+	nand-ecc-step-size = <512>;
+	brcm,nand-oob-sector-size = <16>;
 };
 
 &ahci {
diff --git a/arch/arm/boot/dts/broadcom/bcm963148.dts b/arch/arm/boot/dts/broadcom/bcm963148.dts
index 1f5d6d783f09..aa08b473c7cd 100644
--- a/arch/arm/boot/dts/broadcom/bcm963148.dts
+++ b/arch/arm/boot/dts/broadcom/bcm963148.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm963178.dts b/arch/arm/boot/dts/broadcom/bcm963178.dts
index d036e99dd8d1..c0f504ac43a4 100644
--- a/arch/arm/boot/dts/broadcom/bcm963178.dts
+++ b/arch/arm/boot/dts/broadcom/bcm963178.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm96756.dts b/arch/arm/boot/dts/broadcom/bcm96756.dts
index 8b104f3fb14a..2ce998f2b84f 100644
--- a/arch/arm/boot/dts/broadcom/bcm96756.dts
+++ b/arch/arm/boot/dts/broadcom/bcm96756.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm96846.dts b/arch/arm/boot/dts/broadcom/bcm96846.dts
index 55852c229608..f4b9a07370ee 100644
--- a/arch/arm/boot/dts/broadcom/bcm96846.dts
+++ b/arch/arm/boot/dts/broadcom/bcm96846.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm96855.dts b/arch/arm/boot/dts/broadcom/bcm96855.dts
index 2ad880af2104..5c94063bceaf 100644
--- a/arch/arm/boot/dts/broadcom/bcm96855.dts
+++ b/arch/arm/boot/dts/broadcom/bcm96855.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/broadcom/bcm96878.dts b/arch/arm/boot/dts/broadcom/bcm96878.dts
index b7af8ade7a9d..910f7e125bad 100644
--- a/arch/arm/boot/dts/broadcom/bcm96878.dts
+++ b/arch/arm/boot/dts/broadcom/bcm96878.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
-- 
2.37.3


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
