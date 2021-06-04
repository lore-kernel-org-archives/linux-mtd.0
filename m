Return-Path: <SRS0=b8TW=K6=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E151C47083
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:12:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F1658613BF
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:12:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F1658613BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/7FHe36nawqkPygqpJEi7fgR5Yw879HmWZ2z/jjAwVE=; b=jwwDsxDCxfaMZW
	Lik5uXf3XT4IZxKXZzg59tzL4WxN8vg3PvcpAQwnwJirPrHXCFg8Wt+cEoGUCRuerJa5dIcKghfez
	o74cL4RhBWPAkYgBriJo4lJ/SsUJp2bTHX7Fh+NRHs5tORocxaTVIsIoQEaiBITaUQSMzwDhIA2fn
	xQlDtzUDhpCxrAwUrIESm9EbY8masSYH5nSMQhkAMg9CIjah25QicTDyQ/eyeyun5+YnZkzPpZA7/
	HLt5LuJV64hrV9DRS99z+zqMbmI55Ke8rWMM402UcjkTEXzWZm9Zoq5aXyG34nOxUy3FxVpEey7fE
	gsTovkZo6hslgtT/FIcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBUX-00E5cC-9K; Fri, 04 Jun 2021 15:12:09 +0000
Received: from mail-ot1-x334.google.com ([2607:f8b0:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBTe-00E5CN-81; Fri, 04 Jun 2021 15:11:20 +0000
Received: by mail-ot1-x334.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso9366987otu.10; 
 Fri, 04 Jun 2021 08:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rmERDzA/ERlMENTHiwmD7XH/Ew0+jugDLfjVr8CV6Vc=;
 b=CRxqr94ZqH9d671tSQn0MTM+grqoReU2f9urbwT/W+ArDZyttNEfzit+tqZjXQqT6O
 jb+HYb7pTJA3x07ewTDMBvaCFQC62kVFscprjJjmy/JY0MJGh8fbPnU1y5BS7ITFIgJp
 N+EQGDuFLCBGvwyoMYbOQ8zC2djV3hwAT+/C8HDZE3WEX4ACdUm59TvwroAQ4IPscJiE
 KsbBoj0Eh+LSlFxhOcFOsBseVAVPhXi8HGCv87eTrVFnks/D/alvg8EhgsGBwHr51LU7
 1D3jzJ5dMETcEZnWPIZUpyJUgCo6Op3+0iM9bsJoO6emCV2DYxGVlBWaFdSaSK6h5Jd0
 Lddw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rmERDzA/ERlMENTHiwmD7XH/Ew0+jugDLfjVr8CV6Vc=;
 b=Qtwpl89jtKg0F4lJxYcbYoZaJLDxPIf24S0loGCZu1D5BBNT4hQBzr/0dol5tCW0u7
 PD3KBR4l45cr8qWv96l3J1sgxJtUJchBUiTovz/2p8eBUNEhN9CIWluaRjN/HWIlhU7w
 euoZ/hqhm1rONWbmADgCoXXRqTDTU/JNBbv+j9nE7P9PTPzRVxQ7OdTE4qzs7ZBGYLZc
 +f/hElzdK8Cl+SwjhxqhxDZuuVPYKA1QNcF8Z1m+2jFMWKT7PAkAUdd1f0XP7Ifc/xw+
 9k0OHyiDLHkA0r44hVvCTrj7Av1Prl2YMmhmCYWtEdb5KjhTOe2Pi9E3WM8B+lA2cG+o
 vLzQ==
X-Gm-Message-State: AOAM530h/ZqESKYHsjjQnUtHnpIauDezg9QTM+5qdCb72vpRA09eTMzX
 sIgFBX7CTo+KRSKNWy8FFOA=
X-Google-Smtp-Source: ABdhPJxPipvsTaYVm4HD/RnZJ1adBvAEiC+ZGAajw9Jb6T1P7/BYagDEAJ1ajdqby7URhDqtlTbOBg==
X-Received: by 2002:a9d:608b:: with SMTP id m11mr609120otj.146.1622819472219; 
 Fri, 04 Jun 2021 08:11:12 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id k16sm523440otp.19.2021.06.04.08.11.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:11:11 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC v4 3/8] arm64: dts: rockchip: Add SFC to PX30
Date: Fri,  4 Jun 2021 10:10:50 -0500
Message-Id: <20210604151055.28636-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604151055.28636-1-macroalpha82@gmail.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_081114_308093_C2D50367 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Chris Morgan <macromorgan@hotmail.com>

Add a devicetree entry for the Rockchip SFC for the PX30 SOC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/px30.dtsi | 38 ++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/px30.dtsi b/arch/arm64/boot/dts/rockchip/px30.dtsi
index 09baa8a167ce..cc7aced2dde9 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -966,6 +966,18 @@ emmc: mmc@ff390000 {
 		status = "disabled";
 	};
 
+	sfc: spi@ff3a0000 {
+		compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
+		reg = <0x0 0xff3a0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SFC>, <&cru SCLK_SFC>;
+		clock-names = "ahb", "sfc";
+		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
+		pinctrl-names = "default";
+		power-domains = <&power PX30_PD_MMC_NAND>;
+		status = "disabled";
+	};
+
 	nfc: nand-controller@ff3b0000 {
 		compatible = "rockchip,px30-nfc";
 		reg = <0x0 0xff3b0000 0x0 0x4000>;
@@ -1967,6 +1979,32 @@ flash_bus8: flash-bus8 {
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
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
