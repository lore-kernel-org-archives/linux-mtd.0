Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76031EB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cNpODOR882WKKCt2VDKh8vOtO5uwPdpQicPVouQFd7M=; b=p1n3M1A+sW8L8J
	dCs9x7IEXuyvy+0E4f5mcUBbr+ydTunYycUBsZTjfNIi0URDPClB1YUlATTyyOh9aq2TLvmUYmvMn
	9QPWNTko6MvZu/lrJeEM4xidc2n08Vk2aC24Wbd8JQvHYKVLHwCTrOYfHF+tKPPLxVPD8EB+bmbnM
	mPXoVpd8VX18TlQ7vmoYaWq0jRUBTTyUh+KgBaAloXz7Fb0RqxHOWqeKmCJmPmLmWzM0ETx/Eaifg
	4nY7bDkAuXbYB4dUtKk281B9R2guOPwpq0lsPsKchHlXSLRu6+gzHaxf/i8Izg6+iEyZiT7wWCm3S
	5i3rBq2FgJ6MyuXVxdhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBDD-0081Ah-0d;
	Mon, 19 Jun 2023 09:30:15 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCn-0080m0-2g
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:30:00 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166987;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=iglQIY4QvWya2y1OlkXSdtLQxq0KUlMVd8OaSiGAwgI=;
	b=Cyc4/xAarToYnL+5GuQNZWro1T9IPeINoNzIYg2H6Uycbpk12XL4c1DVgMwzJxJYUDqZs0
	bwgnvgu9l/8UqAwLlzG+Xk3+Jrd7DQIJSosu05JLnN8RVk90zvPlM6T6Hc2NxSn6FtgOsZ
	qEEGztxlLB/d7r9pVvzUnerw5K19qEY7iCZIWnBu00q+qhOB4tjzrtQiXfLaRSs4s4vKh/
	g8hyfFXB77PPZ1IxoQ9uAviDpPJQw8+kUzeTj4qPO3U6pb7tApyZDpG2TSejwCDpXoAD1d
	Xf7Qo6mbxwEO5v//G6cs0VVnf9wFzRha9spzYtz79fjYUgYQ/915I4mkhvV7rQ==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id C447E1BF203;
	Mon, 19 Jun 2023 09:29:46 +0000 (UTC)
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org
Cc: Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Michael Walle <michael@walle.cc>,
	<linux-mtd@lists.infradead.org>,
	Chris Packham <Chris.Packham@alliedtelesis.co.nz>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 17/17] dt-bindings: mtd: ti,am654: Prevent unevaluated properties
Date: Mon, 19 Jun 2023 11:29:16 +0200
Message-Id: <20230619092916.3028470-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022950_013414_F295173C 
X-CRM114-Status: UNSURE (   7.67  )
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

Reference mtd-physmap.yaml which contains all the relevant properties
for this device. Add "unevaluatedProperties: false" to avoid any
spurious addition of random properties.

Cc: Vignesh Raghavendra <vigneshr@ti.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml
index 4774c92e7fc4..df4fdc02456d 100644
--- a/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,am654-hbmc.yaml
@@ -30,6 +30,8 @@ properties:
 patternProperties:
   "^flash@[0-1],[0-9a-f]+$":
     type: object
+    $ref: mtd-physmap.yaml
+    unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
