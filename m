Return-Path: <SRS0=/Eax=6V=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ED4C38A2A
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:02:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F3A692083B
	for <linux-mtd@archiver.kernel.org>; Thu,  7 May 2020 11:02:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ql9cb4aL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F3A692083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UX0oZhI7ajotEOWeEeSM+OWXlFDMZG6yFPkHRh3ifm0=; b=Ql9cb4aLeOXP2R
	vFxWFZ8g680gx2HrcP4Eygq8hNaV58krbZZmQeo4Xa+Nk3HwZR4jlp9vFmJi/hB5HT2avvflF23aO
	zzDMUW1GOM3jVD5duevCVm6kiBCVla+BQhJ0Y1RT3M7LMsMpkNXNMpr1uCfPgLiKaQjbsLFUmoqug
	VqeqL1vnxKI60gv4LpdY29mYkc4lSn5LsdafExuayxX2JLjLUGuEUeAGNFeJSVtyQQfP0/g4U+MWC
	S4JJ1SvPyr6AvxS4xazlPKRkAmRgoL2D2X4R8iYMbHZ5eLK54esa+yeQQ0QEXNlrIIl5pwijIdI1E
	cJi/ETivm3MgndN2NrCA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jWeIX-0006TD-Di; Thu, 07 May 2020 11:02:37 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jWeHP-0005M4-F6
 for linux-mtd@lists.infradead.org; Thu, 07 May 2020 11:01:34 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id EB01020014;
 Thu,  7 May 2020 11:01:23 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 <devicetree@vger.kernel.org>, Richard Weinberger <richard@nod.at>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH v3 6/8] dt-bindings: mtd: Document ARASAN NAND bindings
Date: Thu,  7 May 2020 13:00:32 +0200
Message-Id: <20200507110034.14736-7-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200507110034.14736-1-miquel.raynal@bootlin.com>
References: <20200507110034.14736-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200507_040127_656324_CE62B839 
X-CRM114-Status: GOOD (  10.96  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Michal Simek <monstr@monstr.eu>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Naga Sureshkumar Relli <nagasure@xilinx.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Document the Arasan NAND controller bindings.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../bindings/mtd/arasan,nand-controller.yaml  | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
new file mode 100644
index 000000000000..db8f115a13ec
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/arasan,nand-controller.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/arasan,nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Arasan NAND Flash Controller with ONFI 3.1 support device tree bindings
+
+allOf:
+  - $ref: "nand-controller.yaml"
+
+maintainers:
+  - Naga Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+        - enum:
+          - xlnx,zynqmp-nand-controller
+        - enum:
+          - arasan,nfc-v3p10
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Controller clock
+      - description: NAND bus clock
+
+  clock-names:
+    items:
+      - const: controller
+      - const: bus
+
+  interrupts:
+    maxItems: 1
+
+  "#address-cells": true
+  "#size-cells": true
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - clock-names
+  - interrupts
+
+additionalProperties: true
+
+examples:
+  - |
+    nfc: nand-controller@ff100000 {
+        compatible = "xlnx,zynqmp-nand-controller", "arasan,nfc-v3p10";
+        reg = <0x0 0xff100000 0x0 0x1000>;
+        clock-names = "controller", "bus";
+        clocks = <&clk200>, <&clk100>;
+        interrupt-parent = <&gic>;
+        interrupts = <0 14 4>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+    };
-- 
2.20.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
