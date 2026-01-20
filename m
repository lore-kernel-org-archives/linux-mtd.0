Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0B6D2ECFE
	for <linux-mtd@archiver.kernel.org>; Tue, 20 Jan 2026 01:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3dIzutW6BMdNT6+JcENJ/ivNciV6wlGH9qt6fmQcxbw=; b=CoKiWPqaeR+acl
	fnYCK2IGLr8xZfXETVLkZKzmVQodO9JdliG3XzXCOGUON/F5TrB2W2JxFNFPfViATo3pe4fsxbujY
	Jbd4mwvt5Wz+3mPYEo0XG4R9MO4n0u2MzzUvkw/2eRtEYHvHcGa17ftxV/dhERpvIyJFFcy1Y/yyv
	SldahtjFcEVPgsMlrRE+KxNk2LPCzRdlqmWQTA7qf7WN2JzmqtZA3gYz6LY/zWlJB6tWd4rrejFre
	HkJ82zCheebyLXCxjpcLPtAKlF4EddIHUCVmkWnyRS3f/Yl6l+tBu6LLPRnQiAtqrQU/J3A5sbrBW
	NsqOuf60rzekgQ4aYdWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rj-000000033ei-024e;
	Tue, 20 Jan 2026 01:49:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi0rd-000000033cu-0KhP
	for linux-mtd@lists.infradead.org;
	Tue, 20 Jan 2026 01:49:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1783860156;
	Tue, 20 Jan 2026 01:49:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C38FDC19424;
	Tue, 20 Jan 2026 01:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768873739;
	bh=q5vfvsNNHukkTxi4H/nQ+vW1T6KSyihaVNfG3gXPrN0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I45RNspJXWYKEUnxcSO2lXzj/5Dpg58vxrK9SloidKD84/a91jUkJthgia9PzoW6P
	 1dL6PyCAAYSjVM1I6qSDE+A2crfQRVV7rhOJpnNobv4r8xWVmAI/0RvAoo9LoVHz4s
	 GsQDli82LH6Ag7uP7sZ0QI4UK2PxcFxXoYDW533wXG7PO+Vqc0VAT+tdWcIRNZSWkR
	 bMWRQ7vJdWU8+nlD/RPMgQDYZvBDiiOgXygh+HNGvuPEyqAP5RR05WMw1Sj9SQsYtm
	 lUQym+h0eJzPW6Mlgbr8WPnrURXoYwz2Pyqi/xOdObN8vLhLCGv1ubosh+lkRchRaN
	 7k+m504I1UEVA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Mon, 19 Jan 2026 19:48:24 -0600
Subject: [PATCH v2 03/10] dt-bindings: mtd: partitions: Move
 "sercomm,scpart-id" to partition.yaml
MIME-Version: 1.0
Message-Id: <20260119-dt-mtd-partitions-v2-3-77ebb958a312@kernel.org>
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

Defining child node properties specific to the parent schema doesn't work
unless all the child node properties are known. They aren't known because
any partition can define its own properties. The solution to this is
typically something like spi-peripheral-props.yaml, but that's overkill for
this single property. Just move it to partition.yaml instead.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../devicetree/bindings/mtd/partitions/fixed-partitions.yaml   | 10 ----------
 .../devicetree/bindings/mtd/partitions/partition.yaml          |  9 +++++++++
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
index 73d74c0f5cb7..b504d4376d0b 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/fixed-partitions.yaml
@@ -33,16 +33,6 @@ patternProperties:
   "@[0-9a-f]+$":
     $ref: partition.yaml#
 
-    properties:
-      sercomm,scpart-id:
-        description: Partition id in Sercomm partition map. Mtd parser
-          uses this id to find a record in the partition map containing
-          offset and size of the current partition. The values from
-          partition map overrides partition offset and size defined in
-          reg property of the dts. Frequently these values are the same,
-          but may differ if device has bad eraseblocks on a flash.
-        $ref: /schemas/types.yaml#/definitions/uint32
-
 required:
   - "#address-cells"
   - "#size-cells"
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index 0b989037a005..568fac50f921 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -126,6 +126,15 @@ properties:
       - xz
       - zstd
 
+  sercomm,scpart-id:
+    description: Partition id in Sercomm partition map. Mtd parser
+      uses this id to find a record in the partition map containing
+      offset and size of the current partition. The values from
+      partition map overrides partition offset and size defined in
+      reg property of the dts. Frequently these values are the same,
+      but may differ if device has bad eraseblocks on a flash.
+    $ref: /schemas/types.yaml#/definitions/uint32
+
 if:
   not:
     required: [ reg ]

-- 
2.51.0


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
