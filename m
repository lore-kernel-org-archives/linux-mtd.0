Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB1BC44506
	for <linux-mtd@archiver.kernel.org>; Wed, 21 Jan 2026 19:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sTSeYlvwVpBETHJxGR95qU3xVFQiz14HUO5FsiGqq9k=; b=a0yJ9cz7y3JYcK
	Fo4hEPwyGTRvQ+AfJPa0MgJX4rPI88ZZHf3n6t2msF55ASPxY5i3Ebzs6hZC6Xyd+Nu8zgL9ob9iS
	05HKfxnjRtr8hqveYp1TucsCfe8PGZLBDJAxatPvRSuCriQrF58RJUNLbiQvoUFepTIoQVdCyUuOD
	g7913dXIsME59rrOP35Ad7GNgUamqOXeWEdvyEMt+sHU4t+I5QW6OGOnGpR4ImK6N/DVhAa2Exj9C
	Gh20DV8d6Y3p/cJE859ec0tlqgOQN/E8tUf1PhvLNsM+2QUnEv6vZaTAq6m4VgCyzwVAQXy1yBQY1
	KIISwCrlJwF22njmnZsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK9-00000005zjy-1iRG;
	Wed, 21 Jan 2026 19:57:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vieK5-00000005zgp-3La2
	for linux-mtd@lists.infradead.org;
	Wed, 21 Jan 2026 19:57:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 20FC2408FA;
	Wed, 21 Jan 2026 19:57:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9A5EC19424;
	Wed, 21 Jan 2026 19:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769025421;
	bh=lNztnI4QcVHyFig2NE9Jca79n6y7e/q4hG9Afn4a2J8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=c2c7upRnt8HsVzca0u4hvucw45+nRTSBGjjsZDsvurEJ2eVuXjB02zP0M2Q22KLAv
	 wTabPm4JWD8j2Y2i1uH2EGoOdvkrZFlFg8MFgD04SwWt5QeCSvtrHZrOSDvOAaBtmk
	 VsnZwUQekO+4dpbHUvaGV2XrMFG1BUyeM3S9haVpjtgIV4W6rXuErAbhcn6MNuKAWG
	 g+UggfSlaq4WURxyVBUWwrcrhizLzdQwc0O8rkQj9vyH+B3tPy8jQjNcWyQsY9ns4P
	 pDGCElumR75VnrbbMeE5fi5K6L3qTEn2fuFBAtjS3BLKSnMxjuOHbrktzlBYt1iEMp
	 EOcXhMPxauSIQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 21 Jan 2026 13:56:38 -0600
Subject: [PATCH v3 05/10] dt-bindings: mtd: partitions: Define
 "#{address,size}-cells" in specific schemas
MIME-Version: 1.0
Message-Id: <20260121-dt-mtd-partitions-v3-5-ec3af93c8f93@kernel.org>
References: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
In-Reply-To: <20260121-dt-mtd-partitions-v3-0-ec3af93c8f93@kernel.org>
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
 linux-kernel@vger.kernel.org, linux-mmc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_115701_888248_D36152F5 
X-CRM114-Status: GOOD (  10.92  )
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

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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
index ba7445cd69e8..ba627f51840b 100644
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
