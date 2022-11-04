Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30F64C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:48:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FE0s8eD7KqKNNHuA7v5XtjjWcPMGh4JQxS3Chu+1DjI=; b=3vetKWOtM1tlii
	m2Hy5UtbzgE3fDAMp8qzbBHgs/254L1tTtm76oy0xvzE+liZhmg/FHqsE7Oo+MNRmV49trOEKL6+7
	G/SUQzNoXT8HWRv45cSKypEoN/eWTDYeYShpid+kFajcpwBqWW48qpNZCSybED3dVxhu1Lu9qRIc/
	CyV5SE+tYzK+xv8Hm+QLzs6k0mDnSnH24zAe1NKnPfrW3ejo4B4IQD5h9eJWsrVOLdScdery+tAGe
	kLVoFG1mEmrbres29bfFswukB+OSNjinCKK8EMV5q93UdYaJCmWZCfYdNtEGudGHt+B7xqaLiJCTk
	n1YMjrAlTbQb5d8e5PqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzrs-004Waq-Gq; Fri, 04 Nov 2022 16:48:33 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqu-004Vv9-RU
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9DC7440004;
	Fri,  4 Nov 2022 16:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580451;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tjavzH+cgvyVn10sIb3TajzzynkuJ4IjBmZ/bGLtnUI=;
	b=OEYTCO5+4f36WFPpc931MekHiJo1gUYCq+KWG53vJbjkgQGYJG/FLJU2nn6v3KueuYtvP5
	Xu70MwSLsenRIdoI+yZQvNwdAjNoo0PY5RuzBR5fet+XGITeAYsvMMlZS89wmO03SZDJuV
	iQC0EoBDG+Q2XEt5I6QpneA22c/26gihS0xO+cceDd+QJtB1I+4TiU8ZZjEBNYCstJo2HH
	X9YpT1MTaiC4QV2ZvbKhXAIiAXn00+vZtVBX5UIxyl7FjabYesVRvyJOMwTGWgfPZbtPQw
	oBfGZS/czSyRKVeWVNEvbAQXQSN5zfvl9LFUCb4zHVphaLIOSsXI0hXLmtMrjw==
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
Subject: [PATCH v2 10/17] dt-bindings: mtd: physmap: Reuse the generic definitions
Date: Fri,  4 Nov 2022 17:47:11 +0100
Message-Id: <20221104164718.1290859-11-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094733_217190_398B6A69 
X-CRM114-Status: UNSURE (   9.91  )
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
