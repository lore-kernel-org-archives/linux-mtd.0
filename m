Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF175C433EF
	for <linux-mtd@archiver.kernel.org>; Thu,  7 Apr 2022 15:12:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nbg2PNVVLk37/za0sP+T/dSO3h32BwKLYFX7JGMcHR0=; b=tvJwFNxMRvYeP3
	rVCjQTMF1Id11nC6llbmNfTH12VLyn//6yFD7eLYArXbiSXZ9cBJorFmQgJEMAS0hW6fqznUJYgCo
	jMAexeUMBsArB9uiBFylH/NGI4ozSwhHa5ZOdGCkpptSuPimSoFQs5S7eWdroMzirXUZPKaYw2HWD
	vOsYhFMfACYrkUbV5kDlED06SycymN7zCpgoPfdN9BwWam6Ev/GJQCANhGJCeGhXMoA5qCSu47b05
	T91mP1tTL/3WOzaMsgqfEyKGnZrh/D2kvj1GG1mMFBPmSUOdEvarrmf7x7DRaWS0drxaTqdiB/s1j
	1cE0oU3XTVP0AYxun5Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncToC-00CbLh-Du; Thu, 07 Apr 2022 15:12:28 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncTjj-00CZMK-ND; Thu, 07 Apr 2022 15:07:53 +0000
Received: by mail-pj1-x102a.google.com with SMTP id bx5so5850653pjb.3;
 Thu, 07 Apr 2022 08:07:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jrtvb4212It3IhUoSO26JM4Kh2WKJPNfVyn34wMno3s=;
 b=CdKoyvFYtcgYgIoynZn9xJOG4ouYERktRTxynaEiC2GYuw4iKl+zzb8DOXVBUCqchY
 kD3Cca7aLaBOPFeQqIRdyNoAOvb730Fy04LKCPyKRm6ExlPltGoj8CxZQib03AVtDF4n
 W/XwpGD49YOQQKXySra6y7MBmlkN7X7riVsofaERvlAqwHe7DDrr0WxbJ/a+VJttVqcZ
 npjBJsxu5zTBm4xvfTZzfttZu6WYp/u6nmaHIGehEmTPEilAn/LeGwXz6zPGOe9iUSzY
 bXDgJV8SfpyJka/V0NuQQ0tFquxzhm+7dLoQtIw3NUYJMjOnltyCtZWiVprPWmb99Rss
 NWaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jrtvb4212It3IhUoSO26JM4Kh2WKJPNfVyn34wMno3s=;
 b=SR9dTrlx8kIymXR8rtrL2udeOxFW6+vPibNzYaTewB2uHXeu4hH2riQL7Ba0jiSoO2
 3UwoLqniJ8vrMyG/kSn78GLFfyAZDHPX5P60wn9bXcat6RhiJd9K2cuxHgrw2vHVxKSw
 /4k0J5m4Oyntu4/uyqApQrdJa7zfWpZiFMcgmAWcO65XqlhEdBUr1T4hEnFpiMmMLh/D
 io5jUN5Xa606XdBu3K89OyFf5A8Lbl8lp7wR/OgoYEypPQ59IfKQdy0ydGC6Buikh95q
 +5zKyN3WDEfJOOICLGFhEulEm89xtsnoS6JOdcmsGJpr+hGrx1W08sK/yjyPYf8U1ttS
 ImzA==
X-Gm-Message-State: AOAM5337rg6dK2lRhr1UYnWo/ISc2EKtiiIUiQTNHY9g6Bic6xdMyYx6
 LECZFiBHqk0OolltjC4QL6w=
X-Google-Smtp-Source: ABdhPJwo9sQWb5/mta+s4Cyd7+A2btFwfuVblu9GNLlR6RUcNF57pVGnmshWcIMgUsebh44jAvBnpg==
X-Received: by 2002:a17:902:cec2:b0:154:6df6:1e6a with SMTP id
 d2-20020a170902cec200b001546df61e6amr14428036plg.58.1649344069155; 
 Thu, 07 Apr 2022 08:07:49 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 x2-20020a63aa42000000b0038265eb2495sm19329908pgo.88.2022.04.07.08.07.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Apr 2022 08:07:48 -0700 (PDT)
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
Subject: [PATCH v4 5/5] arm64: dts: mediatek: add mtk-snfi for mt7622
Date: Thu,  7 Apr 2022 23:06:52 +0800
Message-Id: <20220407150652.21885-6-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220407150652.21885-1-gch981213@gmail.com>
References: <20220407150652.21885-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220407_080751_797022_D1E20273 
X-CRM114-Status: GOOD (  10.53  )
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
Change since v2: none
Change since v3: none

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
