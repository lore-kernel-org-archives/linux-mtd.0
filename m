Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF462C38A02
	for <linux-mtd@archiver.kernel.org>; Sat, 29 Oct 2022 00:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7NBER17SfIW89zj/t4/nj49yVmiPJFbQ9B7sAtiA1N0=; b=ZvmudTpNAFPq63
	C6+Du0A9Fh/MacvqOc9huP9kksuwAF94glu/2MTyBUSwmXtufnIvM+BjgJf2HLP8WCmhP7wxBG73O
	XaWsJeHbqR+TwPzx807zd//nGLOEeGtOHcZBAf1CQznpaGMGsk6GJuvo452Rww0TEaLvb+DEeHd9R
	vDOuOZIsmpd/g207Q8yts7TjMWcBxLcZeK4y16SKqsA/y0+hwvxfTwF0ysCG+Js8nTG8E2qjfL853
	1FyrAIFAlpy+I7Q8Y5pRehW2KMs7CcBekAvontrDxD5c0jaNpck+zyQePI8UmZC4GlYShXo9cGXIT
	kU5HraizQ8RTUKsHSVqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGi-003Jpe-I5; Sat, 29 Oct 2022 00:00:08 +0000
Received: from relay9-d.mail.gandi.net ([217.70.183.199])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooZGM-003JhQ-0I; Fri, 28 Oct 2022 23:59:47 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 1C450FF804;
	Fri, 28 Oct 2022 23:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667001578;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H//pRxqN88FjYvGU8isbz1zT4GUsHwbTjTfD5EOaMH4=;
	b=VX1TySE01in907utyqOzBC86k4ZO6ApOS6Gu/L084hXya7TWjTUon1LM1tG0eZnysI+kaC
	l6jxJoUuFfnYdI3/rT+VrYtIqYKyrIMfxXtujkkYjL5giOVEfV3L++PPOQsZ68i2gRffUR
	FiyBXgeCCbejGd1h2V4y8ADKkur03y1XO2tnW3wOv8nEz6TB8mKT+zWmAfUv9VePm1WqFg
	lzfIjvjcnK3CoLJfH21Ir0hleDrXJTkFNLPJ0+3VR1O7WQv9w2omLejxwacKOFrOwBt21j
	oePi8i0RT9aYhzzBWTRQrsahxAtMqsy5DB3nlND+FI8scV4cXoH0Rq8vvj2EWQ==
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
Subject: [PATCH 01/12] dt-bindings: mtd: Clarify all partition subnodes
Date: Sat, 29 Oct 2022 01:59:22 +0200
Message-Id: <20221028235933.934850-2-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221028235933.934850-1-miquel.raynal@bootlin.com>
References: <20221028235933.934850-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_165946_193833_72951549 
X-CRM114-Status: UNSURE (   9.64  )
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

Over time the various ways to define MTD partitions has evolved. Most of
the controllers support several different bindings. Let's define all
possible choices in one file and mark the legacy ones deprecated. This
way, we can just reference this file and avoid dupplicating these
definitions.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/mtd.yaml | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/mtd.yaml b/Documentation/devicetree/bindings/mtd/mtd.yaml
index 25b91f25fcf4..9fcaa61b046c 100644
--- a/Documentation/devicetree/bindings/mtd/mtd.yaml
+++ b/Documentation/devicetree/bindings/mtd/mtd.yaml
@@ -21,7 +21,25 @@ properties:
       based name) in order to ease flash device identification and/or
       describe what they are used for.
 
+  partitions:
+    type: object
+    properties:
+      '#address-cells': true
+      '#size-cells': true
+
+    patternProperties:
+      "partition@[0-9a-f]+":
+        $ref: partitions/partition.yaml
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
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
