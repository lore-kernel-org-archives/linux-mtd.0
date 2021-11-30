Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B39C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Nov 2021 08:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=El6cI57KboNysfq+2iQHiQms54atW3LAcmDUaFBPv4I=; b=iU4mO1FAFvyhIq
	0zX3DKkKIBTMfSGqtVQJvTqD+ZJjD4IpWapIYANLXDm4ow1yyORtpzKS/GfUnlvKXMkyBsXgWfbuB
	TXUK9Vd+ixHLEoF+69xER37kQS6MWvkw2Qa2Cjek/X/vnImSvX5S8K2BpJnL7v9MKDPU3Vynf6D0S
	q8nUhPM5+KvJGOzMjoe1wfBJ3JJ+t3jb5MNlwcEgjOFcdu4B5vHx+IQW4W61K/ixHdNsEkb82DQMC
	OT3MtGg5/DqV/ZAN1FK7IHpjIYy9f233SpKaqKtoSSdAF94ppJY3p8QR3XqawnX8FoFesDQatqQAL
	2BZ/7gkNVWo18Z44pxlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mryaa-0048D4-7g; Tue, 30 Nov 2021 08:34:12 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mryZ0-0047ZS-QR; Tue, 30 Nov 2021 08:32:36 +0000
X-UUID: 11837ba579aa4401bcbc1b851fcbe23e-20211130
X-UUID: 11837ba579aa4401bcbc1b851fcbe23e-20211130
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1321315218; Tue, 30 Nov 2021 01:32:34 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 30 Nov 2021 00:32:32 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Tue, 30 Nov 2021 16:32:30 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkcas11.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.0.1497.2 via Frontend Transport; Tue, 30 Nov 2021 16:32:29 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v4,5/5] arm64: dts: mtk: Add snfi node
Date: Tue, 30 Nov 2021 16:32:02 +0800
Message-ID: <20211130083202.14228-6-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
References: <20211130083202.14228-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211130_003234_894310_3B5B5D46 
X-CRM114-Status: UNSURE (   9.05  )
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

Add snfi node for SPI NAND controller.
Just take MT7622 for example at present.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 13 +++++++++++++
 2 files changed, 29 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index 596c073d8b05..1a5bf553f3a3 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -530,6 +530,22 @@ &spi0 {
 	status = "okay";
 };
 
+&snfi {
+	pinctrl-names = "default";
+	pinctrl-0 = <&snfi_pins>;
+	nand-ecc-engine = <&bch>;
+	status = "disabled";
+
+	spi_nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		nand-ecc-engine = <&snfi>;
+	};
+};
+
 &spi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spic1_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 6f8cb3ad1e84..229ec2a3a65e 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -497,6 +497,19 @@ spi0: spi@1100a000 {
 		status = "disabled";
 	};
 
+	snfi: spi@1100d000 {
+		compatible = "mediatek,mt7622-snfi";
+		reg = <0 0x1100d000 0 0x1000>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg_ao CLK_INFRA_AO_NFI_BCLK_CK_SET>,
+			 <&infracfg_ao CLK_INFRA_AO_NFI_INFRA_BCLK_CK_SET>,
+			 <&infracfg_ao CLK_INFRA_AO_NFI_HCLK_CK_SET>;
+		clock-names = "nfi_clk", "snfi_clk", "hclk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	thermal: thermal@1100b000 {
 		#thermal-sensor-cells = <1>;
 		compatible = "mediatek,mt7622-thermal";
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
