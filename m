Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3129DFA3741
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rzbs3KP2wmt6TsvGU4d0ILuZGgum+SZMREYHC7WTchw=; b=PkD3ycBgS2K4L1
	axSP0Ef7qs40a86nAzM9tK6sIp0+wI9rpxtEk2nBHh+tEa8gm4J9F8x2lxIzxcxWdluhJgUxwJgcR
	4WiAXvpPN6F1hCLoVxvva5JAsd6+3Msr+OQutcnnpOGPpYz4isYxc1vvVMP+xJGfD6oQvD/+Ld4T9
	dm74EWltFeBPPgPvQxf4PzRGqyNTHlU4Ch4jgU2GlAy0okVwB8yB2WhSQUi0BuFoCtRtNoDHJpWyR
	xpe/92y0UQFz/ySX8XbbdaOenwNb9lpnMyALcdwDBSXpmhlJ2PvWk/8iuwAPkCS0KkswUSUFgRPSW
	gj+TQm6H1cxeQin3CVnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZMf-003NFh-MI; Sat, 29 Oct 2022 00:06:17 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGY-003Jml-Ec; Fri, 28 Oct 2022 23:59:59 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 5F1A3FF80D;
	Fri, 28 Oct 2022 23:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001596;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GhGJmrY4S5pbiS6htFjWyxWRV0tdapQgnC4CUqJRsQo=;
	b=PNMSPnI4t/ryFKEpCNgXTzVy7OIt9eNS0evQ1YaVNmJ8o0Y3c3L5S4+A9PJwuRIFefelQH
	4Faz2YOqKHGSKuffbs7W0GwrLT19pHDnMbXhru01g002LGbkuXUgNjZSuzth+QmTl/x+A8
	dOF1kJ5FN5QejwiSxScbrfPt0wv/wpP7/OC4+1qUm7aLQiUUOpsH9K6wtWAkotS4RdJUpl
	BNRl3LiefgYbWdquq7ClV5LCTUdOGmBFjWqhHjESLWp78k6OCSkVhEz0EKbJQLTJNDiZTs
	uWB3+srf9ilFns8Y+Dz4FIw7WOtz7Qo8AbyFmL3FTY+1chToopWLKgJNDN3Yvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <Tudor.Ambarus@microchip.com>,
	Pratyush Yadav <p.yadav@ti.com>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>,
	Naga Sureshkumar Relli <nagasure@xilinx.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Sureshkumar Relli <naga.sureshkumar.relli@xilinx.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH 11/12] dt-bindings: mtd: Argue in favor of keeping additionalProperties set to true
Date: Sat, 29 Oct 2022 01:59:32 +0200
Message-Id: <20221028235933.934850-12-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165958_640756_8912F53F 
X-CRM114-Status: GOOD (  10.06  )
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

In most cases we try to avoidit but in some cases this is
needed. Clarify why by adding a small comment.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml                  | 1 +
 Documentation/devicetree/bindings/mtd/nand-chip.yaml            | 1 +
 Documentation/devicetree/bindings/mtd/partitions/partition.yaml | 1 +
 3 files changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 64714fc8c852..bddb7bdf441b 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -61,6 +61,7 @@ patternProperties:
     required:
       - compatible
 
+# This is a generic file other binding inherit from
 additionalProperties: true
 
 examples:
diff --git a/Documentation/devicetree/bindings/mtd/nand-chip.yaml b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
index 8d5d2d3ef56b..6e2dc025d694 100644
--- a/Documentation/devicetree/bindings/mtd/nand-chip.yaml
+++ b/Documentation/devicetree/bindings/mtd/nand-chip.yaml
@@ -70,4 +70,5 @@ properties:
 required:
   - reg
 
+# This file can be referenced by more specific devices (like spi-nands)
 additionalProperties: true
diff --git a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
index f1a02d840b12..1c97ca0f7f62 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/partition.yaml
@@ -60,4 +60,5 @@ then:
     $nodename:
       pattern: '^partition-.*$'
 
+# This is a generic file other binding inherit from
 additionalProperties: true
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
