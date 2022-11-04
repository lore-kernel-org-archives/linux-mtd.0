Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A26B6C433FE
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zP6m2hQVBByO9bPb6x7ibSW63PfbJzRccTl4T378IYM=; b=Fbns65bl1uS9Jn
	9WKkiZ8kXz2aMAnfqEzBFi6V4nchlTsVfLMpxqSVTC8LV96MM4dbDGtDYVAhRjDux9yvQCCzsrJvd
	eIABetD1/0LiKDhIqa18nObk8ZV4iCE/0dkLlRQoQS9uLj53qkCh5v37HclAuyHDmpqUZFa4U4cGp
	QgU7IT871n0Suxo2gtSmoQV6H7CpueHI+9511qgI7OaeYLP7wYCi8ZDW7eNSsfElLgRAWe3vAPlnp
	hDAKsyx0MI9emoKOfPJTtCvzRs10inZRYq2L3BzMuvKRIxGW58UceLN2OT7HhJJ6YLYwZ4zvRn+8I
	5kHgLDL2pn4WNKRcdVaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzr8-004W2y-GX; Fri, 04 Nov 2022 16:47:46 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqn-004Vpr-1n
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 6286A4000A;
	Fri,  4 Nov 2022 16:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580441;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9JEZ1c2lp6KpEcCyVREwYutRhrJJex3PSE0UiYvaYr4=;
	b=Em0KXUoGDMROIrOx9PdU72KhBktqNT1SHNCvhQpHbvfiBKU28pFDzVM9/QGxx8mLC8rEKf
	U6UTIs6mEVebIvcrw9Q66Sdgcd1u1RpCb+qJ4ChoHHZIafC27i39MPLzQkI7C/UKRwQwnn
	HNPyZ+N0XFrZFflHRXRqJh/ZUduxVtW9UHGyy/7JtY9NSsnAroyJFUoP/Awi/zfZEoRScO
	LhcAXvDu3epR5+Or5MJupp8Mdn0SyX2Ynolqno4cyt2sk/eZYwhcgUppPXv3HG2Kv6naqQ
	+1HXxb4q7IhEdZrvAmQBy+FOS7Bo34XKl8jZk9Q/maBxzLTl3t7HvZ1TB842LQ==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 01/17] dt-bindings: mtd: Clarify all partition subnodes
Date: Fri,  4 Nov 2022 17:47:02 +0100
Message-Id: <20221104164718.1290859-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094725_410201_EB1D9F54 
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

Over time the various ways to define MTD partitions has evolved. Most of
the controllers support several different bindings. Let's define all
possible choices in one file and mark the legacy ones deprecated. This
way, we can just reference this file and avoid dupplicating these
definitions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/mtd.yaml          | 17 ++++++++++
 .../bindings/mtd/partitions/partitions.yaml   | 33 +++++++++++++++++++
 2 files changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/partitions.yaml

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 3498e485679b..a6b498bbdbb6 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,7 +21,24 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+  '#address-cells':
+    deprecated: true
+
+  '#size-cells':
+    deprecated: true
+
+  partitions:
+    $ref: /schemas/mtd/partitions/partitions.yaml
+
 patternProperties:
+  "@[0-9a-f]+$":
+    $ref: partitions/partition.yaml
+    deprecated: true
+
+  "^partition@[0-9a-f]+":
+    $ref: partitions/partition.yaml
+    deprecated: true
+
   "^otp(-[0-9]+)?$":
     type: object
     $ref: ../nvmem/nvmem.yaml#
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
new file mode 100644
index 000000000000..ff65795de285
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/partitions.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Partitions
+
+description: |
+  This binding is generic and describes the content of the partitions container
+  node. All partition parsers must be referenced here.
+
+maintainers:
+  - Miquel Raynal <miquel.raynal@bootlin.com>
+
+properties:
+  compatible: true
+
+  '#address-cells':
+    enum: [1, 2]
+
+  '#size-cells':
+    enum: [1, 2]
+
+patternProperties:
+  "partition(-.+|@[0-9a-f]+)":
+    $ref: partition.yaml
+
+required:
+  - compatible
+
+# Temporary value, should be set to false when constraining the parsers list
+additionalProperties: true
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
