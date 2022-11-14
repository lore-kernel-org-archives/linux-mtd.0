Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6BEAC4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z3u0/x1GMcWoZD9rqBi+bBR96rdSnjf2kGLQDXsnLWc=; b=dYUGZUREaKeyUy
	J14UOGw/7jNXfhtABFNo9y8fplCt7WORaEFGMA42Yt/xIvKhjtStDsKEXsFBlekLDvSLp5xG4UNRN
	Qje6m8kau7NWlCEgabWDMAo5sqcKC+a/+UMCeoPlCaQWJ33dAdNEb4p+d+Jf8nf3EGCPo4Nopy9k/
	7GqbEJqIesovQEaeMRnNczDcBIxiMcT1Mn4APBsu8f2QHYTk9JNoJ8cqmmp8yQajRfpbf+XxSG31R
	+eWQ+kQS9RfzseAYwzSfCpCxlqTxSdH89u/M5+0wpxjAaByBIp2cMDt3inJCCOQDdW1oIzt7Ngo5F
	byoKafhoayeBJbpCGJmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVOl-00H2mV-7O; Mon, 14 Nov 2022 09:04:59 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNN-00H1s9-9G
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:34 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DAA50FF80D;
	Mon, 14 Nov 2022 09:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VZniRa34IJzcORswSbVxxaxEtzC6zBhF2xlhbxe8YXs=;
	b=giuozLSxpKkGYRAtRiy7/GNRi+LI3RQWeS/+x2NZZtX3f4OoqmEsJSvoBMuCWn1rcpM34S
	06t9sHrgfFSr8zAUr/FWTj/PbDwkn75yZctx+GDeeZkisUhsnr4Oa/mjUe/pgXOfxzf2u/
	RcQgzJ2xFyw7dvEA92Gs6TxEFIMyXiUCOgmeRm0gY+zWjWwzw02WzhmJzP7N3iU965Xu2Y
	dwzK3jAo0MlxBl+dEC8drl5o8mYqna6zF8WdI0YrVPfmCwC6r0pX0c5lydjf8HyJwn3DPf
	0grSnK4D+arsp6tIci+cUpH6pRYlCUVfx4blC+YOdrhQKfkeJH0sr1cISxXHog==
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
Subject: [PATCH v3 05/17] dt-bindings: mtd: nand: Standardize the child node name
Date: Mon, 14 Nov 2022 10:03:03 +0100
Message-Id: <20221114090315.848208-6-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010333_540214_6B0B9F0A 
X-CRM114-Status: GOOD (  10.68  )
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
Reviewed-by: Rob Herring <robh@kernel.org>
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
