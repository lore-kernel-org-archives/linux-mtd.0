Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BA2EC7EE43
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 23:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6/yvzyUBAI2EGqDp9NYb5HB5VYwBass4ajEoUaPegfA=; b=UXTgSCW0EGQDRIgi15MaytOItz
	aJvEkMc/Yy7CF8vi/xs8ymOjJgd/ZWcS16DMcctCB2Iq67ehQ7IbfKToHEncBAYWD7GutVmW5zIWF
	y+rfheDMddm9gpNU8Lu1ahuaQcOOlzCJy+3nU1t9Eo65mhCuFOcrINHufLB0FcoGN+ytWGdhtjZHj
	Qb3gaBzK0x/0E9HAD/gd3OLeU5sZ47XrnM7QbnD2PD4MBHaWgzkLjN/JwWPm15bLf7iEwgRf6Lfu/
	8mPXcr0o9ewrQnL2OGRW1w/DnLRNQ0YLH8l1TjjWQwElnp6cCMQqxom1YCdpb/QwkvpIH5ZinOQlp
	csCklngg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6gR5-003gya-0c;
	Tue, 06 Jun 2023 23:49:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6gR3-003gxp-1I
	for linux-mtd@bombadil.infradead.org;
	Tue, 06 Jun 2023 23:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=JD4n19ZUW+aDqTt3+8hAeBasSB/g9ah1D4QlbuExHlk=; b=QTK5xt9LNCjXZt2rcMnb4Vb82r
	3TNQf/hmEURV9fGWp34a5N0vnCmS8r/NWo9MvxzpZmfGNEtZFkGU1gMsT52sVBR24z+XOO9YD8vZw
	77/l9j32fAA+fzf+9ETZ4HJV+7I95u6RGBJRakfyoWdbA14zwnuQWnEY3MU21KbY+XR9qM8oP8sNO
	Dki3QXOd/D42NZajlYMBWRiLfE8bY+SMcivYfU48nT73g3csPmfeXnHqjeYlF1c1IySt48Hjl8Nmo
	DdNoiV0I+K6m0VGOx5L65eWY6Kd9E6PBfQhxnxu/pauF/0DmBQHJQHUqlA8jg/Xi1/U1JuO7F4i+U
	lQIZnfMg==;
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6fsr-004DBb-0N
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 23:16:44 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-75d4a4cf24aso371131885a.1
        for <linux-mtd@lists.infradead.org>; Tue, 06 Jun 2023 16:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1686093275; x=1688685275;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JD4n19ZUW+aDqTt3+8hAeBasSB/g9ah1D4QlbuExHlk=;
        b=VjLSTfhtieRhb50HP9Eo0eyhomVb9p4bcVtVviAND8ivxOzynS7SCzSVoX248StC8P
         MEbK1+KNfNsHleG6XwDYQxzQQ2de5htU5vCYLcGiXJWZFSw9/+/EvkTxnZB8Qp1mD29V
         4D2pyf0FBOugUaPxbXiH9hIH/4T3/yBvl/3Mk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686093275; x=1688685275;
        h=mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JD4n19ZUW+aDqTt3+8hAeBasSB/g9ah1D4QlbuExHlk=;
        b=OkMS/x/4ZTtepEB8mCDH+WfrHepXNiaKSdO1YJEoNbskmOA8UKmoSWsvc1s3CsuS6K
         ZqdJYQRvKl7EJy6QvtcDtN/dh+gwDTVuIXMczaZhKxCRw/iIV08x/Qmp/I+9l7fv4/nZ
         5JIwiabuFVWwwHGEYOPExP4XAP9UNHtglVyMWIUp/6Kp7V3BUZDXsj1HBnfRsiA9sqpP
         jM9yDLReSX2tDDE7uknkKyB7fmUJ1zVDrODs+oe3BSqg/pEZUl+hWvZzONaETaUVB9su
         FosTvEbVyHnJqx4GwZXDCseY/d8pHayTBRL+2MjXp8Q62q6zeMOm39yQ1dWMDT1rKkpE
         SO5Q==
X-Gm-Message-State: AC+VfDx84u2czCgXEz1c6+ugM9FUAcbENBVnUw1/LtCYVWHP9bL58rTw
	+27tnnB3PidrG7b4Jxzxkl8u7g==
X-Google-Smtp-Source: ACHHUZ6KeIVF23V+rneWN/zjyYjbxPIkpWgQ0wLFTcMkMUyJLesoZunx0euMzbhzby+nGgVwIKEh5A==
X-Received: by 2002:a05:620a:2856:b0:75b:23a0:d9f6 with SMTP id h22-20020a05620a285600b0075b23a0d9f6mr89094qkp.76.1686093275107;
        Tue, 06 Jun 2023 16:14:35 -0700 (PDT)
Received: from ubuntu-22.localdomain ([192.19.222.250])
        by smtp.gmail.com with ESMTPSA id x9-20020ae9e909000000b0075b23e55640sm5221519qkf.123.2023.06.06.16.14.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jun 2023 16:14:34 -0700 (PDT)
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
Subject: [PATCH 07/12] arm64: dts: broadcom: bcmbca: Add NAND controller node
Date: Tue,  6 Jun 2023 16:12:47 -0700
Message-Id: <20230606231252.94838-8-william.zhang@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606231252.94838-1-william.zhang@broadcom.com>
References: <20230606231252.94838-1-william.zhang@broadcom.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230607_001443_633420_53994CD7 
X-CRM114-Status: GOOD (  12.95  )
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
Content-Type: multipart/mixed; boundary="===============8850037859385500338=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============8850037859385500338==
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000bd867c05fd7e2e86"

