Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8AAC433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 02:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4zfMxWl5IaatO8Nl626f8K0qX4Oeu1OKPuQarE3QQcc=; b=g+JnqxUP7pLj5r
	MNsNLywDfLKcHgKYeoTMMYOx4pndr11txAR4YIEBKub1i1FRbTkhl6fZgG8jyJU/DdlpSOWU2kr/2
	dfI+lCESvPMIN63LkeUEBwcQ/jgxhvWAGJQNb87CtjYiOybr1Rei4tdOJwkSliEzvzRJ5TbFCx7Cz
	f0dm7qrSmGBe113w7SK0NXzzsRZmMsLqHqq+EmWdmg75UaPqry2ZC7+VP9oZzFnGMqbGEyxYcsVru
	hs4uiXoM2tYBt95TFlVPJs75IPX7maU4XH9XwpA5W06joCAYOmXumwswGVQ2FNEC+1kGadPGUgL7x
	8gSp4TntTmKXhLh5nrBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTZy-00Eoli-6J; Mon, 28 Nov 2022 02:09:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTZf-00Eoef-C3; Mon, 28 Nov 2022 02:08:48 +0000
X-UUID: b5eb4204810b4325953c64cb8720a479-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=P0lzjUqPkXtCw2u3E1g0XvfNQEmHlZGE4XKWJ8ANQgc=;
	b=Dt3g9x33pAKLE695tnCh0SHI33sJdp2cj2Ssf+GzvPZg/Ry8cgrPiyeX1FXEhs4GLo5/2ZwNWE2bIGkcaSRr5N/rkLUB8FeL3QxPRcsbnmj1H2DwqdzOVgw3cS4ASuY40mBzdFusREM1WiDKusoZTAK5BLt0A3gr9e5zjGIQm0g=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:5f79c98a-cae2-4aba-8f15-9760e2f2ad01,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:2220f72f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: b5eb4204810b4325953c64cb8720a479-20221127
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 548800862; Sun, 27 Nov 2022 19:08:45 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 28 Nov 2022 10:07:49 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 28 Nov 2022 10:07:49 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>, Chuanhong Guo
	<gch981213@gmail.com>
CC: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>
Subject: [PATCH 5/9] dt-bindings: spi: mtk-snfi: add mt7986 IC snfi bindings
Date: Mon, 28 Nov 2022 10:06:09 +0800
Message-ID: <20221128020613.14821-6-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_180847_447771_ACEA799E 
X-CRM114-Status: UNSURE (   9.67  )
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

1. add mt7986 IC bindings
2. add optional nfi_hclk property which needed for mt7986

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 .../devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml      | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
index 6e6e02c91780..ee20075cd0e7 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
@@ -26,6 +26,7 @@ properties:
     enum:
       - mediatek,mt7622-snand
       - mediatek,mt7629-snand
+      - mediatek,mt7986-snand
 
   reg:
     items:
@@ -36,14 +37,19 @@ properties:
       - description: NFI interrupt
 
   clocks:
+    minItems: 2
     items:
       - description: clock used for the controller
       - description: clock used for the SPI bus
+      - description: clock used for the AHB bus dma bus, this depends on
+                     hardware design, so this is optional.
 
   clock-names:
+    minItems: 2
     items:
       - const: nfi_clk
       - const: pad_clk
+      - const: nfi_hclk
 
   nand-ecc-engine:
     description: device-tree node of the accompanying ECC engine.
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
