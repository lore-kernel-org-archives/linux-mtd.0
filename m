Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FFDD2ECFD
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 01:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1XWDP8eiZOgmZHyQEEYt0r4OK1WWmyFUn6p3u8m/EKU=; b=Oe31qCMpBC3EV/
	65TWvn/6a5gGJFupWbOMoAHuxxBSOUH4nXJy0nFDYnBQ9/ZcE8x3QXzQStG9mMKqUBTkSSCBsFIjT
	leg+iXghlhILQncZd/+0Esp8ut9rPPj8Ef+Mf6IAQ6SPPPV7C/hFEUBH38iDQPHC4rD67Z3MiSMVM
	ix+T+uSv1OnhT4/96JNlpWgLUcLeGNLURJ/VPwL9BTvf0y5maKc66DK1xuoIi+z+KhdG46I4bz1rM
	nis5TVCchJRm44O+4mFwgt74dFPXCAksbhhkbc9ImCNn7yy41pl/LHUjXbddWF7NN3lfSBXyLXSch
	DrbehcIzBzuKZl+rB1AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rk-000000033gf-29pv;
	Tue, 20 Jan 2026 01:49:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rg-000000033ej-3OjJ
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 01:49:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 409126015E;
	Tue, 20 Jan 2026 01:49:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDDA8C116C6;
	Tue, 20 Jan 2026 01:49:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768873744;
	bh=bA0IrXZIRAmvLVMEUnj2msq0bjns/r0LlSygkXY7W14=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LFSo0VK8ZQkQyMtOm1Ln4QZX4JoDeHszql1qkilSoA+STW58kTZF81UEbzAp3AXBi
	 y1RwHvZPqb0x0PtyHNOp1yCci/qaCjS3Gyw6iJwI+Fk7gSGewZ56n4xcOttPRNnhIy
	 B/CDuPjUHHwCy20Q9ngdx5nFdy9l2/AI9nMpv/Z7tKPRDTvxhwztSUxitf6aj8+L/u
	 cWCqSU2T7EpgXpt+pGvwE/+rt9eLtLSXbAWZ+jpQOcwiBYme0Q6JtaJUrWhyncGLvX
	 uil7/PcE3BBte/AkLZDb2MX7jhlnJl9T9SGYeHupZKL4QelV1/5UttRn0c8Wj1OJrn
	 iElVqNHSFeAlQ==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:48:28 -0600
Subject: [PATCH v2 07/10] dt-bindings: mtd: Ensure partition node
 properties are documented
MIME-Version: 1.0
Message-Id: <20260119-dt-mtd-partitions-v2-7-77ebb958a312@kernel.org>
References: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
In-Reply-To: <20260119-dt-mtd-partitions-v2-0-77ebb958a312@kernel.org>
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

Partition nodes without a compatible have no restrictions on additional
properties. Fix this by ensuring 'unevaluatedProperties' is set when
there's no compatible property. If there is a compatible property, then
there should be a specific schema for it which will enforce
'unevaluatedProperties'.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml               |  8 ++------
 .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml |  2 +-
 .../devicetree/bindings/mtd/partitions/partition.yaml        | 12 ++++++++++++
 .../mtd/partitions/tplink,safeloader-partitions.yaml         |  2 +-
 Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml |  2 +-
 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml   |  2 +-
 6 files changed, 18 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index e56dba83f00a..5a2d06c96c0d 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -36,12 +36,8 @@ properties:
       - compatible
 
 patternProperties:
-  "@[0-9a-f]+$":
-    $ref: partitions/partition.yaml
-    deprecated: true
-
-  "^partition@[0-9a-f]+":
-    $ref: partitions/partition.yaml
+  "(^partition)?@[0-9a-f]+$":
+    $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
     deprecated: true
 
   "^otp(-[0-9]+)?$":
diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 26bef777353d..4d79f786fcd5 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -33,7 +33,7 @@ properties:
 
 patternProperties:
   "@[0-9a-f]+$":
-    $ref: partition.yaml#
+    $ref: partition.yaml#/$defs/partition-node
 
 required:
   - "#address-cells"
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index fe2f7d622e8b..51fd48af55ec 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -149,6 +149,18 @@ then:
 # This is a generic file other binding inherit from and extend
 additionalProperties: true
 
+$defs:
+  partition-node:
+    type: object
+    if:
+      not:
+        required: [ compatible ]
+    then:
+      $ref: '#'
+      unevaluatedProperties: false
+    else:
+      $ref: '#'
+
 examples:
   - |
     partitions {
diff --git a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
index a24bbaac3a90..40e6eaab03ce 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/tplink,safeloader-partitions.yaml
@@ -38,7 +38,7 @@ properties:
 
 patternProperties:
   "^partition-.*$":
-    $ref: partition.yaml#
+    $ref: partition.yaml#/$defs/partition-node
 
 required:
   - partitions-table-offset
diff --git a/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml b/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml
index 327fa872c001..d51bdcb7e585 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/u-boot.yaml
@@ -29,7 +29,7 @@ properties:
 
 patternProperties:
   "^partition-.*$":
-    $ref: partition.yaml#
+    $ref: partition.yaml#/$defs/partition-node
 
 unevaluatedProperties: false
 
diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
index 7d3ace4f5505..8db991dee7eb 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
@@ -36,7 +36,7 @@ properties:
 
 patternProperties:
   "@[0-9a-f]+$":
-    $ref: /schemas/mtd/partitions/partition.yaml
+    $ref: /schemas/mtd/partitions/partition.yaml#/$defs/partition-node
 
 allOf:
   - $ref: /schemas/memory-controllers/ti,gpmc-child.yaml

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
