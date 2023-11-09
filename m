Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1844DC04E83
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Nov 2023 11:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ilOjJqlADoOj+0PDHJ+keMhl9LITJNx6t2KfiEa9DUQ=; b=VDnQgiUbn8oBmK
	M00WEP78DBk7POHJdh8gKzlxyyMDVE0MC0m2D+XU0OVQ1S2nTMZ9z5Bxo9X3Fy0NNjn1YqWQcXUgk
	Rq6PEc3iLcXC0VOfaXoL665tWHg7hFDmN79HyCRWVuitzpP9+bFP5iKC24f2mTOBGAYuGfplTDvSU
	JytoGhv+UyYGpVRUCk+IhObvRw6OtEW3EUU/vZwkhU5ynEOnnFwjKq9EnSOvpCL2DdtzRgLwlMHqv
	8aZiQfdzJcAVLzaY8MmJiWy+ldCOiZCqzLJRvRG7P4xkzBo7Hh/0se4Bs11JkOtIZBaFwI5/xGi+h
	f6Z3f5qZ0WBYD2qNLF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r13AD-0063XK-3A;
	Thu, 09 Nov 2023 11:25:34 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r13A8-0063TQ-1M
	for linux-mtd@lists.infradead.org;
	Thu, 09 Nov 2023 11:25:32 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6b2018a11efso831997b3a.0
        for <linux-mtd@lists.infradead.org>; Thu, 09 Nov 2023 03:25:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699529123; x=1700133923; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JhgRN2Rn+rtjvCYDC100dWfkXqmEv9CGax3w9Fgda48=;
        b=LyRgM6jgI2qyw3v0BO1EvNrL/ilWoBvKWPoMyinY3UYvVc6ljJ9tlKdOppa6iYWOJp
         4UkzGpk8K7rVch+S7vD2akW9Y9b0APCf5uiEKhLuFttm1IVko1BcvHcBYMAxLviXjio9
         TX2LdLWAVwkjjC682C4znb3eDf1nT/z0a4n5vvySAdkVMcUsduFIYgCEvOuqtAVUOjM9
         0LqDCF9bsOwdQdVJT2kCrEUu1E/BfewwZvoOiChT0DUJu/1w1+BaZV99CwV57gfFu8yO
         x5sdY/9HyXGXB/y22tNwiRRBBffbW3wFJKM13AZuNQS4ieP5Vu3P/TT+Kz49QfKVRnY7
         qbMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699529123; x=1700133923;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JhgRN2Rn+rtjvCYDC100dWfkXqmEv9CGax3w9Fgda48=;
        b=NEQS3DkDMbrp3cg8BuVUSXk6AHIfN4hEKaIGVYi7giKglNJQQyV32+HGrVOISfnkp6
         zsnlicMostJZK9TtF3L+in1djSfp431wHpr4HHEzvD+g4U67MA+E2Yf8dle/2d2XzxXF
         8Zx+UC9gCdSR65K6n/uvVb0Qc5oNWq3SoDG+TfzJV6x1oDvtw7A5fEg1w8d6EsWkGFHp
         adcnVVPnXoggcseN354YbsIfhffffge7UJfrii4M3DCAH9yVWEkuU+am++PQhLtK5uUC
         hpCkoTYpdHBR/Tvkh32NU2dgGymtMQIlFVEowQNtkYHCMway9rXdphStln+BBgsvHbOz
         TmZA==
X-Gm-Message-State: AOJu0YxbsLcwbI8pQGThjFFdCWSuGX6OUIAvmPTv2fVumdyG0LrrYPTd
	M9nd1DrRk+ZUAo1M/iUz2kVEPOUvs0M=
X-Google-Smtp-Source: AGHT+IH6QCtbnlZFhfuu6F2t4Oe72e99M/xqinTJVdHC04ASkRI5v8jAoSUnGjWT8MGGPPhGArAnVA==
X-Received: by 2002:aa7:88c2:0:b0:6bd:d884:df00 with SMTP id k2-20020aa788c2000000b006bdd884df00mr4599334pff.9.1699529122516;
        Thu, 09 Nov 2023 03:25:22 -0800 (PST)
Received: from localhost.localdomain ([123.51.145.88])
        by smtp.gmail.com with ESMTPSA id y36-20020a056a00182400b0068790c41ca2sm10455953pfa.27.2023.11.09.03.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Nov 2023 03:25:22 -0800 (PST)
From: JaimeLiao <jaimeliao.tw@gmail.com>
X-Google-Original-From: JaimeLiao <jaimeliao@mxic.com.tw>
To: linux-mtd@lists.infradead.org,
	miquel.raynal@bootlin.com,
	richard@nod.at
Cc: jaimeliao@mxic.com.tw,
	jaimeliao.tw@gmail.com,
	angyanyu13@gmail.com
