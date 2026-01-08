Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A774DD1D484
	for <linux-mtd@archiver.kernel.org>; Thu,  8 Jan 2026 17:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zxfnvyB0AmOUuuGra6ghAKO5SB6yPSUGoAmOzYfCHV8=; b=x2tdNoogWAlCn1
	rK+aB86u3gbIoKpmyT3iMQp/SRGIJ9MdqKqSqMjC+GQMscsIqHP7nM7c0skhb2GkBAnfj533ZQ2yq
	7rVcLmNYA1C+2oQgLPeD+kT9m5kFmyUXpzSJnEvD84SHDQsPA4Iv9ffIM/SSru0fuee6q904P/ha7
	WHNwchf1ngC7NsC7XwtKwfv2dIG7bwrVaZelg64RwdXQEdGdxTh+rELUVmUBqI9hOn9KpjZyx0jv8
	iRY9IIweIbRnodqiKpE/iSAVoIKcURe20F7za4XyuLKHU3pij1FRrdIvDTq8ppuLEkBsJokJqIMJ5
	qpFSjlSmDyEDd9YXNANQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCg-00000000Vet-0cij;
	Thu, 08 Jan 2026 17:53:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vduCb-00000000VbJ-2IZ3
	for linux-mtd@lists.infradead.org;
	Thu, 08 Jan 2026 17:53:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 45F24437C3;
	Thu,  8 Jan 2026 17:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07825C116D0;
	Thu,  8 Jan 2026 17:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767894821;
	bh=7wM7gQcNfjkcg4zQKx49cijiPbPUBHfJqKOeqY2x18c=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cpPynkNdNk9kmyZBTLJRY0+fMNizKS18LJcui3iEe/XzVFHSL8vkGv1QiGbvIZvOo
	 IY9Na9oND6GtKTHaTIfvD4banc3R6rYrxUimBOSn7VeN0ky93N07Z9Ekpy5cE4wOsi
	 JI+mNxdUilA37dnlJN5C8tPNjVJBOe+NXEXjfx6VPh2IVdtHLAIjB0OPMaruzEoAXB
	 eyMNjJv6IJNImtpZo2IOlv1haM/H87rreGBZr3m4z6Z6hul7vyR0ujZKFUKckcZiR8
	 aIqSmi42+u0d/NVpJTvvEVxdAKuSpjVeEZtVzgoshNVWqITYhSNF0HP6ademptTLxg
	 UoNnQNwApCayA==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Thu, 08 Jan 2026 11:53:12 -0600
Subject: [PATCH 03/10] dt-bindings: mtd: partitions: Move
 "sercomm,scpart-id" to partition.yaml
MIME-Version: 1.0
Message-Id: <20260108-dt-mtd-partitions-v1-3-124a53ce6279@kernel.org>
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
X-CRM114-CacheID: sfid-20260108_095341_653190_D5C4DC93 
X-CRM114-Status: GOOD (  13.53  )
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
