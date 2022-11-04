Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2838BC4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OMHvK6RK1bu317iL2W7lC8+7GHfF3sFQSwAN12p17dU=; b=y46ZKEiRxwii7G
	qttkQDf1WxsoQDiJ+vccPJrvos8IhBnJfP4N8LuKueY8AgUJrypSwiDrBAtwMHokDx/e/rXvpV9IL
	K8OxX2vTtm+zKZ3f3UZRrgCWmcaT9oJsJmBoKyhmM2pNyUocgKukyDgmp2QoLUZYuIfH9lik2MizV
	7rp8Yh++JUdDJlWHir1nm54pyuhxyoPgU3nmHPxjBjjXCAbx0IcvG4W7fJ2xVx6F8rb22VssxQHmD
	9PylomLwI8ubYrOC9u4A5oZ49yc1kGKY3dlOJ1u+JtBaFWde0OUitqmYa62VCogVTOd/f9RgKrBAu
	MDoWY3yNGtziG07asWVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzsl-004XIt-V6; Fri, 04 Nov 2022 16:49:28 +0000
Received: from relay2-d.mail.gandi.net ([2001:4b98:dc4:8::222])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqz-004VxX-Gg
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:40 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id DDCAF4000C;
	Fri,  4 Nov 2022 16:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580455;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+/lDN07HzIVXyCOe6g7TO1CLyUYJmJJyGrTHG8Es/Kw=;
	b=IKn83bltza7mii6W7ZBV5MTpEknwv96h9DUbfImGD2IJgAJsWRiLGMEQE02jRLTfjcCHXd
	9fLXANAkFTZ2XIK3H7cLQXYosjmmrwLLZEg35MsMFa50AyhHIJ3GS2WSKOVdUHAPfqvWdA
	8kb782HO0TXhJV6KLU1oaVmEzF10ivlT0zE4vfIQ+lvPZRIJ/IJqgiTBtVP7Qv+uhVc9ce
	f0wMNIQVmhKHknhzs9Vgc38dcX0omsloSvxmMgDBLpICaK2bYmuOVtG8ENeNaof8cINW7x
	Vhu+QqG/ctWTEoDmLz80nzVKoZ10JKBKLqr6ESvIc/L1cnx0j6hJSnGsGktDlg==
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
Subject: [PATCH v2 14/17] dt-bindings: mtd: nvmem-cells: Inherit from MTD partitions
Date: Fri,  4 Nov 2022 17:47:15 +0100
Message-Id: <20221104164718.1290859-15-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094737_738926_1AEAC428 
X-CRM114-Status: UNSURE (   8.27  )
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