Subject: [PATCH v3 1/5] Add clk wizard and mxic host controller driver
Date: Thu,  9 Nov 2023 19:24:56 +0800
Message-Id: <20231109112500.4966-2-jaimeliao@mxic.com.tw>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
References: <20231109112500.4966-1-jaimeliao@mxic.com.tw>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_032528_466109_74B812E3 
X-CRM114-Status: GOOD (  15.56  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Signed-off-by: JaimeLiao <jaimeliao@mxic.com.tw>
---
 arch/arm/boot/dts/xilinx/zynq-7000.dtsi       |   4 +-
 .../dts/xilinx/zynq-mxic-picozed.spi-nand.dts | 141 ++++++
 .../zynq-mxic-picozed.spi-nand_manual.dts     | 141 ++++++
 .../dts/xilinx/zynq-mxic-picozed.spi-nor.dts  | 142 ++++++
 drivers/clk/Kconfig                           |   1 +
 drivers/clk/zynq/Kconfig                      |   6 +
 drivers/clk/zynq/Makefile                     |   1 +
 drivers/clk/zynq/clk-wizard.c                 | 409 ++++++++++++++++++
 drivers/spi/spi-mxic.c                        |  84 ++--
 9 files changed, 885 insertions(+), 44 deletions(-)
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand.dts
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand_manual.dts
 create mode 100644 arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nor.dts
 create mode 100644 drivers/clk/zynq/Kconfig
 create mode 100644 drivers/clk/zynq/clk-wizard.c

diff --git a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
index a7db3f3009f2..45c207b62396 100644
--- a/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
+++ b/arch/arm/boot/dts/xilinx/zynq-7000.dtsi
@@ -289,7 +289,7 @@
 
 		sdhci0: mmc@e0100000 {
 			compatible = "arasan,sdhci-8.9a";
-			status = "disabled";
+			status = "okay";
 			clock-names = "clk_xin", "clk_ahb";
 			clocks = <&clkc 21>, <&clkc 32>;
 			interrupt-parent = <&intc>;
@@ -316,7 +316,7 @@
 			clkc: clkc@100 {
 				#clock-cells = <1>;
 				compatible = "xlnx,ps7-clkc";
-				fclk-enable = <0>;
+				fclk-enable = <0xf>;
 				clock-output-names = "armpll", "ddrpll", "iopll", "cpu_6or4x",
 						"cpu_3or2x", "cpu_2x", "cpu_1x", "ddr2x", "ddr3x",
 						"dci", "lqspi", "smc", "pcap", "gem0", "gem1",
diff --git a/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand.dts b/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand.dts
new file mode 100644
index 000000000000..a34223b70199
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand.dts
@@ -0,0 +1,141 @@
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model = "Zynq MXIC PicoZed Development Board";
+	compatible = "mxicy,zynq-mxic-picozed", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x30000000>;
+	};
+
+	chosen {
+		bootargs = "";
+		stdout-path = "serial0:115200n8";
+	};
+
+	clkwzd_in: clkwzd_in {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <133300000>;
+	};
+};
+
+&amba {
+	sdhci@e0100000 {
+			compatible = "arasan,sdhci-8.9a";
+			status = "okay";
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <0x1 0x15 0x1 0x20>;
+			interrupt-parent = <0x3>;
+			interrupts = <0x0 0x18 0x4>;
+			reg = <0xe0100000 0x1000>;
+			xlnx,has-cd = <0x1>;
+			xlnx,has-power = <0x0>;
+			xlnx,has-wp = <0x0>;
+	};
+
+	sdhci@e0101000 {
+			compatible = "arasan,sdhci-8.9a";
+			status = "okay";
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <0x1 0x16 0x1 0x21>;
+			interrupt-parent = <0x3>;
+			interrupts = <0x0 0x2f 0x4>;
+			reg = <0xe0101000 0x1000>;
+			xlnx,has-cd = <0x1>;
+			xlnx,has-power = <0x0>;
+			xlnx,has-wp = <0x0>;
+	};
+
+	clkwizard: clkwizard@43c20000 {
+		compatible = "xlnx,clk-wizard-5.1";
+		reg = <0x43c20000 0x10000>;
+		clocks = <&clkc 0xf>, <&clkc 0xf>;
+		clock-names = "aclk", "clk_in1";
+		#clock-cells = <1>;
+		xlnx,clk-wizard-num-outputs = <2>;
+		phandle = <0x12>;
+	};
+
+/* v11 */
+/*
+	clkwizard: clkwizard@43c20000 {
+		#clock-cells = <1>;
+		reg = <0x43c20000 0x1000>;
+		compatible = "xlnx,clocking-wizard";
+		xlnx,speed-grade = <1>;
+		xlnx,nr-outputs = <6>;
+		clock-names = "clk_in1", "s_axi_aclk";
+		clocks = <&clkc 18>, <&clkc 18>;
+	};
+*/
+
+	spi@43c30000 {
+		compatible = "mxicy,mx25f0a-spi";
+		reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
+		reg-names = "regs", "dirmap";
+		clocks = <&clkwizard 0x0>, <&clkwizard 0x1>, <&clkc 0xf>;
+		clock-names = "send_clk", "send_dly_clk", "ps_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		flash@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			#nand-use-soft-ecc-engine;
+			#nand-ecc-algo = "bch";
+			#nand-ecc-strength = <8>;
+			#nand-ecc-step-size = <512>;
+			spi-max-frequency = <25000000>;
+			spi-tx-bus-width = <4>;
+			spi-rx-bus-width = <4>;
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+		};
+	};
+	
+/*
+	nand: mxic-nfc@43c30000 {
+		compatible = "mxic,multi-itfc-v009-nand-controller";
+		reg = <0x43c30000 0x10000>;
+		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+		clock-names = "send", "send_dly", "ps";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand@0 {
+			reg = <0>;
+			label = "main-storage";
+
+			nand-use-soft-ecc-engine;
+			nand-ecc-algo = "bch";
+			nand-ecc-algo = "hamming";
+			nand-ecc-strength = <8>;
+			nand-ecc-step-size = <512>;
+		};
+ 
+	};
+*/
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand_manual.dts b/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand_manual.dts
new file mode 100644
index 000000000000..7b68c03deb65
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nand_manual.dts
@@ -0,0 +1,141 @@
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model = "Zynq MXIC PicoZed Development Board";
+	compatible = "mxicy,zynq-mxic-picozed", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x30000000>;
+	};
+
+	chosen {
+		bootargs = "";
+		stdout-path = "serial0:115200n8";
+	};
+
+	clkwzd_in: clkwzd_in {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <133300000>;
+	};
+};
+
+&amba {
+	sdhci@e0100000 {
+			compatible = "arasan,sdhci-8.9a";
+			status = "okay";
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <0x1 0x15 0x1 0x20>;
+			interrupt-parent = <0x3>;
+			interrupts = <0x0 0x18 0x4>;
+			reg = <0xe0100000 0x1000>;
+			xlnx,has-cd = <0x1>;
+			xlnx,has-power = <0x0>;
+			xlnx,has-wp = <0x0>;
+	};
+
+	sdhci@e0101000 {
+			compatible = "arasan,sdhci-8.9a";
+			status = "okay";
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <0x1 0x16 0x1 0x21>;
+			interrupt-parent = <0x3>;
+			interrupts = <0x0 0x2f 0x4>;
+			reg = <0xe0101000 0x1000>;
+			xlnx,has-cd = <0x1>;
+			xlnx,has-power = <0x0>;
+			xlnx,has-wp = <0x0>;
+	};
+
+	clkwizard: clkwizard@43c20000 {
+		compatible = "xlnx,clk-wizard-5.1";
+		reg = <0x43c20000 0x10000>;
+		clocks = <&clkc 0xf>, <&clkc 0xf>;
+		clock-names = "aclk", "clk_in1";
+		#clock-cells = <1>;
+		xlnx,clk-wizard-num-outputs = <2>;
+		phandle = <0x12>;
+	};
+
+/* v11 */
+/*
+	clkwizard: clkwizard@43c20000 {
+		#clock-cells = <1>;
+		reg = <0x43c20000 0x1000>;
+		compatible = "xlnx,clocking-wizard";
+		xlnx,speed-grade = <1>;
+		xlnx,nr-outputs = <6>;
+		clock-names = "clk_in1", "s_axi_aclk";
+		clocks = <&clkc 18>, <&clkc 18>;
+	};
+*/
+
+	spi@43c30000 {
+		compatible = "mxicy,mx25f0a-spi";
+		reg = <0x43c30000 0x10000>;
+		reg-names = "regs";
+		clocks = <&clkwizard 0x0>, <&clkwizard 0x1>, <&clkc 0xf>;
+		clock-names = "send_clk", "send_dly_clk", "ps_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		flash@0 {
+			compatible = "spi-nand";
+			reg = <0>;
+			#nand-use-soft-ecc-engine;
+			#nand-ecc-algo = "bch";
+			#nand-ecc-strength = <8>;
+			#nand-ecc-step-size = <512>;
+			spi-max-frequency = <25000000>;
+			spi-tx-bus-width = <1>;
+			spi-rx-bus-width = <1>;
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+		};
+	};
+	
+/*
+	nand: mxic-nfc@43c30000 {
+		compatible = "mxic,multi-itfc-v009-nand-controller";
+		reg = <0x43c30000 0x10000>;
+		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+		clock-names = "send", "send_dly", "ps";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand@0 {
+			reg = <0>;
+			label = "main-storage";
+
+			nand-use-soft-ecc-engine;
+			nand-ecc-algo = "bch";
+			nand-ecc-algo = "hamming";
+			nand-ecc-strength = <8>;
+			nand-ecc-step-size = <512>;
+		};
+ 
+	};
+*/
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nor.dts b/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nor.dts
new file mode 100644
index 000000000000..ee700c43218f
--- /dev/null
+++ b/arch/arm/boot/dts/xilinx/zynq-mxic-picozed.spi-nor.dts
@@ -0,0 +1,142 @@
+/dts-v1/;
+/include/ "zynq-7000.dtsi"
+
+/ {
+	model = "Zynq MXIC PicoZed Development Board";
+	compatible = "mxicy,zynq-mxic-picozed", "xlnx,zynq-7000";
+
+	aliases {
+		ethernet0 = &gem0;
+		serial0 = &uart1;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x30000000>;
+	};
+
+	chosen {
+		bootargs = "";
+		stdout-path = "serial0:115200n8";
+	};
+
+	clkwzd_in: clkwzd_in {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <133300000>;
+	};
+};
+
+&amba {
+	sdhci@e0100000 {
+			compatible = "arasan,sdhci-8.9a";
+			status = "okay";
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <0x1 0x15 0x1 0x20>;
+			interrupt-parent = <0x3>;
+			interrupts = <0x0 0x18 0x4>;
+			reg = <0xe0100000 0x1000>;
+			xlnx,has-cd = <0x1>;
+			xlnx,has-power = <0x0>;
+			xlnx,has-wp = <0x0>;
+	};
+
+	sdhci@e0101000 {
+			compatible = "arasan,sdhci-8.9a";
+			status = "okay";
+			clock-names = "clk_xin", "clk_ahb";
+			clocks = <0x1 0x16 0x1 0x21>;
+			interrupt-parent = <0x3>;
+			interrupts = <0x0 0x2f 0x4>;
+			reg = <0xe0101000 0x1000>;
+			xlnx,has-cd = <0x1>;
+			xlnx,has-power = <0x0>;
+			xlnx,has-wp = <0x0>;
+	};
+
+	clkwizard: clkwizard@43c20000 {
+		compatible = "xlnx,clk-wizard-5.1";
+		reg = <0x43c20000 0x10000>;
+		clocks = <&clkc 0xf>, <&clkc 0xf>;
+		clock-names = "aclk", "clk_in1";
+		#clock-cells = <1>;
+		xlnx,clk-wizard-num-outputs = <2>;
+		phandle = <0x12>;
+	};
+
+/* v11 */
+/*
+	clkwizard: clkwizard@43c20000 {
+		#clock-cells = <1>;
+		reg = <0x43c20000 0x1000>;
+		compatible = "xlnx,clocking-wizard";
+		xlnx,speed-grade = <1>;
+		xlnx,nr-outputs = <6>;
+		clock-names = "clk_in1", "s_axi_aclk";
+		clocks = <&clkc 18>, <&clkc 18>;
+	};
+*/
+
+	spi@43c30000 {
+		compatible = "mxicy,mx25f0a-spi";
+		reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
+		reg-names = "regs", "dirmap";
+		clocks = <&clkwizard 0x0>, <&clkwizard 0x1>, <&clkc 0xf>;
+		clock-names = "send_clk", "send_dly_clk", "ps_clk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		flash@0 {
+			#compatible = "spi-nand";
+			compatible = "jedec,spi-nor";
+			reg = <0>;
+			#nand-use-soft-ecc-engine;
+			#nand-ecc-algo = "bch";
+			#nand-ecc-strength = <8>;
+			#nand-ecc-step-size = <512>;
+			spi-max-frequency = <25000000>;
+			spi-tx-bus-width = <8>;
+			spi-rx-bus-width = <8>;
+			#address-cells = <0x1>;
+			#size-cells = <0x1>;
+		};
+	};
+	
+/*
+	nand: mxic-nfc@43c30000 {
+		compatible = "mxic,multi-itfc-v009-nand-controller";
+		reg = <0x43c30000 0x10000>;
+		clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+		clock-names = "send", "send_dly", "ps";
+		interrupt-parent = <&intc>;
+		interrupts = <GIC_SPI 29 IRQ_TYPE_EDGE_RISING>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		nand@0 {
+			reg = <0>;
+			label = "main-storage";
+
+			nand-use-soft-ecc-engine;
+			nand-ecc-algo = "bch";
+			nand-ecc-algo = "hamming";
+			nand-ecc-strength = <8>;
+			nand-ecc-step-size = <512>;
+		};
+ 
+	};
+*/
+};
+
+&clkc {
+	ps-clk-frequency = <33333333>;
+};
+
+&gem0 {
+	status = "okay";
+	phy-mode = "rgmii-id";
+};
+
+&uart1 {
+	status = "okay";
+};
diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
index c30d0d396f7a..f16464abacf5 100644
--- a/drivers/clk/Kconfig
+++ b/drivers/clk/Kconfig
@@ -510,6 +510,7 @@ source "drivers/clk/visconti/Kconfig"
 source "drivers/clk/x86/Kconfig"
 source "drivers/clk/xilinx/Kconfig"
 source "drivers/clk/zynqmp/Kconfig"
