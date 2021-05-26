Return-Path: <SRS0=Fb5G=KV=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9237C47088
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:22:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 877CD613C7
	for <linux-mtd@archiver.kernel.org>; Wed, 26 May 2021 19:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 877CD613C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GlIRa3K2R1ssSU/ebdpjryxMWg+BXNl8umHR3RM7SM=; b=doHgK8yL2AIWfN
	m2XpC6X08G9UGSSO/1xs5xY6Snkw9Q8YanSrEKIHjZdBpympz/ntf8V0qlwJNLJlcfmBU5mvsgMhd
	nwTAN5lxjJUPySi1jKxzHdsueu4N0gcpXSWMlnU55yacvOVlbXmdfDn2fBofh8t5wXWETrkLeBSUt
	5ZEVemBXJ6fb2CJprAX5McaTRYnC5FBSMf4Y1UhfW+n1kP7j7qOASAKKzTs1DpPKhdz7fdK71+/yY
	QXjbugXRMqYscrcLOMUIjNjHn4t6/5YPNNQeoKqB4lgTOuptLXPFKJDQtpj87FWV2tAxTuiDAwo69
	SZdQrh82I+lEtMR1vitQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1llz6E-00Gujt-7E; Wed, 26 May 2021 19:21:50 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lly5N-00GRLc-Iw; Wed, 26 May 2021 18:16:55 +0000
Received: by mail-oi1-x233.google.com with SMTP id d21so2391856oic.11;
 Wed, 26 May 2021 11:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6lrF9BDbz/NhsBssEPM7MaLU6trDKxt11SCFlTCydv0=;
 b=dhkUf7aAttwCEHPmEM/RBI0ARHERR0RwPQ1/o1hSs0o7o6K3hkRpxzrzDLwfv7Wcc7
 UeUIxVz659MlLvj1nAsEsMMta1tXE5bJJmFJt5JPsmsCa3sR9m3/bgQEJGHCh3q7HM+R
 eJ/9mQXw4EZf+YhrejIB94vdU7yM1RZsy8t4K4CF440bOzqUx3pbyj3T1LDBb+urAJRJ
 V2wCLlB8kkqh3v+VFK/0WK7qF3d0dwyXJiyMoEczngkTSsjvialU08RhN4kD7dLcYgKd
 dCDbQL7jL2WA08kT46irhRqbyYkts5E1vIOYElrCrYpHya6VQJYbHXjalBaKVK4ooEFX
 /CrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lrF9BDbz/NhsBssEPM7MaLU6trDKxt11SCFlTCydv0=;
 b=HtwvWwq0p6U6dtLBIP/+wCzu5H7D6I+fpBnKXP0bf/BVMjipaqwf9PJszyh8vGK+0m
 sIZnH3ixUvovx8FB4l4IDJkcFX6zkoOikazmhFXqGymSLTarXvZbXZ9l6FlJscdolLBJ
 tcXRm8P3bs9ogunlwBLn3FijhABLRkoObYB/D7reOUhDW5Xa3WPNOOY2YQp9fDR7UKyC
 NgAnW8sF+ifz7oIiKoW38yy/xRFih5GLkroqJWyxO236taqbvQDQJhCDDprRMPH2w3BN
 DgMNZegENS29o2DhQ7zjFhNgTlho6xyY4gXkjdYgDbBY7qUmp6/TK6o9PQ+T8ryWElhQ
 1bXw==
X-Gm-Message-State: AOAM531IdNYwDHpu61DolZvX7Qujw7xvWiIHgKN30csVYYTwnnt4yzd4
 TeQyn1skt800lX4c/XdrNbX2bpeRoHk=
X-Google-Smtp-Source: ABdhPJwsOrBcrYo3RdvLhLD8dBuShBIw+AD1fhV93GpUe/AyKRRkSyF6sX9i+4b+BQOOf7FS9eR0ZQ==
X-Received: by 2002:a54:450a:: with SMTP id l10mr2862047oil.135.1622053011735; 
 Wed, 26 May 2021 11:16:51 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id j20sm4148311oot.29.2021.05.26.11.16.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 11:16:51 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org, andy.yan@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 tudor.ambarus@microchip.com, michael@walle.cc, p.yadav@ti.com,
 heiko@sntech.de, robh+dt@kernel.org, vigneshr@ti.com, richard@nod.at,
 miquel.raynal@bootlin.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add SFC to PX30
Date: Wed, 26 May 2021 13:16:36 -0500
Message-Id: <20210526181636.1130-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210526181636.1130-1-macroalpha82@gmail.com>
References: <20210526181636.1130-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210526_111653_709511_C6EEC477 
X-CRM114-Status: GOOD (  10.82  )
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
index 09baa8a167ce..c0a551c9c043 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -966,6 +966,18 @@ emmc: mmc@ff390000 {
 		status = "disabled";
 	};
 
+	sfc: spi@ff3a0000 {
+		compatible = "rockchip,px30-sfc","rockchip,sfc";
+		reg = <0x0 0xff3a0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+		clock-names = "sfc", "hsfc";
+		pinctrl-names = "default";
+		pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus4>;
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
+			sfc_cs: sfc-cs {
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
