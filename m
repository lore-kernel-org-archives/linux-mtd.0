Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6787EC4332F
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Dec 2022 06:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/sY1AbtbC6YCYUU7p+LWnY7y3a7coQBSAFHS7ObZmFg=; b=DCbYDgZpVyBa+x
	xW6z9Z0enmSTeaTgaTYGUP/WRh8pbQ9tsl0zvSc1JXvy/bztBf1aoJZrPBvTk3zUH+CtoBZQi1zZ6
	+OTPMLvWAps1VUtQ3v0rImg7x4hr6k7+IQeSUwmgBm/1rCV5PjNJHq4zorzwSzTEr8Lf2U7YHn6Ps
	2jeQPezCXKeSoRWpT8FaN/MeEADN6ePQNX8hyi5LPA/xqxAWA02DQmMk5EEiW5dfdp2TCcMpvcpf+
	QE4vmlgf8Mk6WCcsaSR7iwt2duMs1APjsMm+fG5sI0XrpuLaNLwpa9CuO7oYIg7//XN4IVK+Qs5L2
	B+rjBM4k/RKJM+0bd7/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AUw-00404W-BZ; Thu, 08 Dec 2022 06:35:10 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3AQo-003szw-La; Thu, 08 Dec 2022 06:30:55 +0000
X-UUID: f1186ebd6b0a436e992e700e7e1f7181-20221207
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=u8/NwowXK2YbUna8Ai7oL8XOLUBZKDsKd5Yc07Xpqao=;
	b=n2E0Fz6pt3XFUfJr5kdUYNSW+5Qqp3F3tUsSoKUFNb/lE0p7oIYKRU2lA5nOYaY5ltAe3djqrLbpMowErOalX3Ub8bRdDQ90TefJiKkGfQEh0sy9MKJEAJfcenNP5L3Tq/26AI14jgu2eBxn1dOjTXFe2xqR2Gz/27Rg9bTaJgo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:b26f28ba-4572-4cb5-822b-0658d09d44a7,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:95
X-CID-INFO: VERSION:1.1.14,REQID:b26f28ba-4572-4cb5-822b-0658d09d44a7,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTION
	:quarantine,TS:95
X-CID-META: VersionHash:dcaaed0,CLOUDID:228ffed1-652d-43fd-a13a-a5dd3c69a43d,B
	ulkID:221208143015WW8TE27S,BulkQuantity:2,Recheck:0,SF:38|28|17|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: f1186ebd6b0a436e992e700e7e1f7181-20221207
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 705268432; Wed, 07 Dec 2022 23:30:50 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Thu, 8 Dec 2022 14:30:13 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Thu, 8 Dec 2022 14:30:13 +0800
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
Subject: [PATCH v3 9/9] dt-bindings: mtd: mediatek,nand-ecc-engine: Add compatible for MT7986
Date: Thu, 8 Dec 2022 14:29:55 +0800
Message-ID: <20221208062955.2546-10-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
References: <20221208062955.2546-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_223054_746740_4BB82E94 
X-CRM114-Status: UNSURE (   8.85  )
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

Add dt-bindings documentation of ECC for MediaTek MT7986 SoC
platform.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 .../devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml        | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml b/Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
index b13d801eda76..505baf1e8830 100644
--- a/Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
+++ b/Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
@@ -18,6 +18,7 @@ properties:
       - mediatek,mt2701-ecc
       - mediatek,mt2712-ecc
       - mediatek,mt7622-ecc
+      - mediatek,mt7986-ecc
 
   reg:
     items:
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
