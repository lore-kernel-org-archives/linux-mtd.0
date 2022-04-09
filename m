Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC047C433F5
	for <linux-mtd@archiver.kernel.org>; Sat,  9 Apr 2022 12:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mi7JgCC4dNPpBuhnW32JZoa0A2nfpEjaccTbpUwTO+k=; b=n3ye/pu5W9IXyv
	eBUw8b8axFKPdYNX6BgZOkl3bVWZ6kvj5vEkLY7YchhBz0tHDGFPRWYHQrhRy7W3JCeIfm8gRfzBp
	bafVKUm9grd3EdW4jJXJr8YZKM8Jf1EG392z0OdcN2Yw/W/5KWfk9yvv3yY9HYYMz+ywmM8YHqRWr
	k+Rhf4w5V/Fo7k1y7kQO2PJbBdulzWxyHlxniouPL9p5oAgmM5vmFzVlYPUfPNaKx3ilaXyjXaE66
	+n8zimO6/d+n+bwNQDX5wxZNOSVyU4dI1L0Fz/+teCCdBOYARMmB4dX7d5VpQrgdem+Sn5tmEvp3a
	8B/Trvn9+YsnmXT7f4mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nd9xh-00333z-Sw; Sat, 09 Apr 2022 12:13:06 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nd9uI-0031UA-7f; Sat, 09 Apr 2022 12:09:36 +0000
Received: by mail-pl1-x635.google.com with SMTP id k13so4914921plk.12;
 Sat, 09 Apr 2022 05:09:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X2EWpn+6zXv1xmcH8X/db35fCjSMxjasklgZRmyt+K4=;
 b=SP7h7/bTN5UCHbTLEfWi+32Mvf2ij+k26fzw4v+NICFPk5dhePVz65ZByMmcwfOtaV
 hTdePxgIZoTIei0P78oB1S7Kk0ym4QiI+4GGQnzGM8zg6K1dYMWWdho7kHOcHg+KXvC7
 OEnhhOrFXIY9+W4mmKAKlDBsG2dGUkxcS7p4NLUniXZ1l8dbGxMhG0xgBdVvOAPnoD3U
 mHTUNhhJDziX2CegEVU4YDXQQvd8UuzDA/z/PbBmYTBbgFaGbn0y8gVeQSD9sxdRMKKu
 JKXDJPr/n1oRbRtyzfiHkWUlxF1guXGMLLQht0pJ38LGQOwoQM5KxI8BRpDhpPJtPWjo
 KmSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X2EWpn+6zXv1xmcH8X/db35fCjSMxjasklgZRmyt+K4=;
 b=d6jE0Hpo7Amk/A3Ol9Z36bO3WdjWvuWN3gE/7Fsf/mY+xPwYMbe4Kjgl5cCBnd0Kro
 NBfvUDbKLFYzBOx/FyWjRygt+e11sNt29JSGK9f4BMCCnHsYhD7+cX98JmQlHadtIYwM
 moV+BAIWdK2GrAF3S7S+hfb1kWL2Nqao/e3Pzzi62VYse6N7cTyLIH12SkmcsOb5MIMx
 Oz//rr4rz1vF9l1Ef0M3GFAn2qgxhC5TW+gE2CGGJszUY/H/zTv+T1x86hXtWs+XDFFq
 8U5uvPIefrATRoOu8CSEm0clIn3O7GMfXZ8LgE8GqlveXK21QwZbdvgSdvtKCATmWlhC
 yVqQ==
X-Gm-Message-State: AOAM532aGjBE8dwbt9Li0Ll/N9NCl21lmHzAAAwmyoB5I4RpSC5k0lUP
 FpoVkmdb3+jkkPIoIwwwFMk=
X-Google-Smtp-Source: ABdhPJwc8r/p0057XWNzs8kB43AH/8e05JMFItJFo9731KrL+XTpCkDSMZwiy3IsRG4c5x5fgubT9w==
X-Received: by 2002:a17:90b:94a:b0:1cb:1338:c370 with SMTP id
 dw10-20020a17090b094a00b001cb1338c370mr14043954pjb.45.1649506169164; 
 Sat, 09 Apr 2022 05:09:29 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 a85-20020a621a58000000b0050569a135besm8307357pfa.201.2022.04.09.05.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Apr 2022 05:09:28 -0700 (PDT)
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
Subject: [PATCH v5 5/5] arm64: dts: mediatek: add mtk-snfi for mt7622
Date: Sat,  9 Apr 2022 20:08:19 +0800
Message-Id: <20220409120819.3124209-6-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220409120819.3124209-1-gch981213@gmail.com>
References: <20220409120819.3124209-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220409_050934_342450_FDBC74D0 
X-CRM114-Status: GOOD (  10.29  )
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
Change in v2-v5: none

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 47d223e28f8d..097c625ed858 100644
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
