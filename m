Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6E5C77B7A
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Jun 2023 00:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RJbSoGN38aeLN55aXxhPAJY6rJj19ViGlSsrYGIWrQY=; b=Bsl+m7zJfPRBR9pIpk1/r+oJjT
	XQF0ZgHq0sJzd7NU9xvbX3VLKCNiGGiOcg7sfDrOAzEv3HyPjg8LoMxqL85ceRd1ODzNWRiyBf8+b
	EpigbRGM7Z52gtri02c4GuRn6WYbgBkteHUmxdD9r+eGHZBXyPZZNT0SWbTo4L0Ac8VLIdZsdKnDR
	/k+OGwHuW0IXFuSVQfV2ESEt8VjRHNPuUip6jrd0ljeo+TKW52z1rpG/GBBVOYRWUPwCn4uOrqYzi
	9FcDxg5Gp3z0tqme5tYSs0ajGhggMjDQ45IpFrtfgeoDO4oEZ5Sh2hE7BCROglS2g/bf5Qet87yJ/
	1afWJMfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6gpp-003kIh-0k;
	Wed, 07 Jun 2023 00:15:33 +0000
Received: from mail-qk1-x729.google.com ([2607:f8b0:4864:20::729])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fsn-003b1f-1D
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 23:14:35 +0000
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-75d536afa43so1864685a.1
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 16:14:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1686093272; x=1688685272;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUq8Z/QuM4K+hDCOBjpLpgcyP4PWxPQ9sdp/mQx+YJ4=;
        b=UXtijV9hDTc/lvf9OxC2hl1AR+BzJP+0Dgi2fiEi7TQbEYPInGPrPxMr26AHidhOWL
         4XBP/0JitrdXHHd2D5OdgNchRE2pYyZt6qVQz2QITwYQjwAHmxMD9GPiea+OZ+a4W4Dw
         UL9vW85GN3RZSGwHsv6XMRU0vlE3oND2o7oI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686093272; x=1688685272;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eUq8Z/QuM4K+hDCOBjpLpgcyP4PWxPQ9sdp/mQx+YJ4=;
        b=IclaLsU+82p0E1tDT3BKKacj1APjOfQ+KSt/Qoxw/SK8lK6fxXsCjjDHXFCb56BE0p
         e60RiFC0G/IF12BRqr26SJa8/wQpAd79PHjMnwS1Luzbio4k9Art+L7kzXinQaRSJ8TA
         1jpF40CE4Op3D4mTTnE2MhVCV7+t/Yqjq40zVrkv9p+l7eUgBRPsO24Ns+EkOYlIYOMi
         F3yuNv3oR3Su1cps/i+EWlsBBRsVIP5CS9nE/XM573Es5JK87lxxKVNFCFVoMyFoMk1N
         56J8uuOABdHpKbZ1xoeJpbpNNQBLJKrwIKSKHIHrTFyfHLxGpk3k4Y0zLgIRsHluxgC2
         3+iQ==
X-Gm-Message-State: AC+VfDzDIIla94xnBK/gU03aUr72dUFnYTy+aIweJhZt3+SaoYTHAvKg
	fxZx8YbU0q0SnTpxcJU8GIiWmg==
X-Google-Smtp-Source: ACHHUZ7UPhvmRNMHcXdrkJqI8JS17E1EEsrRMwwmJCIryUsTnOQU0RQbScDemOX+9Ivbl/J8K8IKbg==
X-Received: by 2002:a37:e112:0:b0:75e:5141:f403 with SMTP id c18-20020a37e112000000b0075e5141f403mr12459qkm.23.1686093271889;
        Tue, 06 Jun 2023 16:14:31 -0700 (PDT)
Received: from ubuntu-22.localdomain ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id x9-20020ae9e909000000b0075b23e55640sm5221519qkf.123.2023.06.06.16.14.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 16:14:31 -0700 (PDT)
From: William Zhang <william.zhang@broadcom.com>
To: Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	Linux MTD List <linux-mtd@lists.infradead.org>
Cc: f.fainelli@gmail.com,
	rafal@milecki.pl,
	kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com,
	computersforpeace@gmail.com,
	anand.gore@broadcom.com,
	dregan@mail.com,
	kamal.dasu@broadcom.com,
	tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com,
	William Zhang <william.zhang@broadcom.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 06/12] ARM: dts: broadcom: bcmbca: Add NAND controller node
