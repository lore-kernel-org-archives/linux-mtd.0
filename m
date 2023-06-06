Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D626C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4TJzQj7/zQm3IjCF8PRULAdqJbJOgQuycUU6eHhdUQw=; b=W8W+f46hbIo0MC
	FRiYiqVg0Tkg29yIxNWu7IIFSoRLpdDBKoLqa9hwtxfdpnFOF/oAvdFayO4hYjAGQyoaIzCdGUzqC
	FC+WzuEGGmegjyRBOTrORumhNcXu5mWx6TKW6nalMWhkKVgAUOl96pLQab5my3Njo7NHCnkVClSi/
	puzk4GHx+eKouJG6OOlr4uvhUFsLXC9G1/XCkmM4uLsf9sAadb+cinpQ4YvrNvihcK29jGGbMH9zU
	J9E611V9bT0v2+2sFwApEnJVaXx9xakjG561EZOTfjhBSZC9IF7L7pKpeO/PMQXgg6b6Xm93kMAnW
	3uwWQWc6IpPgoSvTh9rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arz-002erB-0K;
	Tue, 06 Jun 2023 17:53:23 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arv-002em4-0C
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:20 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eL/QjMyh/xq3lSIKznjaDjBlkvU+8UxTcr72+ENX2Ms=;
	b=aekL+ZeLu70p36cxC11Gv/u/TiFLk9DaqRE6UG6uUq8JBdpAKV3SAVzp+IDXmFJDw7yqQQ
	tdoPtvveIQzdaHjYiZ04J5/GiUGxusrAOa6uUximuP0oyiq92aEAZCBLmdZwYysCM5cjl+
	qz3b6H00bFo9joJn4R//f7wDrpWyc/H8Am909gNjtGTyOOuJ1tFXaDgwPZa5E7/ljc7SZP
	1hS1qj5HHX0dw6NVNIrZiIF+Rt5G3joZ9mEYtXWoMceqCL2RNtVzzAutBb933IU+tC5Yhe
	T9S2VgFH2W8+x8kZfaQtpuruweJy+sbllO6NaYvqd6TbHJQYqqCQWB3L2neWWw==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2A8781C0007;
	Tue,  6 Jun 2023 17:53:16 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Subject: [PATCH v2 16/17] dt-bindings: mtd: mediatek: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 19:52:45 +0200
Message-Id: <20230606175246.190465-17-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105319_258747_5D2A391F 
X-CRM114-Status: UNSURE (   9.82  )
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

nand-on-flash-bbt is a generic property which may apply to any raw NAND
chip, it does not need to be listed in each controller
description. The raw NAND chip description file which contains the
property is already referenced, so no need to mention the property here
again.

Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Xiangsheng Hou <xiangsheng.hou@mediatek.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
index ab10b90077b6..ab503a33a269 100644
--- a/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
+++ b/Documentation/devicetree/bindings/mtd/mediatek,mtk-nfc.yaml
@@ -45,7 +45,6 @@ patternProperties:
     properties:
       reg:
         maximum: 1
-      nand-on-flash-bbt: true
       nand-ecc-mode:
         const: hw
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
