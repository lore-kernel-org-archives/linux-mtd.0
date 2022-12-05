Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0204C4321E
	for <linux-mtd@archiver.kernel.org>; Mon,  5 Dec 2022 07:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jw73Z5YwpYHLUtiRxmX89g47pO7lvmRRgMAIXrnYfAw=; b=S7x9nlERHoAMiJ
	gEqf0LMJE9ZJMFPQ5ZKaMzLt3/vsiU3A1w7xEI4ltpa1RMFOGoAU2THgGyI1C7TyHPpkQhH/2lD7t
	0F4j+iJJ6ZDGq8cQUIRtkclqPa18NtvCXgGqwZqO0rH9qToaMhDXioTEFN5i8ddOF8uY+OS3nRAf9
	WdDYuyx2sYXyyMmQU5byOD2PLkcWkgqllpNhB3XV7ojsp7ZDVOQ3oBzQlgd/USh1TUcDvN5qxOMqD
	sSaN1HQJQXdWwTaTnQxKWybMwLAi4GhL+A7KoTV3Lauxi8OjuvqLnloZZa9sO1zgPkOf4myGI1SBF
	pitXO8k+m6H0ANsvneZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25aw-00FLCC-3b; Mon, 05 Dec 2022 07:08:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p25as-00FL5j-Fw; Mon, 05 Dec 2022 07:08:52 +0000
X-UUID: 2fbb5e313b8a45e08a4e716e43fbce1a-20221205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=87AgBQA4Kxp3UrxJ6BvkvJGYQQbPRDGXT5DDNc+MxfM=;
	b=V5gDgz/utsO8vaEu3GIjZW/f6OfsmM3TClU7R9C2IAzbeXn3CJLu1RwQRv/dl/iDcNy55+oFTzoJP1iF52egcYQcuaEdZCnV6H7hLMJn7Gl0vAuaFZxc3aQfAMASvdMIaxEcsGjM3FN4yZYa3h4cyujubx53AJWndlIEP8ZN7Ys=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.14,REQID:57f351f8-540a-4af5-9b77-b8c3b2349c69,IP:0,U
	RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:-25
X-CID-META: VersionHash:dcaaed0,CLOUDID:ad062a1f-5e1d-4ab5-ab8e-3e04efc02b30,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
	RL:0,File:nil,Bulk:nil,QS:nil,BEC:nil,COL:0
X-UUID: 2fbb5e313b8a45e08a4e716e43fbce1a-20221205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 2232624; Mon, 05 Dec 2022 00:08:41 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs13n1.mediatek.inc (172.21.101.193) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 5 Dec 2022 14:58:08 +0800
Received: from localhost.localdomain (10.17.3.154) by mtkmbs13n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 5 Dec 2022 14:58:07 +0800
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
Subject: [PATCH v2 0/9] Add MediaTek MT7986 SPI NAND and ECC support
Date: Mon, 5 Dec 2022 14:57:47 +0800
Message-ID: <20221205065756.26875-1-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221204_230850_631348_5F5009A0 
X-CRM114-Status: GOOD (  10.54  )
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
hange to YAML schema.

Changes since V1:
 - Use existing sample delay property.
 - Add restricting for optional nfi_hclk.
 - Improve and perfect dt-bindings documentation.
 - Change existing node name to match NAND controller DT bingings.
 - Fix issues reported by dt_binding_check.
 - Fix issues reported by dtbs_check.

Xiangsheng Hou (9):
  spi: mtk-snfi: Add snfi support for MT7986 IC
  spi: mtk-snfi: Change default page format to setup default setting
  spi: mtk-snfi: Add optional nfi_hclk which needed for MT7986
  mtd: nand: ecc-mtk: Add ECC support fot MT7986 IC
  dt-bindings: spi: mtk-snfi: Add compatible for MT7986
  spi: mtk-snfi: Add snfi sample delay and read latency adjustment
  dt-bindings: spi: mtk-snfi: Add read latch latency property
  dt-bindings: mtd: Split ECC engine with rawnand controller
  dt-bindings: mtd: ecc-mtk: Add compatible for MT7986

 .../bindings/mtd/mediatek,mtk-nfc.yaml        | 171 +++++++++++++++++
 .../mtd/mediatek,nand-ecc-engine.yaml         |  63 +++++++
 .../devicetree/bindings/mtd/mtk-nand.txt      | 176 ------------------
 .../bindings/spi/mediatek,spi-mtk-snfi.yaml   |  58 +++++-
 arch/arm/boot/dts/mt2701.dtsi                 |   2 +-
 arch/arm64/boot/dts/mediatek/mt2712e.dtsi     |   2 +-
 arch/arm64/boot/dts/mediatek/mt7622.dtsi      |   2 +-
 drivers/mtd/nand/ecc-mtk.c                    |  18 ++
 drivers/spi/spi-mtk-snfi.c                    |  66 ++++++-
 9 files changed, 366 insertions(+), 192 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
 create mode 100644 Documentation/devicetree/bindings/mtd/mediatek,nand-ecc-engine.yaml
 delete mode 100644 Documentation/devicetree/bindings/mtd/mtk-nand.txt

-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
