Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A97FC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Dec 2022 06:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jlfxS0xOhjh+Htc2Gp5jrS4a7fAFO6+1I78J5YTT7qA=; b=BOuheUPQB9mJtu
	qi2cwTdbetSAaMoeTCQIuwhXP3GeU0WRpW7+vck80z7OFYYM+8iMMjEW8rnBLhjpemOqGSgkMcWbb
	4UaasrfEvJqqQ3CH7Rdcad6JWY7SodiDD12+UTB17B2VfUcM5FTAKOj1lTwbpCIpA0r71Ea+yWPbP
	9Y9fVEolh2YDJLwkaPUlzgi0pU4OLlEDL/eMWLoZg4qOqS0/O1NQ27JKj/MT6/VWVXc1/q4mOAmLI
	JkzBJNOzYBq5M93N6yT5rCDISORgAotGJ3EYpf/916LodxLjFKvGQAp7JcsiYmo9JXesueDNrG2Q7
	izqngcmaAStk6yRvaAIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3X7G-004h3H-9K; Fri, 09 Dec 2022 06:44:14 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p3X7D-004gtn-B2; Fri, 09 Dec 2022 06:44:12 +0000
X-UUID: ad3a997381d64a71bd822ab65d849829-20221208
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=XfkmgaoPa7gPC1ZTFTs+Ib5gI1ywkha25Ly8O/K7+8c=;
	b=nl5Oo+fHbinveA9Yklu/jsfW0y30NfwtaoGoqS03pXM6cl9yJ3N/MQiYZoGkaH/eHIe90Yf8W2UFJUDA7iPTVNAH09yFMZFE4UGc71Pj6mSAxn/yG5An95UNL75vyq5Q5nCcIYVnPovKfy2sZdhKZScZBungk5w15GFB+tFIKu4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:d38c44df-b38c-4798-bfe1-17bd2b8da287,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:59580117-b863-49f8-8228-cbdfeedd1fa4,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: ad3a997381d64a71bd822ab65d849829-20221208
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 544639564; Thu, 08 Dec 2022 23:43:52 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Fri, 9 Dec 2022 14:43:47 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Fri, 9 Dec 2022 14:43:46 +0800
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
Subject: [PATCH v4 0/9] Add MediaTek MT7986 SPI NAND and ECC support
Date: Fri, 9 Dec 2022 14:43:08 +0800
Message-ID: <20221209064317.2828-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221208_224411_414130_8FAB5ABD 
X-CRM114-Status: GOOD (  12.47  )
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

Changes since V3:
 - Correct mediatek,mtk-nfc.yaml dt-bindings.

Changes since V2:
 - Change ECC err_mask value with GENMASK macro.
 - Change snfi mediatek,rx-latch-latency to mediatek,rx-latch-latency-ns.
 - Add a separate patch for DTS change.
 - Move common description to top-level pattern properties.
 - Drop redundant parts in dt-bindings.

Changes since V1:
 - Use existing sample delay property.
 - Add restricting for optional nfi_hclk.
 - Improve and perfect dt-bindings documentation.
 - Change existing node name to match NAND controller DT bingings.
 - Fix issues reported by dt_binding_check.
 - Fix issues reported by dtbs_check.

Xiangsheng Hou (9):
  spi: mtk-snfi: Change default page format to setup default setting
  spi: mtk-snfi: Add optional nfi_hclk which is needed for MT7986
  mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
  dt-bindings: spi: mtk-snfi: Add compatible for MT7986
  spi: mtk-snfi: Add snfi sample delay and read latency adjustment
  dt-bindings: spi: mtk-snfi: Add read latch latency property
  dt-bindings: mtd: Split ECC engine with rawnand controller
  arm/arm64: dts: mediatek: Fix existing NAND controller node name
  dt-bindings: mtd: mediatek,nand-ecc-engine: Add compatible for MT7986

 .../bindings/mtd/mediatek,mtk-nfc.yaml        | 155 +++++++++++++++
 .../mtd/mediatek,nand-ecc-engine.yaml         |  63 +++++++
 .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |  54 +++++-
 arch/arm/boot/dts/mt2701.dtsi                 |   2 +-
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   2 +-
 drivers/mtd/nand/ecc-mtk.c                    |  28 ++-
 drivers/spi/spi-mtk-snfi.c                    |  41 +++-
 9 files changed, 330 insertions(+), 193 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
