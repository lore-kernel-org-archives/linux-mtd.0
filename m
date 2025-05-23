Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76183C54ED0
	for <linux-mtd@archiver.kernel.org>; Fri, 23 May 2025 10:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOLRc4OlWXEInfaapqdbI6ec2VBdxgo4U1GKJxxPqoU=; b=CMpczQUDozpZn0
	xxvMuTTXop4X08/+raD4A/ZfY0T4SDbBt2gIhzas+heuoF2tI68bXSEACLAkyISDRAePXtYZ1tukh
	HOn0m5Nm+p1OILbHNiN7IzTNeyUDbOKZ95yYRfUlfGMonQLIaNQ1UXuqh5hxjed2K7H7wLNUvVosI
	LZiLEx7OUxV7OJCn/CX5XyhXw8sGDzb3RPR2lqoiL0V9TgyflHau0hpCRR6uRjAZRSV1vtAP59QkL
	H1hGmXItN4IL9IigRWek4Ro7BxixBMmiH4CF3Zmg9XclQEZC7JuA8xXZibdgr0SXL0NuKDo2aIGQs
	lnf1ZGxlO7XvmX4Ok/fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ3b-00000003eSC-3oAv;
	Fri, 23 May 2025 10:55:19 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIQ3Z-00000003eRD-0ngo;
	Fri, 23 May 2025 10:55:18 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-742c27df0daso5247641b3a.1;
        Fri, 23 May 2025 03:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747997716; x=1748602516; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=PlvzBpLq94cK89DVKRCeZLV5M3yKzhg+pHkTigboE6lZh4MEFu2Tlh2dIzKRE1Adhx
         CVDxCB0frtm4WbYB8MZFuuFx++N8M3ZuwaBMRC+Zb8LuF848cOINsjVD9R4EfUHbg0Ss
         uSPqVytYprYVe7mjNcrXyZOzsRaJMo6XRijRwffp9EIjcjcRZOOxK849MDws9YlhNM5I
         Hn/RnKfu9pkqSKndPQ+aZZBVSCM4krPikgMCLU2lgglk/gAqw9SP9hCjflQikdTVPkcD
         TODzjwHZG0Qz6/P1LyLRhTRMEWJgQAOdcq1NZ+RFn0PxvHl0K0rxq5B/zt0UKGfyurFU
         YGbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747997716; x=1748602516;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=UtlsbIGscJWyickPeEEQ/haKJbINHiFHI1ZcohjcVHhn/N7WM+7cNesGLGULPc9sPQ
         Y/bOguxwtaZjBSURHYXRFsLvZfhCG+riMxYGpDOqp4iO4IgH2khilW4Xi8cCEwqmSNjD
         dWWtYg6MEqs8aJvQmTLNZMQG0u2Oiel5N3U/miZzpFmO+WyG0CUprc/ddwq30IX4aSjd
         X36J1luIn2DvjfA1DUxLMr7zfAZ9ovdiFvthdv2Papf5bo8JqIeiCsRgGhDEdOp2asVp
         pFkWq1o1kJYXEjtstPB/etFHNCzuAMFZ3HNvFnILWx5Uhm466uvjdp2rK23gdMh2Q2ri
         PkgA==
X-Forwarded-Encrypted: i=1; AJvYcCV3OkXqYwUAS87fKnrvM8FrsI26uvl5HomikQbUgxa2yMDOZBrED/N+zsLTbcCPEK68eeqSs39mS8Mh5w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyRTLcrui5MnOCBr2K/fQVkd0RLI763w0sffsUqUBx1es3IXdG6
	qu7kbgU6wNmNVnk+4/GXU+w5du386m3W/23rcvDux2XKDC6ytNHExSFs
