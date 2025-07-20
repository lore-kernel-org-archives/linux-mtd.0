Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D25F8C83F22
	for <linux-mtd@archiver.kernel.org>; Sun, 20 Jul 2025 08:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ntf+4n4qFbMSF3wsm6jLi5G8koZLQpfu87/0nXFVxz4=; b=t8dkS6WUnLZmwH
	3NMzY0eww7l1E+hx4nmEvYs6u3cq7CztuQ+sgRxcRF4nkq18uAHyaRB9eWzBk+FaXlpW5YAAaujVB
	t2wRRw29LrcPQvwJg0JYWu8PKMsbL7MYdvR81brv+/YIdu8TO8HVK9+7BKliloiw1lc29qtIZfyl3
	vv+o66N8GwQflkl/lOCDg/RD4HsTc33jfyKdrP30NxmbjPmIjm9qiN6dGZK0/VDB4JXF9W4eHe249
	1QVXmPBR/FrS8kuQFG40goxFbDV3PvA5UUWgAW4F56otYL5ZQsAyVIZo2MzqgigcctYQOAIXgBUj7
	b+LAoO98mtpFIpgzMBUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPU7-0000000F29s-0eiI;
	Sun, 20 Jul 2025 08:33:27 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udPU4-0000000F28A-2HkQ;
	Sun, 20 Jul 2025 08:33:25 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-311c95ddfb5so2446266a91.2;
        Sun, 20 Jul 2025 01:33:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753000404; x=1753605204; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vk2QbpeYdfxireOkVMTO8TaReVM+NxnLECNCVQYv1vc=;
        b=G2e715DTVb7griIs7QmephcT7H7zTLGsc4WoO4oK/GGpNbzbnD0px1PO2UQlHM41vH
         aRSavVGQHhi89qEv4UAEdG49JR9Zr/Nzyfh5qV28dCmCWqUUAdBlH/8bwFkWsAlBC8zw
         GaKjNxWMJuL/wVoNHparWr00OzEgvqhJntePhb/sp3cvpwTv4wCrL1UwYLljfR0JxS7k
         LHbBozGzlHIsF167cSBREdoD11dV69mskszeQcqE51E7obf2qTi37aocOSbSEdrNLhQS
         0H0nbXn+jr31HvD/tySgKNn6hzWmYMkECURgKb3/EH7ULUfm3ZPhcLaZWSeEDPdxQ0he
         SeCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753000404; x=1753605204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vk2QbpeYdfxireOkVMTO8TaReVM+NxnLECNCVQYv1vc=;
        b=WC9Pn0gAAA6QW6j3B0TifnU0KfbT6KKdaVYioOShvY49LeTZBSJP36N/KpT4TxtEoZ
         cIBklXzg0guji4GBhNDB90O22qkSqFg82kar/5McOPjJwl3D5Q9sp2vgNhTBNL1S+UM6
         1BiBs6eb4aznzCmkU8L9jQTxzZPbsRMNqfzrswIv/m2AjxC09QpgR/xBox/NMBwo/qqT
         jdR5aHUxuNrvOo2VLeZBq4LDyAIbsQY6nsCLvGcm8PMjSjeUlSyEdtOwcxBabMsWGyHN
         2Go6G+I14vKtg5YsFemYbHUA56lVRuqTv1chopiu9R4Pou3yK0iEHijEfOmXltgCR48Z
         OzyQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTGFDurIcPCxvaM+HUnYVGbE1pZGUiuxPe+E5NY8GBnl1BBlfs9w4THvLGcIn8SkYUqY9o2NIB/CNFSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyWEu+GH1pGQ/e9uxt097njM5S6kd1SfXP5dHdzs6Kyouf1gOZV
	vOti7OE7QHT/wXSagpKtJsiW/ikudk4viXDjiCWFj2JCYsn4EgsgTyaT
X-Gm-Gg: ASbGncvhKGtJ7fpK9xy8yl8hsoeIy5XuYIMElXbmOFEDecUpjm/uUqwa2pyNcWB6XYD
	0g8Y++PQAzu2SoFKjmtS0Pfdc/QT9WeEE4vFy11mXVQsXTdCYfh4uQ9WGBf6GRrKtq40RoIZqrL
	HCLVPBmecVCIbYUa/zqtUcAFh0O6M7PkKTCmtr/IgeI4atiPVgvEOtxWKFGoBTaYfC2z8jaFDge
	UoLao3jBK00eLuf8vGD60QeXXTZcaUytBnFjfR1U2zhfX88RG2uqMLgn1mYLHbxG3TDMF87/XH4
	Pi2stx4FV8PzR+P/cXpUkYBupZXc83L4OuDQ7N+ygyyehaHzyzwiuXEFAkmCF94CVtyd3MTYWxB
	k3hobXwetlgVSev0iFSjjRFyX
X-Google-Smtp-Source: AGHT+IHQ6aqsMzWnYc8OhtpmX48954oW5ZQ+i2KvLoOdJi5CschQ3b7WowKF1it0RnWS+9kS3TgT1Q==
X-Received: by 2002:a17:90b:4a8d:b0:311:eb85:96f0 with SMTP id 98e67ed59e1d1-31cc25e80b9mr13870327a91.29.1753000403406;
        Sun, 20 Jul 2025 01:33:23 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1002::1d55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31cc3f46b97sm4079721a91.41.2025.07.20.01.33.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jul 2025 01:33:23 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 20 Jul 2025 16:31:46 +0800
Subject: [PATCH v4 4/4] riscv: dts: sophgo: Add SPI NOR node for SG2042
MIME-Version: 1.0
Message-Id: <20250720-sfg-spifmc-v4-4-033188ad801e@gmail.com>
References: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
In-Reply-To: <20250720-sfg-spifmc-v4-0-033188ad801e@gmail.com>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Zixian Zeng <sycamoremoon376@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753000358; l=2404;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=TvdO4gaLKUzOJEi1aNELCkM4P/gdBzPDf2IOJYLCNW8=;
 b=lksiYwk8mrj89e55V3la17CqB//aoirRCF4dGn/kRQVvc4FfgGgqWzJjjN7U9PCxlzb/HE4sL
 Ep2vwiJTSS8CDJasYtL7IvN2wVCJy850Qx3X+F2AUBsS4K41YfhCVqW
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250720_013324_607909_1781555A 
X-CRM114-Status: UNSURE (   8.70  )
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
index b3e4d3c18fdcf94c2294a56ed6ad866fc59a6adb..0f7d8a3743c35046ceec902902af2b8d3ec8e6bd 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -48,6 +48,30 @@ soc: soc {
 		interrupt-parent = <&intc>;
 		ranges;
 
+		spifmc0: spi@7000180000 {
+			compatible = "sophgo,sg2042-spifmc-nor";
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
+			compatible = "sophgo,sg2042-spifmc-nor";
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
