Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7538C3ABCD
	for <linux-mtd@archiver.kernel.org>; Sat, 10 May 2025 19:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/H20vt3t2AomJU6EeiIk8BNmzCx78qG9XHuJ2xJsYaw=; b=ee5ohbHdlxgSqr
	tMy371rflHCuOc6eLpbr50CVo+mkf1AjbGjf20xiF0v5bL959C/nzSOH2e6CYbbH2oGbhsHAJIsYs
	dy9LJcjOeO5gCUgvrzPIAyJdb1WFYhhC6ayv2Z0lB9V+UvioVBAbRotF3vCoTgolLEYyyd2kNfUaI
	B6ZwRJJwVZaWNKqQl8lf3hofA7R/yksGnQBMNqLsDrLswQh81OCsZKzzCTUz9y+S0Ibnf1T7Brv74
	sMN91VIvdZbek8KaN+QcwGHHy/RS3digkWpq0RgLcMT+OW6qLzObWAuwXoWDy+br8tUOwXj2AFSxT
	7qk6NqFr42lDG7SeZPcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDqEB-00000006KH7-2R0O;
	Sat, 10 May 2025 19:51:19 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDq6R-00000006JGa-26z8;
	Sat, 10 May 2025 19:43:20 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-73972a54919so3222532b3a.3;
        Sat, 10 May 2025 12:43:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746906198; x=1747510998; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SRddgwOHN1Vyi2V2faPWngR/Eu23tCZlOEXW/jSpDeM=;
        b=cP1jlkXdqWWbtrtkBoE/1TH/dDuWM3b+eWmBao2bOL+WdRg//+Fbb/PPik/QwUNNk9
         zuBaXwGU0dnItxHKrT7pW6XvAsJqVaNWl7eAOZ1JR9028TpwaQ5gdryAlvPqV1MQefBH
         Iw1mCPv66p1ld52tgPRyvAaYJMmbcm9IAWS294nNzXjJSUdFYIQMVesWc5h/iDOWkl7d
         Zkgg8aDvwe6C56GNCujOXLzm5p8gzoupIpIejTOEtDsq8QrqJsQTmopSc00M5ff/CnVX
         wheqObmS/6hXKQ8/FrIFh5+U1X5ffBUmyu+41iy3QBOzHAA+aXMz7C1duYaAzvHk0p7R
         1STA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746906198; x=1747510998;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SRddgwOHN1Vyi2V2faPWngR/Eu23tCZlOEXW/jSpDeM=;
        b=avYCOAZOx0VUv7482kegyOCrqxa0vcnG3LzIg/QPyXP6F9xxX2b72q7RZNsRTnW0nq
         KVejV4E8mdUBfX80q17dAfw19SAZDR6kvXT55HVUUoGw7s2bOgoAjqhBYd3IWscmE0b6
         oZ+QOg+zDU9/mil8zQoO64mzP9gna6a2ct4+KH3oYfca3HZh8LNFYt6CANl2UNWAgbEb
         bjGZXjw55uIXS9P2IsJ3JeVx84DSjKf0YPJsyUO9Rr9627Qhe+5rxPdHhhsMYiq82ifd
         yMz9NA9T02oYpK7QAD1Lopa0Fgk4wVtzVMNoORwScFFI2xABb+PEhKqgJzAhXUJaC1VP
         /Ptw==
X-Forwarded-Encrypted: i=1; AJvYcCUFXgJNHJ7k2+vHpO9vnoLn8ErSjhDkLPldf2OBL1LzN/OakSot+id67MjWOc0EP7hR/4O+7AdgLcU4PDXfhhT3@lists.infradead.org, AJvYcCX1aemiJVZdi+c6MBC5XLjMuG1/Ey1t1nEq1RJthrznR7Ynx0mhbhtsDeWcV7c8ly99QZxo1YrqQXU/@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9e9e+n5aH0n4XbKCqDqA7NLPs1CwjcI14nkGdgtmiXOwJZwsh
	Hx5xYC96MUKLRKm83UVZHtO1hi5kqgm7UyQyRWyjF9gRXiIMFENe
