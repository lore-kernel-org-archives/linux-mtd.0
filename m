Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9810C433F5
	for <linux-mtd@archiver.kernel.org>; Sun, 24 Apr 2022 03:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uYJ0FbCgFUTlRwUJdhaf5YY0pRZ1eKcigEHN5bnVnDc=; b=MWkvFhLH3TgKZ2
	F31QFZZ7KuSAqx+LiGegKjtvUKWJd/QDxvN0tJIsnDWu6HbB7XF4Zikptpsf9d9ESCqJ8CDAI9t8C
	QolCDZ1g2gyla7jlX3doVO5gm+/T1NLj4oxYwVpOCHCZ0IfRNr0BA8ioDlUHLwGlncVeOKMhErc8o
	PgxhDC6ytN+831O0DkRnsgtLgrmdwkux6mB1U1ZrxsuKfHbmrFWz0rgR8e6DCiE5cU1GlmkUbVez0
	qtR50p4TW8UyBeSiSkoSPbSIoIB9WO2RFIFxRNRN5QKQK+EMWKY8VF60o15JzqCCOiT6mEdaBvbuQ
	hi1roc5Ss7A6g3GDjDoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1niSvz-005foL-IQ; Sun, 24 Apr 2022 03:29:15 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1niStR-005eMd-BD; Sun, 24 Apr 2022 03:26:38 +0000
Received: by mail-pf1-x42e.google.com with SMTP id j17so11748103pfi.9;
 Sat, 23 Apr 2022 20:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dTSKZRhjg25O5C1jlBW1LRl5IUhwoxhhyCVs3jC3lXs=;
 b=NQEwgIsyvQM+8c91zHJp/VLeFL09cmvrN/vlUyahcrDgfjqF0SOWuHfyKAebhXKaGB
 8CDfEF/W//rKPtjwmgE/i1SsC8KrAP0TsaHOjEGv/YFAhMkXwQkEcxo7FAaj51MDJciG
 C+BZE/k+XF1IPrsGNVcTf0u0VgX9jmXoYj7RMJ8gg7I1HtnT+C3y5pO/5gQbaWYWxr4u
 Mv+yHTv0SJwqegA4QhJW9D6NITCZiLRCumAsqrYAn7mFQnBOOXBd5pA69m4NV7ItlNPt
 AKTeCQ0KuwivsKU7Sj06o2fF5omHx5+c/CwcDOh/bqTgnjst0d1r6HB5Mz6G/roFBqXn
 0kiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dTSKZRhjg25O5C1jlBW1LRl5IUhwoxhhyCVs3jC3lXs=;
 b=Vl4cV/yjNez3Tnrqn9PMVcBLUvF48QT4TRVg4CiwYblVmJQ0G8mwRrHYwMcfVbvDdl
 dO7UyHQ528zHy7XW1rl7GfLxwool/FXmawuWp1h22xevbHDutfWV3tgO+U0eQcyR2uES
 gUEhrMKz03A0yId9wvY2YbqdlC67Wsr0lSxgo4R1sZydnb0h6Ri/Wxahm82khu4jxa8v
 ol6CPocpJGc47A+vaxrPGXqhjMiMI9FjKm528xjlQdadpXZntQ4GXauo3KjbLNzJbCCt
 qI4ktvx1/zB63R/4fyYwfL1+2EDlLVKIV+9pkUj1dyN/z0DfBJSfdJlq8/Hysa4Y+2G4
 uVUA==
X-Gm-Message-State: AOAM53326fVZY2F7i06ZfIpijNsJm2A0blert/zFYWF8JAAoS5GHmLLH
 TwLFccaT6VdUGkSRqwpHdxQ=
X-Google-Smtp-Source: ABdhPJwnCkDmNFP2ub0LUJ5XFBOw3WVX1bkBhe4XHDPGH7PdIKzQy9kZ9No2Rbpa1oUDlTX3Rbfi3g==
X-Received: by 2002:a63:358c:0:b0:39c:c97a:ee80 with SMTP id
 c134-20020a63358c000000b0039cc97aee80mr9999124pga.7.1650770795849; 
 Sat, 23 Apr 2022 20:26:35 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 r76-20020a632b4f000000b003820643e1c2sm5790724pgr.59.2022.04.23.20.26.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 20:26:35 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@vger.kernel.org
Cc: Chuanhong Guo <gch981213@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Roger Quadros <rogerq@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Cai Huoqing <cai.huoqing@linux.dev>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Colin Ian King <colin.king@intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Paul Cercueil <paul@crapouillou.net>, Pratyush Yadav <p.yadav@ti.com>,
 Yu Kuai <yukuai3@huawei.com>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH v6 5/5] arm64: dts: mediatek: add mtk-snfi for mt7622
Date: Sun, 24 Apr 2022 11:25:27 +0800
Message-Id: <20220424032527.673605-6-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220424032527.673605-1-gch981213@gmail.com>
References: <20220424032527.673605-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220423_202637_456195_82C7C57C 
X-CRM114-Status: GOOD (  10.07  )
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

This patch adds a device-tree node for the MTK SPI-NAND Flash Interface
for MT7622 device tree.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
Changes since v1:
  1. use the newly introduced nand-ecc-engine instead
  2. reword commit message
Change in v2-v6: none

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index f232f8baf4e8..8c2563a3919a 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -545,6 +545,18 @@ nandc: nfi@1100d000 {
 		status = "disabled";
 	};
 
+	snfi: spi@1100d000 {
+		compatible = "mediatek,mt7622-snand";
+		reg = <0 0x1100d000 0 0x1000>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&pericfg CLK_PERI_NFI_PD>, <&pericfg CLK_PERI_SNFI_PD>;
+		clock-names = "nfi_clk", "pad_clk";
+		nand-ecc-engine = <&bch>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	bch: ecc@1100e000 {
 		compatible = "mediatek,mt7622-ecc";
 		reg = <0 0x1100e000 0 0x1000>;
-- 
2.35.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
