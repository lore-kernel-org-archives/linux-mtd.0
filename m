Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30A22C433FE
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:06:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=liPzPQ44i1zPsRdmXd/cP4cUv3SpK8FD7Cesc+BiHMY=; b=MMarKaxY36mwMZ
	X4e8DrqbrKP0i+FoFGrcUuqqvgpBxlNsSBDHEMe+xt2olx0YDdT58ErlE2+aBp7BJbR8hBIJAYR7B
	wzFfC9uUWfH/Kas+GJLl3bn1LifZxp5OVcBU4E4L/UkIrGG2D+nUcrM6IdH5gMI47cBUfWfIQFnOQ
	juxtvEZFth0vBjIA/Xnw7DaqCNQ+UnmpfqEI0R9ncaNi+5jTUqL0B0HXsoox5PUJbNp26ByChxQAG
	m2M4Y71HhN3HeOE3SYN4cPUIZE+Oa/kJ7KHDavEzBz4NzbO0vvINqL0b0ANyAOm03/c40FNwjd2QG
	BtYwFEJdyBlTCQ/yUNEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVPv-00H3go-PJ; Mon, 14 Nov 2022 09:06:11 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNc-00H21g-2I
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:49 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 089E8FF814;
	Mon, 14 Nov 2022 09:03:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9dJEc1+k308koWh3qlEAPGOXzHpFninitXpbK03A4Gs=;
	b=L+e4cEYFuSXg05G3UhHC4xTMcufckNXW9ulOWm+MzLx3GWuEoahJNEXOPvO4xl6kIObLXD
	OLTGhK/1l8TRH6kfM+iinGQXrjsw8jvH3uV6SBEOL4xOrQEHjjyS/3Em7XLzox5YTwdXDB
	Fv0oUQxIgRYdZdQdEsSbsWByVu7l9KIcck7yYaQxPHA4yEMDX0B00RVwZvqO12Juvdqc84
	8ipDDdQ+IaEGkjEJJOFi0EffoilgbLpMqZ4f0CA8eQkFux7JweJvrS2XGoEtr2mqjjibb9
	l/oxzv5p/6UTuV6j7xd28C+UfPonkm4OJ3wqs1Ih0hpQsZcXwnaX9aS0pcdRUw==
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
Subject: [PATCH v3 10/17] dt-bindings: mtd: physmap: Reuse the generic definitions
Date: Mon, 14 Nov 2022 10:03:08 +0100
Message-Id: <20221114090315.848208-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010348_280358_2E60D3DB 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

The memory mapped MTD devices also share a lot with all the other MTD
devices, so let's share the properties by referencing mtd.yaml. We can
then drop mentioning the properties, to the cost of mentioning the
possible "sram" node name prefix.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mtd-physmap.yaml     | 7 +++----
 Documentation/devicetree/bindings/mtd/mtd.yaml             | 2 +-
 Documentation/devicetree/bindings/mtd/nand-controller.yaml | 1 -
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
index 82eb4e0f453b..5df94953c34e 100644
--- a/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd-physmap.yaml
@@ -13,6 +13,9 @@ description: |
   Flash chips (Memory Technology Devices) are often used for solid state
   file systems on embedded devices.
 
+allOf:
+  - $ref: "mtd.yaml#"
+
 properties:
   compatible:
     oneOf:
@@ -121,10 +124,6 @@ properties:
   big-endian: true
   little-endian: true
 
-patternProperties:
-  '@[0-9a-f]+$':
-    $ref: partitions/partition.yaml
-
 required:
   - compatible
   - reg
diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index a6b498bbdbb6..2fbd0a2ff548 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -12,7 +12,7 @@ maintainers:
 
 properties:
   $nodename:
-    pattern: "^flash(@.*)?$"
+    pattern: "^(flash|.*sram)(@.*)?$"
 
   label:
     description:
diff --git a/Documentation/devicetree/bindings/mtd/nand-controller.yaml b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
index 359a015d4e5a..3f2a1480e1eb 100644
--- a/Documentation/devicetree/bindings/mtd/nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-controller.yaml
@@ -51,7 +51,6 @@ properties:
 
 patternProperties:
   "^nand@[a-f0-9]$":
-    type: object
     $ref: "nand-chip.yaml#"
 
     properties:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
