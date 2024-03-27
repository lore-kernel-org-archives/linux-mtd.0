Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F96CD1283
	for <linux-mtd@archiver.kernel.org>; Wed, 27 Mar 2024 10:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+ifxuTEYV6o2ZzCDFPqhfdX8Br3+FURwlA4ZN0XWQUY=; b=OS6W+DecBgy3tg
	lwVSSPCbujFkwBhEE9ZjWz+p955YHCXWScApYCDD3u7lG4pkVdYhCBcrTSOa2EF4uub6m0gM7V9Bz
	tOZNw4rDFiqmR7z+AQBEqlxA/kZlT2lFoJIYykdwINEMUVXLnyJUrf/xO1eX5t7OYjRLXtCo88rtr
	VSvE/JuYOp7g3ER+lGNyMY93gTGtcRg42emR2OdqIWrA9DuCKhphUNzbr1nP8ZBRF6iVJohRuL3/+
	Ff8V/4sF4r/whBHshDc57VfzTTrgqJ6pGw6Vz0BVEeyDtQfDNfgFHt759B5NQuaxMhCPk3nL5D7DY
	Y7dOteXbEqD9ODTxYggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQmC-00000008Sjf-3NSB;
	Wed, 27 Mar 2024 10:45:00 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQm6-00000008Sg6-2a1B
	for linux-mtd@lists.infradead.org;
	Wed, 27 Mar 2024 10:44:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 81A85CE2601;
	Wed, 27 Mar 2024 10:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AE830C433F1;
	Wed, 27 Mar 2024 10:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711536291;
	bh=SOFXEAyxqf7gCj/PKs4OxopkGggYXvVGBYupyrDF7MQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=imzIbDF4cBc002W+hFN9aAH7GeCSjth9qKsiEuK5Dqag4nAYohKJIiGJ7rblNnpFe
	 V3YKMqPw6LVobmuzLD/Ac9etyrRl/xE9RsU/RL4DyLA3uVmkGbwK7RPL4PGQHkLGDq
	 YYDDrVlmibNp45zKxeAEUnTGsLce5EBfl9G/TYVjAVBSUh2AqOuElOCJuxaP4f+weU
	 CP7EI0IBgE1vmDZq+j5kk/uuy0/VIwdi2xqgfqHIzrsHl+ul5PhbxejRWFMvF9EKT2
	 i4B2LoR1nemzqlTRup48aqzPabdNTY1piBpNhafYUe5YT7LNtnJrVhB7PpINLRWsnp
	 YCCug7gpdofqA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B9CBC54E67;
	Wed, 27 Mar 2024 10:44:51 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 27 Mar 2024 18:43:59 +0800
Subject: [PATCH v6 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
MIME-Version: 1.0
Message-Id: <20240327-loongson1-nand-v6-1-7f9311cef020@gmail.com>
References: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
In-Reply-To: <20240327-loongson1-nand-v6-0-7f9311cef020@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1711536289; l=1918;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=/c2JzCGiocJH2FRjGpQj1Q5eYCDgSYWhUtAJhnm0nNk=;
 b=eaerRshqwfTKjm0fCEbsHmg1vT1vqL96vqKGFwahc8rg9aGw2YxI9AeHm3KR85x7LcCIlYf+Z
 ZsmgEurqShEBYEkbliGi10MUSklMLGGV/zF/PLi8k/BFjxQ/XpEy4XV
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_034455_163861_5900BC0D 
X-CRM114-Status: GOOD (  10.71  )
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

Add devicetree binding document for Loongson-1 NAND Controller.

Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Changes in v6:
- A newly added patch
---
 .../devicetree/bindings/mtd/loongson,ls1x-nfc.yaml | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml
new file mode 100644
index 000000000000..2494c7b3b506
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1x-nfc.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/loongson,ls1x-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-1 NAND Controller
+
+maintainers:
+  - Keguang Zhang <keguang.zhang@gmail.com>
+
+allOf:
+  - $ref: nand-controller.yaml
+
+properties:
+  compatible:
+    oneOf:
+      - const: loongson,ls1b-nfc
+      - items:
+          - enum:
+              - loongson,ls1a-nfc
+              - loongson,ls1c-nfc
+          - const: loongson,ls1b-nfc
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
+        compatible = "loongson,ls1b-nfc";
+        reg = <0x1fe78000 0x40>;
+
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        dmas = <&dma 0>;
+        dma-names = "rxtx";
+
+        nand@0 {
+            reg = <0>;
+            nand-use-soft-ecc-engine;
+            nand-ecc-algo = "hamming";
+        };
+    };

-- 
2.40.1



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
