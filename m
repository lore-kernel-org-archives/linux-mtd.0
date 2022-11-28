Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F158C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 02:49:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHfsMpCugwV4/r13eqmREvDtVxAjsf6sU/aJe1dAyDI=; b=qPXI9kUjvXfo5K
	3k+/pCv2/qIFO5oxN8qIzUfQGL9iPviWCNVlwJv4ANhd4sTl4fK5h22+5aRc3dJXqtProYUCJYIkR
	0bkdJSjzmtJURdnF4hto5SFm+nl05Y+c+iuDHuz8gc1C5l+MkwxFWG4699aDJmNmkA3jtnsdGUnr6
	gLUBQcCTdYfGHdgbjXpvKtOWPdOwo/hIwO29iCZQHWsZrfB2NtkkgmLxPh67ZRu5hCkE5/wCDSYNr
	woMxxamX2zeVYNlBdQ9txy7c4MWE0Jd75tPgymK3/+XqRXp7fsW5RgJG+BM+M2Wa51fISNYcbul5+
	AUnirCgwlJDnoNdx9fIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozUCT-00FBR7-O1; Mon, 28 Nov 2022 02:48:53 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozUCG-00FBMq-T9; Mon, 28 Nov 2022 02:48:42 +0000
X-UUID: 41966a3c270e4a8da84224c4737479b1-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=e8ryU+C/Jl2eGzU8a8lflF+NAwn4pUDJzVpIHRS2n7Y=;
	b=R3868j13wckwSCtYoFuUWEHItyz4JcIaHAOLRiXqmNO3C4rE3Adj4Y8KeJpyMIFoohAefGy3vudX8gHIb9qkKofd6lgIK5vInPTHGurFWL6v7ITXxBgNSj1qwluKPYe7dZBVG+G36yWBSPYTr9MrY/yUMm/C3iR5YTQ5/ywW7mE=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b6162a41-1a84-4b43-9385-d882bc905395,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:4a1d63dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 41966a3c270e4a8da84224c4737479b1-20221127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1229058343; Sun, 27 Nov 2022 19:48:35 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 28 Nov 2022 10:07:56 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 28 Nov 2022 10:07:54 +0800
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
Subject: [PATCH 7/9] dt-bindings: spi: mtk-snfi: add two timing delay property
Date: Mon, 28 Nov 2022 10:06:11 +0800
Message-ID: <20221128020613.14821-8-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_184840_978972_54708F4B 
X-CRM114-Status: UNSURE (   8.45  )
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

add rx-sample-delay and rx-latch-latency property.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml      | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
index ee20075cd0e7..367862688e92 100644
--- a/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
+++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mtk-snfi.yaml
@@ -55,6 +55,22 @@ properties:
     description: device-tree node of the accompanying ECC engine.
     $ref: /schemas/types.yaml#/definitions/phandle
 
+  rx-sample-delay:
+    description: Rx delay to sample data with this value, the valid
+                 values are from 0 to 47. The delay is smaller than
+                 the rx-latch-latency.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minItems: 0
+    maxItems: 47
+    default: 0
+
+  rx-latch-latency:
+    description: Rx delay to sample data with this value, the value
+                 unit is clock cycle.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+    default: 0
+
 required:
   - compatible
   - reg
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
