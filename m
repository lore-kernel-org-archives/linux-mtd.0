Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BE68CA0EE4
	for <linux-mtd@archiver.kernel.org>; Mon, 18 Aug 2025 13:41:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:To:Cc:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Ugja61OIpRVRYBP21aNzzsg5ampYGNjnjerCnq+XPww=; b=BqUH9qZPlPoX5xzQ3Xq+M+5zV/
	E2ZEnq76po9nxkzy/iEzsf7zkmw3OG+uKp/p/2bxglovR99LUSyDwyk855doCHAFDNXRQihfeq1Ks
	zOCq9VbZCWa0XC2W7kt+0ywyd31e3XPklpydfG207E96AJfqJLZoSGedbWAuNbJFT9AaX1X8zpLPM
	TVFEBCfiJ3Ie5m59kOJyN0g0gXo4qgkdfEiskZxjOWgh6KWBFSM7uP/XgQlr/hZfjQykcUTMO6TjS
	/fWVgHggWGV4JzCK2gRCPbDYl69kvZmbAVyUuFlhvLAMiQJkPxQdrQgLRqtEmg9qY15PT8L0oSjPn
	yLeqLTog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo07T-00000007azS-3B2g;
	Mon, 18 Aug 2025 13:41:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unxQe-00000007BLl-1txx
	for linux-mtd@lists.infradead.org;
	Mon, 18 Aug 2025 10:49:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 69D9E5C59C3;
	Mon, 18 Aug 2025 10:49:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01200C4CEEB;
	Mon, 18 Aug 2025 10:49:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755514167;
	bh=3tpDuu2kPY5wbA/+5sAi2GLONH1UuFC4z5Uynztubsw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JODImVgojE0pSHb4s1QKDxDJSO6mgzqbtB+m31lizzxTUEGgE+R2z7keOZ5NCLC7f
	 NKVZZc/9JdKAL710xVaia64OifkaKFIfSMHe3pWSPCUQ4PtgyCcKCYXKjWHhO8EGji
	 JSR/l4Ljg28Snc2hjXNiqznSIifVfEgu6jYLQqRT57d2QcR/HxYknvJQoYX9/KqE3w
	 nRyyWQRe0VcAWSY9qAW2aI82OpTaVXdFcSuHpxpiA4I/86i9uvCTBIN7ZvHMRH7S50
	 kNSquBWmoQ1zjpB9eDpxTr1KBOUwA2gAh4TUK0Z8yZiJTkjqP0a+pDxj58QTtN+4rI
	 xn8VcAZf8DkYg==
Date: Mon, 18 Aug 2025 05:49:26 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: krzk+dt@kernel.org, vigneshr@ti.com, linux-mtd@lists.infradead.org, 
 miquel.raynal@bootlin.com, conor+dt@kernel.org, richard@nod.at, 
 devicetree@vger.kernel.org
To: Markus Stockhausen <markus.stockhausen@gmx.de>
In-Reply-To: <20250818092725.1977105-2-markus.stockhausen@gmx.de>
References: <20250818092725.1977105-1-markus.stockhausen@gmx.de>
 <20250818092725.1977105-2-markus.stockhausen@gmx.de>
Message-Id: <175551416618.518415.14194098883265282853.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: mtd: Add realtek,rtl9301-ecc
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_034928_537270_B8E8CECB 
X-CRM114-Status: GOOD (  10.30  )
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


On Mon, 18 Aug 2025 05:27:24 -0400, Markus Stockhausen wrote:
> Add a dtschema for the ECC engine on the Realtek RTL93xx SoCs.
> The engine supports BCH6 and BCH12 parity for 512 byte blocks.
> 
> Signed-off-by: Markus Stockhausen <markus.stockhausen@gmx.de>
> ---
>  .../bindings/mtd/realtek,rtl9301-ecc.yaml     | 35 +++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.example.dts:24.17-38: Warning (reg_format): /example-0/soc/ecc@1a600:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 2)
Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/realtek,rtl9301-ecc.example.dtb: soc: ecc@1a600:reg:0: [108032, 84] is too short
	from schema $id: http://devicetree.org/schemas/reg.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250818092725.1977105-2-markus.stockhausen@gmx.de

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
