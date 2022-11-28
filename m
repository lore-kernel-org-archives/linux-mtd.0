Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD59C43217
	for <linux-mtd@archiver.kernel.org>; Mon, 28 Nov 2022 02:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hgbXa76LEfki43J4PY/28gw7D7Qcw+lmc6rMPLz98xY=; b=Y29ZRrVkyFuVZF
	PT8/z7NgBbZXDPdlNint+8TOEO844PTdNjvtrD+zAkmELKq3dXMJaSyINx/yYrOFJS2FOPTXtwNSk
	vPR4f4PzBQdUWIBrU+JqQILKMBUxBejBKsedEZpz4N/qoSEEqp+/6GaAEq2GnjRxTZMb26/VJLzQ1
	Qz0qJR38JyNgENkOpGextaj3OZf+IxEeGCXpqpsv31U1xAgU+xcTF6gSgKTkGh8s3AH8y4FqIJ0cy
	yD7bdelEsTchnTqWZ3MlsASfB9JYHjjx2Ip8mRhyMNWZMzEC3B7dJucn7YTuJ4SR/E9P3O97bcGBm
	esKgmi/OayGOcCU1bZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozU2P-00F5v2-4H; Mon, 28 Nov 2022 02:38:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozU26-00F5oK-1J; Mon, 28 Nov 2022 02:38:11 +0000
X-UUID: 82bba189138c48728bd9fc94488a99d5-20221127
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=Vx9r4K8c2AmypEnlXhjtUj3PToclJWeeeHtuSZMQl/0=;
	b=dAllR7dtiduK1fbYK88xkooh17LMapd6qeLL49sWQjvVDX2uU+lCbLlJ4K/a5vjPgBCjAGjcgNdAb4KG1BlFXZl+gSGfNS7bfUKUxwriG56IY8GEzPE6+gVGhSJu4LCfp0yYPo55kBtCJVPny+VROj1Ay/IFk66bocigb141PIA=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:7fd7c9d9-3828-4f5b-91c7-738237acf0fb,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-5
X-CID-META: VersionHash:dcaaed0,CLOUDID:bf2cf82f-2938-482e-aafd-98d66723b8a9,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 82bba189138c48728bd9fc94488a99d5-20221127
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 730989145; Sun, 27 Nov 2022 19:38:05 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3;
 Mon, 28 Nov 2022 10:07:31 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n1.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 28 Nov 2022 10:07:30 +0800
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
Subject: [PATCH 0/9] Add MediaTek MT7986 SPI NAND and ECC support
Date: Mon, 28 Nov 2022 10:06:04 +0800
Message-ID: <20221128020613.14821-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221127_183810_106857_16C0279E 
X-CRM114-Status: UNSURE (   9.48  )
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

This patch series add MediaTek MT7986 SPI NAND and ECC controller
support, split ECC engine with rawnand controller in bindings and
change to YAML schema.

Xiangsheng Hou (9):
  spi: mtk-snfi: add snfi support for mt7986 IC
  spi: mtk-snfi: change default page format to setup default setting
  spi: mtk-snfi: add optional nfi_hclk which needed for mt7986
  mtd: nand: ecc-mtk: add ecc support fot mt7986 IC
  dt-bindings: spi: mtk-snfi: add mt7986 IC snfi bindings
  spi: mtk-snfi: add snfi sample delay and read latency adjustment
  dt-bindings: spi: mtk-snfi: add two timing delay property
  dt-bindings: mtd: Split ECC engine with rawnand controller
  dt-bindings: mtd: ecc-mtk: add mt7986 IC ecc bindings

 .../bindings/mtd/mtk,nand-ecc-engine.yaml     |  61 ++++++
 .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
 .../devicetree/bindings/mtd/mtk-nand.yaml     |  92 +++++++++
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |  22 +++
 drivers/mtd/nand/ecc-mtk.c                    |  18 ++
 drivers/spi/spi-mtk-snfi.c                    |  63 ++++++-
 6 files changed, 252 insertions(+), 180 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk,nand-ecc-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.yaml

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
