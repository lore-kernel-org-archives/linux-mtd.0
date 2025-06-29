Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC43C83029
	for <linux-mtd@archiver.kernel.org>; Sun, 29 Jun 2025 08:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IYWdFLhYi8JJ6TEvnRiVgNJXPBztvanDZ2NYlz6dI1g=; b=xPhRDJVofH0+x0
	2HClPQTJFHYAT6PI7vNAI4luLDjZ+hhPictwcf14XUHm3UjlgwyhyJUuvOaN/VXi2TW5NxNhJJ5Ct
	8WE4VL8Bu7PJAj092yKD4dbOT3kLhoqPz0hCxL1VvSaUB639sYftIm6J4n2EjP25RpddD1L79YQpd
	w0ZJkVsimDOR2YNCTcEKRAd1luldMOcI05xtYzgh8P+wQM4H7udOPXySAyXZh6vZOTs1+eh+IT5I+
	CE7eeVMkdEqLquyMEsOLDMdgSjAC1zE4Wt3kgwFk2Wo0j0IPXOwymOedavZVEO7x++6oiCBaVt85k
	nY4GkC1vDnb/HjAMUQKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKW-000000001hI-1Q5v;
	Sun, 29 Jun 2025 08:24:04 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVnKU-000000001es-1tBY;
	Sun, 29 Jun 2025 08:24:03 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-af6a315b491so1227709a12.1;
        Sun, 29 Jun 2025 01:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751185442; x=1751790242; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=97fxYmkEtlOpyahoQx4M5It56A2ScDgvjgQGcXq1u+M=;
        b=R/zkXPTwkqmlT4m305Agtwql0V6TkNpyFNHsxFFzL2UIr+JQprz9BH6mkarTHDcjUz
         EE6WR1JgkrGe2qkoYn9dQI3VlSpe2Cb0IL/O43FuxWhmy/CUmjtBdc0e8CU+T2M3yOsr
         Vm8mrs6D0oP2j8d7Vb9syPPnx4NYVYBjcaOFiR//OYJrWKylwW3Xx2xVFAzVccYtVZgG
         rwkOWBtF+QhyQjLmuo0N41WZaYKyKQQm3UIhKbtHVl8BVBZ7SViSNnnKm4s7XsTzCquV
         iQ5JdQWoVPTgMxK+R0ZK5yAIc/lDY5vpDy7N0vPao9GGs7vQNVKs05GuYAmmJWhbtb8p
         WcnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751185442; x=1751790242;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=97fxYmkEtlOpyahoQx4M5It56A2ScDgvjgQGcXq1u+M=;
        b=suAuTtikDLDYD9CDcqRvsjviaXDxDqaCkrvHkL1w+6ERmbKfvJR9M3juZ2xn8ic8WD
         fZHoMUlRDosa1mf8tJLfZnDMFjSJu/NNNG9yXVe1oKADSN0JVm9OIZbKCP5MyNd21F73
         VRFs8CNcx7BcRTGFOoUGxVNfbzbvfPscpuXhR5b6yvk0kbqh3GMCTkZKfj5gX71qKmDf
         PS9TGmQH/xcEGO8ZCRbmkzayb8gbhFLO4lPIvm9z98EODZgeUcipBfcsekhGuysObvDV
         9Llt24zqTzuSjm0UbgeQfi+whx7mmJhW7KyFRX5DgHBGnsJWj65ietXA7H+bkqpreFRu
         kKuA==
X-Forwarded-Encrypted: i=1; AJvYcCU8q2s6P2/rFIFKjqRLJQyrV/Btgjfa0Bt8zUob81C5JoO0yvPsE5SR7Khe+cCdVMvM4SlbxnzP9MPVOg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYFhmdlq9gA6r7XHnQnsOzW91sfWPXldV3vphG/qNBdklaz6g2
	DkqSb+FCjS+473icHKBdBFmMVG7o3JAHArXPpO/wTkXomU/17gpttnBa
X-Gm-Gg: ASbGncsmwAjowUiqX7IH0VmBQIN6PM+B6tGP6mgQM2rUqOlySjh5TrufHV2sQFo4N2f
	IzobEAVvtjXg6BH++xTQfisNZceQBO84IrQIbmwMNbm0qhlhGbHAcgCTPSY2Klpe0Yiqio3jeX/
	KEDcmVzXJl9iiRApFCVf1dsmrEUO+JgESgQIVbkoj28/NmZVBxmDyqVqngrQ0jBnu16m1AAd1Xk
	JvqBgXhk9t5EmazmpsICSKjPbtraWx/e8sXeeYONbMVHmqs7BaDj0PNxTlLk76/tGHR6XpLP1WZ
	Wj0HwU5hv3PTYHp8ENCBteK/xxuE4wnONbZgBZJp7eauUVQOgSablQ==
X-Google-Smtp-Source: AGHT+IHAI6D2+4NaOQwnBVFRV6TfBFP4M7lyDzfYRNJ5iP2pargoe20VvUzU6g8JZlrc4J5MmumIGA==
X-Received: by 2002:a17:90b:554f:b0:311:fde5:c4b6 with SMTP id 98e67ed59e1d1-318c8ecda6fmr14121094a91.6.1751185441085;
        Sun, 29 Jun 2025 01:24:01 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::168a])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f542661asm10495839a91.26.2025.06.29.01.23.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 01:24:00 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 29 Jun 2025 16:23:13 +0800
Subject: [PATCH v3 4/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
MIME-Version: 1.0
Message-Id: <20250629-sfg-spifmc-v3-4-28db1f27e999@gmail.com>
References: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
In-Reply-To: <20250629-sfg-spifmc-v3-0-28db1f27e999@gmail.com>
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
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751185413; l=2460;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=b+ls9Cn6mM3MfOnV5MwzeFfnl2Z8gVpyt1s6gAiujiE=;
 b=qcKJ8A9MKl1P77tnPMI3NfkU32uwTXkSDZJvQfYIjdv1Qyo0isAzCFstxLD0cUiPLM5fWPmEW
 4K+vp3bYOuCC+x8B5wTmbP07YTNgDyop6esoGUoR3UyZXUwmcVKdIjv
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_012402_494420_562219F3 
X-CRM114-Status: UNSURE (   9.04  )
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
 .../riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts | 24 ++++++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi             | 24 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index ef3a602172b1e5bf3dcf54a8cacdad5172b7f50e..554ec14d58453a44a02a82da40a7aedb80d61dc9 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -138,6 +138,30 @@ &sd {
 	status = "okay";
 };
 
+&spifmc0 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&spifmc1 {
+	status = "okay";
+
+	flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <100000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
 &uart0 {
 	pinctrl-0 = <&uart0_cfg>;
 	pinctrl-names = "default";
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 85636d1798f11804546ed8606595ace1b4cb2a2f..0e1fcb54480af71147d0e71178a8eb08a31b75c3 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -48,6 +48,30 @@ soc: soc {
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