X-Gm-Gg: ASbGnctEZCFCyvt7HYmuQuTIYLwvjk1un7BXANmshpCBan2QKJa+PXwyaNfiN3kyTfu
	AE0vDT7But6JEgAaNkSoJYcyKo7tYb8GRKEd7l8twcOxpTbDLICtLCEZCd+bOCGI4+5cOlg5GH7
	VgS+/Y2hlrkqLXb2rrgmpTS7as3qCBgmhWmy06Xf87cQ++2Yd/tZG+geZvFzxf/azPbWL660434
	o43t9Rd8uuOj1HhDSCQs02IKgZbpuBO8Q4Lb9BeetAE9O6+J8RUYYuOMvM/ljS//wb+/JiXI8CM
	4T6H14qlIggLV2uHup/xeYUZusm+Sfyxhj3X4wZrbmxpbs6SmLNi0q2CDd1sUg8=
X-Google-Smtp-Source: AGHT+IH053WbjA3cvqj9iQ8a7h5v+mWrap4AkYe2w2/EzsXrjAunLV+dXYcLOr/NytKnX5MMq0uq+Q==
X-Received: by 2002:a05:6a20:e68d:b0:1ee:8435:6b69 with SMTP id adf61e73a8af0-215ababcab7mr11814578637.1.1746906198481;
        Sat, 10 May 2025 12:43:18 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2523e67d53sm2223670a12.19.2025.05.10.12.43.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 12:43:18 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Sat, 10 May 2025 23:42:23 +0400
Subject: [PATCH 3/3] ARM: dts: vt8500: Add serial flash controller and its
 clock
MIME-Version: 1.0
Message-Id: <20250510-wmt-sflash-v1-3-02a1ac6adf12@gmail.com>
References: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
In-Reply-To: <20250510-wmt-sflash-v1-0-02a1ac6adf12@gmail.com>
To: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746906149; l=13606;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=AqqaMB30uWeNBPi6eapQMsRaWN5WUqUZI3tfXltWrtU=;
 b=9HbS2d3KP67QxcLBqUs+Dm8Msny0saXPEgDQmen+dSuDYtQ20sj7w1/xe9rRlJJ9Pq67aMgon
 FcjxhBj1ydjDOsdRKTsBdSXp5hOVWTQJQ+SRtcLotX7oLt+TcTEnOcn
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_124319_553881_CF388546 
X-CRM114-Status: GOOD (  10.72  )
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

The serial flash controller resides at the same MMIO address in all known
VIA/WonderMedia SoCs, and its clock uses the same enable bit and divisor
reg on all SoCs, feeding off PLL B.

Add respective DT nodes using SoC specific compatibles for the controller
to make it future proof in case any differences in behavior are discovered
later on.

All known boards boot from SPI NOR flash, so their flash chips are at CS0
and mapped by the boot ROM at the end of their CPU address space. Add
respective DT nodes in board-specific dts files too.

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm/boot/dts/vt8500/vt8500-bv07.dts     | 37 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/vt8500/vt8500.dtsi         | 34 +++++++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8505-ref.dts      | 37 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8505.dtsi         | 21 ++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8650-mid.dts      | 37 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8650.dtsi         | 21 ++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8750-apc8750.dts  | 37 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8750.dtsi         | 21 ++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8850-w70v2.dts    | 37 ++++++++++++++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8850.dtsi         | 21 ++++++++++++++++
 arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts | 37 ++++++++++++++++++++++++++++
 11 files changed, 340 insertions(+)

diff --git a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
index 38a2da5e2c5d64477f04e1da9d98cb97be0d95e4..c3c5ba3ac014cc49bee8c2b9e6c7b25225d4d5fe 100644
--- a/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
+++ b/arch/arm/boot/dts/vt8500/vt8500-bv07.dts
@@ -30,6 +30,43 @@ timing0: timing-800x480 {
 	};
 };
 
+&sflash {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-boot";
+				reg = <0 0x50000>;
+				read-only;
+			};
+
+			partition@1 {
+				label = "U-boot environment 1";
+				reg = <0x50000 0x10000>;
+			};
+
+			partition@2 {
+				label = "U-boot environment 2";
+				reg = <0x60000 0x10000>;
+			};
+
+			partition@3 {
+				label = "W-load";
+				reg = <0x70000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index 2ba021585d4889f29777a12473964c29f999f3a0..7ea115576c69b517cb2a08206638062f22c976a0 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -74,6 +74,19 @@ ref24: ref24M {
 					clock-frequency = <24000000>;
 				};
 
+				ref25: clock-25000000 {
+					#clock-cells = <0>;
+					compatible = "fixed-clock";
+					clock-frequency = <25000000>;
+				};
+
+				pllb: clock@204 {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-pll-clock";
+					clocks = <&ref25>;
+					reg = <0x204>;
+				};
+
 				clkuart0: uart0 {
 					#clock-cells = <0>;
 					compatible = "via,vt8500-device-clock";
@@ -105,6 +118,15 @@ clkuart3: uart3 {
 					enable-reg = <0x250>;
 					enable-bit = <4>;
 				};
+
+				clksf: clock {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&pllb>;
+					divisor-reg = <0x314>;
+					enable-reg = <0x254>;
+					enable-bit = <23>;
+				};
 			};
 		};
 
