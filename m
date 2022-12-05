Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC427C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 07:00:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2D+SeXPYFzz8Swcv/Bg8wnuyLstgWjwHMcvvp4d+Bnw=; b=CeJKytyNVm0AkA
	w8rvp59EXKFr3UrQO01bVIUvF9sRQCiwFcR7Xl1Am4wMq+IB5of50c6hR2Yt49XPS6+ShmxUxKzTK
	jvBI0GjSsCY6p8q9boB7F4X3kJ4vm19HIqUBwuvHtlMY236HvFTAoxmcdxx6CbFTVnXUB6HJ4fikh
	DPA9lXafh0Jm8qc/zX97hY/7AeKNbdMxeixjmSG5jRkRAkQ3rwwo3hgAl75L021mSrllX6+zKtjKS
	wPWOLDxGxOgrTSr0aZBRK7zamt5if22XtIBqWNaJyVZLCWRVjQBLypKAuA3bH8/aOQVoV2PVMyJA/
	iHRiU5WbIg6rMSj+2Irw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25Rh-00FE8K-Od; Mon, 05 Dec 2022 06:59:21 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25RJ-00FDLh-6a; Mon, 05 Dec 2022 06:58:58 +0000
X-UUID: 7b991fe32cff4041b720d9ab33a4463f-20221204
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=Rzm8NGnhC/Y3p58483tZdX6IHSByPcsSolFg96uJoLs=;
	b=bRRlXhlH+69fp41mPgZzEIl2hpkS7ENYBFwDCc4JVSliDZGasouLuZKeMP+/ssxvC/GMHI1JCqwoJATU3iSbKEuts87stRqhAfnuW5sd3cO6rPcUPQaOvx8nVFtX40nCiO8Sg4rh/lUZg/evVN1qO3GhugFPF/q8awamowlauIw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d2336cb4-e656-451f-ac5c-d3d55ba45895,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:15a6291f-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 7b991fe32cff4041b720d9ab33a4463f-20221204
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 661865295; Sun, 04 Dec 2022 23:58:49 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Dec 2022 14:58:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Dec 2022 14:58:12 +0800
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
Subject: [PATCH v2 5/9] dt-bindings: spi: mtk-snfi: Add compatible for MT7986
Date: Mon, 5 Dec 2022 14:57:52 +0800
Message-ID: <20221205065756.26875-6-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
References: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_225857_268623_BD225B95 
X-CRM114-Status: UNSURE (   8.76  )
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

1. Add dt-bindings documentation of SPI NAND controller
for MediaTek MT7986 SoC platform.
2. Add optional nfi_hclk property which needed for MT7986.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
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
