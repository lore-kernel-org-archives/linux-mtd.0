Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FBBC433F5
	for <linux-mtd@archiver.kernel.org>; Fri, 26 Nov 2021 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9B07A3c+1Otl5n/I3UaKcpg7PJn4VDqHD03bIdA+udM=; b=24NevOYOJCwwJV
	o5T3+ukrpHZ0Ddz88gY3UMoB1QkvXxx6qG7J5jpb+062BsZ27xnrEydFgGeGOwSzozY6TlXuj3WNe
	xUm1jZzWv7KRj0kq25LXza8B/FCqDMezTNPatSXfEaJ73wmg6MXSjf3+j0Wu/Ukl5qdCoiTo6/fM/
	vGIOyZawQd3pKB7RO73JFqOyG7b+gMZ54M6UpvfSFC8h0gBWH3BLNvRlZMzgWKGPanejtx375ZR+C
	UrHQS3e0ps5Gw01TeBhxx1HJKZlG4i5nDwFHdTkS55Z0zWY3fKC5iajanwY1QYMGSmRxA3ywdu88E
	Q+i3IQTy/78Caiqh/CIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mqZap-00ABVd-Mf; Fri, 26 Nov 2021 11:40:39 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mqZZn-00ABAN-PP
 for linux-mtd@lists.infradead.org; Fri, 26 Nov 2021 11:39:37 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 1AA0AFF815;
 Fri, 26 Nov 2021 11:39:33 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Michael Walle <michael@walle.cc>,
 <linux-mtd@lists.infradead.org>
Cc: Rob Herring <robh+dt@kernel.org>, <devicetree@vger.kernel.org>,
 Mark Brown <broonie@kernel.org>, <linux-spi@vger.kernel.org>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Boris Brezillon <bbrezillon@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, Rob Herring <robh@kernel.org>
Subject: [PATCH v2 04/20] dt-bindings: mtd: spi-nand: Convert spi-nand
 description file to yaml
Date: Fri, 26 Nov 2021 12:39:08 +0100
Message-Id: <20211126113924.310459-5-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211126113924.310459-1-miquel.raynal@bootlin.com>
References: <20211126113924.310459-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211126_033935_996062_B26971E7 
X-CRM114-Status: GOOD (  14.26  )
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

Let's get rid of spi-nand.txt by converting it to yaml schema. While at
converting this file, let's actually pull all the generic properties
from nand-chip.yaml which might apply to a SPI-NAND chip.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/spi-nand.txt      |  5 ----
 .../devicetree/bindings/mtd/spi-nand.yaml     | 27 +++++++++++++++++++
 2 files changed, 27 insertions(+), 5 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.txt
 create mode 100644 Documentation/devicetree/bindings/mtd/spi-nand.yaml

diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.txt b/Documentation/devicetree/bindings/mtd/spi-nand.txt
deleted file mode 100644
index 8b51f3b6d55c..000000000000
--- a/Documentation/devicetree/bindings/mtd/spi-nand.txt
+++ /dev/null
@@ -1,5 +0,0 @@
-SPI NAND flash
-
-Required properties:
-- compatible: should be "spi-nand"
-- reg: should encode the chip-select line used to access the NAND chip
diff --git a/Documentation/devicetree/bindings/mtd/spi-nand.yaml b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
new file mode 100644
index 000000000000..19ac57dcffc3
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/spi-nand.yaml
@@ -0,0 +1,27 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/spi-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: SPI-NAND flash device tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+allOf:
+  - $ref: "nand-chip.yaml#"
+
+properties:
+  compatible:
+    const: spi-nand
+
+  reg:
+    maxItems: 1
+    description: Encode the chip-select line on the SPI bus
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
