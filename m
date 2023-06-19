Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD9AEB64D9
	for <linux-mtd@archiver.kernel.org>; Mon, 19 Jun 2023 09:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wiqSWaRSCSQMmGfx8o9264gyRUo/mOLW1Ry8ps/VEOI=; b=a8hscai6m3IsNz
	JS08romEojqPyO3ULVif9dyXxozNtorNIUbUoAXT0MP7pDCqZ6unwdFsTcsNvokHs6Z/ZMEVycseA
	4Zfn7ZWVN/AqxconjiMepNqz+Q3yKXoH5O4Ynb1ibIoHukn/OltabNVvA4yYx+ee/P7zkzN48TY6+
	3xkkX0iNrxjhU3ameyz4bklnmpoLcbpt87mr9BJNkiEIHfD9Ixw2aycrlwrj8lUX+k1LeotZiMblb
	5HtGHT8AyCb3SrnVaQ2eYwoSAgjGCyUPpBFZbKPyPZ/gXHOFzvoC5W6SG7/Y7WEYsNE3PI4NoZ4Mc
	pxio4HbEVSnLnUq2uW+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCt-0080r0-0Q;
	Mon, 19 Jun 2023 09:29:55 +0000
Received: from relay8-d.mail.gandi.net ([2001:4b98:dc4:8::228])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBBCf-0080cB-12
	for linux-mtd@lists.infradead.org;
	Mon, 19 Jun 2023 09:29:44 +0000
X-GND-Sasl: miquel.raynal@bootlin.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1687166979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=z2qOks+/r0ydif/5pXo0Sbt0HpZgDwWYY+rCMjw4hQI=;
	b=KsBcigDMXmfEje+8lP3IbHv3Q9ci9QREjhEyXevx/Ngzf+K8QtB8oG3HLtMjqAvfN41fO5
	AF8Ea/tNS9vDh7tW5dWh3CWm4+ZHPlPx1LEQbaiIZOavb2syUbsB0OogFoSpKnZPXiTclC
	ww78h2hZ13N9iHxVm1zX8Eg0B/FWYk3/hD0ForVdBMO3cfuVeHu8hNqtkB6d19Hd4hmFUE
	E4yhsR5VQeI20k8oKKAQHWGU8M2BRW57clSR8Hjx9iqTSWqPv3Z1I5TcMFnIg+d4TIb+gG
	B1tnIWwSbhpBv9hnVqqJlL94rVUtOGF10+tVq8fb5y8OqK2oi4nMc4b/pXYlMg==
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
X-GND-Sasl: miquel.raynal@bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 41F121BF20B;
	Mon, 19 Jun 2023 09:29:38 +0000 (UTC)
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
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v3 12/17] dt-bindings: mtd: intel: Prevent NAND chip unevaluated properties
Date: Mon, 19 Jun 2023 11:29:11 +0200
Message-Id: <20230619092916.3028470-13-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
References: <20230619092916.3028470-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230619_022941_546206_D3C8ECA7 
X-CRM114-Status: UNSURE (   9.17  )
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

nand-ecc-mode is a generic property which may apply to any raw NAND
chip, it does not need to be listed in each controller
description. Instead, let's reference the raw NAND chip description file
which contains the property. The description contained
"additionalProperties: false" which is wrong as other properties such as
partitions might very well be added in the final .dts, and anyway needs
to be converted into "unexpectedProperties: false" to fit the property
change new requirements.

Cc: Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
index cc3def758e00..07bc7e3efd3a 100644
--- a/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
+++ b/Documentation/devicetree/bindings/mtd/intel,lgm-ebunand.yaml
@@ -42,17 +42,16 @@ properties:
 patternProperties:
   "^nand@[a-f0-9]$":
     type: object
+    $ref: raw-nand-chip.yaml
     properties:
       reg:
         minimum: 0
         maximum: 1
 
-      nand-ecc-mode: true
-
       nand-ecc-algo:
         const: hw
 
-    additionalProperties: false
+    unevaluatedProperties: false
 
 required:
   - compatible
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
