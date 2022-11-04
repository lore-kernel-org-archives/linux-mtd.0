Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 023CFC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xH0NeNg1rQtRhSkJ89cceFdeY23oAFeWyFtD7zHoUuA=; b=beJibZXelmAQF7
	gSDmxE/t8TKkyyqxgbcRCBJdcjRUmuKsgs3rUxRIIb41CtCDczLSgvY/KowaMWkD4meokfBgBDHD0
	HV4kBoniBa4wNtK8HWhHBpypUUwXsg2NpAwVCE4t6xSFrgS6DUUCryI1YSjdkXpvzX4ZS2iRaWMk0
	8wmwQR/xOZGS5srPQSWbcxKz9gtDe/VLdbVw0rhE0QeKk9G0OpSkE34G9J5lhw7augSB5ryyJaXLL
	hULW8pwqH4gGcGc7TDlgHOsRZoHA3xZDgrUpJngAzXEwiHdCVgPZdQjSUSSZ8OJWgeKZa7jUJM5fy
	ui6I3xoUl3gTWEp7SyEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzrP-004WD4-1S; Fri, 04 Nov 2022 16:48:03 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqr-004Vt0-AE
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:32 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DA7B140010;
	Fri,  4 Nov 2022 16:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580447;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uhHL581pVZ78rpGpusp3WI56Gx3E7sF7B6MwrnAS96k=;
	b=jAD8aravNoAwXsGAU97Rgz+cSv3XEdMGLJolk0UC8/9ErrXVaLMWU+wmG3uBBwH6r/4s2u
	31ioeY8+B15tmaRyVcsv5CvXQCCYNj8FRN5CUpZf6jqJAwb+MO06NTuDr0SXM8kKR4ki+5
	t/Gy64wq6WPVEWeLBaqpp4tOuUn2+/1Ukg+Sb21voBtE8hQ0pD+kJCVTS82/4+Ds7xId1E
	jtaWTjOv9AdVZAXeZy+HDTKFIklFqBvUiDAGnFyns9474rfnKOfxZGTbn7WWd4sT4aDg+z
	MzDIHE8V9qWahZO0ZMbbU71vrLlYJoT/gsceTAmNQUB8Amf34RX6ep7QYgOPOg==
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
Subject: [PATCH v2 07/17] dt-bindings: mtd: onenand: Mention the expected node name
Date: Fri,  4 Nov 2022 17:47:08 +0100
Message-Id: <20221104164718.1290859-8-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094729_539669_9C051D16 
X-CRM114-Status: UNSURE (   8.55  )
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

The chip node name in this driver is expected to be different and should
be prefixed with onenand instead of the regular "flash" string, so
mention it.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
index a953f7397c40..8a79ad300216 100644
--- a/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
+++ b/Documentation/devicetree/bindings/mtd/ti,gpmc-onenand.yaml
@@ -15,6 +15,9 @@ description:
   as child nodes of the GPMC controller.
 
 properties:
+  $nodename:
+    pattern: "^onenand@[0-9],[0,9]$"
+
   compatible:
     const: ti,omap2-onenand
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