--000000000000bd867c05fd7e2e86
Content-Transfer-Encoding: 8bit

Add support for Broadcom STB NAND controller in BCMBCA ARMv8 chip dts 
files.

Signed-off-by: William Zhang <william.zhang@broadcom.com>
---

 .../arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi |  5 ++++-
 .../arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi | 17 +++++++++++++++++
 .../boot/dts/broadcom/bcmbca/bcm63146.dtsi      | 17 +++++++++++++++++
 .../boot/dts/broadcom/bcmbca/bcm63158.dtsi      | 17 +++++++++++++++++
 .../arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi | 17 +++++++++++++++++
 .../arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi | 17 +++++++++++++++++
 .../arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi | 17 +++++++++++++++++
 .../arm64/boot/dts/broadcom/bcmbca/bcm94912.dts |  4 ++++
 .../boot/dts/broadcom/bcmbca/bcm963146.dts      |  4 ++++
 .../boot/dts/broadcom/bcmbca/bcm963158.dts      |  4 ++++
 .../arm64/boot/dts/broadcom/bcmbca/bcm96813.dts |  4 ++++
 .../arm64/boot/dts/broadcom/bcmbca/bcm96856.dts |  4 ++++
 .../arm64/boot/dts/broadcom/bcmbca/bcm96858.dts |  4 ++++
 13 files changed, 130 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
index 457805efb385..acfedff89d19 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4908.dtsi
@@ -591,16 +591,19 @@ hsspi: spi@1000{
 		nand-controller@1800 {
 			#address-cells = <1>;
 			#size-cells = <0>;
-			compatible = "brcm,nand-bcm63138", "brcm,brcmnand-v7.1", "brcm,brcmnand";
+			compatible = "brcm,nand-bcmbca", "brcm,brcmnand-v7.1", "brcm,brcmnand";
 			reg = <0x1800 0x600>, <0x2000 0x10>;
 			reg-names = "nand", "nand-int-base";
 			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "nand_ctlrdy";
+			brcm,nand-use-wp = <0>;
 			status = "okay";
 
 			nandcs: nand@0 {
 				compatible = "brcm,nandcs";
 				reg = <0>;
+				nand-on-flash-bbt;
+				brcm,nand-ecc-use-strap;
 			};
 		};
 
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi
index 46aa8c0b7971..7c611c1978ac 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm4912.dtsi
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
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi
index 7020f2e995e2..faf8b1198d8e 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63146.dtsi
@@ -118,6 +118,23 @@ hsspi: spi@1000 {
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
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
index 6a0242cbea57..24c344ed5dba 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm63158.dtsi
@@ -136,6 +136,23 @@ hsspi: spi@1000 {
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
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi
index 1a12905266ef..c3416146c946 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6813.dtsi
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
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
index f41ebc30666f..ab6866ab6107 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6856.dtsi
@@ -107,6 +107,23 @@ uart0: serial@640 {
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
 		hsspi: spi@1000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
index fa2688f41f06..390d5da67a3b 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm6858.dtsi
@@ -155,5 +155,22 @@ hsspi: spi@1000 {
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
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts
index e69cd683211a..4d1ea501e384 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm94912.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts
index db2c82d6dfd8..810b5a23da7b 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm963146.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts
index 25c12bc63545..3aaae5dbb568 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm963158.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts
index faba21f03120..6b167cc2af76 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm96813.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts
index 9808331eede2..d598cd618b57 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm96856.dts
@@ -32,3 +32,7 @@ &uart0 {
 &hsspi {
 	status = "okay";
 };
+
+&nand_controller {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts b/arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts
index 1f561c8e13b0..e50ddbf6f58c 100644
--- a/arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts
+++ b/arch/arm64/boot/dts/broadcom/bcmbca/bcm96858.dts
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


--000000000000bd867c05fd7e2e86
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
JOEwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZIhvcNAQkEMSIEICqVwmWBlaY0Nu5TifdgGvlM4qPc
w/AyykSinuKfVHKXMBgGCSqGSIb3DQEJAzELBgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTIz
MDYwNjIzMTQzNVowaQYJKoZIhvcNAQkPMVwwWjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsG
CWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkqhkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFl
AwQCATANBgkqhkiG9w0BAQEFAASCAQAhjnKbJ3jgV9kiAvbLRotnnNOP7Dm9GOx7dDl9EkWxmhPb
hrSpuUXLjbQbZZpSmd6AvWsXhFSzfc3oAAJ5fRaHwHxhbLdq2VpXUTOqYdXizCCEOrHr+Anu5hzs
oc+Ts+ze5OzPf/Qau7ALjp5aBSn7Sud2eM410wMEPoGW6L9vht1KNH83iiOxykCVQnv2z0s/1aFs
2yg+cyjtgPjrscW3oh+Vhn86u4/qN98v42nJCxNV9Hu28vOKLF6dUFKuxD66FrnXJmuJ9b63pZLN
AB713da/3p6OKyM/Fji1DUwtno+jvvrfbvMPdu9yYJb3GBKsjpnkzeH4jCvbD1PCIzT3
--000000000000bd867c05fd7e2e86--


--===============8850037859385500338==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============8850037859385500338==--

