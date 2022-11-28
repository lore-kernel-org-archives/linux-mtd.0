Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED291C43217
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 02:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+yPtqc4UCZ9ryZ5oDO+0tszbc6YSrY9rdRtji3w72CQ=; b=aO2/5yp4/qfolO
	rKtvlsFnh0gUdau5DmlCrnqZUhLKrZRz8gy9P4QykXnQ+qCmA5GcbdWD3F5QE00bT+YVpypbY7kcm
	F8RwxHYP0QGeKaePSjTdrHec+yOufikM1/eVZtv7xP1aVnnttPEQfhWRzY+by3fEAIkLYHPmbJJix
	/dao6VB2abS25B2lzZsKemO4FW2v6j2IPd5hE47sjh/7H3NdkoOQ9NSWzJg9QVRGfrKTZmVN0pQJA
	jx2PBLJ21l3DBCZs54P0YesEUQWDFpJB8HaS/AHPYCZOnpGB2YHm7UI53seVVKqpVZwzqhGVgd782
	YPm4fisZhQzBRO0i1zVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTdN-00Eqdj-2C; Mon, 28 Nov 2022 02:12:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozTa1-00Eop5-Ke; Mon, 28 Nov 2022 02:09:11 +0000
X-UUID: 010c36f40959424e8b9666b2809a97a5-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=xZfGRtPRaAaAiqWG2zCIOQaELCPMTaMU463PVgynDtg=;
	b=J35FwVy0yMCkY2STuQsxzKiSa4e9iQ/Idbwg/CB8+RWHGOAHpTQzYyq2227TnaSQqP/OqJfEZLZl9NR9AIs4bovOa7VrPSn9dWUxDJm3YnKk5UHTczAllxtDfsO36FGQ+JRZYo0919IVWXrT50VaYoX8lAyx5xJk0PSo7pcYN6E=;
X-CID-UNFAMILIAR: 1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:7af3b247-f58f-49dd-a8f8-6cb30ce50447,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:100
X-CID-INFO: VERSION:1.1.14,REQID:7af3b247-f58f-49dd-a8f8-6cb30ce50447,IP:0,URL
	:0,TC:0,Content:0,EDM:0,RT:0,SF:100,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:100
X-CID-META: VersionHash:dcaaed0,CLOUDID:aeb261dc-6ad4-42ff-91f3-18e0272db660,B
	ulkID:221128100806OS7S1AIB,BulkQuantity:3,Recheck:0,SF:38|28|16|19|48,TC:n
	il,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0
X-UUID: 010c36f40959424e8b9666b2809a97a5-20221127
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 58314421; Sun, 27 Nov 2022 19:09:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 28 Nov 2022 10:08:03 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 28 Nov 2022 10:08:02 +0800
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
Subject: [PATCH 9/9] dt-bindings: mtd: ecc-mtk: add mt7986 IC ecc bindings
Date: Mon, 28 Nov 2022 10:06:13 +0800
Message-ID: <20221128020613.14821-10-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
References: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_180909_943269_5F37B6B0 
X-CRM114-Status: UNSURE (   8.51  )
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

add mt7986 IC ecc bindings

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
---
 Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml b/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml
index 80321157e928..e5d8e1839fff 100644
--- a/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml
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
