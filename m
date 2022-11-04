Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F497C4332F
	for <linux-mtd@archiver.kernel.org>; Fri,  4 Nov 2022 16:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8ZnUBeOaCcucihRS46Jqi/sK4E7PuW/KtYxWW4W4BYk=; b=FTOrh9pSNEpYEI
	vU7VJnQwoqn9hOFJYn2BYlu5zk71MlV8YA4JLkg4WeyXVp+rp6u2T8vK1/QVYo0b1TibJTcjlFl+t
	Nr2joUwAg7QXbwvAQKPA7wk9vI2AktHZN1kAfNlCEdTuv8bSwXVBNU5Ck1lR3KkbM7Y2xzT8LTTbS
	jznZV2ZlCFHi3kBmQy9b0RABWqdCFUlflUCOMQ8Jo9NVMwKqCEx8rj+aCHXMRdC2HLKE6Ee9Br43t
	UReDz93ER1EpNkjpyRxH51UfeP9bE7gZRhrzEkZjzT20e8hTAZoz7r4mjgxDddLcVFzQDBPHUXguu
	R9iXRL3va9Uxfc7NuMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzsI-004Wup-1a; Fri, 04 Nov 2022 16:48:58 +0000
Received: from relay2-d.mail.gandi.net ([217.70.183.194])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqzqy-004Vx0-5k
	for linux-mtd@lists.infradead.org; Fri, 04 Nov 2022 16:47:38 +0000
Received: (Authenticated sender: miquel.raynal@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 9FFE84000E;
	Fri,  4 Nov 2022 16:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1667580454;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mfySvTw9F2sJ/4rPEiimBhliYhZWKXtJT7ol/a3yWK0=;
	b=BAwtPBJzb+XlqqpzqieVXHyZ3DejlH1PGnv/FsZyapr/V2YWOZGiYPcv+6xIEzpLbVjw/c
	fUyGzoqcJOQox8RZGEOSZ2zD3W51FvanYVppRulSmoXultO3xknnTd/N+GPCe60NEUl2gD
	yVMl+O6I/m5rWYz0DRHjv91tN67ZaaMgfReGqNYgeNnrhdF3ebkguBt3om0so6+f/E+6dW
	ig1moSkpc7vgCrgVbkJjfOxRwmwwKb8KuaTO4fG57mRlhpvkbIDA+ggpL8GbAKr/OM5wZF
	Tl5kiid47R8wu7G2EFkgyVjrU9Oc3JeAKIcjk6UynWKN/+DPVCmGfJmN94Zxkg==
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
Subject: [PATCH v2 13/17] dt-bindings: mtd: nvmem-cells: Fix example
Date: Fri,  4 Nov 2022 17:47:14 +0100
Message-Id: <20221104164718.1290859-14-miquel.raynal@bootlin.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
References: <20221104164718.1290859-1-miquel.raynal@bootlin.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221104_094736_401833_045524C6 
X-CRM114-Status: UNSURE (   9.51  )
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

There is no such thing as a "ranges" property within an nvmem-cells
node. There is no use of it, it is anyway not pictured anywhere that
this is valid, so drop it from the example.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 .../devicetree/bindings/mtd/partitions/nvmem-cells.yaml          | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
index 5cdd2efa9132..ca18892eacc7 100644
--- a/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
+++ b/Documentation/devicetree/bindings/mtd/partitions/nvmem-cells.yaml
@@ -84,7 +84,6 @@ examples:
             compatible = "nvmem-cells";
             label = "calibration";
             reg = <0xf00000 0x100000>;
-            ranges = <0 0xf00000 0x100000>;
             #address-cells = <1>;
             #size-cells = <1>;
 
-- 
2.34.1


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
