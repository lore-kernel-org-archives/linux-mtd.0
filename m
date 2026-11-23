Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD475606A69C
	for <linux-mtd@archiver.kernel.org>; Mon, 23 Nov 2026 18:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iLVkEzJB;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SWOaP3ks
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=p0riUw3JtcDgHtWlb9T92/1nt/MvHt4dTTYz7jVPTYo=; b=iLVkEzJBBiuQByq/jgzrrT7NXd
	L0p1gXCx15LamQ4o4QuIy3wgM78S8eg026BP7iVebTSMVsO/m7R5xXKnoZvll1V3Qi3VjwzUnnGNp
	y0y4Yssa8vsoYvubLAkA1P+jqWFPMjlt0B9kLZKUe5X/AGDSqt67GR0NYWTTN/vga+gKI4feaAPMP
	xvjPE5n8u4R7iWJa8JcOVoBosMVogdxHuB/yLcg+mRFW7tQ0rq+NdQdCweKUUtksZfd3FnWPO8s2v
	Lj2mB/OineoLHu/HoMC5u59qQob7au7c/I+Leek9rmNUCiYULNwjT5rg9sTKNYLpwPbTs2EPRKXgz
	tsFKrPvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzn-00000004WsM-2Dg9;
	Mon, 23 Nov 2026 18:42:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVYzM-00000004WVL-3a5h
	for linux-mtd@lists.infradead.org;
	Mon, 23 Nov 2026 18:42:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 873F745A87;
	Mon, 23 Nov 2026 18:42:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795459324;
	b=fJrmK2GeN2yuulwho1kfru2eoZ4BLCCb//sltEZsO0Ul7cMh3P1J9gniBXOyTOFma/PX
	 Vze8o7c74yCE0SdASnGIXa40S4Cqjf4JOxm1FXw9Upx644NrVl+PzHauHhx0+OvU4iEHe
	 4l5hOFAkG3bRK+DurHbB+XixEhML5Y5yC9MJIE3Pt05//rBDO9UwnifXaA4zI0zS069Vl
	 /cc6WzUHgfl4Jn89Q4Z7CX6TGS40q3RXzkmMg87rnxbWxSxlwTFDX7t4h/5r8v4GZ+TYW
	 7NAwYH2LqAdHEWqOMq2aVALocg5bZaiapqj+FQEz+eRuU5Yy+iEbQcPFwqYQZnLXr3A==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795459324;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	b=0cl4RSoqJ1ZU/m04JL9SYT2KGIEBipjsGpqTLO7LnjhaUDL/Ji6fZUYWJYaJ7HXvpQ7R
	 T5G9ChhzRJ/9agecBq1OC5O/VR+WpHO3IUC9u9lVQ+9cYnj6YQqAyFim5cukuK7S/flzb
	 IZxk+uwwG7ju6ptN5b6o3q1KOz7UWLXxPBJYnAfu0WYbCg+SmpAZvEBNK/WWggzWzgQ7f
	 aiU/gvG2GS6xaMB621EgG3qKZJuamNMWUiPMywA+jHG5Ub/jIbEATH3wkJjM/gGWMEECz
	 LubO6tdMRMKC9NbSjjKczmNB4571mRWXL6Ne47ckd8m8zAq8hbUgAfU5e/g8mxkm29Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id DE1B01F00ADE;
	Mon, 23 Nov 2026 18:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795459324;
	bh=dTY9H4MEUXebkJIxacnGx6ldxYXsTr4Zi+O0m4hM0TQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SWOaP3kso5TwUQnd0EHBj0HxYvBuJQVjiXNBjP6zQCWg0V9d/BECBt0sxO34p+8xB
	 U1ltQxiVyE1o+SXMQBfJDTZyMmimhJOOm02ME8FPc81eQ7uecxlrxVsNW6MGqFTdLs
	 63fn5XeziLZLMaiZtR4FvtQvS5njJnuC47wIvqZmRzXMFywFA15y/txG3+RH3JfQAZ
	 /I5H8Qsl93KTG/jjsXhQ5KzMbiSURvPFRL8DHL5HjbTthiPOgZpJETXRQcKoR01ySe
	 wLxusjdWwHKyzWbv7traI1qVYa6holBvsnjAAV7+QTVpgBxQVb6OP3Tr8W1QJrLebv
	 o9MT1J2JorAMw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id BBAF94C5E1;
	Mon, 23 Nov 2026 18:41:39 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Mon, 23 Nov 2026 21:41:38 +0300
Subject: [PATCH 1/3] dt-bindings: mtd: Add Cortina CS7542 NAND controller
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261123-b4-cs7542-nand-v1-1-7ce179c011e2@gmail.com>
References: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
In-Reply-To: <20261123-b4-cs7542-nand-v1-0-7ce179c011e2@gmail.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795459297; l=2237;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=R4f5+AZ20ZvVDHkrykvH4nwddcpdeFmF1zCSrzBHxh8=;
 b=bfHq8In5jdLo/dunT0UnO+Berlv962onqZZJnPFXMiVqyAFPk+hEUZm0R+b7I2/4SP/E82iWM
 kwSK+k2RImTANU86YaMZ/NEGC2VMQezGEuSDrVfrnttey2FTzaCx63W
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
