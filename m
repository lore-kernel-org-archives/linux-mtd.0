Return-Path: <SRS0=Y0kv=SD=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B533AC43381
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 21:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B0720880
	for <linux-mtd@archiver.kernel.org>; Mon,  1 Apr 2019 21:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Mkm7G/kJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B0720880
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gjL7FmgbqvNOSgoUmT6RKlzNM0jpfbvpuSnDzQkHOro=; b=Mkm7G/kJEYmj87
	J88pyGQnUYyX6m9CJr8C0Jplul6IbFCrYSGHirRWKTdwI8IKc7l1v4OYKd5RdBRx7dVdOonDp7VxT
	L6kkdtDGLpR1/mwOc49h4kqsrtBL56l/QeBd+2GD2yTJJ+DAf9c9+IRm1zM67AvyN4EP1jr+UsD5J
	HfXHvw3p12hLUGi+lYk1s7izrTOi+eWVLvChvQacQQcp1GGu8HRuuI4MBKwD4VhiaUn/rcKajJRqk
	646dBQTbgoJf+ejkrG6JT8LadUu2ZQGpNxAqej9nGFPqEvpPQkTPdBUVmhuhqnr1/CEEzruHwiqIY
	gzzEMkgr7ASRHhFgLY9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hB4Gb-0002fY-4p; Mon, 01 Apr 2019 21:14:53 +0000
Received: from relay6-d.mail.gandi.net ([217.70.183.198])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hB4Fw-0001mD-6b; Mon, 01 Apr 2019 21:14:14 +0000
X-Originating-IP: 90.89.68.76
Received: from localhost (lfbn-1-10718-76.w90-89.abo.wanadoo.fr [90.89.68.76])
 (Authenticated sender: maxime.ripard@bootlin.com)
 by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id 7CC02C0004;
 Mon,  1 Apr 2019 21:14:00 +0000 (UTC)
From: Maxime Ripard <maxime.ripard@bootlin.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 1/4] dt-bindings: mtd: Add YAML schemas for the generic NAND
 options
Date: Mon,  1 Apr 2019 23:13:53 +0200
Message-Id: <75ad3b89e4a6f8ad5bc414c3dccbb1f99361495a.1554153146.git-series.maxime.ripard@bootlin.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190401_141412_705001_FF23DB5E 
X-CRM114-Status: GOOD (  14.52  )
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Cc: Maxime Ripard <maxime.ripard@bootlin.com>, devicetree@vger.kernel.org,
 Chen-Yu Tsai <wens@csie.org>, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

The NAND chips in MTD have a bunch of generic options that are needed in a
device tree. Add a YAML schemas for those.

Signed-off-by: Maxime Ripard <maxime.ripard@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 131 +++++++-
 1 file changed, 131 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/nand-controller.yaml

diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
new file mode 100644
index 000000000000..05b1afb34972
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -0,0 +1,131 @@
+# SPDX-License-Identifier: (GPL-2.0+ OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NAND Chip and NAND Controller Generic Binding
+
+maintainers:
+  - Boris Brezillon <bbrezillon@kernel.org>
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+  - Richard Weinberger <richard@nod.at>
+
+description: |
+  The NAND controller should be represented with its own DT node, and
+  all NAND chips attached to this controller should be defined as
+  children nodes of the NAND controller. This representation should be
+  enforced even for simple controllers supporting only one chip.
+
+  The ECC strength and ECC step size properties define the correction
+  capability of a controller. Together, they say a controller can
+  correct {strength} bit errors per {size} bytes.
+
+  The interpretation of these parameters is implementation-defined, so
+  not all implementations must support all possible
+  combinations. However, implementations are encouraged to further
+  specify the value(s) they support.
+
+properties:
+  $nodename:
+    pattern: "^nand-controller(@.*)?"
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  ranges: true
+
+patternProperties:
+  "^nand@[a-z0-9]$":
+    properties:
+      reg:
+        description:
+          Contains the native Ready/Busy IDs.
+
+      nand-ecc-mode:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/string
+          - enum: [ none, soft, hw, hw_syndrome, hw_oob_first, on-die ]
+        description:
+          Operation mode of the NAND ecc mode. soft_bch is deprecated
+          and should be replaced by soft and nand-ecc-algo
+
+      nand-ecc-algo:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/string
+          - enum: [ hamming, bch, rs ]
+        description:
+          Algorithm of NAND ECC.
+
+      nand-bus-width:
+        allOf:
+          - $ref: /schemas/types.yaml#/definitions/uint32
+          - enum: [ 8, 16 ]
+          - default: 8
+        description:
+          Bus width to the NAND chip
+
+      nand-on-flash-bbt:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Enable the on-flash Bad Block Table
+
+      nand-ecc-strength:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of bits to correct per ECC step.
+
+      nand-ecc-step-size:
+        $ref: /schemas/types.yaml#/definitions/uint32
+        description:
+          Number of data bytes covered by a single ECC step.
+
+      nand-ecc-maximize:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Whether or not the ECC strength should be maximized. The
+          maximum ECC strength is both controller and chip
+          dependent. The controller side has to select the ECC config
+          providing the best strength and taking the OOB area size
+          constraint into account.  This is particularly useful when
+          only the in-band area is used by the upper layers, and you
+          want to make your NAND as reliable as possible.
+
+      nand-is-boot-medium:
+        $ref: /schemas/types.yaml#/definitions/flag
+        description:
+          Whether or not the NAND chip is a boot medium. Drivers might
+          use this information to select ECC algorithms supported by
+          the boot ROM or similar restrictions.
+
+      nand-rb:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        description:
+          Contains the native Ready/Busy IDs.
+
+    required:
+      - reg
+
+required:
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    nand-controller {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      /* controller specific properties */
+
+      nand@0 {
+        reg = <0>;
+        nand-ecc-mode = "soft";
+        nand-ecc-algo = "bch";
+
+        /* controller specific properties */
+      };
+    };

base-commit: aa63f222af3e5991099ebcecca7c474d8285c7c4
-- 
git-series 0.9.1

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
