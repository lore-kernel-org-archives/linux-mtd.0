Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55B79CCD193
	for <linux-mtd@archiver.kernel.org>; Mon, 20 Oct 2025 10:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x/64MwHUNcVn6YwMywVOj6OumSzNlVix9ANjhtcYJK0=; b=eyv8veI/LKPeQv
	CserfTn4b5KSoG+T675PTLnGHSTulFTQMCjV4T3tXH9Ka4YHyCVkFLuXtfPfjuNcvhF7h2spOgpq3
	7KT4UOl2OD6+nLWAwm4CbKMKaR3i1QAs5d6wGn7U5Dsv6GbQMEDpESMQ2c1ITj28EU56HorumpwYj
	0JIIJEYUUueh5kGYjm+jO7dbq3nRsoXdW/ZiwILPZjE/cokipfOPYLuCSKWl4JXb4AHIkvBXjy7R+
	soF1aAtDSGNGzEoY32uWhCI1MPDvhL1bHIQ9Zaz54QFvmAqe8Uz78FwflP2TinoFVnKIEphmYdz8O
	47gjPmn4x65cMj4sR3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmuc-0000000Cngs-2QlW;
	Mon, 20 Oct 2025 10:14:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmu9-0000000Cn2Q-3B01
	for linux-mtd@bombadil.infradead.org;
	Mon, 20 Oct 2025 10:14:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=EJZx7MjvWZvR+9dhB8zsNC40vJfrlNPlQ8ARjxiScT8=; b=nq8e7y6BAloLCA27Ws7YW2oNrh
	I8V9s81W6TggRzkGWwqn0+FlOdCw5Wlu/82jerEZqtMnVOuPcutL5WV+ZycabegP4fdpnY/v9IZ/2
	1AWFrfK9Dqm9YC9DhTEocNZho0Sl0ExNajgHFqQ3S5GrYpiNNF9FjJ8w7IiyzLEl+VryO9S0JV9B+
	KXzHoMV7xnKGAIaUw1bsXz8GSaFjr8xd+6fw8Bc52RBUY076dLjToq4gnp7zwbJM7yaKLmdIuUtJ4
	Wo4w8zQ2eSyEweV+nA8aQEM8JKuLjWnYrlLFTyt1Q49e/nrD1kZZ1ruLWWS5d6Cjta5O1x+kKemX2
	vy0Ki3SA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmu6-00000009i8m-16r6
	for linux-mtd@lists.infradead.org;
	Mon, 20 Oct 2025 10:14:16 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 861764E411EF;
	Mon, 20 Oct 2025 10:14:13 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5BFFC606D5;
	Mon, 20 Oct 2025 10:14:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3C2AA102F23AF;
	Mon, 20 Oct 2025 12:14:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760955252; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=EJZx7MjvWZvR+9dhB8zsNC40vJfrlNPlQ8ARjxiScT8=;
	b=c4Ta6UE/C0O36OnJN8Hs08sr6wpMsXXN+k9RfK9GLKLFJsXb/adbzcS0eAQR3SftGlEnNB
	gaNdULvdIQgZlNBEINquexRJnCHrIrnMCDx5jezUeHU+IeozY70Fd3ZummPIUEqEm7ROCY
	AVi5kk9xjAg/HHWOe9ljSuAXqG9Vy2HWFyLYjGsSu5IVmowQMW57/cHJNGpnceLvMQqlKR
	05pBIEbomAo1ziXcqb3OJ+Tq68SGsWUZg4vqKm1TawT0dmC3i/E9mijvncOt8aVGVVeAMj
	weg3XzP3ZN6RTs3M+9zSW6PZVZm4gaxB6pKIUt/8nuVZvf6mk03/6fURDVzpJQ==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v3 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
Date: Mon, 20 Oct 2025 12:13:10 +0200
Message-ID: <20251020101311.256819-15-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251020101311.256819-1-richard.genoud@bootlin.com>
References: <20251020101311.256819-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_111414_485784_AD98FCFF 
X-CRM114-Status: UNSURE (   8.33  )
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

The H616 NAND controller is quite different from the A10 and A23 ones,
some registers offset changed, and some new one are introduced.
Also, the DMA handling is different (it uses chained descriptors)

So, introduce a new compatible to represent this version of the IP.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 .../mtd/allwinner,sun4i-a10-nand.yaml         | 41 +++++++++++++++++--
 1 file changed, 38 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 054b6b8bf9b9..9d061e2216cb 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: Allwinner A10 NAND Controller
 
-allOf:
-  - $ref: nand-controller.yaml
-
 maintainers:
   - Chen-Yu Tsai <wens@csie.org>
   - Maxime Ripard <mripard@kernel.org>
@@ -18,6 +15,8 @@ properties:
     enum:
       - allwinner,sun4i-a10-nand
       - allwinner,sun8i-a23-nand-controller
+      - allwinner,sun50i-h616-nand-controller
+
   reg:
     maxItems: 1
 
@@ -25,14 +24,20 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 2
     items:
       - description: Bus Clock
       - description: Module Clock
+      - description: ECC Clock
+      - description: MBus Clock
 
   clock-names:
+    minItems: 2
     items:
       - const: ahb
       - const: mod
+      - const: ecc
+      - const: mbus
 
   resets:
     maxItems: 1
@@ -85,6 +90,36 @@ required:
 
 unevaluatedProperties: false
 
+allOf:
+  - $ref: nand-controller.yaml
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun4i-a10-nand
+              - allwinner,sun8i-a23-nand-controller
+    then:
+      properties:
+        clocks:
+          maxItems: 2
+        clock-names:
+          maxItems: 2
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - allwinner,sun50i-h616-nand-controller
+    then:
+      properties:
+        clocks:
+          minItems: 4
+        clock-names:
+          minItems: 4
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/arm-gic.h>

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