Date: Tue,  6 Jun 2023 16:12:46 -0700
Message-Id: <20230606231252.94838-7-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606231252.94838-1-william.zhang@broadcom.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_161433_421466_3430B78F 
X-CRM114-Status: GOOD (  13.65  )
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
Content-Type: multipart/mixed; boundary="===============8730619291948442849=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8730619291948442849==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000008d121e05fd7e2e01"

--0000000000008d121e05fd7e2e01
Content-Transfer-Encoding: 8bit

Add support for Broadcom STB NAND controller in BCMBCA ARMv7 chip dts 
files.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
---

 arch/arm/boot/dts/bcm47622.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm63138.dtsi    | 12 ++++++++++--
 arch/arm/boot/dts/bcm63148.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm63178.dtsi    | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm6756.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm6846.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm6855.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm6878.dtsi     | 17 +++++++++++++++++
 arch/arm/boot/dts/bcm947622.dts    |  4 ++++
 arch/arm/boot/dts/bcm963138.dts    |  4 ++++
 arch/arm/boot/dts/bcm963138dvt.dts | 12 +++++-------
 arch/arm/boot/dts/bcm963148.dts    |  4 ++++
 arch/arm/boot/dts/bcm963178.dts    |  4 ++++
 arch/arm/boot/dts/bcm96756.dts     |  4 ++++
 arch/arm/boot/dts/bcm96846.dts     |  4 ++++
 arch/arm/boot/dts/bcm96855.dts     |  4 ++++
 arch/arm/boot/dts/bcm96878.dts     |  4 ++++
 17 files changed, 166 insertions(+), 9 deletions(-)

