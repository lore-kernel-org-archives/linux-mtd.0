Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C8D8C78828
	for <linux-mtd@archiver.kernel.org>; Fri, 20 Sep 2024 11:20:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umCKEMyyiv+V0OQXFsyfUTZXi9SHjXx/4NiFywgSZsY=; b=hesQA5eZzr6TXJ
	CMJzkgUE5K+lZchrwgIBA/XaE0cxNKeoxK6NYq4iytbfGJyD3uEka0aQtWVE8K+3IRlrsd+oH2m2p
	J3q5lNjQ54soacXnR/Iq//TGU3MwizzKwnOABiYZt5GqIp3DVmdosYs0C3z6hxlMvMkNg+KalYYIy
	teKSzvClVYad69kyXM4+BIvt99QgZaFHYFQr8GSFC9lE6Pgs0eeQEFbLkxOkjqdJ0o+ygj3p8eXHx
	MmskoF1VvWlnTSk58Q7NcrJUpNa07VMKSYbvojipq2YO7HhGYx4zhsPWrVFd8Z3eYjItwgQTfwAUB
	YayqSGbnltQVFhGVxT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srbg3-0000000C4pI-0jVE;
	Fri, 20 Sep 2024 11:19:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srbf9-0000000C4Zd-04JF
	for linux-mtd@lists.infradead.org;
	Fri, 20 Sep 2024 11:19:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D4FB05C5631;
	Fri, 20 Sep 2024 11:18:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B3DEC4CECD;
	Fri, 20 Sep 2024 11:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726831137;
	bh=C2lALOA/HTQ48lrUu1YpJ0xMWmzNjp8V2vBH0myGipw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bkGzEum8Dh2tQbhJp7/r81zrQ5Ip69k+iCWFdXYavp3JAS95xuGQW3xuKruq0IBBa
	 2IWV94m0OyiGyFk5GnUXtDxgGtyOuRGTOZaTy1dbrqDNiR4wQr0NCRlxP4BNQH9Ilu
	 nSqc5NAypvYelvj6zeKDueaKdTdAG2OxkgsjRJWoWd9BPXTJuf2XLvbFEENn6SPZU8
	 3ieGpLOZCEVLnJmtp4OOrg396eT9Wve65DIx0SGezLIFYZfQVLRieXGRyAn53wfAaD
	 30LdkxhdbJPsrZ3DfXBsXciGYfFKMEfzgFwqFGYMfDt2H8GxucgumDUe3+HyIBvTXG
	 xVwQnftzdfwEw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376A4C78828;
	Fri, 20 Sep 2024 11:18:57 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Fri, 20 Sep 2024 19:18:53 +0800
Subject: [PATCH v9 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
MIME-Version: 1.0
Message-Id: <20240920-loongson1-nand-v9-1-9cc7b9345a03@gmail.com>
References: <20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com>
In-Reply-To: <20240920-loongson1-nand-v9-0-9cc7b9345a03@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1726831135; l=2835;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=i1pwL1d4KaKaOGZPu9rx8w563lpvdoqxRBgzicR1lOI=;
 b=QeHkXkgO5Eg/QwzrbNR3XgZSDKKgqtKm+u8VZCz4HixQ+3AE8kO3exJJBYn07mzkpSh7fKc9H
 lKzMOxrgsSJBruEBJlZkFsnPpQuKUJr+fyz9PZg+hoD32WkTUdOEziO
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240920_041859_249712_56DF3038 
X-CRM114-Status: GOOD (  13.71  )
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
Reply-To: keguang.zhang@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

From: Keguang Zhang <keguang.zhang@gmail.com>

Add devicetree binding document for Loongson-1 NAND controller.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Changes in v9:
- Change the compatible to 'loongson,ls1*-nand-controller'.
- Rename the file to loongson,ls1b-nand-controller.yaml
- Some minor adjustments.

Changes in v8:
- Add a description part.
- Adjust the compatible because the match data for ls1c-nfc differs from ls1b-nfc.
- Mark 'nand-use-soft-ecc-engine' and 'nand-ecc-algo' as mandatory.
- Delete the superfluous blank lines.

Changes in v7:
- rename the file to loongson,ls1b-nfc.yaml

Changes in v6:
- A newly added patch
---
 .../mtd/loongson,ls1b-nand-controller.yaml         | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
new file mode 100644
index 000000000000..308baf23221b
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nand-controller.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-1 NAND Controller
+
+maintainers:
+  - Keguang Zhang <keguang.zhang@gmail.com>
+
+description:
+  The Loongson-1 NAND controller abstracts all supported operations,
+  meaning it does not support low-level access to raw NAND flash chips.
+  Moreover, the controller is paired with the DMA engine to perform
+  READ and PROGRAM functions.
+
+allOf:
+  - $ref: nand-controller.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - loongson,ls1b-nand-controller
+          - loongson,ls1c-nand-controller
+      - items:
+          - enum:
+              - loongson,ls1a-nand-controller
+          - const: loongson,ls1b-nand-controller
+
+  reg:
+    maxItems: 1
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+patternProperties:
+  "^nand@[0-3]$":
+    type: object
+    $ref: raw-nand-chip.yaml
+
+    required:
+      - nand-use-soft-ecc-engine
+      - nand-ecc-algo
+
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - dmas
+  - dma-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@1fe78000 {
+        compatible = "loongson,ls1b-nand-controller";
+        reg = <0x1fe78000 0x40>;
+        dmas = <&dma 0>;
+        dma-names = "rxtx";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            nand-use-soft-ecc-engine;
+            nand-ecc-algo = "hamming";
+        };
+    };

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
