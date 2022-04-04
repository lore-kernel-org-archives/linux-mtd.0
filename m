Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BA04C433F5
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 04:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wvfho+8rxAkRJncLo9ygaoosUYkXd+apEsnSk6gKod0=; b=GhG+Pd+wxLOeWA
	cVVst30RTgzFR55cyjScjvIIGF16bq8qCpznQWUi3Qbeo9SuB410B8Z6a64baCDQ37KV+jEmEQfS+
	ttBhaTWFyN+D9CZqlavSNlLZ9fHnhK8Zs+lIy5oyqRSPY6NtmPHDtDG6Dg9dahToi/Oiettil+7/6
	UlkQEtLLQ7W4k6arv6uDfz0JFDW0l0g71V2KzQ1XbkzZi/mqRR5HQJvLJ7wUsHhGQszEVMC9jBwg4
	VSJzA6j1ePe6dpr1qE7VSwxujr7R/Ry/VAbs9pz8X0ebJ5S6sT0S/5nCGN6YyZPzhLCAIpsjSYfze
	IHNozAz8vts5tT7hJQqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbDzN-00CyW5-Gu; Mon, 04 Apr 2022 04:06:49 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbDvS-00CwuD-PU; Mon, 04 Apr 2022 04:02:48 +0000
Received: by mail-pl1-x62d.google.com with SMTP id f10so7120852plr.6;
 Sun, 03 Apr 2022 21:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1HV5c5QEBjHHJKwEleOTxRh6M5uLQnGXYD11zp0jEEY=;
 b=Th2x/KrGd+A33w7vq9tYo45HQNILH5GVOU7O0QWQVZDkWGA0s374oCg9OcbwhU77Er
 fddlJT40IlUhdqc/R39Cf6GeryMWeh94712B5h1YDUHXBxS3SkmvS0i4Q3pHqQXa/tHA
 LGT2TIiJhcV44kcYOjJT5ciueOlISkpEgsCzMNh1/JjnPS7mQbYCYtou2YM7CAp8ATf+
 7XSVKUz7E+djK9L44ZSla18JiVLJep39FvZUdP3ROqdbNcVvIhqeiCQsi7Qp5R+1uvNa
 KU4wy3AjcBqoph/UzVRj1rH/5MyScLePaPEVHXtRqa6QO4li6FwmdWs3rZ/EkEash1il
 5L7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1HV5c5QEBjHHJKwEleOTxRh6M5uLQnGXYD11zp0jEEY=;
 b=sea+5zP5AA/jes9dEmGJCorMDfwZw+B9hkDmZfy3KixIgi+IwAMQ6EKf29di4cQTbu
 eEZKYee57ATlVxLmRt1p/aV7bImQbUWJ1h6Ivklo+lbAHX9W45FMRb3LOqtnPWwPsq29
 ZT+xYXC71q5iASb4VvXWJq9aGWSH30eCadyfp0IW0SGcEaSb3Bl5gS2giXbJfhYCIRDp
 kkQhQufKXPo4T6wkvu3SoLBChOFRaSHeaO5bvq+jdecyuYIcrJbrshmGnS5w9jbjw04U
 CJi/byYEiQheiNNIBahqTKl+vFiNATSWNYF261iwvpA0xl5aOoOLkPrOK5Zi5Ax80Qqt
 kR+g==
X-Gm-Message-State: AOAM5327EXkPCfsoa+AvKxd5DahPM+4+9rH0tQS+nTES9zgNjYHELGRz
 +J/ne5fANZdDO3buGNQu6uw=
X-Google-Smtp-Source: ABdhPJw2VMe0j+rzz5r581Dqg1+SGhDEuCaA4GPBKVV20F35xs8PFv9ElxWDZgNpQ0SDkkWPRFewLw==
X-Received: by 2002:a17:90b:3502:b0:1c7:2920:7c5f with SMTP id
 ls2-20020a17090b350200b001c729207c5fmr24262038pjb.89.1649044965102; 
 Sun, 03 Apr 2022 21:02:45 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 j70-20020a638b49000000b003985b5ddaa1sm8756191pge.49.2022.04.03.21.02.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Apr 2022 21:02:44 -0700 (PDT)
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
Subject: [PATCH v2 5/5] arm64: dts: mediatek: add mtk-snfi for mt7622
Date: Mon,  4 Apr 2022 12:01:53 +0800
Message-Id: <20220404040153.1509966-6-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404040153.1509966-1-gch981213@gmail.com>
References: <20220404040153.1509966-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220403_210246_877160_F49EBBE1 
X-CRM114-Status: GOOD (  10.65  )
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

 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 6f8cb3ad1e84..4b8f7dc1ec23 100644
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