diff --git a/arch/arm/boot/dts/bcm47622.dtsi b/arch/arm/boot/dts/bcm47622.dtsi
index cd25ed2757b7..401e1ce1da6d 100644
--- a/arch/arm/boot/dts/bcm47622.dtsi
+++ b/arch/arm/boot/dts/bcm47622.dtsi
@@ -137,6 +137,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
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
diff --git a/arch/arm/boot/dts/bcm63138.dtsi b/arch/arm/boot/dts/bcm63138.dtsi
index 93281c47c9ba..2c9939e775fb 100644
--- a/arch/arm/boot/dts/bcm63138.dtsi
+++ b/arch/arm/boot/dts/bcm63138.dtsi
@@ -224,12 +224,20 @@ hsspi: spi@1000 {
 		nand_controller: nand-controller@2000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.0", "brcm,brcmnand";
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.0", "brcm,brcmnand";
 			reg = <0x2000 0x600>, <0xf0 0x10>;
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
 
 		bootlut: bootlut@8000 {
diff --git a/arch/arm/boot/dts/bcm63148.dtsi b/arch/arm/boot/dts/bcm63148.dtsi
index ba7f265db121..de14d4564b14 100644
--- a/arch/arm/boot/dts/bcm63148.dtsi
+++ b/arch/arm/boot/dts/bcm63148.dtsi
@@ -118,5 +118,22 @@ hsspi: spi@1000 {
 			num-cs = <8>;
 			status = "disabled";
 		};
+
+		nand_controller: nand-controller@2000 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
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
diff --git a/arch/arm/boot/dts/bcm63178.dtsi b/arch/arm/boot/dts/bcm63178.dtsi
index d8268a1e889b..ae205408c5cd 100644
--- a/arch/arm/boot/dts/bcm63178.dtsi
+++ b/arch/arm/boot/dts/bcm63178.dtsi
@@ -128,6 +128,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
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
diff --git a/arch/arm/boot/dts/bcm6756.dtsi b/arch/arm/boot/dts/bcm6756.dtsi
index 49ecc1f0c18c..bbff47172dc1 100644
--- a/arch/arm/boot/dts/bcm6756.dtsi
+++ b/arch/arm/boot/dts/bcm6756.dtsi
@@ -138,6 +138,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
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
diff --git a/arch/arm/boot/dts/bcm6846.dtsi b/arch/arm/boot/dts/bcm6846.dtsi
index fbc7d3a5dc5f..26a36a577b44 100644
--- a/arch/arm/boot/dts/bcm6846.dtsi
+++ b/arch/arm/boot/dts/bcm6846.dtsi
@@ -118,5 +118,22 @@ hsspi: spi@1000 {
 			num-cs = <8>;
 			status = "disabled";
 		};
+
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
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
diff --git a/arch/arm/boot/dts/bcm6855.dtsi b/arch/arm/boot/dts/bcm6855.dtsi
index 5e0fe26530f1..0defcc10ca8a 100644
--- a/arch/arm/boot/dts/bcm6855.dtsi
+++ b/arch/arm/boot/dts/bcm6855.dtsi
@@ -128,6 +128,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
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
diff --git a/arch/arm/boot/dts/bcm6878.dtsi b/arch/arm/boot/dts/bcm6878.dtsi
index 96529d3d4dc2..f6ae07fe1b44 100644
--- a/arch/arm/boot/dts/bcm6878.dtsi
+++ b/arch/arm/boot/dts/bcm6878.dtsi
@@ -119,6 +119,23 @@ hsspi: spi@1000 {
 			status = "disabled";
 		};
 
+		nand_controller: nand-controller@1800 {
+			#address-cells = <1>;
+			#size-cells = <0>;
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
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
diff --git a/arch/arm/boot/dts/bcm947622.dts b/arch/arm/boot/dts/bcm947622.dts
index 93b8ce22678d..22e3c4508e1a 100644
--- a/arch/arm/boot/dts/bcm947622.dts
+++ b/arch/arm/boot/dts/bcm947622.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm963138.dts b/arch/arm/boot/dts/bcm963138.dts
index 1b405c249213..450289d47dc7 100644
--- a/arch/arm/boot/dts/bcm963138.dts
+++ b/arch/arm/boot/dts/bcm963138.dts
@@ -29,3 +29,7 @@ &serial0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm963138dvt.dts b/arch/arm/boot/dts/bcm963138dvt.dts
index b5af61853a07..f2140e512070 100644
--- a/arch/arm/boot/dts/bcm963138dvt.dts
+++ b/arch/arm/boot/dts/bcm963138dvt.dts
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
+	brcm,nand-oob-sectors-size = <16>;
 };
 
 &ahci {
diff --git a/arch/arm/boot/dts/bcm963148.dts b/arch/arm/boot/dts/bcm963148.dts
index 1f5d6d783f09..aa08b473c7cd 100644
--- a/arch/arm/boot/dts/bcm963148.dts
+++ b/arch/arm/boot/dts/bcm963148.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm963178.dts b/arch/arm/boot/dts/bcm963178.dts
index d036e99dd8d1..c0f504ac43a4 100644
--- a/arch/arm/boot/dts/bcm963178.dts
+++ b/arch/arm/boot/dts/bcm963178.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm96756.dts b/arch/arm/boot/dts/bcm96756.dts
index 8b104f3fb14a..2ce998f2b84f 100644
--- a/arch/arm/boot/dts/bcm96756.dts
+++ b/arch/arm/boot/dts/bcm96756.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm96846.dts b/arch/arm/boot/dts/bcm96846.dts
index 55852c229608..f4b9a07370ee 100644
--- a/arch/arm/boot/dts/bcm96846.dts
+++ b/arch/arm/boot/dts/bcm96846.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm96855.dts b/arch/arm/boot/dts/bcm96855.dts
index 2ad880af2104..5c94063bceaf 100644
--- a/arch/arm/boot/dts/bcm96855.dts
+++ b/arch/arm/boot/dts/bcm96855.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/bcm96878.dts b/arch/arm/boot/dts/bcm96878.dts
index b7af8ade7a9d..910f7e125bad 100644
--- a/arch/arm/boot/dts/bcm96878.dts
+++ b/arch/arm/boot/dts/bcm96878.dts
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


--0000000000008d121e05fd7e2e01
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
YDZuuBJwnyCzevMoPtVYPharioL5H3BRnQi8YoTXH7/uRo33dewYFm474yFjwwnt82TFtveVZkVq
6h4WIQ4wTcwFfET8zMkELnGzS5SHCl8sPD+lNxxJ1JDZYwIDAQABo4IB2zCCAdcwDgYDVR0PAQH/
BAQDAgWgMIGjBggrBgEFBQcBAQSBljCBkzBOBggrBgEFBQcwAoZCaHR0cDovL3NlY3VyZS5nbG9i
YWxzaWduLmNvbS9jYWNlcnQvZ3NnY2NyM3BlcnNvbmFsc2lnbjJjYTIwMjAuY3J0MEEGCCsGAQUF
BzABhjVodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9nc2djY3IzcGVyc29uYWxzaWduMmNhMjAy
MDBNBgNVHSAERjBEMEIGCisGAQQBoDIBKAowNDAyBggrBgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xv
YmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wCQYDVR0TBAIwADBJBgNVHR8EQjBAMD6gPKA6hjhodHRw
Oi8vY3JsLmdsb2JhbHNpZ24uY29tL2dzZ2NjcjNwZXJzb25hbHNpZ24yY2EyMDIwLmNybDAlBgNV
HREEHjAcgRp3aWxsaWFtLnpoYW5nQGJyb2FkY29tLmNvbTATBgNVHSUEDDAKBggrBgEFBQcDBDAf
BgNVHSMEGDAWgBSWM9HmWBdbNHWKgVZk1b5I3qGPzzAdBgNVHQ4EFgQUq65GzwZxydFHjjYEU/9h
xHhPWlwwDQYJKoZIhvcNAQELBQADggEBAA2hGG3JPAdGPH0ZdohGUCIVjKz+U+EFuIDbS6A/5jqX
VhYAxZlzj7tSjUIM7G7IhyfqPC46GKJ/4x+Amz1Z6YxNGy71L68kYD6hIbBcA5AM42QBUufly6Oa
/ppSz3WoflVyFFQ5YXniZ+eU+2/cdnYZg4aVUnFjimOF5o3NfMLzOkhQNxbaDjFUfUYD8hKmU6v4
0vUBj8KZ9Gi1LIagLKUREn8jku0lcLsRbnJ5Ey5ScajC/FESPyYWasOW8j8/1EoJksmhbYGKNS6C
urb/KlmDGfVrIRYDbL0ckhGQIP5c6L+kSQZ2sHnQK0e0WgIaZYxaPYeY5u0GLCOze+3vyRMxggJt
MIICaQIBATBrMFsxCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMTEwLwYD
VQQDEyhHbG9iYWxTaWduIEdDQyBSMyBQZXJzb25hbFNpZ24gMiBDQSAyMDIwAgwxuh2XG3FXRL1W
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEIHvLUr7m3a7ujemODYth3Zk1Q5uY
phzn6A3TyzBhnKSQMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDYwNjIzMTQzMlowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAUBfEQQmQRILv4FX6d6m786w8q+gtxfPMrVsNuI9rvXCSy
H77cFw1E/oT/V3ssto0CO7Oqm2IwBgDefWzUZoqPwogx+ZpTprJXcMsKuyuoLnC7elfmNKUrN4wO
ZpM2vA3hki272JkbXO2JRzweYbgNJLVEPLJlWRK+e3WkYkh8LPRUJUkRlL9sNITViSX8wHsHFmSU
6RCYC+VWl+szzM27qYaX3+DWFfE7GtXsfIQtVggmT8/8Nz9kFO+8tCjjTKD+6ad2dk3ndtz55fQH
zTXlLeKWdaGUEHApBSRI0B0Vjc+zSm6RF+HE4lSdLFeeHy9Y2iEyKcm9ckDt4CbseRxT
--0000000000008d121e05fd7e2e01--


--===============8730619291948442849==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8730619291948442849==--

