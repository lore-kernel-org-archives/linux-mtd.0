Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F51EC3DA4A
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Aug 2024 11:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wu9O7nm9fD1ELiWtNSDqItMsK0AEl+8Hzqb/pgXgxHU=; b=vyRy/WpP2Dj9lu
	Kk7tv+FxNSq+u1huPIh2qBpstRPzOgHwkaz7PBKrnnJRqsXrNiO+ke4bKiQEfw6LSC4ytoAUptCD5
	EsIOf3gSKQ8eKca7tz66B5qk+vlTBqpH8yVsmkQT589Hve7NpLst+XlVsyk1lAEldG/1FSEX5l2MX
	zJLbXX60bDZVEJweDWpdr9EMZimY3t/cRYlm/6c8Gn9kH3kTab6aNZiekVmWfEv22FezG+GcIKlSc
	jAwOvBbohl0MGG5XRQEMTqDLD8vsMYUCzKXiwIB7iqOD1wp4WcRDbL6nu8yaK+YAtxXtDbQAjnt85
	0n/y4H2C1o3aP/rEZnyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1E8-0000000835I-4Azn;
	Thu, 08 Aug 2024 11:22:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sc1E4-0000000833v-0jR8
	for linux-mtd@lists.infradead.org;
	Thu, 08 Aug 2024 11:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EC8B261531;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 98E8DC4AF0C;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723116154;
	bh=CDwKJA/uu3OGplk5NSlMNfEYskSGArcrLLejB20802Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=d6HVMPmPl5YpwTkTRg0qC2D5PrrdY8Zd9fIQlI0NcI0KNT+tBC45MXMqatnpFbTWJ
	 8hAaoT6bjlSrXTx2zDx4lA4PBPDn93ScaJaDR+Vtp3fQ98mOq9XA2d//PB+fUerutK
	 dmasIPTe2qtTR5npE23F9WLkYqbZhTDh9wnES7tQdC9re4UO3UhM+zHt87mhrnTF7I
	 gq51cYtgV/KNWFpEkXBqhA9a6FOaGXVI77AW6/Dwkn42t6w4K8NZlu9VMb1gmXb2z9
	 3qMldQvmvZ+L3ej8eTYOSX10cSZvz8GxwxZTzNsJ3qZYNE0OWEOhYsDUMQjUeFrfDP
	 MVMJCP74EFSGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882CDC52D6F;
	Thu,  8 Aug 2024 11:22:34 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Thu, 08 Aug 2024 19:22:19 +0800
Subject: [PATCH v8 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
MIME-Version: 1.0
Message-Id: <20240808-loongson1-nand-v8-1-c96dea418b41@gmail.com>
References: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
In-Reply-To: <20240808-loongson1-nand-v8-0-c96dea418b41@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-media@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1723116152; l=2566;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=Vtn3xAEQPno1t8MbB7sh3XS5+5h43vqaMfiWPSo6hUU=;
 b=vCA1lIZ+DiRFPepmmjKvfvp2cOUqgqgCl1GQc4ljZ4dt3k26znwBASox7rClwJo+7/8hzCnZl
 uE+FsN5lYygC983w0LplFRWOd0Jf+CkXoCLny1CziXCfdFKd74+YvYL
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_042236_394174_565954FC 
X-CRM114-Status: GOOD (  13.64  )
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
 .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
new file mode 100644
index 000000000000..7ce335324a29
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/loongson,ls1b-nfc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Loongson-1 NAND Controller
+
+maintainers:
+  - Keguang Zhang <keguang.zhang@gmail.com>
+
+description: |
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
+          - loongson,ls1b-nfc
+          - loongson,ls1c-nfc
+      - items:
+          - enum:
+              - loongson,ls1a-nfc
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
+        compatible = "loongson,ls1b-nfc";
+        reg = <0x1fe78000 0x40>;
+        #address-cells = <1>;
+        #size-cells = <0>;
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
2.43.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
