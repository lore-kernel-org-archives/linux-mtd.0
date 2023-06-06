Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4E5C77B7A
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0l/oUusrfOA6w4vIqcFV+3QLeS7U5jd82o86k1JaRJM=; b=M/1dHxwqsEVA1x
	Not3jmrlapfHu94KknUobx2qNhO+09Ls4/OyO25J/dL7liWOMuTR66PHrPVTYnjCWdvUIXquKPKK/
	KPjgxgFdCbN/BSC0gAF7/9pC3KRsVwRqoNAP7bELOsBkgL7wIpYUz5bt6rPF5doOe73GBpuasjm6N
	oex49Jo1v9rOfXgcoyrC+zlqUtFkqMjvjyQTqOsq5aOQAQMXze2A5frAhboIX9bl0sFjQyttQ0Nd3
	ZP3ysCS4YOKaUUgP1/9P6UdXUqNGKqCgkYRzUBLrVnG0FutWOO3bv9cGPrj/ffXm8H9RmNRNDpML+
	e6OmuZln7AXABC8KLlSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arx-002epS-1S;
	Tue, 06 Jun 2023 17:53:21 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6art-002ekr-16
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:18 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jwwvRTjJ0LIIZZ8NrpPblpWybAPwlZ5ekZgglbh676s=;
	b=REp41+yA8SlzvL5Yjm59oFIygoVclyfd0QTVka3CssGU85mmN3QU+HE5DtMKTK+h0XCGc8
	dDeS2Yq52mujdHTmnv8LB4YzQkhMzWt9YbtUd3Qg46qZDE7Y/oTl96UBMPFjxuLAp8hOtW
	Q2kec/zJ8J7QO3B7+okIjckU6wWGImHL1SZydM13S3R9ZbjoOD49gB9zbL7rc2T03f/3LE
	Rg8t0ArXGMjN0LNbltimXocAI8P4tkaKNZE9kyI7ghN12ljsYNUHhXbm8EwhPWnk7euJxd
	0UoBbeloC5LxoZaX2VeeWXs3kt67xFMcZLH0ypwXmwnblSSJqx5ClFyJlskDeQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id C17921C0004;
	Tue,  6 Jun 2023 17:53:14 +0000 (UTC)
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
Subject: [PATCH v2 15/17] dt-bindings: mtd: mediatek: Reference raw-nand-chip.yaml
Date: Tue,  6 Jun 2023 19:52:44 +0200
Message-Id: <20230606175246.190465-16-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105317_519276_88279DC6 
X-CRM114-Status: GOOD (  10.27  )
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
