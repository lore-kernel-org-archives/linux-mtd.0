Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94127C433F5
	for <linux-mtd@archiver.kernel.org>; Sun,  3 Apr 2022 13:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F9gpz1CtDo4DV0nE69rQ2wMueq1kKP4wty0woP6cXAY=; b=GQ4cBoSBPhZEmk
	cDQzaF3X+5kQZ+jKacJn/xeAeE+7fcSw4H1qu237YHbam7WQ3JMS9rcYB0fTfgFDhDHGO8YWvPH8e
	LHiLkY+8jPyqdd9n8uWIu5KJkL0g55hQ3gFqWgK+iboqa0Nb6oO0Cm3exZrrHeqLBK3yJcagEIdWV
	UbUcYHPnOndQlznZiSI0DGv4Knrh6YdJ7B3GsraOnYf14FJ0lMXQlnZlfp47DM0a7UyysGi5OYxRP
	gv1h/UFiCeSLHfDRVqW6fmLmg36mAlM7ba5xbQKGIEABh8gqDoCJIwE3FwBmWb354by/BcMpfLevO
	zvD443czE3LFp7tceFTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nb05K-00BRP4-6h; Sun, 03 Apr 2022 13:16:02 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nb02X-00BQ1v-Ch; Sun, 03 Apr 2022 13:13:12 +0000
Received: by mail-pf1-x434.google.com with SMTP id s11so6525982pfu.13;
 Sun, 03 Apr 2022 06:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PfNnbuCnnrrI2HGCtTaPf9X8eo27J8q+BtzO2NSDh9k=;
 b=msjpSnH9mfT0MJbyKbKAYAlGPiFywj7VssRS8LKVrTvPfv+yQaL/arBrXDkwvBTeHS
 Pl5PmEW4ph8HkbRCw72d3PWEmtyP8UdG7U8XiS7J1ubj7LH2VFH7FArVlJO0wldZ+zvC
 FK0LyqcNErZqb5Gkf73ELnLEgBkPx5fb8f3XA1Kx2DrR4flHRAu4IVqmrTXlAn59J4xX
 bipMmU6wRFSFHAAFubY4RPRHneI8ZDr2vEfoRh9XDHBoOFiBttDnOGjfb/TEoBPHiu/p
 juZuSSz6hetC6q9XawP7aTrzwwA5ku2pqH9YZKNZ5dCYG0xTUaVnSwNyDrty9gx1/Aoe
 nmig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PfNnbuCnnrrI2HGCtTaPf9X8eo27J8q+BtzO2NSDh9k=;
 b=4/dhCsOvFkHcTYO2ooc5oeNgnXtLJRfbZ2gwrNVmiixjbs1YMR3yH4VsptwXReTELh
 1nxrMj7l1eCvEvXG2Kk6oBsDcIpitHLLe0OH0vhFnRgEEbBWvLRoff/ulIMN8X389JZa
 3vnwAV3ZrleJPp36w8yTrSqGD4UgcOafNsp7EMf1nlBHVt9TXGbDld9s8yA0Q4Y7jolm
 vW35HlP2yz8DL+CwdfVC3F5ILslBV5092ug3kiYklJZqn8e5nZ3WJVtqvfempttnwP/u
 ZVa80RDDpRSwbrhrDVkZ0mHqIX/npVJQCwJHji6ZDU9kT2MHNbiksrYNMJpUk0Z/pUL5
 YipQ==
X-Gm-Message-State: AOAM533ekmnCccgfbpsjZ3aMcNLpF6de8FX7puysEf/3RAtJ6S5RdoJi
 KcVjLxy/q6TKDnPaOTZMdmOxH8/sggx3zbMg5Z4=
X-Google-Smtp-Source: ABdhPJyD4ZZ2tlGGZ3t5FpYPJIvAflp1wJMYBe0MzHuZy5qsKEI1F+UUXO5xd+Uz5hCUa1uyU0Kjmg==
X-Received: by 2002:a63:7f1c:0:b0:382:1fb5:58b8 with SMTP id
 a28-20020a637f1c000000b003821fb558b8mr21882197pgd.507.1648991587689; 
 Sun, 03 Apr 2022 06:13:07 -0700 (PDT)
Received: from guoguo-omen.lan ([222.201.153.219])
 by smtp.gmail.com with ESMTPSA id
 x123-20020a623181000000b004fdf99d25f6sm1554857pfx.80.2022.04.03.06.13.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 06:13:07 -0700 (PDT)
From: Chuanhong Guo <gch981213@gmail.com>
To: linux-spi@lists.infradead.org
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
 linux-spi@vger.kernel.org (open list:SPI SUBSYSTEM),
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support), 
 linux-kernel@vger.kernel.org (open list),
 linux-mtd@lists.infradead.org (open list:NAND FLASH SUBSYSTEM)
Subject: [PATCH 4/4] arm64: dts: mediatek: add dt node for MTK SNFI
Date: Sun,  3 Apr 2022 21:11:54 +0800
Message-Id: <20220403131154.1267887-5-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220403131154.1267887-1-gch981213@gmail.com>
References: <20220403131154.1267887-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_061309_445922_8C2B0E2E 
X-CRM114-Status: GOOD (  10.19  )
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

This patch adds a device-tree node for the MTK SPI-NAND Flash Interface.

Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
---
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 6f8cb3ad1e84..40112fdca67e 100644
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
+		ecc-engine = <&bch>;
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