+source "drivers/clk/zynq/Kconfig"
 
 # Kunit test cases
 config CLK_KUNIT_TEST
diff --git a/drivers/clk/zynq/Kconfig b/drivers/clk/zynq/Kconfig
new file mode 100644
index 000000000000..240ff17daa8f
--- /dev/null
+++ b/drivers/clk/zynq/Kconfig
@@ -0,0 +1,6 @@
+config CLK_ZYNQ_CLK_WIZARD
+        tristate "Xilinx clocking wizard driver"
+        depends on ARCH_ZYNQ || COMPILE_TEST
+        help
+          Enable the driver for Xilinx clocking wizard IP.
+
diff --git a/drivers/clk/zynq/Makefile b/drivers/clk/zynq/Makefile
index a5bb696de943..b1a1628048fb 100644
--- a/drivers/clk/zynq/Makefile
+++ b/drivers/clk/zynq/Makefile
@@ -2,3 +2,4 @@
 # Zynq clock specific Makefile
 
 obj-y	+= clkc.o pll.o
+obj-$(CONFIG_CLK_ZYNQ_CLK_WIZARD)      += clk-wizard.o
diff --git a/drivers/clk/zynq/clk-wizard.c b/drivers/clk/zynq/clk-wizard.c
new file mode 100644
index 000000000000..3b217f8a8ffa
--- /dev/null
+++ b/drivers/clk/zynq/clk-wizard.c
@@ -0,0 +1,409 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Zynq Clocking Wizard driver
+ *
+ *  Copyright (C) 2018 Macronix
+ */
+
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
+#include <linux/io.h>
+#include <linux/iopoll.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_address.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#define SRR			0x0
+
+#define SR			0x4
+#define SR_LOCKED		BIT(0)
+
+#define CCR(x)			(0x200 + ((x) * 4))
+
+#define FBOUT_CFG		CCR(0)
+#define FBOUT_DIV(x)		(x)
+#define FBOUT_GET_DIV(x)	((x) & GENMASK(7, 0))
+#define FBOUT_MUL(x)		((x) << 8)
+#define FBOUT_GET_MUL(x)	(((x) & GENMASK(15, 8)) >> 8)
+#define FBOUT_FRAC(x)		((x) << 16)
+#define FBOUT_GET_FRAC(x)	(((x) & GENMASK(25, 16)) >> 16)
+#define FBOUT_FRAC_EN		BIT(26)
+
+#define FBOUT_PHASE		CCR(1)
+
+#define OUT_CFG(x)		CCR(2 + ((x) * 3))
+#define OUT_DIV(x)		(x)
+#define OUT_GET_DIV(x)		((x) & GENMASK(7, 0))
+#define OUT_FRAC(x)		((x) << 8)
+#define OUT_GET_FRAC(x)		(((x) & GENMASK(17, 8)) >> 8)
+#define OUT_FRAC_EN		BIT(18)
+
+#define OUT_PHASE(x)		CCR(3 + ((x) * 3))
+#define OUT_DUTY(x)		CCR(4 + ((x) * 3))
+
+#define CTRL			CCR(23)
+#define CTRL_SEN		BIT(2)
+#define CTRL_SADDR		BIT(1)
+#define CTRL_LOAD		BIT(0)
+
+struct clkwzd;
+
+struct clkwzd_fbout {
+	struct clk_hw base;
+	struct clkwzd *wzd;
+};
+
+static inline struct clkwzd_fbout *to_clkwzd_fbout(struct clk_hw *hw)
+{
+	return container_of(hw, struct clkwzd_fbout, base);
+}
+
+struct clkwzd_out {
+	struct clk_hw base;
+	struct clkwzd *wzd;
+	unsigned int id;
+};
+
+static inline struct clkwzd_out *to_clkwzd_out(struct clk_hw *hw)
+{
+	return container_of(hw, struct clkwzd_out, base);
+}
+
+#define CLKWZD_MAX_OUTPUT	7
+
+struct clkwzd {
+	struct mutex lock;
+	struct clk *aclk;
+	struct clk *clk_in1;
+	void __iomem *regs;
+	struct clkwzd_out out[CLKWZD_MAX_OUTPUT];
+	struct clkwzd_fbout fbout;
+	struct clk_hw_onecell_data *onecell;
+};
+
+
+static int clkwzd_is_locked(struct clkwzd *wzd)
+{
+	bool prepared;
+
+	mutex_lock(&wzd->lock);
+	prepared = readl(wzd->regs + SR) & SR_LOCKED;
+	mutex_unlock(&wzd->lock);
+
+	return prepared;
+}
+
+static int clkwzd_apply_conf(struct clkwzd *wzd)
+{
+	int ret;
+	u32 val;
+
+	mutex_lock(&wzd->lock);
+	ret = readl_poll_timeout(wzd->regs + SR, val, val & SR_LOCKED, 1, 100);
+	if (!ret) {
+		writel(CTRL_SEN | CTRL_SADDR | CTRL_LOAD, wzd->regs + CTRL);
+		writel(CTRL_SADDR, wzd->regs + CTRL);
+		ret = readl_poll_timeout(wzd->regs + SR, val, val & SR_LOCKED,
+					 1, 100);
+	}
+	mutex_unlock(&wzd->lock);
+
+	return 0;
+}
+
+static int clkwzd_fbout_is_prepared(struct clk_hw *hw)
+{
+	struct clkwzd_fbout *fbout = to_clkwzd_fbout(hw);
+
+	return clkwzd_is_locked(fbout->wzd);
+}
+
+static int clkwzd_fbout_prepare(struct clk_hw *hw)
+{
+	struct clkwzd_fbout *fbout = to_clkwzd_fbout(hw);
+
+	return clkwzd_apply_conf(fbout->wzd);
+}
+
+static unsigned long clkwzd_fbout_recalc_rate(struct clk_hw *hw,
+					      unsigned long parent_rate)
+{
+	struct clkwzd_fbout *fbout = to_clkwzd_fbout(hw);
+	unsigned long rate;
+	u32 cfg;
+
+	cfg = readl(fbout->wzd->regs + FBOUT_CFG);
+	if (cfg & FBOUT_FRAC_EN)
+		rate = DIV_ROUND_DOWN_ULL((u64)parent_rate *
+					  ((FBOUT_GET_MUL(cfg) * 1000) +
+					   FBOUT_GET_FRAC(cfg)),
+					  1000);
+	else
+		rate = parent_rate * FBOUT_GET_MUL(cfg);
+
+	rate /= FBOUT_GET_DIV(cfg);
+
+	return rate;
+}
+
+static int clkwzd_fbout_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clkwzd_fbout *fbout = to_clkwzd_fbout(hw);
+
+	writel(degrees * 1000, fbout->wzd->regs + FBOUT_PHASE);
+
+	return 0;
+}
+
+static int clkwzd_fbout_get_phase(struct clk_hw *hw)
+{
+	struct clkwzd_fbout *fbout = to_clkwzd_fbout(hw);
+
+	return readl(fbout->wzd->regs + FBOUT_PHASE) / 1000;
+}
+
+const struct clk_ops fbout_ops = {
+	.is_prepared = clkwzd_fbout_is_prepared,
+	.prepare = clkwzd_fbout_prepare,
+	.recalc_rate = clkwzd_fbout_recalc_rate,
+	.set_phase = clkwzd_fbout_set_phase,
+	.get_phase = clkwzd_fbout_get_phase,
+};
+
+static int clkwzd_out_is_prepared(struct clk_hw *hw)
+{
+	struct clkwzd_out *out = to_clkwzd_out(hw);
+
+	return clkwzd_is_locked(out->wzd);
+}
+
+static int clkwzd_out_prepare(struct clk_hw *hw)
+{
+	struct clkwzd_out *out = to_clkwzd_out(hw);
+
+	return clkwzd_apply_conf(out->wzd);
+}
+
+static unsigned long clkwzd_out_recalc_rate(struct clk_hw *hw,
+					    unsigned long parent_rate)
+{
+	struct clkwzd_out *out = to_clkwzd_out(hw);
+	unsigned long rate;
+	u32 cfg;
+
+	cfg = readl(out->wzd->regs + OUT_CFG(out->id));
+	if (cfg & OUT_FRAC_EN)
+		rate = DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000,
+					  ((OUT_GET_DIV(cfg) * 1000) +
+					   OUT_GET_FRAC(cfg)));
+	else
+		rate = parent_rate / OUT_GET_DIV(cfg);
+
+	return rate;
+}
+
+static int clkwzd_out_set_rate(struct clk_hw *hw,
+			       unsigned long rate,
+			       unsigned long parent_rate)
+{
+	struct clkwzd_out *out = to_clkwzd_out(hw);
+	u64 div;
+	u32 cfg;
+
+	div = DIV_ROUND_DOWN_ULL((u64)parent_rate * 1000, rate);
+	if (div < 1000 || div > 255999)
+		return -EINVAL;
+
+	cfg = OUT_DIV((u32)div / 1000);
+
+	if ((u32)div % 1000)
+		cfg |= OUT_FRAC_EN | OUT_FRAC((u32)div % 1000);
+
+	writel(cfg, out->wzd->regs + OUT_CFG(out->id));
+
+	/* Set duty cycle to 50%. */
+	writel(50000, out->wzd->regs + OUT_DUTY(out->id));
+
+	return 0;
+}
+
+static long clkwzd_out_round_rate(struct clk_hw *hw,
+				  unsigned long rate,
+				  unsigned long *parent_rate)
+{
+	u64 div;
+
+	div = DIV_ROUND_CLOSEST_ULL((u64)(*parent_rate) * 1000, rate);
+	if (div < 1000)
+		return *parent_rate;
+
+	if (div > 255999)
+		div = 255999;
+
+	return DIV_ROUND_DOWN_ULL((u64)(*parent_rate) * 1000, (u32)div);
+}
+
+static int clkwzd_out_set_phase(struct clk_hw *hw, int degrees)
+{
+	struct clkwzd_out *out = to_clkwzd_out(hw);
+
+	writel(degrees * 1000, out->wzd->regs + OUT_PHASE(out->id));
+
+	return 0;
+}
+
+static int clkwzd_out_get_phase(struct clk_hw *hw)
+{
+	struct clkwzd_out *out = to_clkwzd_out(hw);
+
+	return readl(out->wzd->regs + OUT_PHASE(out->id)) / 1000;
+}
+
+static const struct clk_ops out_ops = {
+	.is_prepared = clkwzd_out_is_prepared,
+	.prepare = clkwzd_out_prepare,
+	.recalc_rate = clkwzd_out_recalc_rate,
+	.round_rate = clkwzd_out_round_rate,
+	.set_rate = clkwzd_out_set_rate,
+	.set_phase = clkwzd_out_set_phase,
+	.get_phase = clkwzd_out_get_phase,
+};
+
+static int zynq_clkwzd_probe(struct platform_device *pdev)
+{
+	struct clk_init_data fboutinit = { };
+	const char *clk_in_name;
+	struct resource *res;
+	struct clkwzd *wzd;
+	u32 i, noutputs = 0;
+	int ret;
+
+	wzd = devm_kzalloc(&pdev->dev, sizeof(*wzd), GFP_KERNEL);
+	if (!wzd)
+		return -ENOMEM;
+
+	wzd->aclk = devm_clk_get(&pdev->dev, "aclk");
+	if (IS_ERR(wzd->aclk))
+		return PTR_ERR(wzd->aclk);
+
+	wzd->clk_in1 = devm_clk_get(&pdev->dev, "clk_in1");
+	if (IS_ERR(wzd->clk_in1))
+		return PTR_ERR(wzd->clk_in1);
+
+	of_property_read_u32(pdev->dev.of_node, "xlnx,clk-wizard-num-outputs",
+			     &noutputs);
+	if (!noutputs || noutputs >= CLKWZD_MAX_OUTPUT)
+		return -EINVAL;
+
+	wzd->onecell = devm_kzalloc(&pdev->dev,
+				    sizeof(*wzd->onecell) +
+				    (sizeof(*wzd->onecell->hws) * noutputs),
+				    GFP_KERNEL);
+	if (!wzd->onecell)
+		return -ENOMEM;
+
+	clk_in_name = __clk_get_name(wzd->clk_in1);
+	if (!clk_in_name)
+		return -EINVAL;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	wzd->regs = devm_ioremap_resource(&pdev->dev, res);
+	if (IS_ERR(wzd->regs))
+		return PTR_ERR(wzd->regs);
+
+	mutex_init(&wzd->lock);
+
+	wzd->fbout.wzd = wzd;
+	fboutinit.ops = &fbout_ops;
+	fboutinit.flags = CLK_SET_RATE_GATE;
+	fboutinit.num_parents = 1;
+	fboutinit.parent_names = &clk_in_name;
+	fboutinit.flags = CLK_SET_RATE_GATE;
+
+	fboutinit.name = devm_kasprintf(&pdev->dev, GFP_KERNEL, "%s-fbout",
+					dev_name(&pdev->dev));
+	if (!fboutinit.name)
+		return -ENOMEM;
+
+	ret = clk_prepare_enable(wzd->aclk);
+	if (ret)
+		return ret;
+
+	wzd->fbout.base.init = &fboutinit;
+	ret = devm_clk_hw_register(&pdev->dev, &wzd->fbout.base);
+	if (ret)
+		goto err_disable_aclk;
+
+	for (i = 0; i < noutputs; i++) {
+		struct clk_init_data outinit = { };
+
+		wzd->out[i].id = i;
+		wzd->out[i].wzd = wzd;
+		outinit.ops = &out_ops;
+		outinit.num_parents = 1;
+		outinit.parent_names = &fboutinit.name;
+		outinit.flags = CLK_SET_RATE_GATE;
+		wzd->out[i].base.init = &outinit;
+		outinit.name = devm_kasprintf(&pdev->dev, GFP_KERNEL,
+					      "%s-out%d",
+					      dev_name(&pdev->dev), i);
+		if (!outinit.name) {
+			ret = -ENOMEM;
+			goto err_disable_aclk;
+		}
+
+		ret = devm_clk_hw_register(&pdev->dev, &wzd->out[i].base);
+		if (ret)
+			goto err_disable_aclk;
+
+		wzd->onecell->hws[i] = &wzd->out[i].base;
+	}
+
+	wzd->onecell->num = noutputs;
+	ret = devm_of_clk_add_hw_provider(&pdev->dev,
+					  of_clk_hw_onecell_get,
+					  wzd->onecell);
+	if (ret)
+		goto err_disable_aclk;
+
+	platform_set_drvdata(pdev, wzd);
+
+	return 0;
+
+err_disable_aclk:
+	clk_disable_unprepare(wzd->aclk);
+
+	return ret;
+}
+
+static int zynq_clkwzd_remove(struct platform_device *pdev)
+{
+	struct clkwzd *wzd = platform_get_drvdata(pdev);
+
+	clk_disable_unprepare(wzd->aclk);
+
+	return 0;
+}
+
+static const struct of_device_id zynq_clkwzd_of_ids[] = {
+	{ .compatible = "xlnx,clk-wizard-5.1" },
+	{ /* sentinel */ },
+};
+MODULE_DEVICE_TABLE(of, zynq_clkwzd_of_ids);
+
+static struct platform_driver zynq_clkwzd_driver = {
+	.probe = zynq_clkwzd_probe,
+	.remove = zynq_clkwzd_remove,
+	.driver = {
+		.name = "zynq-clk-wizard",
+		.of_match_table = zynq_clkwzd_of_ids,
+	},
+};
+module_platform_driver(zynq_clkwzd_driver);
+
+MODULE_AUTHOR("Boris Brezillon <boris.brezillon@bootlin.com>");
+MODULE_DESCRIPTION("Xilinx Clocking Wizard driver");
+MODULE_LICENSE("GPL");
diff --git a/drivers/spi/spi-mxic.c b/drivers/spi/spi-mxic.c
index 60c9f3048ac9..28c324d7200a 100644
--- a/drivers/spi/spi-mxic.c
+++ b/drivers/spi/spi-mxic.c
@@ -323,7 +323,7 @@ static u32 mxic_spi_mem_prep_op_cfg(const struct spi_mem_op *op,
 		       (op->addr.dtr ? OP_ADDR_DDR : 0);
 
 	if (op->dummy.nbytes)
-		cfg |= OP_DUMMY_CYC(op->dummy.nbytes);
+		cfg |= OP_DUMMY_CYC((op->dummy.nbytes) * (op->data.buswidth));
 
 	/* Direct mapping data.nbytes field is not populated */
 	if (data_len) {
@@ -390,7 +390,7 @@ static int mxic_spi_data_xfer(struct mxic_spi *mxic, const void *txbuf,
 static ssize_t mxic_spi_mem_dirmap_read(struct spi_mem_dirmap_desc *desc,
 					u64 offs, size_t len, void *buf)
 {
-	struct mxic_spi *mxic = spi_controller_get_devdata(desc->mem->spi->controller);
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
 	int ret;
 	u32 sts;
 
@@ -434,7 +434,7 @@ static ssize_t mxic_spi_mem_dirmap_write(struct spi_mem_dirmap_desc *desc,
 					 u64 offs, size_t len,
 					 const void *buf)
 {
-	struct mxic_spi *mxic = spi_controller_get_devdata(desc->mem->spi->controller);
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
 	u32 sts;
 	int ret;
 
@@ -481,9 +481,9 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 	    op->dummy.buswidth > 8 || op->cmd.buswidth > 8)
 		return false;
 
-	if (op->data.nbytes && op->dummy.nbytes &&
-	    op->data.buswidth != op->dummy.buswidth)
-		return false;
+	//if (op->data.nbytes && op->dummy.nbytes &&
+	//    op->data.buswidth != op->dummy.buswidth)
+	//	return false;
 
 	if (op->addr.nbytes > 7)
 		return false;
@@ -493,7 +493,7 @@ static bool mxic_spi_mem_supports_op(struct spi_mem *mem,
 
 static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)
 {
-	struct mxic_spi *mxic = spi_controller_get_devdata(desc->mem->spi->controller);
+	struct mxic_spi *mxic = spi_master_get_devdata(desc->mem->spi->master);
 
 	if (!mxic->linear.map)
 		return -EINVAL;
@@ -510,7 +510,7 @@ static int mxic_spi_mem_dirmap_create(struct spi_mem_dirmap_desc *desc)
 static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 				const struct spi_mem_op *op)
 {
-	struct mxic_spi *mxic = spi_controller_get_devdata(mem->spi->controller);
+	struct mxic_spi *mxic = spi_master_get_devdata(mem->spi->master);
 	int i, ret;
 	u8 addr[8], cmd[2];
 
@@ -543,7 +543,7 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 	if (ret)
 		goto out;
 
-	ret = mxic_spi_data_xfer(mxic, NULL, NULL, op->dummy.nbytes);
+	ret = mxic_spi_data_xfer(mxic, NULL, NULL, (op->dummy.nbytes) * (op->data.buswidth));
 	if (ret)
 		goto out;
 
@@ -565,9 +565,9 @@ static int mxic_spi_mem_exec_op(struct spi_mem *mem,
 static const struct spi_controller_mem_ops mxic_spi_mem_ops = {
 	.supports_op = mxic_spi_mem_supports_op,
 	.exec_op = mxic_spi_mem_exec_op,
-	.dirmap_create = mxic_spi_mem_dirmap_create,
-	.dirmap_read = mxic_spi_mem_dirmap_read,
-	.dirmap_write = mxic_spi_mem_dirmap_write,
+	//.dirmap_create = mxic_spi_mem_dirmap_create,
+	//.dirmap_read = mxic_spi_mem_dirmap_read,
+	//.dirmap_write = mxic_spi_mem_dirmap_write,
 };
 
 static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
@@ -577,7 +577,7 @@ static const struct spi_controller_mem_caps mxic_spi_mem_caps = {
 
 static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
 {
-	struct mxic_spi *mxic = spi_controller_get_devdata(spi->controller);
+	struct mxic_spi *mxic = spi_master_get_devdata(spi->master);
 
 	if (!lvl) {
 		writel(readl(mxic->regs + HC_CFG) | HC_CFG_MAN_CS_EN,
@@ -592,11 +592,11 @@ static void mxic_spi_set_cs(struct spi_device *spi, bool lvl)
 	}
 }
 
-static int mxic_spi_transfer_one(struct spi_controller *host,
+static int mxic_spi_transfer_one(struct spi_master *master,
 				 struct spi_device *spi,
 				 struct spi_transfer *t)
 {
-	struct mxic_spi *mxic = spi_controller_get_devdata(host);
+	struct mxic_spi *mxic = spi_master_get_devdata(master);
 	unsigned int busw = OP_BUSW_1;
 	int ret;
 
@@ -632,7 +632,7 @@ static int mxic_spi_transfer_one(struct spi_controller *host,
 	if (ret)
 		return ret;
 
-	spi_finalize_current_transfer(host);
+	spi_finalize_current_transfer(master);
 
 	return 0;
 }
@@ -713,8 +713,8 @@ static int mxic_spi_mem_ecc_probe(struct platform_device *pdev,
 
 static int __maybe_unused mxic_spi_runtime_suspend(struct device *dev)
 {
-	struct spi_controller *host = dev_get_drvdata(dev);
-	struct mxic_spi *mxic = spi_controller_get_devdata(host);
+	struct spi_master *master = dev_get_drvdata(dev);
+	struct mxic_spi *mxic = spi_master_get_devdata(master);
 
 	mxic_spi_clk_disable(mxic);
 	clk_disable_unprepare(mxic->ps_clk);
@@ -724,8 +724,8 @@ static int __maybe_unused mxic_spi_runtime_suspend(struct device *dev)
 
 static int __maybe_unused mxic_spi_runtime_resume(struct device *dev)
 {
-	struct spi_controller *host = dev_get_drvdata(dev);
-	struct mxic_spi *mxic = spi_controller_get_devdata(host);
+	struct spi_master *master = dev_get_drvdata(dev);
+	struct mxic_spi *mxic = spi_master_get_devdata(master);
 	int ret;
 
 	ret = clk_prepare_enable(mxic->ps_clk);
@@ -744,21 +744,21 @@ static const struct dev_pm_ops mxic_spi_dev_pm_ops = {
 
 static int mxic_spi_probe(struct platform_device *pdev)
 {
-	struct spi_controller *host;
+	struct spi_master *master;
 	struct resource *res;
 	struct mxic_spi *mxic;
 	int ret;
 
-	host = devm_spi_alloc_host(&pdev->dev, sizeof(struct mxic_spi));
-	if (!host)
+	master = devm_spi_alloc_master(&pdev->dev, sizeof(struct mxic_spi));
+	if (!master)
 		return -ENOMEM;
 
-	platform_set_drvdata(pdev, host);
+	platform_set_drvdata(pdev, master);
 
-	mxic = spi_controller_get_devdata(host);
+	mxic = spi_master_get_devdata(master);
 	mxic->dev = &pdev->dev;
 
-	host->dev.of_node = pdev->dev.of_node;
+	master->dev.of_node = pdev->dev.of_node;
 
 	mxic->ps_clk = devm_clk_get(&pdev->dev, "ps_clk");
 	if (IS_ERR(mxic->ps_clk))
@@ -786,19 +786,19 @@ static int mxic_spi_probe(struct platform_device *pdev)
 	}
 
 	pm_runtime_enable(&pdev->dev);
-	host->auto_runtime_pm = true;
+	master->auto_runtime_pm = true;
 
-	host->num_chipselect = 1;
-	host->mem_ops = &mxic_spi_mem_ops;
-	host->mem_caps = &mxic_spi_mem_caps;
+	master->num_chipselect = 1;
+	master->mem_ops = &mxic_spi_mem_ops;
+	master->mem_caps = &mxic_spi_mem_caps;
 
-	host->set_cs = mxic_spi_set_cs;
-	host->transfer_one = mxic_spi_transfer_one;
-	host->bits_per_word_mask = SPI_BPW_MASK(8);
-	host->mode_bits = SPI_CPOL | SPI_CPHA |
-			  SPI_RX_DUAL | SPI_TX_DUAL |
-			  SPI_RX_QUAD | SPI_TX_QUAD |
-			  SPI_RX_OCTAL | SPI_TX_OCTAL;
+	master->set_cs = mxic_spi_set_cs;
+	master->transfer_one = mxic_spi_transfer_one;
+	master->bits_per_word_mask = SPI_BPW_MASK(8);
+	master->mode_bits = SPI_CPOL | SPI_CPHA |
+			SPI_RX_DUAL | SPI_TX_DUAL |
+			SPI_RX_QUAD | SPI_TX_QUAD |
+			SPI_RX_OCTAL | SPI_TX_OCTAL;
 
 	mxic_spi_hw_init(mxic);
 
@@ -808,9 +808,9 @@ static int mxic_spi_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	ret = spi_register_controller(host);
+	ret = spi_register_master(master);
 	if (ret) {
-		dev_err(&pdev->dev, "spi_register_controller failed\n");
+		dev_err(&pdev->dev, "spi_register_master failed\n");
 		pm_runtime_disable(&pdev->dev);
 		mxic_spi_mem_ecc_remove(mxic);
 	}
@@ -820,12 +820,12 @@ static int mxic_spi_probe(struct platform_device *pdev)
 
 static void mxic_spi_remove(struct platform_device *pdev)
 {
-	struct spi_controller *host = platform_get_drvdata(pdev);
-	struct mxic_spi *mxic = spi_controller_get_devdata(host);
+	struct spi_master *master = platform_get_drvdata(pdev);
+	struct mxic_spi *mxic = spi_master_get_devdata(master);
 
 	pm_runtime_disable(&pdev->dev);
 	mxic_spi_mem_ecc_remove(mxic);
-	spi_unregister_controller(host);
+	spi_unregister_master(master);
 }
 
 static const struct of_device_id mxic_spi_of_ids[] = {
-- 
2.17.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
