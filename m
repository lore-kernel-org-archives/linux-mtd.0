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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51345C47083
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:15:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 20AFE61400
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 20AFE61400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+c1gYfk/U1bAgXMIjSghptgB6SbM4LCFM1PHTjutDKY=; b=B1AMLLFUxt5iXJ
	PTwH9ldjNOLHXvSJNt7OGZZmKlXrlUjFEP1/xyJ3nWBdhU+4CsIH2XWuXPdqH/oTmNp9dqM72UL6S
	AZaVKgq130weQybMKlKZOHwqhQ7UDqjPJ+Ev6X4KopyoeSpPQORmwHn0pltkhg1AHzTZumvRGKG5j
	v0uKbsfp70zQ1A3VOEsmkgChNu1tOOzF+fRQdRIWuPAM9lH1++9z7Glz4gJzDq4Y/HLBZIiVYX3qy
	uiTytO76kLGDDpo+g86DhPIvAn23zuQeurd1DcEQ4jXrfZlxDC4OUZzeW1H9Tqz6opomYeDZdKmLy
	Qmdhm9ivjdBS3Y8gOieQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBX1-00E7Ju-1K; Fri, 04 Jun 2021 15:14:43 +0000
Received: from mail-ot1-f53.google.com ([209.85.210.53])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBUe-00E5kT-DV; Fri, 04 Jun 2021 15:12:21 +0000
Received: by mail-ot1-f53.google.com with SMTP id
 i12-20020a05683033ecb02903346fa0f74dso9367088otu.10; 
 Fri, 04 Jun 2021 08:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wPwsgHZfI7X2x/NCoAxg4rZpLg9do9zJr4tiKRuNV2U=;
 b=XKT5uArA2Y93UoUY499zE5bbJv1N0dJeuV5pbfWnn0yPwPAmAZr1KBymRC+Jybm6lg
 fxAi1XcPbKpoouTM8uygZrqcMAV7yOAGF3pyREh3ofMeCOY1XgEycXjkU5QGDjmYeR6u
 olo8n2jNj7vhfJN+VqjS7UZ5oP8nWTSZTKEb5cikoXCMrjhI0ipnevEuaa05wwf8noNJ
 nq9YDy0wPBUuB4RYpMG1NKMV70YE+LB5fvsO1K+R+BGK5pnkIqCXeHm7nH3PPbfN0z7I
 o0sTWVe4gbI5xdyD69JpcI+Wc/ZlxZBOtx+UxtYPo1DnlAh5EwExyCB1EkC+plqdN/Bj
 8i0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wPwsgHZfI7X2x/NCoAxg4rZpLg9do9zJr4tiKRuNV2U=;
 b=HaGUfYbnUZBEWJj43uslHUWraoK007cKkwhLv84yXnTDGPH+TDnS1AmXfGBxGhghGp
 VUaouSysCqWuoLJTxL2t0VfPaH/dzXq3vnxAtHWzxyqbi890j9y0Ksq1fwP0Xg86zowk
 QevkvPWjVPgVI4GrFmbO0NhghrbBPiTlGC53xgNLwRX3tGAE2uG2gkIkA0pCv0pgWdXw
 1sbDnrIrLvbJ2N7r1dOCEXfxo0u4u8hs1CE0IKSRMa+EuZWh+YS8s2Zwm7qz985Jgmwx
 JkWAWOFzHsd5X9aUcz9wFjc1hs3A2fQCCVZsH6Nu6U6FMdmDUrMGnHF3vRCjZ5Z98wpU
 6aQg==
X-Gm-Message-State: AOAM533oIDmfZiFUmtQuGBA9inrg6wZqMgZhYftJq0jRdSqyvbO5jv/K
 yrlz3j2saDt6kome2RpqZgA=
X-Google-Smtp-Source: ABdhPJy5ES3R6EtHURbrmb60FZhk3ISvUZCZ5kwgT2RbBoGW/fHp9+86zwvj7K65PwavwGPHwy3chg==
X-Received: by 2002:a9d:27a4:: with SMTP id c33mr4193051otb.281.1622819474472; 
 Fri, 04 Jun 2021 08:11:14 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id k16sm523440otp.19.2021.06.04.08.11.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:11:14 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC v4 5/8] arm: dts: rockchip: Add SFC to RK3036
Date: Fri,  4 Jun 2021 10:10:52 -0500
Message-Id: <20210604151055.28636-6-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604151055.28636-1-macroalpha82@gmail.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_081216_497362_999DCEC4 
X-CRM114-Status: UNSURE (   9.49  )
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

Add a devicetree entry for the Rockchip SFC for the RK3036 SOC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm/boot/dts/rk3036.dtsi | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/arch/arm/boot/dts/rk3036.dtsi b/arch/arm/boot/dts/rk3036.dtsi
index e24230d50a78..0dba2956dfb8 100644
--- a/arch/arm/boot/dts/rk3036.dtsi
+++ b/arch/arm/boot/dts/rk3036.dtsi
@@ -206,6 +206,17 @@ emac: ethernet@10200000 {
 		status = "disabled";
 	};
 
+	sfc: spi@10208000 {
+		compatible = "rockchip,rk3036-sfc";
+		reg = <0x10208000 0x4000>;
+		interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SFC>, <&cru SCLK_SFC>;
+		clock-names = "ahb", "sfc";
+		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	sdmmc: mmc@10214000 {
 		compatible = "rockchip,rk3036-dw-mshc", "rockchip,rk3288-dw-mshc";
 		reg = <0x10214000 0x4000>;
@@ -684,6 +695,37 @@ flash_wrn: flash-wrn {
 			};
 		};
 
+		serial_flash {
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
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
