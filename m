Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E16C636CC
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 02:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=074yM3sZOpysQGvQoxqnciGYmuYrXuhxCHd0U/LuTf4=; b=b42yAFcYdF/c9Q
	4/vRLZlB+Vb1kYcJyN/U9nadSKq+HDW+q0c09DvWh7VAWxexNC9qV+H2CeMMQt1zxwvWPAdWFnwt5
	9IhJepI4798ZljS0wSY+EhFJe0HlivEY4tO2EwfbW+jC3/fn4Vfh0B3j7vxuRyrWmkGPo3umxGks5
	CGuDwtpyfPN1jaNzG0H3BfsPRhM0SqJonkfdA3xyEbfOPVYlLYcp0jv5lVCZDwyjK4nxvinIXoiVZ
	nzLEY0flxVMt31dP/zEmw2Kepa1mLWowGQlnIDNzNKdcGW9d24RUHujh5DAUp2FSRudtjJNs+S+7p
	0JXqo5BfEoV29kRCoXMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2fR-009wME-KP; Wed, 01 Feb 2023 02:16:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2ez-009wC7-RX; Wed, 01 Feb 2023 02:15:43 +0000
X-UUID: 517f8510a1d611eda08d4d6090ec5a5c-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=/YTk/4myQC/KyrxLyPo1I1KSJqbfhccuiIeb+TgIHG0=;
	b=A98zsQmVV1zG/UELvowoBSywEgiKopakSPM81a997WykRzN14lPDjRx9iYvJsDh5jMhvqlkmvpRQsdx0ekDMJlC4dUU+tx2QGFQYBgIgvoHNrohG3mnujrR6iw+nEpUl/RhKgoae+ecimluMcJfMPfguu17hP6IwAFB3i63V4pU=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:7d405d9d-06cf-4088-800a-22282b235dd3,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:3ca2d6b,CLOUDID:1f3f858d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:1,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 517f8510a1d611eda08d4d6090ec5a5c-20230131
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1770434041; Tue, 31 Jan 2023 19:15:38 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 10:15:03 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 10:15:02 +0800
From: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger
	<richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
	<matthias.bgg@gmail.com>
CC: Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	<linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <benliang.zhao@mediatek.com>,
	<bin.zhang@mediatek.com>
Subject: [PATCH v6 0/5] Add MediaTek MT7986 NAND ECC engine support
Date: Wed, 1 Feb 2023 10:14:55 +0800
Message-ID: <20230201021500.26769-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_181541_928431_EB68A5D0 
X-CRM114-Status: GOOD (  12.71  )
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

This patch series split from bellow series which pick-up mtd relevant patches
https://lore.kernel.org/all/20230130030656.12127-1-xiangsheng.hou@mediatek.com.
This series add MediaTek MT7986 NAND ECC controller support, split ECC engine
with rawnand controller in bindings and change to YAML schema.

Changes since V5:
 - Split from previous series V4.
 - Fix warning by change mtk-nand.txt references to new yaml file.

Changes since V4:
 - Split arm and arm64 dts patch for fix existing NAND controller node name.

Changes since V3:
 - Correct mediatek,mtk-nfc.yaml dt-bindings.

Changes since V2:
 - Change ECC err_mask value with GENMASK macro.
 - Change snfi mediatek,rx-latch-latency to mediatek,rx-latch-latency-ns.
 - Add a separate patch for DTS change.
 - Move common description to top-level pattern properties.
 - Drop redundant parts in dt-bindings.

Changes since V1:
 - Improve and perfect dt-bindings documentation.
 - Change existing node name to match NAND controller DT bingings.
 - Fix issues reported by dt_binding_check.
 - Fix issues reported by dtbs_check.

Xiangsheng Hou (5):
  dt-bindings: mtd: Split ECC engine with rawnand controller
  arm64: dts: mediatek: Fix existing NAND controller node name
  arm: dts: mediatek: Fix existing NAND controller node name
  dt-bindings: mtd: mediatek,nand-ecc-engine: Add compatible for MT7986
  mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC

 .../bindings/mtd/mediatek,mtk-nfc.yaml        | 155 +++++++++++++++
 .../mtd/mediatek,nand-ecc-engine.yaml         |  63 +++++++
 .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
 MAINTAINERS                                   |   2 +-
 arch/arm/boot/dts/mt2701.dtsi                 |   2 +-
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   2 +-
 drivers/mtd/nand/ecc-mtk.c                    |  28 ++-
 8 files changed, 247 insertions(+), 183 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
