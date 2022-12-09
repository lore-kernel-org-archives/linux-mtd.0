Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B32EC4708E
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 06:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q2NRhxACsUM+f1c8mK63gBKLKARAFzDv2/5MtwtlWXo=; b=DPS+LUkjw0V4M3
	IGdmTgxWxBiDg6TINzXeud0eSWnxqP5AFfL11LAOqoEcVLIBLBtyCvL9FS1uWj5dikjNGuYwKYwxr
	bYzh/VvL+rUotYWrcpA9RchuwTggPbVBK0MsgFcZStpcCvLhOEJMefkUUUZ9kYJdBZvXWB1XoZR7K
	ONmHdnd14bXQRlWNKPqAl4vBcybM77M+WWXNgobEiNgBmJYTWeeWfOqiUVfEIEsIPPR8QuNSsTZCl
	esRwcbweeCnXAa2T5/4sd/6W7pLXmuwYsRz+OguPiTMQmHYpiFa6aFUJpJ970nmd+t/w17gj23IDx
	LxNIIP6wpzsQut99zOYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3X8P-004hkC-22; Fri, 09 Dec 2022 06:45:25 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3X7q-004hMh-Ms; Fri, 09 Dec 2022 06:44:52 +0000
X-UUID: 17ec9ee738db4b89a6fc089811763c3a-20221208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=d1GDowZFHehwCGTuyFuI4huVFHOriEhMR24XBfSvdpk=;
	b=UWzwv0P41hlPrPEZ1107TYs1toUcq9K7vf8Zeh4NXnSFgA36H5+4YERNkCqP2vQE0WRcDEMG4oxdvZBqDcRGT4m1nrLUEt45flNc2cmyEvMfMo6TzlfW3MYPcQEBPQiamBtlqwG+Rs8BswLYKxSUweI3rzBG8QkK1UpjFGY6eo4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:3469eb7b-0c7e-4aaf-a761-6528bd2658c2,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:2162c624-4387-4253-a41d-4f6f2296b154,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 17ec9ee738db4b89a6fc089811763c3a-20221208
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1081661264; Thu, 08 Dec 2022 23:44:46 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Dec 2022 14:44:11 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 9 Dec 2022 14:44:10 +0800
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
	<benliang.zhao@mediatek.com>, <bin.zhang@mediatek.com>, Krzysztof Kozlowski
	<krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 4/9] dt-bindings: spi: mtk-snfi: Add compatible for MT7986
Date: Fri, 9 Dec 2022 14:43:12 +0800
Message-ID: <20221209064317.2828-5-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
References: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_224450_770594_1C5B87F5 
X-CRM114-Status: UNSURE (   8.99  )
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

Add dt-bindings documentation of SPI NAND controller
for MediaTek MT7986 SoC platform. And add optional
nfi_hclk property which is needed for MT7986.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   | 51 +++++++++++++++----
 1 file changed, 42 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
index 6e6e02c91780..bab23f1b11fd 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
@@ -18,14 +18,12 @@ description: |
   using the accompanying ECC engine. There should be only one spi
   slave device following generic spi bindings.
 
-allOf:
-  - $ref: /schemas/spi/spi-controller.yaml#
-
 properties:
   compatible:
     enum:
       - mediatek,mt7622-snand
       - mediatek,mt7629-snand
+      - mediatek,mt7986-snand
 
   reg:
     items:
@@ -36,14 +34,12 @@ properties:
       - description: NFI interrupt
 
   clocks:
-    items:
-      - description: clock used for the controller
-      - description: clock used for the SPI bus
+    minItems: 2
+    maxItems: 3
 
   clock-names:
-    items:
-      - const: nfi_clk
-      - const: pad_clk
+    minItems: 2
+    maxItems: 3
 
   nand-ecc-engine:
     description: device-tree node of the accompanying ECC engine.
@@ -57,6 +53,43 @@ required:
   - clock-names
   - nand-ecc-engine
 
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt7622-snand
+            - mediatek,mt7629-snand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: clock used for the controller
+            - description: clock used for the SPI bus
+        clock-names:
+          items:
+            - const: nfi_clk
+            - const: pad_clk
+
+  - if:
+      properties:
+        compatible:
+          enum:
+            - mediatek,mt7986-snand
+    then:
+      properties:
+        clocks:
+          items:
+            - description: clock used for the controller
+            - description: clock used for the SPI bus
+            - description: clock used for the AHB bus
+        clock-names:
+          items:
+            - const: nfi_clk
+            - const: pad_clk
+            - const: nfi_hclk
+
 unevaluatedProperties: false
 
 examples:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
