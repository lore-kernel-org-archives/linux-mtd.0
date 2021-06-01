Return-Path: <SRS0=rnzE=K3=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE7C9C4708F
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:11:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A8FAD60FE5
	for <linux-mtd@archiver.kernel.org>; Tue,  1 Jun 2021 20:11:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A8FAD60FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iXIaR9gZH5Bq79d+gvM2gVpk9zAGmwE5UUU5FeNuLaY=; b=Xy7G0QwQIASNkh
	hxMS1ITQAsEc/wRNQojjK0mvQuK7Z1qYvErgx4UXXnkhMFrCD1uu28L3mb6hTqegGwTWMDA4dmMj1
	Fys9yF9cXBjW9JjXnE1Sal6qY8yrfH6mxRgK5bhDqovV6hNhku5nqxb7PoBr2Sr5k+dHj6odIaBrv
	QSyjb6gzNoLG07hcqLl3MN3JMxtVfo5XoL5HQwznXSmcZGUFwlA4R8eDxvV+SbAyy6ZdLG16XbxjG
	/bYqXG0hfZk0Xn1gmPQaag01hqSoQSnniDJu/keKUv19xE4EiIOv106tXNfJ0W66+3swSTs09Kbc1
	Szq0eC5HH0AbbZnTo1Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loAjC-000hou-95; Tue, 01 Jun 2021 20:11:06 +0000
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loAig-000heX-Si; Tue, 01 Jun 2021 20:10:36 +0000
Received: by mail-oi1-x22f.google.com with SMTP id a21so579999oiw.3;
 Tue, 01 Jun 2021 13:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SJn5FRuw/EiIvtLinsK2GbKy9tMV7GDq0Fhvm6NhLVg=;
 b=JX1cphjxSijfmB4ZAnLWJ7O6M0wZJXlUNzB8TuxqJSrXdYuuUGIBUujhQ9jGLh1oUj
 NYX6sr63ZZ6Kv3rtBHlfjFw9J9DD6SnGws2WcyuFc6nqCeSh12fdfV//wXT+kPMf5EWu
 5zQ+cCqVzgeUnOL35f/WPhy2iy3Q3sjE3aNF7KVigcSYRjhyD0dy0AcAkz+BIfDsCKX5
 4VuDfFRChojJSMiueCNIuZSs6EjhBPg0DoVRHhaHusx2aHlA0GzZJEL7U+wrhkSUFXRO
 0/44o+Fhd6d5sHIPUY/eLiwvDCUI7QJM8+i/TRxDm2k2R2nFMjG+knAwYHDtZNUr1I0y
 CNpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SJn5FRuw/EiIvtLinsK2GbKy9tMV7GDq0Fhvm6NhLVg=;
 b=cEz1wm6kcFyDmcxP/7JAex3Shf+kgheXc/mNYtEIjjnVUS7B5+uzYP3H8GdwNhNEzL
 u/aKnbIFo3qFwwVXZUUTD2r1MLDhD6zjIHSsYEKsS8wt2CRQpjyu93kY54RdetwriqrP
 k/iIQFGycDS6ycPOHO8cg7ZjbC+tbLpUteV9mySb8C7B/hgfzUhWv+ogzRCPWikN/6MR
 iAtqcFnE89OXQXPsdHws1PwTVdIdp4uE93291tst6nxRs0lP1Z16g7/dnqMfz5zGPUMb
 Igf6SAwgRKxwjlTXUHaJXwH4iqz2MbnkKtuGr40UpjISv1lLPHLF40CwElx+tnxnF/XQ
 OKhA==
X-Gm-Message-State: AOAM532d7s6Dvv+ibL4RVl67LudDM4CD0bItpPDWROg0kRQsGsJXvCo3
 fp/1QV3xCl0gO6XWbqazGqIQndlT8hI=
X-Google-Smtp-Source: ABdhPJxOcxQ4KlMkRDkgNCMadsKgeZ8Bb4XeVjMZjVMIqSt4wFGX9j3RuwSR/zSMLzQPwYm4Qzrezw==
X-Received: by 2002:aca:d18:: with SMTP id 24mr1189511oin.56.1622578232856;
 Tue, 01 Jun 2021 13:10:32 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id p25sm468118ood.4.2021.06.01.13.10.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 13:10:32 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: broonie@kernel.org, robh+dt@kernel.org, heiko@sntech.de, jbx6244@gmail.com,
 hjc@rock-chips.com, yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [PATCH v3 3/4] arm64: dts: rockchip: Add SFC to PX30
Date: Tue,  1 Jun 2021 15:10:20 -0500
Message-Id: <20210601201021.4406-4-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210601201021.4406-1-macroalpha82@gmail.com>
References: <20210601201021.4406-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_131034_964842_0F1C7AAF 
X-CRM114-Status: GOOD (  10.17  )
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
index 09baa8a167ce..1f4feb53e270 100644
--- a/arch/arm64/boot/dts/rockchip/px30.dtsi
+++ b/arch/arm64/boot/dts/rockchip/px30.dtsi
@@ -966,6 +966,18 @@ emmc: mmc@ff390000 {
 		status = "disabled";
 	};
 
+	sfc: spi@ff3a0000 {
+		compatible = "rockchip,px30-sfc","rockchip,rk3036-sfc";
+		reg = <0x0 0xff3a0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
+		clock-names = "sfc", "ahb";
+		pinctrl-0 = <&sfc_clk &sfc_cs &sfc_bus4>;
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
