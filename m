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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16455C07E94
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:16:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8EAA61400
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Jun 2021 15:16:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8EAA61400
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o7/992jHA84odJPzD8f+HImbcVtv8wVISv9Had8rDcg=; b=PbsQuiZczz8686
	k8Z8FD7wNX84jwFl66fv9RHCxEprdr0CUCli9gXHt4w06w9GFYa2hnWB8w3VQuvTauxIVFmqg5Pkn
	eE7bf35dJIeGDRiHe6hyzvFx0XwIYTAF+AsvSiaiLGYV2P0QDXSQG+U0mjG2g6SOtjy9JS9wkGv0n
	n3SW9XcFcsX6Gias9OHItimiDJDH3YsnEFVQIoaxW2pqtBQ3rriTOy+7uGNeZeTeMnCsFEIhpJU0U
	voEiVWlJJtyj0aPdanMsk/YKT7o2MW/n3N0rX6iJDR4c9A9sGvqpeRZMb6kvSW+4VJOxRNmWCJ/f1
	NOk+/YqGUSPF03g8UVEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lpBY1-00E7fX-4w; Fri, 04 Jun 2021 15:15:45 +0000
Received: from mail-ot1-f45.google.com ([209.85.210.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lpBUg-00E5lw-30; Fri, 04 Jun 2021 15:12:25 +0000
Received: by mail-ot1-f45.google.com with SMTP id
 v19-20020a0568301413b0290304f00e3d88so9370867otp.4; 
 Fri, 04 Jun 2021 08:12:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tcOkC5VLrGMggQW0/cK3a0vHPS7zEtQley9DVLkd3MU=;
 b=tvkLMHgqP6xKcgtHLGO4Mu75FFkXNjILRvACWIjzgLONqGdeuo7cA/TsiB4UPuwbqm
 8JGu2ufe7LWehmOl97tg3+CF2ZvuivHT11JDJI8iUkzEDU+9bIvh3/qlnnQ8RLX/Epqo
 JBDJVl2FF/e3qbfiBbvZ9nWdVXa33ndPM/zZGSLm2UoGjESIATz/DvfA3fyrWUrHAM1N
 l3LK9pfmcxmmbpCfqSXi9jmACNeB0/TKbcgQ6LbUSVMvNKbq/d2INlfpF7Q4fwgA7lGX
 qwMbzdYp+aI70DyduM4yjP6is4vJ6M+TkQL5SqX8CChH65aDOMGpeRxQ8rch0py/Kedx
 mykg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tcOkC5VLrGMggQW0/cK3a0vHPS7zEtQley9DVLkd3MU=;
 b=H/SNTW3eMgEjAdcPG/Vyem97oVFKPoiA9uMLOjX1+2TWwQ14noFYkOtAXMF1EE9P3M
 89dZ7XYuBru+KbjT/hjIy/x3F9PzhAfLMnPV667KAG6kVcb0d9FUdumKdhgCOKqoZvEi
 +7rUOP1J5tSHpCopr63r2i+K4iDX7mGDEiE/ptuWODW0uRKpRBSBCgiqOg61xidFC1A4
 SwCgjXN7PKa4lDOqehuEg+3g6+ciXhKkiAzQkc+tKoDj7najDatatpdBtEBp2gtD4SGN
 Co7HNheBzhnjPa1Rzwh59Vx1YP/BOtt5pXH0NzvwPlTXfvxvbwM5kVR9dSke5BobLhcq
 mt/Q==
X-Gm-Message-State: AOAM532gzz6sIDzuEnNiESsYt7toY/7+TxXZGpYIif1P7GZjG3iM9TcZ
 PmoP7b1wPzubYC8rKO/vzGE=
X-Google-Smtp-Source: ABdhPJw+iIVWLirlLWj1ASIfVhTk3Cc37un01nAD0o0oR5HSWHeYrriYIKRgczNXkt8ODOJppQxqXg==
X-Received: by 2002:a05:6830:11d7:: with SMTP id
 v23mr3971951otq.44.1622819476922; 
 Fri, 04 Jun 2021 08:11:16 -0700 (PDT)
Received: from wintermute.localdomain (cpe-76-183-134-35.tx.res.rr.com.
 [76.183.134.35])
 by smtp.gmail.com with ESMTPSA id k16sm523440otp.19.2021.06.04.08.11.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 08:11:16 -0700 (PDT)
From: Chris Morgan <macroalpha82@gmail.com>
To: linux-spi@vger.kernel.org
Cc: jon.lin@rock-chips.com, broonie@kernel.org, robh+dt@kernel.org,
 heiko@sntech.de, jbx6244@gmail.com, hjc@rock-chips.com,
 yifeng.zhao@rock-chips.com, sugar.zhang@rock-chips.com,
 linux-rockchip@lists.infradead.org, linux-mtd@lists.infradead.org,
 p.yadav@ti.com, Chris Morgan <macromorgan@hotmail.com>
Subject: [RFC v4 7/8] arm64: dts: rockchip: Add SFC to RK3308
Date: Fri,  4 Jun 2021 10:10:54 -0500
Message-Id: <20210604151055.28636-8-macroalpha82@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604151055.28636-1-macroalpha82@gmail.com>
References: <20210604151055.28636-1-macroalpha82@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_081218_164933_C4546539 
X-CRM114-Status: UNSURE (   9.40  )
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

Add a devicetree entry for the Rockchip SFC for the RK3308 SOC.

Signed-off-by: Chris Morgan <macromorgan@hotmail.com>
---
 arch/arm64/boot/dts/rockchip/rk3308.dtsi | 37 ++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3308.dtsi b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
index 0c5fa9801e6f..2d922b1d51d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3308.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3308.dtsi
@@ -637,6 +637,17 @@ nfc: nand-controller@ff4b0000 {
 		status = "disabled";
 	};
 
+	sfc: spi@ff4c0000 {
+		compatible = "rockchip,rk3308-sfc", "rockchip,rk3036-sfc";
+		reg = <0x0 0xff4c0000 0x0 0x4000>;
+		interrupts = <GIC_SPI 82 IRQ_TYPE_LEVEL_HIGH>;
+		clocks = <&cru HCLK_SFC>, <&cru SCLK_SFC>;
+		clock-names = "ahb", "sfc";
+		pinctrl-0 = <&sfc_clk &sfc_cs0 &sfc_bus4>;
+		pinctrl-names = "default";
+		status = "disabled";
+	};
+
 	cru: clock-controller@ff500000 {
 		compatible = "rockchip,rk3308-cru";
 		reg = <0x0 0xff500000 0x0 0x1000>;
@@ -910,6 +921,32 @@ flash_bus8: flash-bus8 {
 			};
 		};
 
+		serial_flash {
+			sfc_bus4: sfc-bus4 {
+				rockchip,pins =
+					<3 RK_PA0 3 &pcfg_pull_none>,
+					<3 RK_PA1 3 &pcfg_pull_none>,
+					<3 RK_PA2 3 &pcfg_pull_none>,
+					<3 RK_PA3 3 &pcfg_pull_none>;
+			};
+
+			sfc_bus2: sfc-bus2 {
+				rockchip,pins =
+					<3 RK_PA0 3 &pcfg_pull_none>,
+					<3 RK_PA1 3 &pcfg_pull_none>;
+			};
+
+			sfc_cs0: sfc-cs0 {
+				rockchip,pins =
+					<3 RK_PA4 3 &pcfg_pull_none>;
+			};
+
+			sfc_clk: sfc-clk {
+				rockchip,pins =
+					<3 RK_PA5 3 &pcfg_pull_none>;
+			};
+		};
+
 		gmac {
 			rmii_pins: rmii-pins {
 				rockchip,pins =
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
