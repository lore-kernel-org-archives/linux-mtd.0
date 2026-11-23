Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39163606A321
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 20:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4vapqfmi;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=XaAy7uUz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p0riUw3JtcDgHtWlb9T92/1nt/MvHt4dTTYz7jVPTYo=; b=4vapqfmiAJBUArbYnfytJRbJ7h
	Y2cpaJwXAg67Fz6AiX5WSQFJdEXZlEcOnbQTpMVmcjGQVVt4vg7RQn70itWVv/P2SptT1gmsomW4b
	ac9PLcRXL4NKbsO64y+GURT5ss3/h/4TfOKJphIFaKEMVyCTLmbYVksAliEOEgW0Yke3ACk/pORNo
	jGRgl088ohoo0zEYNaU7P7R9fOXy8Mbuou+ZxDBNFmvvKuLSEcw90R8Mi3gzRWXvgtY6r5WSLlZwv
	nBp4Q+YBC2Bc2wzUFhAn9wxJLtUp/hzFZqX2eHijXuYkTl8/9wfIq14Z0VA7fJhh8NRsP75se29m9
	EqQvlK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVadl-00000004pOK-3Mxh;
	Mon, 23 Nov 2026 20:27:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVadF-00000004p6l-3tNm
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 20:27:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE34E447E3;
	Mon, 23 Nov 2026 20:27:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795465641;
	b=N/WtJ3+jDFmPL2Xv1Ymw+MX6C3BZrsXCt9hIeqRky6U89EUDxful2lKq0SbIPex1cvKx
	 oI7wP3JaRDFUoYq6hsk70IWkpgboozx9uG1meEXWS3aJ86oov6gg0defb4oD+87qzym8p
	 /O286wH+sr/PLmSWlsiePWURJCkHBdd7BCyFxInSh/kQI6cS1u3KFj8sq6bARkw/kGCxA
	 hQDmAn8l2pnNKYhLeDxy4/FZuQqFk2nFTECW/XwbpxpfNurAzjaP/BmFUYO/JfbKl8w31
	 tCplirmLT5vv8m4SpSW85Fk4TVC5WVQX51PRZOUZplKzlZ52lZ/L3vHJnS10l6eldDg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795465641;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=o+tQ6H3ZtBJcv9fbFqMLzNCFXUpIbUmmaPR8TCmHcZ8o7/UJrqPEiy1LXFcH0QzKYlJ0
	 gKyLk0z6H3c8UoFWfQFAYisO0q7tZI0Ze9DrggoNok7k29wwh4QQic90/pqmP+AAXgUvO
	 nbIGeiAAfvSma+H0wYQok7pDKoAmXIGTVEjldFV/JGC8vdkXifK6SAz/iTYREudWH7HeY
	 y5TBU2wu7AyeUL5Xm0XYnWTd2jCCJ5j/wEyNwLbuwcrWVYx3tgrvAS5OLH+4Y7M2gOdpG
	 6mPY3NCQWA714gKe7HWwPJmDzkjU2IMKLTJkVqDcRjOvry1m0mn0B1gLdsgvsRlvQVw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6BD3C1F000ED;
	Mon, 23 Nov 2026 20:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795465641;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=XaAy7uUzzbpI4ikki7YzvhX8QdRN8Bi9LFrhlJ6QdApIRX9VbDp5VPJM3pPn9Kpl0
	 XLpdyi1HDGdgxLb3e/ZATwmL52uSNvDXu9BJ1DNVID9YA3qpXzmZXweg4geHqUrFJ9
	 lddUSI7eFlEycGDZ5fW+Ux55euOkGFOFGZm7vSOys/mXGCJ9lFGgocccGmB7Rw96Yu
	 6skO+p6IOxuTBMZ1wyUyBd9gmarRgmn1MkNCtE7Gw8GqD2nkKP5lYk/87HoHgnSqp/
	 B8FAmh70BSE2+7TfvkNx3Mh3jNP3KPBxHLMkYohhbyTWJ7fJsK7D/SjPCrEivywnVo
	 jBtQMiiZwgaHg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E39374C6F5;
	Mon, 23 Nov 2026 20:27:07 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:27:06 +0300
Subject: [PATCH v2 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND
 controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-b4-cs7542-nand-v2-1-9d9f08608534@gmail.com>
References: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
In-Reply-To: <20261123-b4-cs7542-nand-v2-0-9d9f08608534@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795465626; l=2237;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R4f5+AZ20ZvVDHkrykvH4nwddcpdeFmF1zCSrzBHxh8=;
 b=MWl0A5yPlRfJlo0LUvDGO9aPOnfNyBCmcWGU5JpKVwh5n2EPCrej9vGdQpKT7w4BPtswBp3dD
 s5AvSlY4NLzCEzRiluFT2MOrUC1rrA0Sb01w0fbAGvxqsuUaAwTYLKD
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
X-BeenThere: linux-mtd@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Reply-To: filipp.dunsky@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Fil Dunsky <filipp.dunsky@gmail.com>

Describe the flash register bank and the single 8-bit NAND target used
on CS7542. Specify the ROM-compatible Hamming ECC configuration and
allow standard NAND partition descriptions. Firmware supplies the bus
timing.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 .../bindings/mtd/cortina,cs7542-nand.yaml          | 66 ++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
new file mode 100644
index 000000000..c9ab9d4d9
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/cortina,cs7542-nand.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/cortina,cs7542-nand.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Cortina Systems CS7542 NAND controller
+
+maintainers:
+  - Fil Dunsky <filipp.dunsky@gmail.com>
+
+description:
+  The flash controller supports programmed I/O transfers and a hardware
+  Hamming ECC engine. Firmware initializes the NAND bus timing.
+
+allOf:
+  - $ref: nand-controller.yaml#
+
+properties:
+  compatible:
+    const: cortina,cs7542-nand
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^nand@[0-9a-f]$":
+    type: object
+    $ref: raw-nand-chip.yaml#
+    properties:
+      reg:
+        const: 0
+      nand-bus-width:
+        const: 8
+      nand-ecc-mode:
+        const: hw
+      nand-ecc-algo:
+        const: hamming
+      nand-ecc-step-size:
+        const: 256
+      nand-ecc-strength:
+        const: 1
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    nand-controller@f0050000 {
+        compatible = "cortina,cs7542-nand";
+        reg = <0xf0050000 0x300>;
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        nand@0 {
+            reg = <0>;
+            nand-ecc-mode = "hw";
+            nand-ecc-algo = "hamming";
+            nand-ecc-step-size = <256>;
+            nand-ecc-strength = <1>;
+        };
+    };

-- 
2.53.0



______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