X-Gm-Gg: ASbGncv8UcrvCUs/ohAqunf/mUc3vXh1hNHap1a+/eOhigxACr0oVujhzqaFDK5bvRO
	vQBtTsiTJzp32UD1wVpKxiqT4Vnf+Tn785eivwnDEMFbdUq4TqC2Tw21jND49ytGpOINytjY7Vm
	HZUaSzdUhwvO8N/E9r2fUv1g6rdYgsPKQJtUl/0hBYTiRbq0edGqLjBe2vdrrcKddUIFFfo5yNe
	eJEMhoG6aoEI3ILxHlvhcwZd1agnCEL5orQxma1NcLBRaOZx4y7nzCa8iiNqleVPlVSamyH8RWq
	vwUJ8wc/i2cCjst37XKith6eZJDYr5a5bWMyGHGJeqftoPPptufAcg==
X-Google-Smtp-Source: AGHT+IH4Nepegl0mcTej89S8M81vz2ympEfH22RcRGrsFdndLJpdaWHD3e9xghthl+2Ys9cAmW6dww==
X-Received: by 2002:a05:6a00:198e:b0:740:91e4:8107 with SMTP id d2e1a72fcca58-742a963242bmr40755354b3a.0.1747997715930;
        Fri, 23 May 2025 03:55:15 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9739cdesm12623687b3a.82.2025.05.23.03.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 03:55:15 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Fri, 23 May 2025 18:54:51 +0800
Subject: [PATCH 3/3] riscv: dts: sophgo: Add SPI NOR node for SG2042
MIME-Version: 1.0
Message-Id: <20250523-sfg-spifmc-v1-3-4cf16cf3fd2a@gmail.com>
References: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
In-Reply-To: <20250523-sfg-spifmc-v1-0-4cf16cf3fd2a@gmail.com>
To: Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Pratyush Yadav <pratyush@kernel.org>, Michael Walle <mwalle@kernel.org>, 
 Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Longbin Li <looong.bin@gmail.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 sophgo@lists.linux.dev, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 dlan@gentoo.org, ziyao@disroot.org, Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747997691; l=2232;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=1GDh0zAEry6mVGUqkPUqxMLAqpRze3QvTZVNyNvZNiQ=;
 b=ggUaIaLAnq0XDvfVdPu0NfePlrDLY2dn8MKJT0iKXUMiF1MEHy/syRdJlgoTBOGeUSfm4YIlT
 KSDFwsD6mtwDCqBFTgLW6Ay7wnXJkzFi/5pSIsZelDxnHN+TG3McRkL
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250523_035517_235774_C82FE142 
X-CRM114-Status: UNSURE (   8.83  )
X-CRM114-Notice: Please train this message.
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

Add SPI-NOR controller and flash nodes to device tree for SG2042.

Signed-off-by: Zixian Zeng <sycamoremoon376@gmail.com>
---
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 18 ++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 2 files changed, 42 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 34645a5f6038389cd00d4940947c6bb71d39ec6f..c59a819e35d3201c484bf98392aec14392a7eb04 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -68,6 +68,24 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+	};
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 212a3edc73fd654de59e10fab2094af2fec7f88f..06b433d5949bcc2374ea90223ff2d81434fad2b5 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -83,6 +83,30 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		spifmc0: spi@7000180000 {
+			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x00180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <108 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF0>;
+			status = "disabled";
+		};
+
+		spifmc1: spi@7002180000 {
+			compatible = "sophgo,sg2042-spifmc-nor", "sophgo,sg2044-spifmc-nor";
+			reg = <0x70 0x02180000 0x0 0x1000000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clkgen GATE_CLK_AHB_SF>;
+			interrupt-parent = <&intc>;
+			interrupts = <109 IRQ_TYPE_LEVEL_HIGH>;
+			resets = <&rstgen RST_SF1>;
+			status = "disabled";
+		};
+
 		i2c0: i2c@7030005000 {
 			compatible = "snps,designware-i2c";
 			reg = <0x70 0x30005000 0x0 0x1000>;

-- 
2.49.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
