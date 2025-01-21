Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE062C02182
	for <linux-mtd@archiver.kernel.org>; Tue, 21 Jan 2025 10:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=050jqlPij07C7y7t2jo66CREZ9tpGJ0sfh8v6bvPIeQ=; b=AirNBKsKKOZhs5
	G8nEIFXqXGQ/bV65Yj+jMdtXeLJ3wiaujKSRi2X/oHUFu8F7atLmwhPQbuOc1o3+045tCUamgOh2e
	fclNemmgYswb8Vljp8ervvD9ABADM96ZS/yQL1nosSipjXPVkn39V2fDdVKyfzJJ6TVU266PbYXfl
	tqQ4pgCBLtnmz+z3F8LVm+FA3uVtqtNNMEDgjBuXtb4vCw/r68DBpPIpXbsQeRXqJXKK+spc1W7Db
	ufl5P3yyLf4am61bVjCdUOsdMH5GEUYESoxZf24VAmoLlE/GzcecDkXkmP6p+eh1csLCWsi55ziUK
	RDJTUf/zvPc92VSBoGLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taBX7-00000007aMf-2z0p;
	Tue, 21 Jan 2025 10:30:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taBVH-00000007Zr5-1f0y
	for linux-mtd@lists.infradead.org;
	Tue, 21 Jan 2025 10:29:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2996C5C57DA;
	Tue, 21 Jan 2025 10:28:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 15AD0C4CEE3;
	Tue, 21 Jan 2025 10:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737455342;
	bh=xTpVwwA9Z/JY+uNbnl7D/PUvhBqvPVadW+5yYXTG4yQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tA++yOZQZAAvBs/72PPMc1DWkbW70bpF3lFVPTcNE6oSDx//MkC00AkZj/py0deuN
	 We7FfeKscXyQhNojHYelnW5Q6caEN7V5EVUzxT5bAgcRGSzmU2/bpw9Do+65LNpV/s
	 OgA5lxeHlRFb3htoV4xopppxTflMVHi/Ntb0DZptqsEZrgGh4Ll4Mpa1w4dx0L1J1r
	 7nBuYj9qfFa/Qw98u4U3cN7J2ZETP4tGD1m/k/QIwVt9kydL3NVR5NPlpaLetHHs12
	 UCn+f13N99BX4rV/m9puMCshe0mxs+Gr0BuN7l+POBMeTr7rU8K+bdBEmw+FRHjRuC
	 5zxUKCnkMcvTw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07062C0218B;
	Tue, 21 Jan 2025 10:29:02 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Tue, 21 Jan 2025 18:27:33 +0800
Subject: [PATCH v12 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
MIME-Version: 1.0
Message-Id: <20250121-loongson1-nand-v12-1-53507999de39@gmail.com>
References: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
In-Reply-To: <20250121-loongson1-nand-v12-0-53507999de39@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737455340; l=3086;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=q+d1ZFmWj7rQk92y1vrzAikT5KZipaCojpk705icFmg=;
 b=ACWT7B4+HuTSTQQZW/UJjcRJCYUWRcbrRK/re/15gRi9ZmMIWnnbpdEA4slPWWURsDnRrZ9sP
 PeE+/Urrht0Bsctw83FNYVChzoLKPfCegZwp72ewbO0ZeQHjxPZEJum
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_022903_535018_6DA283D3 
X-CRM114-Status: GOOD (  15.20  )
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

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Keguang Zhang <keguang.zhang@gmail.com>
---
Changes in v12:
- Add MTD label in the example.

Changes in v11:
- Remove the requirement for 'nand-use-soft-ecc-engine' and 'nand-ecc-algo'.
- Add 'reg-names' to support DMA address.

Changes in v10:
- None

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
 .../mtd/loongson,ls1b-nand-controller.yaml         | 72 ++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
new file mode 100644
index 000000000000..a09e92e416c4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nand-controller.yaml
@@ -0,0 +1,72 @@
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
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: nand
+      - const: nand-dma
+
+  dmas:
+    maxItems: 1
+
+  dma-names:
+    const: rxtx
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - dmas
+  - dma-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@1fe78000 {
+        compatible = "loongson,ls1b-nand-controller";
+        reg = <0x1fe78000 0x24>, <0x1fe78040 0x4>;
+        reg-names = "nand", "nand-dma";
+        dmas = <&dma 0>;
+        dma-names = "rxtx";
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            label = "ls1x-nand";
+            nand-use-soft-ecc-engine;
+            nand-ecc-algo = "hamming";
+        };
+    };

-- 
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
