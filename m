Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC027C19F32
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Mar 2025 11:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AS3O4zQGggs2RV1oyqQzMl6VwAgNnzlcwVixhhy1+2A=; b=lDuUN5Fgo9lTwg
	KQfT1inCTEckz6X61830SuoKcRSvHl7HUi33XxL4pN0x45FgDfE7Iq/kHXKAIJzg/235qO8qfyNUu
	oOvd8TMcfjd/TaRyCxTvkjMuVBwkpUC3z7sb35QJz6AKNFjgBUcF854M1+3YJqntXzvytcpfm5SMY
	o5KhUkPOkvOfkV0Xlf5FJBLl03oNvcx8zT34WvvPrB0AxL7wTERVYaXmTiFaGp/DBubadXMoYcNDl
	KAvuOGG+7HuJco+dKUsznMUmxx91PPXFuOPspQtOOCFZbUbzijZGVNDwhSLopzxVaEWFvL8Mev3/q
	sFEI7J7nbC9wcVrzpCng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnJ8-00000007vAM-1kCz;
	Wed, 05 Mar 2025 11:53:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmYr-00000007nMH-13lN
	for linux-mtd@lists.infradead.org;
	Wed, 05 Mar 2025 11:05:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7310B5C4B58;
	Wed,  5 Mar 2025 11:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E63F0C4CEE9;
	Wed,  5 Mar 2025 11:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741172712;
	bh=Wn+HkeuykAgkMxuLx9Wzsoz+97Luiz91NvrSXcwMjaw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qBVkWa+TLzXxlfX4DDUSH4nq9ONz+wRBPrDRFEtsnC1JtdrbntnlD4+5zDdn+TpNf
	 8XdkHi05I4IgJkNEj6GiNjPFidGSTd5Sq3z3rihU24JnouQmUBxJWaGjrh14fGzQf1
	 J5GnDnUEe2TPnshIO2fIE80llYIBnpnNjRHFHNMX0MZyqtqQbYInzCiM3PTNwIKRI0
	 RyU/qkoI0All4z17Lk6T6bagQKh8e3BpQHquXg4kIfiQYhNimWOAgjr5PhMqDdolzF
	 VQelBSkQOIxgER1EqNwnCoAxifC79sK0v1FFlFVxuznTP4KXexU6MfYcBNM4ig51pq
	 vuZE5MlthWNmw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4081C19F32;
	Wed,  5 Mar 2025 11:05:11 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Wed, 05 Mar 2025 19:05:04 +0800
Subject: [PATCH v13 1/2] dt-bindings: mtd: Add Loongson-1 NAND Controller
MIME-Version: 1.0
Message-Id: <20250305-loongson1-nand-v13-1-a5bac21631cd@gmail.com>
References: <20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com>
In-Reply-To: <20250305-loongson1-nand-v13-0-a5bac21631cd@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-mips@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741172709; l=3113;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=EoSyInd/tPhcSSV/G9oyENpJ97B1jinURWqxESSsYu4=;
 b=nlQ8VE3UGDfj1uy6AWCHyUafsaGiIs4oXzhdyhTBrg+wQYX2jV1K0eIlDZPkAWQkMLHQxDUHk
 W+LvJ9mUJBCDEXmySc3RVeyMrLqbFeE2DkCNJ0D++RyyXAFYMPBjTAp
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_030513_431319_37BAFA02 
X-CRM114-Status: GOOD (  14.88  )
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
Changes in v13:
- None

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
