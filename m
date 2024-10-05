Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49A5BCF887E
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Oct 2024 14:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:References:
	In-Reply-To:Cc:To:From:MIME-Version:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=n91h1ndxWESPstXskNCoNL8dTzBgOP4MCF8ngR65mVU=; b=db7OQZx1VdYbqWuQxzP9bScy7Q
	E/5cjaXESt/51m1n+NDjqIgA1gSnm2wwfDGodu4P/Gln+69R+/yOpdIvn0wQWb+CuF9/Ge/i8KdQJ
	MImK96MHRQ2UbPIeHeqMxRMG2F2RjW79OxIGLy/iaSm6/Ap6uR9h9mVPeC27ciJC/lZbeQN55mSMZ
	VMRUWKO4eLCMGIgBZozhXlmwbd+FxhAxrjoyBvubW1+fAGigU2NKqZ8btmiRC3LIZj1riPiSIE1/J
	9w0fnVf+gFKO6Oyy6Ols4V0dxnomEGFt+mjiF+3JXcWNm7BMxwIZ+p0+m5O63fQqJIiQq5Ash9JuX
	uEdkhIpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx5hZ-0000000FSRA-1Yj4;
	Sat, 05 Oct 2024 14:24:09 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx5hW-0000000FSQo-2JYp
	for linux-mtd@lists.infradead.org;
	Sat, 05 Oct 2024 14:24:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 07E05A404FC;
	Sat,  5 Oct 2024 14:23:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06875C4CED0;
	Sat,  5 Oct 2024 14:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728138245;
	bh=txlfB+9xh3mLZ1jCT2FDFCuADgC+DWHCutNmzx33phc=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=IkU76rzuV1Ark0vVlF427vyGCcw+iQH5bZd+63SyLUjrqDjHa4QQdyG36YzADhStc
	 cXYsGGbFx0/e1E9rOnDaId6rS78GTC71zQWfa90EGdcfC5BfKO5qu5xtYYmMcZxGrt
	 0wA/u5ETki8p4XDSALd7uR5WaE6Zyaj82XMQ2wKKZREDt0B9cplLQVRXOy9KesVjRU
	 YN7YJgN2H9F+858LFWn6qC1rMYpSCw6Mc/4/E22Vj3XssRYq3STCjYP4xWL0s+GC0s
	 AS2XCnPv1+ye6bjXtHZOfTvrzoax0mIVJGLlWaMxivQyG3u73zrbvj1UNKQengFAtm
	 UstXNY23vKzjQ==
Date: Sat, 05 Oct 2024 09:24:04 -0500
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>, 
 linux-mtd@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Richard Weinberger <richard@nod.at>
In-Reply-To: <20241005-ondie-v3-2-459d9c32225c@gmail.com>
References: <20241005-ondie-v3-0-459d9c32225c@gmail.com>
 <20241005-ondie-v3-2-459d9c32225c@gmail.com>
Message-Id: <172813824343.140783.17306442382482143087.robh@kernel.org>
Subject: Re: [PATCH v3 2/2] dt-bindings: mtd: davinci: convert to yaml
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_072406_742073_A5498F76 
X-CRM114-Status: UNSURE (   9.34  )
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


On Sat, 05 Oct 2024 10:26:12 +0200, Marcus Folkesson wrote:
> Convert the bindings to yaml format.
> 
> Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> ---
>  .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -------------------
>  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 102 +++++++++++++++++++++
>  2 files changed, 102 insertions(+), 94 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml: properties:ti,davinci-ecc-bits: '$ref' should not be valid under {'const': '$ref'}
	hint: Standard unit suffix properties don't need a type $ref
	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dts:32.13-40: Warning (reg_format): /example-0/nand-controller@62000000/partition@180000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dts:30.28-33.14: Warning (avoid_default_addr_size): /example-0/nand-controller@62000000/partition@180000: Relying on default #address-cells value
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dts:30.28-33.14: Warning (avoid_default_addr_size): /example-0/nand-controller@62000000/partition@180000: Relying on default #size-cells value
Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: reg: [[1644167168, 526335], [1744830464, 32768]] is too long
	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: ti,davinci-ecc-bits: 4 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#address-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#size-cells' is a required property
	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: ti,davinci-ecc-bits: 4 is not of type 'array'
	from schema $id: http://devicetree.org/schemas/property-units.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241005-ondie-v3-2-459d9c32225c@gmail.com

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
