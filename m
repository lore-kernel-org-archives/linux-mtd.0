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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14F13C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:14:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D304F61400
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:14:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D304F61400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xxjSSXWT/GbYufc2Q6Qq6bQlvXjQ3X4A2C6e/SBfJAY=; b=FceM+dCvE2J8nw
	g+yyTCHxYxVXJKb2WOoqc1GNLazxxyFWFOAqZIjvIhna3MUh+D8likSRkPKt5orwMEhhtswP0EWZn
	hSebrTL91QXhPiZ+rclELEPSWsKx4U2cZsnpgzztpIEOQEtBtjyK4MI3yML8Smmk1StQaWpdtlKY8
	ZtlpLwEpl1JYxVg+2pawqlwZUOEgIds4buLZvHfzcvz88y0zCUywC6tFFgXA0/qMAvpDXuqin1/HF
	T84RXGS9LD4UMvQNg55q2nlkQObt5U8PWa5/FuULmIf+b68edXKsJQOxYgxbrS5XylzKXtTUO5JWa
	vkqJz+BiqBe9PEUGG1tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBWD-00E6xg-6K; Fri, 04 Jun 2021 15:13:53 +0000
Received: from mail-oi1-f170.google.com ([209.85.167.170])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBUe-00E5l8-RQ; Fri, 04 Jun 2021 15:12:21 +0000
Received: by mail-oi1-f170.google.com with SMTP id x196so9655870oif.10;
 Fri, 04 Jun 2021 08:12:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nzDBGocjHn2IrUk4Z69ayz+va87LVb0nNyKPqEYDMw4=;
 b=lMRNyS7BjOiMXbpSOBoHUehplevtPoTWp0wsFiTVfT0+f0mbwRfyyP6G4LGEdQ3rJd
 RWofimwRtaZTXosObROJAv+khHZdmpZGo8uL1or50ds0IvZluyeheKSg3jKj3BXH3Idj
 hSJM6TRC10JzbIaOroPuoxKA3sROneGAAfMu8Ivf5YHRC0hqpv1Z/OKFw0R4b/atFE7h
 Hp5IIp7eXD8Vkl6EeG7QtsvvdRJaxkX7+xEbU6pjU/yHkHW5mKtDD9qWc8X3rbb/4hhK
 WBpeH4Rz0yTy8iE7SDpTXc0uCYtAJa48fabSE7JrXOTgc+vuFBhRfDYsargOoW6mWmER
 rxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nzDBGocjHn2IrUk4Z69ayz+va87LVb0nNyKPqEYDMw4=;
 b=awlkAaKMPjCVGcJju3YBZNeF/iVLu1RtYW+vrj11iIYODNamYaNGaOOTErD7HRYcU5
 FraZ1G5sFLbl8eKr3nCoUZEuyVtDK3oT5wQWhR12TXAI1zQqspYg+RzGjwjouAQd1IxI
 J4gfO1pxycaVKsEjdBUgHru5x/bfrTLhcxB8XBeykd/CAq7x8oZ49uBNp4zNbXvWgm4G
 QENbCUQhJ6ydjvJf/zAwN2q87x+E/CKrALEadVglLiREsM4yaO5mQwUg2qepmq82/h6O
 OuNpE1WMAu2mf9QTcCW3XR4/B41MLlbVldO65MtwJA0YrggD4YCSZyxU5jDWv9NkM4of
 beEg==
X-Gm-Message-State: AOAM530EkOGI4Ln2B4oV5wouhC5Lyi2+0gbuX1eNzIzLKLUi0OC6cbG+
 hO4m+Si99+1ACCS7JCl/fuE=
X-Google-Smtp-Source: ABdhPJz4xn0UG4QNk7VcbA9ajAimYmgAyMMWJnwoeqptc8AypkwYUSktrl0+T+EoWMAoydzxpGhQRw==
X-Received: by 2002:aca:ab50:: with SMTP id u77mr3267046oie.153.1622819475800; 
 Fri, 04 Jun 2021 08:11:15 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id k16sm523440otp.19.2021.06.04.08.11.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:11:15 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC v4 6/8] arm: dts: rockchip: Add SFC to RV1108
Date: Fri,  4 Jun 2021 10:10:53 -0500
Message-Id: <20210604151055.28636-7-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604151055.28636-1-macroalpha82@gmail.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_081216_945732_27143B91 
X-CRM114-Status: UNSURE (   9.35  )
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

Add a devicetree entry for the Rockchip SFC for the RV1108 SOC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/rv1108.dtsi | 37 +++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm/boot/dts/rv1108.dtsi b/arch/arm/boot/dts/rv1108.dtsi
index 884872ca5207..c0d95e13add4 100644
--- a/arch/arm/boot/dts/rv1108.dtsi
+++ b/arch/arm/boot/dts/rv1108.dtsi
@@ -536,6 +536,17 @@ usb_otg: usb@30180000 {
 		status = "disabled";
 	};
 
+	sfc: spi@301c0000 {
+		compatible = "rockchip,rv1108-sfc", "rockchip,rk3036-sfc";
+		reg = <0x301c0000 0x4000>;
+		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SFC>, <&cru SCLK_SFC>;
+		clock-names = "ahb", "sfc";
+		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	gmac: eth@30200000 {
 		compatible = "rockchip,rv1108-gmac";
 		reg = <0x30200000 0x10000>;
@@ -704,6 +715,32 @@ emmc_cmd: emmc-cmd {
 			};
 		};
 
+		serial_flash {
+			sfc_bus4: sfc-bus4 {
+				rockchip,pins =
+					<2 RK_PA0 3 &pcfg_pull_none>,
+					<2 RK_PA1 3 &pcfg_pull_none>,
+					<2 RK_PA2 3 &pcfg_pull_none>,
+					<2 RK_PA3 3 &pcfg_pull_none>;
+			};
+
+			sfc_bus2: sfc-bus2 {
+				rockchip,pins =
+					<2 RK_PA0 3 &pcfg_pull_none>,
+					<2 RK_PA1 3 &pcfg_pull_none>;
+			};
+
+			sfc_cs0: sfc-cs0 {
+				rockchip,pins =
+					<2 RK_PB4 3 &pcfg_pull_none>;
+			};
+
+			sfc_clk: sfc-clk {
+				rockchip,pins =
+					<2 RK_PB7 2 &pcfg_pull_none>;
+			};
+		};
+
 		gmac {
 			rmii_pins: rmii-pins {
 				rockchip,pins =	<1 RK_PC5 2 &pcfg_pull_none>,
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