@@ -114,6 +136,18 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
+		sflash: spi-nor-controller@d8002000 {
+			compatible = "via,vt8500-sflash";
+			reg = <0xd8002000 0x400>,
+			      <0xff800000 0x800000>,
+			      <0xef800000 0x800000>;
+			reg-names = "io", "chip0-mmap", "chip1-mmap";
+			clocks = <&clksf>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505-ref.dts b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
index 8ce9e2ef0a81097e7143a5392ee5b42bf8028ec1..b037f9d919fb51a527f35276e2b8601f3f3d8505 100644
--- a/arch/arm/boot/dts/vt8500/wm8505-ref.dts
+++ b/arch/arm/boot/dts/vt8500/wm8505-ref.dts
@@ -30,6 +30,43 @@ timing0: timing-800x480 {
 	};
 };
 
+&sflash {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-boot";
+				reg = <0 0x50000>;
+				read-only;
+			};
+
+			partition@1 {
+				label = "U-boot environment 1";
+				reg = <0x50000 0x10000>;
+			};
+
+			partition@2 {
+				label = "U-boot environment 2";
+				reg = <0x60000 0x10000>;
+			};
+
+			partition@3 {
+				label = "W-load";
+				reg = <0x70000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index 99c064c916b2279797f71261ca9306e9dcd4bbd8..bf9ba4e99f86d1bf41c4e4bfe8b4f71ad162be4f 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -203,6 +203,15 @@ clksdhc: sdhc {
 					enable-reg = <0x254>;
 					enable-bit = <18>;
 				};
+
+				clksf: clock {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&pllb>;
+					divisor-reg = <0x314>;
+					enable-reg = <0x254>;
+					enable-bit = <23>;
+				};
 			};
 		};
 
@@ -212,6 +221,18 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
+		sflash: spi-nor-controller@d8002000 {
+			compatible = "wm,wm8505-sflash";
+			reg = <0xd8002000 0x400>,
+			      <0xff800000 0x800000>,
+			      <0xef800000 0x800000>;
+			reg-names = "io", "chip0-mmap", "chip1-mmap";
+			clocks = <&clksf>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usb@d8007100 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007100 0x200>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650-mid.dts b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
index 7977b6c1e8ebf215df210dee703e470b9159d329..d3c8b7b99706603bab5aa8dad1165edb3763c2f6 100644
--- a/arch/arm/boot/dts/vt8500/wm8650-mid.dts
+++ b/arch/arm/boot/dts/vt8500/wm8650-mid.dts
@@ -31,6 +31,43 @@ timing0: timing-800x480 {
 	};
 };
 
+&sflash {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-boot";
+				reg = <0 0x50000>;
+				read-only;
+			};
+
+			partition@1 {
+				label = "U-boot environment 1";
+				reg = <0x50000 0x10000>;
+			};
+
+			partition@2 {
+				label = "U-boot environment 2";
+				reg = <0x60000 0x10000>;
+			};
+
+			partition@3 {
+				label = "W-load";
+				reg = <0x70000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 0d6c7bd87f7dcce0eef056d04c38ab1de5d52639..972b61d2437b1da9ce765b65f844872e8df4da1d 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -175,6 +175,15 @@ clksdhc: sdhc {
 					enable-reg = <0x254>;
 					enable-bit = <18>;
 				};
+
+				clksf: clock {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&pllb>;
+					divisor-reg = <0x314>;
+					enable-reg = <0x254>;
+					enable-bit = <23>;
+				};
 			};
 		};
 
