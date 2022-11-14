Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B3FC43219
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4EEqeLb3UF/I0pryn5/sx8V6wtnKn8NMzLgWXu+OOKc=; b=VO/d6X1XSf9snc
	knU4DDN9Qp5mOZ3livv454aNW3FAgmv9jFl8plFJ6U6bkJLAAUf3y/aC/HoWQJrXwyoge13mWdzYx
	hyiu0Td/A+JXIcK56KOnjdjweeRhmTI+whfRUyWzYhJZGvlbBAJwWJcGy+68KZf/S8Bd4s6oZuZS7
	6aurhckydY5SsW4pu0i0omvWoe3PFfo7Qmds8XIz013w8Z1QkcGppneD/F8p8ShNeS50QeqVwXRq2
	/dP6/8uNyptaqUBye9YkfLVKdcnI0cX5y0//0LV4SIZ0BQK0zp9xe1Iah7ooIZxsVFXcGsvVNdfmA
	MWrNxPqWWrNnrcODfAdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVO4-00H2IB-7G; Mon, 14 Nov 2022 09:04:16 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNC-00H1n1-Aw
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:25 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 7E557FF80F;
	Mon, 14 Nov 2022 09:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416600;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuBIlMKCZZIuUuj5REra2VmiQWnswPU4OmSCifTO9M0=;
	b=OwkgcgfymZPogF7Sg5bekGuc6M86gRrTodsVWU1fvBH43cK9P/rZ+SigCoZt65MP4v4xLX
	/nl+ooXqfGRb4ZsGjdEaZVA0C3UpBZHif1G4mIFRQl9WajX7g+A5XManeA95+sfwki6Abu
	sJOB/ijxtZ2TPqHPmsHJ1F+r0ixXxlx1q0QndSe1Izczop6Rk4tfuHFx0Mjat6F7s7NhiO
	xOorKDNKYCNMQpZQQBc5ky7teyQvtLrsRNQK0pp0G7cus03SNr7TiphU9MibQ+MiKCx16l
	/RkSXquGK9DJeJv/mDGxnLyLhhtYvm/x3A2gm60xH5X/9eIWxc9l76qOJdKRLg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	<linux-kernel@vger.kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 01/17] dt-bindings: mtd: Clarify all partition subnodes
Date: Mon, 14 Nov 2022 10:02:59 +0100
Message-Id: <20221114090315.848208-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010322_671249_47DD0495 
X-CRM114-Status: GOOD (  13.11  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
