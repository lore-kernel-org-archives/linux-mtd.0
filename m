Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7857C4332F
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Nov 2022 09:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WV36zVLra2gFbwc5prpw++q9DqHeUSAKm+BNOdiPcuQ=; b=oE+nXbHhguaqX+
	nyYK4NpGJKyy9WwsOGZS9h33xP0msa76IpjmHiuVsNY4smNmtE8Tu3zVP81f9Lnrk7iqSRSMNzAcw
	1ngsGspAy+Rx5voU65W6TwOG2imdq+V9thPnnxhARynV6fzDC7v/luO6RdGGH0NiZXC4oeLut97qk
	vd47vtF36knBx3NRk3vcEf1S+RWFLub8Kv5R+J+d2QNin6Y7nFyB+RxoVnYgLBmbtHnmOEu8E/4vU
	hCzQFqaeznrNNVX1g30UBSd0M34TrvbV9kpZl5zqf6beSW3k51tQseOi10DG7CTHKd+bvVxosS0QU
	ZJpxxDy8P2C2v94T+u4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVRM-00H4iE-PV; Mon, 14 Nov 2022 09:07:41 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouVNk-00H27C-DN
	for linux-mtd@lists.infradead.org; Mon, 14 Nov 2022 09:03:58 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 39DD3FF810;
	Mon, 14 Nov 2022 09:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1668416634;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SGgLQJiM767wl93pGV+At61F3Cl0A+eitZYipi117FY=;
	b=pdcgHVIjKG1D0HsuTRi8Wg5NCj25/XO1IB4F76Tg6izZ6E9L615VdI2WlPZ6h1pSeqFj1Z
	AQGCPIb7R3UUMXHzFYgo49rUloHBxbMiMw5Lk+bF7X5d1ETNL15xTg0oGQ5GVd+x+51KYE
	cJPSTFemhrwXnYFc3YS6rjHnl87dzjex4HKePGD5hKaOfNmf9etJoCId6QXWQN9qSahk0l
	v9mNb5LZbdt3tAi78R9kwTpxap8//+jb93So5CKT/esHM2An7Y2DSXE+cF0j+R3Xz2jcr/
	+X1XtshAmLSDhx7Xc6ybCMYeGPH22Vtrn4SbE4YgJ2D4XWHC8eIVEabFayN/8A==
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
Subject: [PATCH v3 14/17] dt-bindings: mtd: nvmem-cells: Inherit from MTD partitions
Date: Mon, 14 Nov 2022 10:03:12 +0100
Message-Id: <20221114090315.848208-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221114090315.848208-1-miquel.raynal@bootlin.com>
References: <20221114090315.848208-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_010356_637124_82647A39 
X-CRM114-Status: UNSURE (   7.75  )
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

The aim of MTD nvmem-cells is to treat MTD partitions as NVMEM
providers. Hence, MTD partition properties are valid here. Let's
reference mtd/partition.yaml which gives us a chance to drop
"additionalProperties: true" in favor of "unevaluatedProperties:
false".

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/mtd/partitions/nvmem-cells.yaml        | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
index ca18892eacc7..5474d63268dc 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -17,6 +17,7 @@ maintainers:
   - Ansuel Smith <ansuelsmth@gmail.com>
 
 allOf:
+  - $ref: /schemas/mtd/partitions/partition.yaml#
   - $ref: /schemas/nvmem/nvmem.yaml#
 
 properties:
@@ -26,7 +27,7 @@ properties:
 required:
   - compatible
 
-additionalProperties: true
+unevaluatedProperties: false
 
 examples:
   - |
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
