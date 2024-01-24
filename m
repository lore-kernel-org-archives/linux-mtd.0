Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 926C3C48260
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 03:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EAzuKC1ENVvAXThRKwTKmxT86LNbxQk3gd+fzawh6cU=; b=y2EyMcTQPuo6Zv
	zaNlG5CIABH/fwEHsAW0AJx/78UrD9jUI7CpXGMqF9FxPbVww1vitLCKKZ8qwKOrYgcJ97yOF/dM+
	5nc6jNHv9bjx02VPWHaNRa4KiORj1QLqdOyYRhEWRk6JFroaIJ5YgR5uZSXzrGrhjFP+TkKssmadM
	OPFIc4447nyjYR3uT3Bbb0xz1kS3ATrGIC9pdZPutaZH8hqdiGnfqgdYnJzFAdJ1Zz0QJKrxYvK2n
	hXmtE7SSzNBLgr6TqVctMR5RNOO0yyZ4cfLzuTzpi6DHOvbmRA3KrziCFvqxwj9UwYtVYEWliF9X3
	whIkOp50sUOzEkR/c1TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTbH-001Fil-1F;
	Wed, 24 Jan 2024 03:06:51 +0000
Received: from mail-ot1-f97.google.com ([209.85.210.97])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSTb0-001FXZ-2P
	for linux-mtd@lists.infradead.org;
	Wed, 24 Jan 2024 03:06:38 +0000
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-6ddeb015ec6so3544424a34.0
        for <linux-mtd@lists.infradead.org>; Tue, 23 Jan 2024 19:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1706065533; x=1706670333; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ThJa0h4fa0Qqrzqap7bg7YPhFAxFKY8FrPLl0QLp5r8=;
        b=h/xlUouN4UyILUujr9AKPEJR6Sb9jVCfoknehX25orOPjB9C3NiDydApLYpEL77yQc
         SjZAaUd/QC0cYq+I1JFGq23TmwBnRcgTiNmTIEzc88AiHb5RkK4qqU1URyw9emYC1LkN
         JJCGOjEPA9sfdowcMa4gKvLV+SszSIhfc1UOE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706065533; x=1706670333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ThJa0h4fa0Qqrzqap7bg7YPhFAxFKY8FrPLl0QLp5r8=;
        b=nL8SH/ce3/20RGqQhh0QWcfw1TDFTPBalBSWQgFLHM+PYT/6U+kzeGspwZlT44EHqt
         2M7bSmKVZe2LZTsPg7lzIRtRoFXHMyEGNCbR6j1zBwz0s0uS0LVF+w21yi0gk2WjCCpg
         yCZKXqIrWO6geG8Zq50XjpfRDdthzm/ELHlnuFBt11t4TigPpSqSrEdiaMFMmLYs+vGz
         rE2ba/4+aCVDd1bdIVIvdtkadbBia8Q2jdz2zEydbuLetnJBdG8SiSaLopvSxyvzs3Ff
         kwAHZg/b4yR/gNtMJssTNgQbDCXR5Tk9lNw1UXD0VfYq1d9qRryT21nuicCJqIjvi5PC
         opgQ==
X-Gm-Message-State: AOJu0Yz45xRh5HcXiG7AxvZq6bH5T4O6UmmhLNNRUMp9ybHkd1ZEIQ1v
	kQlIrw2H5ahYA5vNf7avDV2PfyHT1vrl9ceDTIbhhpZOEgrHIXnDTLxkwDsKTGnAzYvTrhC7oXf
	MsmweCwfG0pThtmerooJUElj8IMF2TA==
X-Google-Smtp-Source: AGHT+IGOJv4VmqhHKQ58MHbgQguDFk6gSt5vnWVA8ozPFeH+q78JxaJWfzyfQTlamkcygUhRcCMKi2l84hxm
X-Received: by 2002:a05:6830:168e:b0:6dd:e17e:f714 with SMTP id k14-20020a056830168e00b006dde17ef714mr1099039otr.27.1706065533728;
        Tue, 23 Jan 2024 19:05:33 -0800 (PST)
Received: from bcacpedev-irv-3.lvn.broadcom.net ([192.19.161.250])
        by smtp-relay.gmail.com with ESMTPS id c22-20020a056830349600b006dc7502beabsm455320otu.3.2024.01.23.19.05.32
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 23 Jan 2024 19:05:33 -0800 (PST)
X-Relaying-Domain: broadcom.com
From: David Regan <dregan@broadcom.com>
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
Subject: [PATCH v3 02/10] ARM: dts: broadcom: bcmbca: Add NAND controller node
Date: Tue, 23 Jan 2024 19:04:50 -0800
Message-Id: <20240124030458.98408-3-dregan@broadcom.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20240124030458.98408-1-dregan@broadcom.com>
References: <20240124030458.98408-1-dregan@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_190634_785985_99501F32 
X-CRM114-Status: GOOD (  10.93  )
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
Changes in v3: None
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
