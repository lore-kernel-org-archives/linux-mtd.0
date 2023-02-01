Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC5FDC38142
	for <linux-mtd@archiver.kernel.org>; Wed,  1 Feb 2023 02:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8JMX2FHo+eLFbpVtFGKTgYjMba9oLRVB+4C/Iu/ZfI=; b=HJpDzDbMejm9xm
	tf1XMFcVhbpx7PsBH8LBAZfh5D7NcDzVbGSVVL09ze9PbZ621TfMRI3DM6GLSEp6DWuwe43Ms+Arc
	s0YS2IgIIQhMIMaLGf+nDEG0zhgL0fMhB9fjlOCZ3fiyDbKRAySASwvnqAU2q+OYX6bFnbYGuxtCG
	xQ4AtQF6T0fjEaSbwaUj0LWTpEd9Hay4XprQ216d4EaSrhOZzMdlzmXRKfmwZ+Vu38gRFie7yzOKA
	oqVvcxVFqYzjOc3mYGdquJagmagA+qL2TlbNJNBFEHWqCrIt7xC5uBUpceaNTHZrQQQ4BjmmxNegA
	iAtR87yHCK09laJ1552Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2hD-009xFL-RQ; Wed, 01 Feb 2023 02:18:00 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2f4-009wCT-Pi; Wed, 01 Feb 2023 02:15:48 +0000
X-UUID: 54d18038a1d611eda08d4d6090ec5a5c-20230131
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=t/lJsNvA0uH9SgSwmdI1vH7I7ad8xh4M3pN5qXfTyqY=;
	b=SFC73X/2A/NwnnGrCHzFScYzkre+bWMGvKQS3jrmXv7BD38zTK/eGGPPksc2WP4bhxVQf5BvaJVzG/7DYqSMIaBqWdQbsvru5WQ32xJUJ+uY10sIw7SuKtyzs0y/X/5RjkWyvVeAYXR1B5o6AMj7pxy2zbe2QlPZRkWY1mIaRJQ=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.18,REQID:c1b12594-edbd-4481-afc2-730b17cac45d,IP:0,U
	RL:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:90
X-CID-INFO: VERSION:1.1.18,REQID:c1b12594-edbd-4481-afc2-730b17cac45d,IP:0,URL
	:0,TC:0,Content:-5,EDM:0,RT:0,SF:95,FILE:0,BULK:0,RULE:Spam_GS981B3D,ACTIO
	N:quarantine,TS:90
X-CID-META: VersionHash:3ca2d6b,CLOUDID:1c40858d-8530-4eff-9f77-222cf6e2895b,B
	ulkID:230201101510CM436Q13,BulkQuantity:3,Recheck:0,SF:38|29|28|17|19|48,T
	C:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil,Bulk:40,QS:nil,BEC:nil,COL:0,
	OSI:0,OSA:0
X-CID-BVR: 0
X-UUID: 54d18038a1d611eda08d4d6090ec5a5c-20230131
Received: from mtkmbs13n1.mediatek.inc [(172.21.101.193)] by mailgw02.mediatek.com
	(envelope-from <xiangsheng.hou@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 4203973; Tue, 31 Jan 2023 19:15:43 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs13n2.mediatek.inc (172.21.101.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 1 Feb 2023 10:15:08 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.792.15 via Frontend Transport; Wed, 1 Feb 2023 10:15:06 +0800
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
	<bin.zhang@mediatek.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>
Subject: [PATCH v6 3/5] arm: dts: mediatek: Fix existing NAND controller node name
Date: Wed, 1 Feb 2023 10:14:58 +0800
Message-ID: <20230201021500.26769-4-xiangsheng.hou@mediatek.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230201021500.26769-1-xiangsheng.hou@mediatek.com>
References: <20230201021500.26769-1-xiangsheng.hou@mediatek.com>
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_181546_898176_04E8EA9D 
X-CRM114-Status: GOOD (  11.36  )
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

Change the existing node name in order to match NAND controller DT
bindings.

Signed-off-by: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm/boot/dts/mt2701.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/mt2701.dtsi b/arch/arm/boot/dts/mt2701.dtsi
index 0a0fe8c5a405..ce6a4015fed5 100644
--- a/arch/arm/boot/dts/mt2701.dtsi
+++ b/arch/arm/boot/dts/mt2701.dtsi
@@ -359,7 +359,7 @@ thermal: thermal@1100b000 {
 		mediatek,apmixedsys = <&apmixedsys>;
 	};
 
-	nandc: nfi@1100d000 {
+	nandc: nand-controller@1100d000 {
 		compatible = "mediatek,mt2701-nfc";
 		reg = <0 0x1100d000 0 0x1000>;
 		interrupts = <GIC_SPI 56 IRQ_TYPE_LEVEL_LOW>;
-- 
2.25.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
