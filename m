Return-Path: <SRS0=rRTz=6F=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE4C1C54FC9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 17:00:10 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9F5BC206E9
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Apr 2020 17:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hdaUe2uu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9F5BC206E9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UX0oZhI7ajotEOWeEeSM+OWXlFDMZG6yFPkHRh3ifm0=; b=hdaUe2uueVklf4
	kbOND65whUvVNu4alLLqPCTQUqoTRF6cDRwIGfpBi6U9lgUUTsKJS/fvzpZqzw1QSIOroW4B5Uc7V
	NqNbnzCHMeoz3841vr6atzPU9q2zUdmwdxeA5/YdJ3udJ8L1hr5eFuBfmtPClCx6PAPb8/RqNF6s/
	4+Mu9OG1oTcesnDBuvo9eucrY5gBefWBtqjSAvb6JPETG9a3U3bzNL7Vr92JTHEQs3W8rXoN5Val1
	kygVsMRqdqZg7F4ytZkTx2nlMnUkfj8cFlYf/hmUXBnG326LQAXvFH8cUkvbFC8rchX+PG+A9TrFK
	JPhe7D9/8qX0u/fffdyQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jQwFl-0000OK-Nj; Tue, 21 Apr 2020 17:00:09 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jQwFT-0008LS-EN
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2020 16:59:53 +0000
X-Originating-IP: 91.224.148.103
Received: from localhost.localdomain (unknown [91.224.148.103])
 (Authenticated sender: miquel.raynal@bootlin.com)
 by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 3A2E5FF804;
 Tue, 21 Apr 2020 16:59:49 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <Tudor.Ambarus@microchip.com>,
 <linux-mtd@lists.infradead.org>
Subject: [PATCH 1/2] dt-bindings: mtd: Document ARASAN NAND bindings
Date: Tue, 21 Apr 2020 18:59:45 +0200
Message-Id: <20200421165946.21471-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200421165946.21471-1-miquel.raynal@bootlin.com>
References: <20200421165946.21471-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200421_095951_616726_82AEE7BC 
X-CRM114-Status: GOOD (  10.64  )
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
