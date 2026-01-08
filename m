Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 496C7D1D487
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rUaZ/3CCaXO9nXPHXU6sq7nHNdYKuwcI/p9kfi+DnlI=; b=ENxb0c+WeftAfB
	3A80HfNP5VhtNHfjmqdANRcHONH5QBxpXlnslApWB2gOrj9seBgO0ealHDqe/XOM/wD0uSI76DdpT
	w0qEZ8+LFgf3/d7WX8qld/ptei72pfq5i5WBNaXzSwktlR+JE2Njpi3ygdNnlawUpDDQQI0UzdZFF
	G0oTx8BPNYnhtSwL3Y18PtuxH+9Ly3KjMDiyMIrsSHkB2Hd3AGEF7u6eEpIIgNtFP7zboxs0wvrjv
	/PDY3oJJTWlohC4w/uOf4MeVujwxjSLmAqP6MEqGuP1xAbyX4BqRjDwG2eGSOsGKnCwdN/WLlSJo0
	q2SWXAn7BHmNBq6hgsiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCh-00000000Vhf-3r2A;
	Thu, 08 Jan 2026 17:53:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCe-00000000Vcm-00k0
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:53:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3E06D441F2;
	Thu,  8 Jan 2026 17:53:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01464C19422;
	Thu,  8 Jan 2026 17:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894823;
	bh=NybYYQFhDpQHAUmXrGSSV36BPz67jaqMd9fSLCbvpN8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ei0wKvGePo3aTIWYuDO2bK2KKW2iFfn3CaBTvXVzfCr3NDQyqMkH8GzPxg31Xw+1q
	 RAUE+l8TmuvWNDwLojUwGtKynHCBp37M7siBiwLBA90LObzQGRzn5eBoYvwISLgA04
	 zqLl7YAX/6Mn6Lidm7lJhDofrU0J65a05DcMl9RPwuA/cE3Xfd/VCkmTyaK2gMq4Rv
	 43W0oopf1UuoR2G/YLFg1PL9e7g8+k5Hh83ACmQ1FFuvywAYeyPXNhLXBO6yAfbTbz
	 tplYapwuY8+d2QIuf/JKPY2cnWGoT84A0AZ4EU7YyIEwEbRvXVy8cmVIiZhWOhA6Vd
	 /NWR2wyRf6iZw==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 08 Jan 2026 11:53:14 -0600
Subject: [PATCH 05/10] dt-bindings: mtd: partitions: Define
 "#{address,size}-cells" in specific schemas
MIME-Version: 1.0
Message-Id: <20260108-dt-mtd-partitions-v1-5-124a53ce6279@kernel.org>
References: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
In-Reply-To: <20260108-dt-mtd-partitions-v1-0-124a53ce6279@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>, 
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Brian Norris <computersforpeace@gmail.com>, 
 Kamal Dasu <kdasu.kdev@gmail.com>, 
 William Zhang <william.zhang@broadcom.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, 
 =?utf-8?q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>, 
 Simon Glass <sjg@chromium.org>, Linus Walleij <linusw@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Marcus Folkesson <marcus.folkesson@gmail.com>, 
 Tony Lindgren <tony@atomide.com>, Roger Quadros <rogerq@kernel.org>, 
 Hauke Mehrtens <hauke@hauke-m.de>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_095345_385397_20ED41AD 
X-CRM114-Status: GOOD (  10.50  )
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

Whether "#address-cells" and "#size-cells" are used or not depends on
the specific partition type, so drop them from partitions.yaml and
define them in the specific partition schemas as needed.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml        | 6 ++++--
 Documentation/devicetree/bindings/mtd/partitions/partitions.yaml    | 6 ------
 Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml   | 4 ----
 3 files changed, 4 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index b504d4376d0b..26bef777353d 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -25,9 +25,11 @@ properties:
           - const: sercomm,sc-partitions
           - const: fixed-partitions
 
-  "#address-cells": true
+  "#address-cells":
+    enum: [ 1, 2 ]
 
-  "#size-cells": true
+  "#size-cells":
+    enum: [ 1, 2 ]
 
 patternProperties:
   "@[0-9a-f]+$":
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
index 1dda2c80747b..76199506d690 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partitions.yaml
@@ -26,12 +26,6 @@ oneOf:
 properties:
   compatible: true
 
-  '#address-cells':
-    enum: [1, 2]
-
-  '#size-cells':
-    enum: [1, 2]
-
 patternProperties:
   "^partition(-.+|@[0-9a-f]+)$":
     $ref: partition.yaml
diff --git a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
index e3978d2bc056..dc6421150c84 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/redboot-fis.yaml
@@ -28,10 +28,6 @@ properties:
       device. On a flash memory with 32KB eraseblocks, 0 means the first
       eraseblock at 0x00000000, 1 means the second eraseblock at 0x00008000 and so on.
 
-  '#address-cells': false
-
-  '#size-cells': false
-
 required:
   - compatible
   - fis-index-block

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
