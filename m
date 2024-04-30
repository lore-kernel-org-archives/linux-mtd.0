Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F54C10F16
	for <linux-mtd@archiver.kernel.org>; Tue, 30 Apr 2024 11:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=S/eI2SYgMyujYEATbhflq4r1YvSvO0CXe7TvPTH+WyM=; b=hvxQf4R2U9O+3z
	iKZz+6QAjSFEh36YiozsSBgJGDhq8Mf9VfKoAfIUSsuD4A2HgLUTLVwJShYj8sEBDUq/ay3i+Aa2G
	AsrR0VBa/k+vdufmjqeKej17gDA2Sh164dlV3jiFF12jrBYhdOkMV2jS4jfj21mudDR2vcLr6pZ3D
	AByQ2sa4soW2Lj4p1B0G4LMbvBx9FYLfK+QaRLVrv7SOemTnfCiayQ9MnIADU13LJZjHbvRBjyKQ3
	KbrDyVLLB/5wsWn2gR8Wc9ARchqtI0HjNJxTBdZ8kNO6bpjoTCUepDJKYNdzG9SxdsQRi0k5JIlGo
	FeJPmpjUIFejslusuKew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lOd-000000068au-00HK;
	Tue, 30 Apr 2024 11:11:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1lOZ-000000068YH-0KDp
	for linux-mtd@lists.infradead.org;
	Tue, 30 Apr 2024 11:11:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 02E4F6146C;
	Tue, 30 Apr 2024 11:11:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9FF69C4AF18;
	Tue, 30 Apr 2024 11:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714475493;
	bh=2v7bw47Y8yac0BNl8kfbTVNGSFn6BD1G1x5HiyR04yk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DxCGMtmliiMPZwmnrapARnExGI0flvG1XUX7bZf5eucZyez/5PfJd06nSDkxd7BKF
	 z2GN+1anL6VUi0y2Sn0EO3lx1fKyLvLUXViar6a8rAHj/cI2ypIGjdUsRN9/08LOID
	 dwvaK0x7yQpd5yS5OrJ1NCqssT4k7VJbA2mkC+XEHAPyY8TOnWf2aGG+RmDSj+E7eM
	 YGSqUumO+lbjxJBnwAw0n7OHaOEeAtCe9EG6kLqipR5xZnrU63uFDXbC0LqQjCia/V
	 5KWHAACsDZj0jqrAkd+p9mIG+l5RDlLnuq/86jm+T1jiyOnVaFpPD/0GL1b1mVaIgu
	 u6C3MwZalUzAw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EBC7C19F53;
	Tue, 30 Apr 2024 11:11:33 +0000 (UTC)
From: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>
Date: Tue, 30 Apr 2024 19:11:10 +0800
Subject: [PATCH v7 1/3] dt-bindings: mtd: Add Loongson-1 NAND Controller
MIME-Version: 1.0
Message-Id: <20240430-loongson1-nand-v7-1-60787c314fa4@gmail.com>
References: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
In-Reply-To: <20240430-loongson1-nand-v7-0-60787c314fa4@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mips@vger.kernel.org, devicetree@vger.kernel.org, 
 Keguang Zhang <keguang.zhang@gmail.com>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714475491; l=1981;
 i=keguang.zhang@gmail.com; s=20231129; h=from:subject:message-id;
 bh=051ksmvBr0UxivFTnhR9mHkGLTvP/HWsibHv4Ii5zR4=;
 b=NWQWxMYBcUQhSr4sUNOhXWIGbWl7BRPCIJSTrLjZgsIWxIHm3C9M+lhuZdk/KQNJpnjN3ND9V
 SRKmhBxJgE8ATTyAVc/nwE9e/VrZByAA7jsUZAdTZ+9zynIXp2rjo5v
X-Developer-Key: i=keguang.zhang@gmail.com; a=ed25519;
 pk=FMKGj/JgKll/MgClpNZ3frIIogsh5e5r8CeW2mr+WLs=
X-Endpoint-Received: by B4 Relay for keguang.zhang@gmail.com/20231129 with
 auth_id=102
X-Original-From: Keguang Zhang <keguang.zhang@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_041135_401009_CFDB9BDE 
X-CRM114-Status: GOOD (  11.27  )
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
Changes in v7:
- rename the file to loongson,ls1b-nfc.yaml

Changes in v6:
- A newly added patch
---
 .../devicetree/bindings/mtd/loongson,ls1b-nfc.yaml | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
new file mode 100644
index 000000000000..a69f22b9fd9e
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/loongson,ls1b-nfc.yaml
@@ -0,0 +1,66 @@
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