@@ -184,6 +193,18 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
+		sflash: spi-nor-controller@d8002000 {
+			compatible = "wm,wm8650-sflash";
+			reg = <0xd8002000 0x400>,
+			      <0xff800000 0x800000>,
+			      <0xef800000 0x800000>;
+			reg-names = "io", "chip0-mmap", "chip1-mmap";
+			clocks = <&clksf>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
index 136e812bc1e498d48c7fc61154bc66a48888b117..4465946cfe44e82db1cad14c1f81237e1ccc0e67 100644
--- a/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
+++ b/arch/arm/boot/dts/vt8500/wm8750-apc8750.dts
@@ -24,6 +24,43 @@ i2c: i2c {
 	};
 };
 
+&sflash {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-boot";
+				reg = <0 0x50000>;
+				read-only;
+			};
+
+			partition@1 {
+				label = "U-boot environment 1";
+				reg = <0x50000 0x10000>;
+			};
+
+			partition@2 {
+				label = "U-boot environment 2";
+				reg = <0x60000 0x10000>;
+			};
+
+			partition@3 {
+				label = "W-load";
+				reg = <0x70000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index 0158c0ba5dd110957eac38775d3bf3ebd2ab4154..d6b4e4463fae1e8a0a3cf0feecce7125b4a67f5c 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -240,6 +240,15 @@ clki2c1: i2c1clk {
 					enable-reg = <0x250>;
 					enable-bit = <9>;
 				};
+
+				clksf: clock {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&pllb>;
+					divisor-reg = <0x314>;
+					enable-reg = <0x254>;
+					enable-bit = <23>;
+				};
 			};
 		};
 
@@ -256,6 +265,18 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
+		sflash: spi-nor-controller@d8002000 {
+			compatible = "wm,wm8750-sflash";
+			reg = <0xd8002000 0x400>,
+			      <0xff800000 0x800000>,
+			      <0xef800000 0x800000>;
+			reg-names = "io", "chip0-mmap", "chip1-mmap";
+			clocks = <&clksf>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
index 5d409323b10cb94a5694722de1e31cff5be390ce..d2638a204579d3dff477bb7f458438037e08019b 100644
--- a/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
+++ b/arch/arm/boot/dts/vt8500/wm8850-w70v2.dts
@@ -42,6 +42,43 @@ timing0: timing-800x480 {
 	};
 };
 
+&sflash {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-boot";
+				reg = <0 0x50000>;
+				read-only;
+			};
+
+			partition@1 {
+				label = "U-boot environment 1";
+				reg = <0x50000 0x10000>;
+			};
+
+			partition@2 {
+				label = "U-boot environment 2";
+				reg = <0x60000 0x10000>;
+			};
+
+			partition@3 {
+				label = "W-load";
+				reg = <0x70000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c4bfb4d30aad0358b39cbf30edf0c63e32167bbd..6837198de2508536eef52537a7f451679d36c38b 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -217,6 +217,15 @@ clksdhc: sdhc {
 					enable-reg = <0x250>;
 					enable-bit = <0>;
 				};
+
+				clksf: clock {
+					#clock-cells = <0>;
+					compatible = "via,vt8500-device-clock";
+					clocks = <&pllb>;
+					divisor-reg = <0x314>;
+					enable-reg = <0x254>;
+					enable-bit = <23>;
+				};
 			};
 		};
 
@@ -243,6 +252,18 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
+		sflash: spi-nor-controller@d8002000 {
+			compatible = "wm,wm8850-sflash";
+			reg = <0xd8002000 0x400>,
+			      <0xff800000 0x800000>,
+			      <0xef800000 0x800000>;
+			reg-names = "io", "chip0-mmap", "chip1-mmap";
+			clocks = <&clksf>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
 		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
diff --git a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
index 58b3c8deb4f20ae072bf1381f1dfa5e5adeb414a..647fdcccdbbd680276af1fa30363e09bbeb5ad16 100644
--- a/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
+++ b/arch/arm/boot/dts/vt8500/wm8950-apc-rock.dts
@@ -16,6 +16,43 @@ memory@0 {
 	};
 };
 
+&sflash {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+
+		partitions {
+			compatible = "fixed-partitions";
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			partition@0 {
+				label = "U-boot";
+				reg = <0 0x50000>;
+				read-only;
+			};
+
+			partition@1 {
+				label = "U-boot environment 1";
+				reg = <0x50000 0x10000>;
+			};
+
+			partition@2 {
+				label = "U-boot environment 2";
+				reg = <0x60000 0x10000>;
+			};
+
+			partition@3 {
+				label = "W-load";
+				reg = <0x70000 0x10000>;
+				read-only;
+			};
+		};
+	};
+};
+
 &uart0 {
 	status = "okay";
 };

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
