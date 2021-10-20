Return-Path: <SRS0=lu4o=PI=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0CD6C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:32:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 716DA60F59
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Oct 2021 14:32:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 716DA60F59
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kiI4M8g+pVvm5vc6YJy9H41EE+vWFdAMwEISHdlvqlw=; b=vqK+I5DFv4gIba
	FnPnVloVjqcciDlDgSnNRraZg46iV0YuuI+mP6TwR+iv8yCNRt0YCvIGsLTPLOhqHTtkoy837GjRN
	dgSvB8AbW20GKQRRxmTyDExQyc1X8dl9SaiGeSbEnJp1BadKeadgGUsqwu7Y4g/O+NyEUguk8bHmO
	x8/R+bnEHNR0x4GoGf6QQgdW4H7km7cRS4JMG4bYXpKOvWCQYA0VGMb5wyO+u8i5Zb0pu126h18Oh
	gMQAOPI9pOJqrw4oRLeGsj/0Oe4AFN5RoJcV+k7BbUh5UBrEW22LAGjaLn/seKxZcQfM8alVqIO4u
	IxxOBMdGnacCzcZY1KFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mdCd4-004lta-BX; Wed, 20 Oct 2021 14:31:42 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mdCZs-004khF-5G
 for linux-mtd@lists.infradead.org; Wed, 20 Oct 2021 14:28:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id A86432000D;
 Wed, 20 Oct 2021 14:28:21 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: <linux-mtd@lists.infradead.org>, <linux-spi@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 Julien Su <juliensu@mxic.com.tw>, Jaime Liao <jaimeliao@mxic.com.tw>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Xiangsheng Hou <Xiangsheng.Hou@mediatek.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 08/18] dt-bindings: mtd: Describe Macronix NAND ECC engine
Date: Wed, 20 Oct 2021 16:27:59 +0200
Message-Id: <20211020142809.349347-9-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20211020142809.349347-1-miquel.raynal@bootlin.com>
References: <20211020142809.349347-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211020_072824_500982_0F859204 
X-CRM114-Status: GOOD (  12.31  )
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

Describe Macronix NAND ECC engine. This engine may be used as an
external engine or can be pipelined with either a raw NAND controller or
a SPI controller. Both hardware designs with a SPI controller are shown
in the examples.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/mtd/mxicy,nand-ecc-engine.yaml   | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/mxicy,nand-ecc-engine.yaml

diff --git a/Documentation/devicetree/bindings/mtd/mxicy,nand-ecc-engine.yaml b/Documentation/devicetree/bindings/mtd/mxicy,nand-ecc-engine.yaml
new file mode 100644
index 000000000000..804479999ccb
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/mxicy,nand-ecc-engine.yaml
@@ -0,0 +1,77 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/mxicy,nand-ecc-engine.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Macronix NAND ECC engine device tree bindings
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+properties:
+  compatible:
+    const: mxicy,nand-ecc-engine-rev3
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    /* External configuration */
+    spi_controller0: spi@43c30000 {
+        compatible = "mxicy,mx25f0a-spi";
+        reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
+        reg-names = "regs", "dirmap";
+        clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+        clock-names = "send_clk", "send_dly_clk", "ps_clk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            nand-ecc-engine = <&ecc_engine0>;
+        };
+    };
+
+    ecc_engine0: ecc@43c40000 {
+        compatible = "mxicy,nand-ecc-engine-rev3";
+        reg = <0x43c40000 0x10000>;
+    };
+
+  - |
+    /* Pipelined configuration */
+    spi_controller1: spi@43c30000 {
+        compatible = "mxicy,mx25f0a-spi";
+        reg = <0x43c30000 0x10000>, <0xa0000000 0x4000000>;
+        reg-names = "regs", "dirmap";
+        clocks = <&clkwizard 0>, <&clkwizard 1>, <&clkc 15>;
+        clock-names = "send_clk", "send_dly_clk", "ps_clk";
+        #address-cells = <1>;
+        #size-cells = <0>;
+        nand-ecc-engine = <&ecc_engine1>;
+
+        flash@0 {
+            compatible = "spi-nand";
+            reg = <0>;
+            nand-ecc-engine = <&spi_controller1>;
+        };
+    };
+
+    ecc_engine1: ecc@43c40000 {
+        compatible = "mxicy,nand-ecc-engine-rev3";
+        reg = <0x43c40000 0x10000>;
+    };
-- 
2.27.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
