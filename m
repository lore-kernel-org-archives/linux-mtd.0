Return-Path: <SRS0=Gl3N=LD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9685EC48BCF
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 15:12:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 60E8060E0B
	for <linux-mtd@archiver.kernel.org>; Wed,  9 Jun 2021 15:12:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 60E8060E0B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rock-chips.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmN/Tur+Vzg7zO15jrHobWb3oCcXEikTvmtopkQuc6E=; b=y8V6+ygkbsj/0w
	sLxn/ngQznHDL6Ki8U+RyV6yQqpyYKCuqyQXPR7Jb9BjQei1aoaBnyObWVfV22WIhayN4+fhXx7jd
	8QmJjZfTT3R/MY5ubTmRP/uiX438GBqFf2e75H7WmaHErLhysClayNcQMvWW8zpKUC+zNqXnja6dR
	JUf+TcHz8B/yxlxjJ9mzEM+YKAecsf3ZM5zTWuMfUZNXOWtKGuHf0L9a/+bMIcisGYlEkl5zGW2jd
	Y+fMMOJSP3kQUrWIALsXNWia1FDC3CcrvB2GQltOwrXGy3KPhoNe1kFAaGsvaknavdd0SWMwVr6TA
	mKnoS1iQ6G2YWIieUHDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqzrn-00EWKG-As; Wed, 09 Jun 2021 15:11:39 +0000
Received: from lucky1.263xmail.com ([211.157.147.133])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqyxz-00EEq7-6E; Wed, 09 Jun 2021 14:14:00 +0000
Received: from localhost (unknown [192.168.167.235])
 by lucky1.263xmail.com (Postfix) with ESMTP id 59E27CD975;
 Wed,  9 Jun 2021 22:13:54 +0800 (CST)
X-MAIL-GRAY: 0
X-MAIL-DELIVERY: 1
X-ADDR-CHECKED4: 1
X-ANTISPAM-LEVEL: 2
X-ABS-CHECKED: 0
Received: from localhost.localdomain (unknown [58.22.7.114])
 by smtp.263.net (postfix) whith ESMTP id
 P31748T140095021577984S1623248030099962_; 
 Wed, 09 Jun 2021 22:13:54 +0800 (CST)
X-IP-DOMAINF: 1
X-UNIQUE-TAG: <6e9b8c89d5308aec48f5cbad6c2d8894>
X-RL-SENDER: jon.lin@rock-chips.com
X-SENDER: jon.lin@rock-chips.com
X-LOGIN-NAME: jon.lin@rock-chips.com
X-FST-TO: linux-spi@vger.kernel.org
X-RCPT-COUNT: 20
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
 mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org,
 Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v7 6/9] arm: dts: rockchip: Add SFC to RK3036
Date: Wed,  9 Jun 2021 22:13:45 +0800
Message-Id: <20210609141348.19178-2-jon.lin@rock-chips.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210609141348.19178-1-jon.lin@rock-chips.com>
References: <20210609140412.16058-1-jon.lin@rock-chips.com>
 <20210609141348.19178-1-jon.lin@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_071359_635320_FBA3A23E 
X-CRM114-Status: GOOD (  10.32  )
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

Add a devicetree entry for the Rockchip SFC for the RK3036 SOC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
Signed-off-by: Jon Lin <jon.lin@rock-chips.com>
---

Changes in v7: None
Changes in v6: None
Changes in v5: None
Changes in v4: None
Changes in v3: None
Changes in v2: None
Changes in v1: None

 arch/arm/boot/dts/rk3036.dtsi | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index e24230d50a78..06e37be81393 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -206,6 +206,17 @@
 		status = "disabled";
 	};
 
+	sfc: spi@10208000 {
+		compatible = "rockchip,sfc";
+		reg = <0x10208000 0x4000>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+		clock-names = "clk_sfc", "hclk_sfc";
+		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	sdmmc: mmc@10214000 {
 		compatible = "rockchip,rk3036-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x10214000 0x4000>;
@@ -684,6 +695,37 @@
 			};
 		};
 
+		sfc {
+			sfc_bus4: sfc-bus4 {
+				rockchip,pins =
+					<1 RK_PD0 3 &pcfg_pull_none>,
+					<1 RK_PD1 3 &pcfg_pull_none>,
+					<1 RK_PD2 3 &pcfg_pull_none>,
+					<1 RK_PD3 3 &pcfg_pull_none>;
+			};
+
+			sfc_bus2: sfc-bus2 {
+				rockchip,pins =
+					<1 RK_PD0 3 &pcfg_pull_none>,
+					<1 RK_PD1 3 &pcfg_pull_none>;
+			};
+
+			sfc_cs0: sfc-cs0 {
+				rockchip,pins =
+					<2 RK_PA2 3 &pcfg_pull_none>;
+			};
+
+			sfc_cs1: sfc-cs1 {
+				rockchip,pins =
+					<2 RK_PA3 3 &pcfg_pull_none>;
+			};
+
+			sfc_clk: sfc-clk {
+				rockchip,pins =
+					<2 RK_PA4 3 &pcfg_pull_none>;
+			};
+		};
+
 		emac {
 			emac_xfer: emac-xfer {
 				rockchip,pins = <2 RK_PB2 1 &pcfg_pull_default>, /* crs_dvalid */
-- 
2.17.1




______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
