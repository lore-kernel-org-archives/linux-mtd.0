Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB481EB64DA
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHGGu2Fg/3OT0I8fjbtko9pDgpYQQ9CZBKarDXGJoKo=; b=Ftdd2PSYbCsZDC
	dARf+ftHgKUSiMEeIkJAhbXY3XeKAVzyquHMAm/VAL1xr8ulU5dvp50WJnriQsATXnXH8nKZPHS64
	X6ox6PlD/FXDkoZq+3qLvA/XuqaFjQiaL7CmMFNonTkKzbY6GTFu86KfQTpcMMYQOuAWQ7frKXZHc
	DyyaWyBOoeAjifeBoZ1MJLL6p0Jgr/9PFxGa8uMmM+C+1URRhOdSiVxIyT9NmUb7Q4UADtuBpTSxq
	i0YTDGzY92zNJYQCgMej2x0lzwMWIiExvsMQbKn05lGcgkh2BdenoAQS91gDV8T1kIkGKVEpWvF5R
	1gS26DDTxD391M4zlWPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBDA-00818R-30;
	Mon, 19 Jun 2023 09:30:12 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCk-0080j2-2f
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:59 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166985;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jze5YN2aX7SgAa5p9hsCxpJKSKuW0V7/I82zaMTRyDI=;
	b=LaHp4Tu38OFHxNLJMEK34dfKh0Ty9+dqAtEV8OB0Qjuc3AFy77OS/8wdJ/q2vQsBhhv/Pz
	7HX0ytmTr0SyHdIsWg48nM/00S0ASgSp0/Dob90OZvWQc6MnZhuKDq4DLTMaid37CMjonZ
	HCbNzYVcRcTpjExdF+cQdAQ+Xq3Y8cmliESoeviUo/YDzIvfqclZGPXMlgSm9hjsRXz5we
	P9oM79cmq28a9FqC26a4Ai/nXnwTNOvTnne32iFXHTDst2pySgsWKR49WAL8Qyv6h1CbU+
	0FQi93GMQIKWrFsb+iL4vAssBU1OOrokgxP73tgHpYovDqdX63MnEvHmFfZrdg==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 6B45C1BF20D;
	Mon, 19 Jun 2023 09:29:43 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 15/17] dt-bindings: mtd: mediatek: Reference raw-nand-chip.yaml
Date: Mon, 19 Jun 2023 11:29:14 +0200
Message-Id: <20230619092916.3028470-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022947_038647_26CD5054 
X-CRM114-Status: GOOD (  10.45  )
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

The mediatek NAND controller should reference the new raw-nand-chip.yaml
binding instead of the original nand-chip.yaml which does not contain
*all* the properties that may be used to fully describe the NAND
devices, certain properties being actually described under
nand-controller.yaml.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
index a6e7f123eda7..ab10b90077b6 100644
--- a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
+++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
@@ -40,7 +40,7 @@ properties:
 
 patternProperties:
   "^nand@[a-f0-9]$":
-    $ref: nand-chip.yaml#
+    $ref: raw-nand-chip.yaml#
     unevaluatedProperties: false
     properties:
       reg:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
