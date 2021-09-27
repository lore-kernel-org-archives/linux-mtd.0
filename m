Return-Path: <SRS0=BNsP=OR=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8012C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:42:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7CD5A600EF
	for <linux-mtd@archiver.kernel.org>; Mon, 27 Sep 2021 05:42:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7CD5A600EF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LVZvcnh9l9XHbMpRRI1dY3MWAY4LNQFDOO7UUUrH6DM=; b=rOyMsjDXBZZPYK
	BMc5qHUFAK1vpwRssEgCwv8DV9p2uCD3O4dyfZDHfFKByD1+H69CtILV8oJGUtRCqmDRGNqe9pgmJ
	Z64UA7vDrzVobeC5SgOwn+FVJbIPdkZZRdhM1esPXG0uBx/qIfqn6+sqDM2XAHT3AMY2mHpeao3Ep
	B+3/HU6cNQ59GycZqc9GU7pJZFJdWIU0czXfAFyMeSMU9J5jy/dDD38xG15W53GB6EJnuqaAzZMq9
	CYUd+cFB8cgofPtMFtVjQ27Db2lmI6T50aiAiIQ4tcBuDVLa7UABRK59PsNl2ncrL5h1iHSbsMj+5
	Uyk9elb5vPTOvUuajwUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUjOV-001bBe-5W; Mon, 27 Sep 2021 05:41:39 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUjOR-001bAf-F9; Mon, 27 Sep 2021 05:41:36 +0000
X-UUID: fe7ce9c369ba4e35b1cb394cad3ed44b-20210926
X-UUID: fe7ce9c369ba4e35b1cb394cad3ed44b-20210926
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <xiangsheng.hou@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2112617688; Sun, 26 Sep 2021 22:41:31 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 26 Sep 2021 22:36:57 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 27 Sep 2021 13:36:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 27 Sep 2021 13:36:54 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: <miquel.raynal@bootlin.com>, <broonie@kernel.org>
CC: <xiangsheng.hou@mediatek.com>, <benliang.zhao@mediatek.com>,
 <dandan.he@mediatek.com>, <guochun.mao@mediatek.com>,
 <bin.zhang@mediatek.com>, <info@bootlin.com>, <sanny.chen@mediatek.com>,
 <mao.zhong@mediatek.com>, <yingjoe.chen@mediatek.com>, <donghunt@amazon.com>, 
 <rdlee@amazon.com>, <linux-mtd@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <srv_heupstream@mediatek.com>
Subject: [RFC,v1 4/4] arm64: dts: add snfi node for spi nand
Date: Mon, 27 Sep 2021 13:36:29 +0800
Message-ID: <20210927053629.17847-5-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
References: <20210927053629.17847-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210926_224135_531149_BC341AF3 
X-CRM114-Status: UNSURE (   9.87  )
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

Add snfi node and this version add nfi register base
at bch(ecc) node.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts | 16 ++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi     | 15 ++++++++++++++-
 2 files changed, 30 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
index f2dc850010f1..ddd759da4805 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
+++ b/arch/arm64/boot/dts/mediatek/mt7622-rfb1.dts
@@ -223,6 +223,22 @@ &nandc {
 	status = "disabled";
 };
 
+&snfi {
+	pinctrl-names = "default";
+	/* pin shared with spic */
+	pinctrl-0 = <&snfi_pins>;
+	status = "disabled";
+
+	spi_nand@0 {
+		compatible = "spi-nand";
+		reg = <0>;
+		spi-max-frequency = <104000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+		nand-ecc-engine = <&bch>;
+		nand-ecc-algo = "ecc-mtk";
+	};
+};
 &nor_flash {
 	pinctrl-names = "default";
 	pinctrl-0 = <&spi_nor_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt7622.dtsi b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
index 890a942ec608..e916011b1804 100644
--- a/arch/arm64/boot/dts/mediatek/mt7622.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt7622.dtsi
@@ -545,9 +545,22 @@ nandc: nfi@1100d000 {
 		status = "disabled";
 	};
 
+	snfi: spi@1100d000 {
+		compatible = "mediatek,mt7622-snfi";
+		reg = <0 0x1100D000 0 0x1000>;
+		interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_LOW>;
+		clocks = <&infracfg_ao CK_INFRA_NFI1_CK>,
+			 <&infracfg_ao CK_INFRA_SPINFI1_CK>,
+			 <&infracfg_ao CK_INFRA_NFI_HCK_CK>;
+		clock-names = "nfi_clk", "snfi_clk", "hclk";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "disabled";
+	};
+
 	bch: ecc@1100e000 {
 		compatible = "mediatek,mt7622-ecc";
-		reg = <0 0x1100e000 0 0x1000>;
+		reg = <0 0x1100e000 0 0x1000>, <0 0x1100D000 0 0x1000>;
 		interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_LOW>;
 		clocks = <&pericfg CLK_PERI_NFIECC_PD>;
 		clock-names = "nfiecc_clk";
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
