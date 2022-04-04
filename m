Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D31FC433EF
	for <linux-mtd@archiver.kernel.org>; Mon,  4 Apr 2022 13:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FGZ1lOWl/ycgC74DdtTMuM15McS2KL8AaVdN4J9i3Co=; b=LWpYl3xBl9r3rm
	a1oeCrIYgl39yPA0cZQp+Cxso3P9VBQReTxXE7fy8p+ldouvKZAvn+xGe3UbdCIFcYGAiwEnCtlbC
	YRgjUEXdQEkw3qJPMNbWCJfAnTJguy2GFxL2nGEisi/P2fmpzALhiKNWztgWHqVrLJpyIeZ7XBZNy
	rbfPXyW7VbxvKzl1uu2caf+UclMpV0SDvXIJwpGKlNrfcThhDWITU/BAhMzRFLAJk9p8HwOGyESg2
	ETlAqEP081z1ZdcZtND4aw604qAH+b1p49jY1Zx6RBVvpcllJsw/uey+YrldLGaOi+MyU7FQ1X2hR
	JCeC/ZlBGOSN7PLclueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nbMfs-00F5Cd-3W; Mon, 04 Apr 2022 13:23:16 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nbMc4-00F3Pu-VF; Mon, 04 Apr 2022 13:19:22 +0000
Received: by mail-pf1-x436.google.com with SMTP id h24so4605431pfo.6;
 Mon, 04 Apr 2022 06:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tS+NAQ+2D7agIki50tkRPL+/ag2LxAizn5hQjD0npls=;
 b=PET9hD0TOOlxzcMYMOfT1jjstVzlrGrI95uhZTqi8ziGnO+Kvzo8GzeLdfN9KuJXb5
 dEsJUm8Ddlf7AwD3XMS/Xr8vEud0/HcAkCM0vpQqVUIo8JjWdELmuNe66OFwFOZYoQjD
 7GozIrPEnrDgYaGmcuESoUq0X2y19O4CebzlfArPMfAixrP6qVfjH1ahPxV5u78/OZUQ
 LXgDU3mxfbtjB0Rbo89eQDw/bsgR9ZE2pOXv96OiS5d2B8UFWtP156ujm7OwzrM5GT+b
 w/fHjp/86V7nVlbqjbBrRuQvdbxRVNf3ERNvNnvZf1XyiKXXL0bQ29RgW/qP0Lbej6Uh
 Oayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tS+NAQ+2D7agIki50tkRPL+/ag2LxAizn5hQjD0npls=;
 b=joKmJXLqy3lRQ0HUVn6p+4k+lmGob75VPUt7A3zUQs5LnUqj79/4q7hBYK39a32Sol
 l0EcvWmwyJMJ9VSkJzAtdXXb7dcdjuBhxnAriEkj/DH7gGNAyuici83GaL0c6pbXChk9
 t1sWcR2ewIEoyXaTNC4We/938TWwpGfZzhspmY+De8RDU/73Yh63eOHkyZ4WgrDMn5cJ
 a2XHy/UVfl57x4TuuRmWprp0TCp6GxiLP5JEOpa2nJSgB/djzIXMcVpuuzya/xPPKr6C
 IDhFE8UxO/gJIkix66YEfBmXeQQfUwhHyCpbQ5RNFYwhUmV3824THFUDqJqPXnJzzK2a
 lUYA==
X-Gm-Message-State: AOAM530tXFW+KvhsDGs0fJTUeT2jcPZ1Lm4L6zhoqIyL/jcnBt1H9vJv
 UuMHPSMOWkPeHtAD4gWoidI=
X-Google-Smtp-Source: ABdhPJzLAMviS73DnsYXW0jI9f5cwwNFWa83DUwdZUIbuOqsebhBjg6JkDgNrUtBEulaxOE4IIAkYw==
X-Received: by 2002:a05:6a00:182a:b0:4fd:dee2:6371 with SMTP id
 y42-20020a056a00182a00b004fddee26371mr12945796pfa.8.1649078357014; 
 Mon, 04 Apr 2022 06:19:17 -0700 (PDT)
Received: from guoguo-omen.lan ([2401:c080:1400:4da2:b701:47d5:9291:4cf9])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00088d00b004e1bea9c582sm12475705pfj.43.2022.04.04.06.19.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 06:19:16 -0700 (PDT)
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
Subject: [PATCH v3 5/5] arm64: dts: mediatek: add mtk-snfi for mt7622
Date: Mon,  4 Apr 2022 21:18:18 +0800
Message-Id: <20220404131818.1817794-6-gch981213@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220404131818.1817794-1-gch981213@gmail.com>
References: <20220404131818.1817794-1-gch981213@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220404_061921_026590_F92E5361 
X-CRM114-Status: GOOD (  10.54  )
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
Change since v2: None
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
