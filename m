Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA9CC43217
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bG4dWooN/W2EKjM2FsonmXjNeTEdWBI9zo/JYd9FRXk=; b=ub30BaCWi7FGSR
	3m1lh6K2OhwE4pkDsxmXldyoGwAUNuNCn7ZQDch8WiiquQRCXd6LQoENzlkRD6ADFIQ9RSDY7P4uc
	L70FJBtY3MnLjiYjKLse34246H3EFxgVeLjomUNC6AfE5ZLA+2ZDBsUIq6/54o+awXmGKV0lysMmU
	Heng1aYQsCXapA2EaZ0r6jffj+QKhFi5HT+cVtAy3jWB+a8fyIRiHugzkX1m26dW6ENjdnwqXi32v
	/NymE3iGTZ1CzjcBha3GANUr3+ydZZdUgxpQal2TEekiB6DzBq2OVngTvFnoFEK9/p3d1Py71olbn
	w17BxStOJx5ygNbMfNwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzrD-004W5T-DS; Fri, 04 Nov 2022 16:47:51 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqp-004Vry-7b
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:29 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 8B9744000E;
	Fri,  4 Nov 2022 16:47:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1BVXfpUDpuO14vpkhrGj4WhajxKP64/OBHEAjC1gJJU=;
	b=YDzbuVof2BvQCL5+tC0MmGS8rNod+85O+cSBK1eT7Ru8ktT/MCZQp4ix2sFrRCUezRZWdA
	G2QIlNNJoydsR8NferXcXIdgYGuDeAWg9c7FVm+GVH/H5oBqoNKEUtthuyZNqw0MCz01q7
	YQ5SLlsrUG3eI8GNSEdt4CuPaG9EaJCZ9cOrvYrEo2Er72D9s5JmPxP8Ok8u7B+7Zh2brS
	SqatFHtjnOm5ZzP2VdlTXZ3pRAXO6zKeXsUhO7vJ4j6JwXVjLtV/+z6Pknn/+6kx46cAZF
	Hewwv/KkOrWTbhDdtxcOytvFtUC1LazYonxqx79RZNotMDU3RB0bYl+6xoo3gg==
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
Subject: [PATCH v2 05/17] dt-bindings: mtd: nand: Standardize the child node name
Date: Fri,  4 Nov 2022 17:47:06 +0100
Message-Id: <20221104164718.1290859-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094727_485044_52586C88 
X-CRM114-Status: GOOD (  11.20  )
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

In almost all the schema mentioning a NAND chip child node, the name of
the subnode contains a single index number.

In practice there are currently no controller supporting more than 8 cs
so even the [a-f] numbers are not needed. But let's be safe and limit
the number of touched files by just allow a single number everywhere, so
in practice up to 16 CS at most. This value can anyway be limited in
each schema.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml       | 2 +-
 Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml    | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
index 65521924ee1c..465aa69f0f10 100644
--- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
+++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
@@ -47,7 +47,7 @@ properties:
     const: rxtx
 
 patternProperties:
-  "^nand@[a-f0-9]+$":
+  "^nand@[a-f0-9]$":
     type: object
     properties:
       reg:
diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index 7c83a328845e..d455b75a0b0b 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
@@ -40,7 +40,7 @@ properties:
       - const: rx
 
 patternProperties:
-  "^nand@[a-f0-9]+$":
+  "^nand@[a-f0-9]$":
     type: object
     properties:
       reg:
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
