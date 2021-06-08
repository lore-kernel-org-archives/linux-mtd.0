Return-Path: <SRS0=i2dy=LC=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288C1C47094
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 02:29:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E22F361185
	for <linux-mtd@archiver.kernel.org>; Tue,  8 Jun 2021 02:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E22F361185
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=apUGiK6PvBkG7VvVZOezJuAOjMLs+a5SEUehLKJBLNo=; b=3MpP3LgEhG8KzI
	qx8vCkc0kfUKr+t3BRMpYMPMeeXYzx0QNIktmmufhoJQxnNKIEZqpPdlKvF1AMhPpnGurnWVya93G
	LXMsMIeKeCKsnoBhF7AKUvHH9OGN0bMDej7mAfxU8QEks/ri9FFHeybj9X8lLX9BzyyS1m+1Ds8i+
	LuQa+pih8ioPTDese9iBaq/fb9TLY6nrcCR3iiwW3aF4Gdo0nSgyDR6hcUgLM5MF5cjSuFsVsA+P/
	wbGLvfmKle/8BE/bl1yCPIjFIFj7feBhkidlezzisj1TN+VECBYNBwdKLQwooQ2fFMRyvMFgFIeMT
	XP3enSywAKYfawdO3hAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqRTJ-0060sj-J8; Tue, 08 Jun 2021 02:28:05 +0000
Received: from lucky1.263xmail.com ([211.157.147.132])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqRSH-0060eV-Et; Tue, 08 Jun 2021 02:27:02 +0000
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id D4DF7F4B1B;
 Tue,  8 Jun 2021 10:26:57 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31748T140095290545920S1623119206974105_; 
 Tue, 08 Jun 2021 10:26:55 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <dd4a2cd6961df4e90ca9b904b05c5cf6>
X-RL-SENDER: jon.lin@rock-chips.com
X-SENDER: jon.lin@rock-chips.com
X-LOGIN-NAME: jon.lin@rock-chips.com
X-FST-TO: linux-spi@vger.kernel.org
X-RCPT-COUNT: 17
X-SENDER-IP: 58.22.7.114
X-ATTACHMENT-NUM: 0
X-System-Flag: 0
From: Jon Lin <jon.lin@rock-chips.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, macroalpha82@gmail.com, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v6 3/8] arm64: dts: rockchip: Add SFC to PX30
Date: Tue,  8 Jun 2021 10:26:39 +0800
Message-Id: <20210608022644.21074-4-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210608022644.21074-1-jon.lin@rock-chips.com>
References: <20210608022644.21074-1-jon.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210607_192701_686962_726BAF23 
X-CRM114-Status: GOOD (  11.27  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add a devicetree entry for the Rockchip SFC for the PX30 SOC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None
Changes in v1: None

 arch/arm64/boot/dts/rockchip/px30.dtsi | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 09baa8a167ce..99a46259e428 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -966,6 +966,18 @@
 		status = "disabled";
 	};
 
+	sfc: spi@ff3a0000 {
+		compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
+		reg = <0x0 0xff3a0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SFC>, <&cru SCLK_SFC>;
+		clock-names = "hclk_sfc", "clk_sfc";
+		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
+		pinctrl-names = "default";
+		power-domains = <&power PX30_PD_MMC_NAND>;
+		status = "disabled";
+	};
+
 	nfc: nand-controller@ff3b0000 {
 		compatible = "rockchip,px30-nfc";
 		reg = <0x0 0xff3b0000 0x0 0x4000>;
@@ -1967,6 +1979,32 @@
 			};
 		};
 
+		serial_flash {
+			sfc_bus4: sfc-bus4 {
+				rockchip,pins =
+					<1 RK_PA0 3 &pcfg_pull_none>,
+					<1 RK_PA1 3 &pcfg_pull_none>,
+					<1 RK_PA2 3 &pcfg_pull_none>,
+					<1 RK_PA3 3 &pcfg_pull_none>;
+			};
+
+			sfc_bus2: sfc-bus2 {
+				rockchip,pins =
+					<1 RK_PA0 3 &pcfg_pull_none>,
+					<1 RK_PA1 3 &pcfg_pull_none>;
+			};
+
+			sfc_cs0: sfc-cs0 {
+				rockchip,pins =
+					<1 RK_PA4 3 &pcfg_pull_none>;
+			};
+
+			sfc_clk: sfc-clk {
+				rockchip,pins =
+					<1 RK_PB1 3 &pcfg_pull_none>;
+			};
+		};
+
 		lcdc {
 			lcdc_rgb_dclk_pin: lcdc-rgb-dclk-pin {
 				rockchip,pins =
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
