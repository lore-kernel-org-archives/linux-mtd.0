Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CC4C54E90
	for <linux-mtd@archiver.kernel.org>; Sun, 25 May 2025 14:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bOLRc4OlWXEInfaapqdbI6ec2VBdxgo4U1GKJxxPqoU=; b=sWalSnSKxTwpkn
	SHpxnmQPAGuOZVJppsrCvU2ifFcuXmdzS2ea77yR9IUJeSjGCTS/CDE4vDQoH+rMISZSVgea+jyG0
	VODq4SrzQ4GXfFxbB5YQzTInNmGbF9gEGENzE94rWIK+lexCH4LEPh9ADmACYB48mQBNCdCMlLjHI
	jgU/TJZPvDWcGvSNShVViRhp185EV7grRwKMj9HSGehnSLiG7hsHlawG2GdCtBcBuCGcpFwlpjXvm
	hwFMK9JDMW6PgHLjn21B7LKS23S6nFADR0rzLBDx+RgA1vFCCckBhxkkFgyYN8wRhkwDaPZLiBL82
	8mpc5V+8M12B5NDhpURw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCpN-00000007EDz-2qWD;
	Sun, 25 May 2025 14:59:53 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJCpK-00000007EBd-3DiO;
	Sun, 25 May 2025 14:59:51 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b26f5eb16a5so984113a12.0;
        Sun, 25 May 2025 07:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748185190; x=1748789990; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=nV8j14cLmrFRXI7Xb5+ddvq6Y2fAXTMCc0Nnsvilu6JZrLk0C6BcHZKBAsYXyD9Raa
         Fv4AmXYgW5zCLNK0iXjXbka/rO6iNwbWKSvUaRMLYAHV8+Glh+DPgAVAxyJI3oiUcD2J
         nQ9VR5bT17YsZDJ+JECIs/Qw6/RurhmsA8aUx3fX3rmfaqmA8JumdKWUnPaNggagjYR4
         vs+dCX5DvYv2sP2fHCS8/vyhCHqU7YbPHpAw+12TmVU4yHZzBGeBW9Lrj8NapdwNJPl3
         GLkVDLSuwn3H7KpaHnN0Rcd1/PKieNQIKCwIq9H+KSXv3eRDbgcCB65Kel6h34smjrGY
         fp/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748185190; x=1748789990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BxmiZPl5Ck8pukdGXQ0/lqOM6oa5lUIp5yTgqKF3faw=;
        b=pJ9uUOcMvv1ruFQj/5PeFqbyZM5Ci3jks0qSh/Laq/fuvL6Vy7L7iDr99f+3KYkf6q
         h80I78lhPZl5THJgZ8nWbQ9o9iZALeVCcLs4n2AYg7vnguJJR2ovGRYvnzSOntPh8KGe
         SzT2d7zBbCgv19yGwe8AECbM04EpN9pAz46QrZXJkdZiGrG8zdoDKm+EMUywIcmROhsC
         r5S2TPaC3SsP5B87+VDyJ03HT+tlw27JYcmAgvUseC/kasKkdnJaxOx8YcOj5OtRUsoo
         p3EeoTcJboTdZskmV+AAT0B2zhr5HWUnprbUR/ipP4Tacp1OGLnW1ybJOgC8hkF7aplq
         zKIg==
X-Forwarded-Encrypted: i=1; AJvYcCVjAr30ASKXRyzF1QnMOeJ6R+v6YX/F9W98Kj2VHnnZl3JYxktRJzGLhOrU947QkLQ5wXOEOC78Q6ai5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0XaZT15HvJg2UADTzHxIYRJ4oeGncBWTcjRhpQ4A4kaafwqkv
	LgD1EQfRhCCxHJX2thKIHUFegcZvGFnirM5azWgr+hYyLxEnefkeqmPp
X-Gm-Gg: ASbGnct7so7k2u3GtX64F815BOXjwfRmEZFs1WqzQVCxB/wxB6UvJ9qncJLqpxnivSu
	W+Rqu0z5qtiqU1nRTYRi1euRjfvjqfWkTYLXtSkMTcR7Dpw8yMX+YY19+s34hs2YoQXjT0i8iZ+
	iS4sEzPoyzI/1URh0HwQudWmXUYjwyGWxv4D0RA19rdTRDF4gLEFwktuVB2XnLuvi++7VU2lvjA
	DarTm28f9Hs9HjTzdCLbGASpSp15Rhr3q40gUcrfQTCs/SVHChUiktn+lCc25r8uTR4sZe3zOjp
	cFUnvpkj6y1+fHF1Y4sZ/VRu1FDuHYWRIz/bcPGEBJs=
X-Google-Smtp-Source: AGHT+IGunpP59ynpyV2hBlZb/lg+XTXK4YdN1s4v9vrB00vwAMIKxbDWsG2m36xfm44uu5CUSMBefQ==
X-Received: by 2002:a17:902:c94a:b0:22e:23c1:d711 with SMTP id d9443c01a7336-23414df58fbmr94181685ad.16.1748185189378;
        Sun, 25 May 2025 07:59:49 -0700 (PDT)
Received: from [127.0.0.1] ([2001:250:5800:1000::3fc8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2343f8e2fbesm12204845ad.250.2025.05.25.07.59.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 07:59:49 -0700 (PDT)
From: Zixian Zeng <sycamoremoon376@gmail.com>
Date: Sun, 25 May 2025 22:58:43 +0800
Subject: [PATCH v2 3/3] riscv: dts: sophgo: Add SPI NOR node for SG2042
MIME-Version: 1.0
Message-Id: <20250525-sfg-spifmc-v2-3-a3732b6f5ab4@gmail.com>
References: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
In-Reply-To: <20250525-sfg-spifmc-v2-0-a3732b6f5ab4@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748185167; l=2232;
 i=sycamoremoon376@gmail.com; s=20250113; h=from:subject:message-id;
 bh=1GDh0zAEry6mVGUqkPUqxMLAqpRze3QvTZVNyNvZNiQ=;
 b=pAjTR2y1Jyl1kOT2HIrGue4nOoASxsqz3sFfNJmHw8RhUwHa6kMtiZX2u+s8DVtmQlF8uG2Vd
 gFPcGRCfky+AG7+eNwNKD529Vou0ucmxp82i1NihK/sy7VEEbG43NqB
X-Developer-Key: i=sycamoremoon376@gmail.com; a=ed25519;
 pk=OYfH6Z2Nx3aU1r0UZdvhskmddV6KC6V1nyFjsQQt4J8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_075950_802455_E85CD946 
X-CRM114-Status: UNSURE (   8.92  )
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
