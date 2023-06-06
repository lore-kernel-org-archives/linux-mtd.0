Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E50C7EE24
	for <linux-mtd@archiver.kernel.org>; Tue,  6 Jun 2023 17:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tlF4WB4MlEWVbNyxI9ew0QzpRLZCequpvcv+eWxKsBE=; b=ru1/rOCFYPibGz
	VynbpxjlljbiBBQ5NPTlrbscLrHf3jKxKOhx6DM5gdiAcJfT3Z+JGZ3bp3MYA0JH5yRSLUwUZZWYU
	mv1MlwJKYdKvDKHm1yWxvHWqKsvjQoRmwfBQqESmKh67E2FEm8pQ+hrG6mlXLesYOJxopiW1GLg63
	x81Zx/trs/TSt7sBmHjw45X23XM9SXo/1hIxZiQTp8dn2DCrV4KwOBTfc51pJVre+YkdhZJj7vONZ
	ftyrRpfNn88HgooX6AKuJK9y2BME4uzIxD9MszpuHqRBLmPq1hDAfsRNtqtCSesb6RjjD7AleOb04
	87UV6xrAnJsZJHuYZi1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arz-002erx-37;
	Tue, 06 Jun 2023 17:53:23 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6arw-002ems-06
	for linux-mtd@lists.infradead.org;
	Tue, 06 Jun 2023 17:53:21 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1686073998;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3l7Jl1iXpyRdwoT/GylOtWdQ+8MZ9B3ZlLM+WuAhu4Y=;
	b=ly/ahLmp8tbaE/a+e7kEDPvKPvk0C2c0QU080rcicZGJAmWiG/m8Dpi2t5lMY7T10ibJR3
	DqMv17fEo9USS3mWOwiFtfbJwt6QOdEbMAZChBl01povI2fN9i8XYD3NTW0IZgcRu0qik1
	ULIIW2c0+r+YISWWMXtUX9plGldrOUljFH9PuN2BvHGup9+SOqC/TYzwQHfcrEopSSt4dS
	XD4o5VP5JmM7TZiTTutPj17NeLgRJznNXWQj83d60rYdLwyTRk148QkiWiU5tLj+xCTHCX
	k2PFGWFSqiLftqjtTy7MDtngj9zEk/YQrk33eVoAq1cPwlGKVFPojm0empWR1Q==
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
Received: by mail.gandi.net (Postfix) with ESMTPSA id A46861C000A;
	Tue,  6 Jun 2023 17:53:17 +0000 (UTC)
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
	Miquel Raynal <miquel.raynal@bootlin.com>
Subject: [PATCH v2 17/17] dt-bindings: mtd: ti,am654: Prevent unevaluated properties
Date: Tue,  6 Jun 2023 19:52:46 +0200
Message-Id: <20230606175246.190465-18-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606175246.190465-1-miquel.raynal@bootlin.com>
References: <20230606175246.190465-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_105320_202018_E6D1A0F0 
X-CRM114-Status: UNSURE (   7.49  )
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
