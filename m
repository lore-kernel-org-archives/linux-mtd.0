Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18475C7EE32
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHnC5ZgKhHglqUbCD9UPPcHixirhiMzsvs6+LTuhnKg=; b=d1JlxBd+xe4Wr+
	4EgPd2vHSEZYWgnpRjuKusJzCr5db/upFdr0cZf2hd+4kXO+snMRBGEukA1TuV6uz111IYvgFKQak
	5U9aW6LlNm4B43siCahWjTEWQSZTbXzKKBXQZcYBrEZMb8jVt8Zv9Nd9yBIdvxBudvijOb3/K9wfE
	gBtGEi2Z0/TrhR4SPuMHNmnXnY58692LwLXoZKz3oVsxHwF3LpTvuIF7fN1n60jAI4ose0+5PxvC+
	U+24JQf5i4BzjSJhUW9zJnRFRKYHEFGubJg6QngLLuJqGHHcqcm7DUbhzHVLt8c4NwRW1J++fF1bR
	vMi3XmVHdAPOD8xyZdxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6aru-002emo-30;
	Tue, 06 Jun 2023 17:53:18 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arq-002eib-2O
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:16 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073993;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8WpSqsWuk5BYR/kDPBJlDu36RhwdBv9XYyfx55Z4+Pc=;
	b=a4dZJsRUpuAKltY2ZeDhuChXgZZ7iIBxZC3isJMQzkC7+qDG1t+4jAmRcXqYUV/5RG8qtg
	UjrxAWFHAdyaPxbiBOs+eDVzLh7MrIbuaAhEFZkeCDE8vTS8kswmpTmgDU0qe1gtpBmXYB
	IBFH4hSBiBB1OJWTLY4fwF2oW87Ojfym9BBo4K2t8pu9Ig+ZwsX6c8Sq4NQccFhd7RaGCO
	h2IbLJKEKGWP0yVWSak04GJ7jCWL8W++5bs/jFE645OSqa+w0yW8b2yoczc6og1WA8BrAg
	APN0fgNJYD6luNyjDHDIwyoj6CnyJ5IJY24TsTrkDl/ITlhfRTJaD8Rij7767w==
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 1A8121C0005;
	Tue,  6 Jun 2023 17:53:12 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org
Cc: Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH v2 13/17] dt-bindings: mtd: rockchip: Prevent NAND chip unevaluated properties
Date: Tue,  6 Jun 2023 19:52:42 +0200
Message-Id: <20230606175246.190465-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105314_941107_D2966F4E 
X-CRM114-Status: UNSURE (   9.07  )
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

List all the possible properties in the NAND chip as per the example and
set unevaluatedProperties to false in the NAND chip section.

Cc: Heiko Stuebner <heiko@sntech.de>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/rockchip,nand-controller.yaml      | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
index 566f330851f7..3672632e2ffa 100644
--- a/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
+++ b/Documentation/devicetree/bindings/mtd/rockchip,nand-controller.yaml
@@ -57,6 +57,7 @@ properties:
 patternProperties:
   "^nand@[0-7]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       reg:
         minimum: 0
@@ -116,6 +117,8 @@ patternProperties:
 
           Only used in combination with 'nand-is-boot-medium'.
 
+    unevaluatedProperties: false
+
 required:
   - compatible
   - reg
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
