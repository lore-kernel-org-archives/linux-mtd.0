Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB04ECF887E
	for <linux-mtd@archiver.kernel.org>; Sat,  5 Oct 2024 14:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7RUSe/04c65kbOqlo8UlPynWeQ6CrkMzagm9snkOrOU=; b=T2eL2jnhuV/CkP
	tapJIN4vrUCAZVdTQT4s80wBamEhlfDcJ3qRIq8HGuiJ0xnS+/ne7DsL7SpMiG5uqDXaEBATpFq6a
	iQb3POCSauPDTTHiiGGQKPFuXj82mLQlroF5/lE166+fS630tUNQtO1LIffRtEJhM1tlu08hS3YUZ
	rQeal4UR5RTej2Xf/CeeXLqZIf46Q8Ugzx38KbDRk3DbWhywqtiGoMpqIouCI/s2xO6J2DE3HrdaX
	WbtL8W0S1JdH1scF7gGUbhvwtj9AZ1vy2i+sqis1xoGQn+/BZ5yI4x1ezK7N9bFcUwPJJLihkPocB
	eo+Mi8srEUi0YuAJVbkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sx5xs-0000000FTj9-1V88;
	Sat, 05 Oct 2024 14:41:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sx5xp-0000000FTin-0EGg
	for linux-mtd@lists.infradead.org;
	Sat, 05 Oct 2024 14:40:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1F0745C05F7;
	Sat,  5 Oct 2024 14:40:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D7ECC4CEC2;
	Sat,  5 Oct 2024 14:40:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728139256;
	bh=IESewRE5dpOceertCQW9BhawHutEpUXflIqNfJ3XaiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiEFnaC/R+PzY5GrMTfZz07v2r5v9DyW/CpVVXZD1Ezh4ZkoBFL1JzVJWjGAqZXpz
	 Mqk/JlCc2TN6zpMCE56C5SkPvVUXPTpZy1mdh1bOo0aCXzlNzeCPzkTEc+Cn6K4fR8
	 8h4xfrtOvxdv6MTYP7n965dXaA+5r4ofSYRxUQRqBqnsLoHp5Idy0SnlqMC316hwJ7
	 1BGNSCP2bcR1xWbzsXbLqhrLjKSxOvAL/JpJ4TJzKxO254RgbNa9pRbIQ3fEZAEuZQ
	 1hV1Jo+1LMIEJXOAeFAQGMd/sbb5pIihGKZ5JpF9Jx+yg6AUuUhUW4r33oVjBLOUT1
	 rUWOy85FusAPw==
Date: Sat, 5 Oct 2024 09:40:54 -0500
From: Rob Herring <robh@kernel.org>
To: Marcus Folkesson <marcus.folkesson@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	devicetree@vger.kernel.org, Vignesh Raghavendra <vigneshr@ti.com>,
	Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
	Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH v3 2/2] dt-bindings: mtd: davinci: convert to yaml
Message-ID: <20241005144054.GA156122-robh@kernel.org>
References: <20241005-ondie-v3-0-459d9c32225c@gmail.com>
 <20241005-ondie-v3-2-459d9c32225c@gmail.com>
 <172813824343.140783.17306442382482143087.robh@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <172813824343.140783.17306442382482143087.robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_074057_206108_C8252B7F 
X-CRM114-Status: GOOD (  18.33  )
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

On Sat, Oct 05, 2024 at 09:24:04AM -0500, Rob Herring (Arm) wrote:
> 
> On Sat, 05 Oct 2024 10:26:12 +0200, Marcus Folkesson wrote:
> > Convert the bindings to yaml format.
> > 
> > Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
> > ---
> >  .../devicetree/bindings/mtd/davinci-nand.txt       |  94 -------------------
> >  .../devicetree/bindings/mtd/ti,davinci-nand.yaml   | 102 +++++++++++++++++++++
> >  2 files changed, 102 insertions(+), 94 deletions(-)
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:

I think this is the 2nd version with the same failures. This is not a 
free testing service. Test you patches before sending.

> 
> yamllint warnings/errors:
> 
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml: 'oneOf' conditional failed, one must be fixed:
> 	'unevaluatedProperties' is a required property
> 	'additionalProperties' is a required property
> 	hint: Either unevaluatedProperties or additionalProperties must be present
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.yaml: properties:ti,davinci-ecc-bits: '$ref' should not be valid under {'const': '$ref'}
> 	hint: Standard unit suffix properties don't need a type $ref
> 	from schema $id: http://devicetree.org/meta-schemas/core.yaml#
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dts:32.13-40: Warning (reg_format): /example-0/nand-controller@62000000/partition@180000:reg: property has invalid length (8 bytes) (#address-cells == 2, #size-cells == 1)
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dts:30.28-33.14: Warning (avoid_default_addr_size): /example-0/nand-controller@62000000/partition@180000: Relying on default #address-cells value
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dts:30.28-33.14: Warning (avoid_default_addr_size): /example-0/nand-controller@62000000/partition@180000: Relying on default #size-cells value
> Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#address-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#size-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: reg: [[1644167168, 526335], [1744830464, 32768]] is too long
> 	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: ti,davinci-ecc-bits: 4 is not of type 'array'
> 	from schema $id: http://devicetree.org/schemas/mtd/ti,davinci-nand.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#address-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: '#size-cells' is a required property
> 	from schema $id: http://devicetree.org/schemas/mtd/nand-controller.yaml#
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mtd/ti,davinci-nand.example.dtb: nand-controller@62000000: ti,davinci-ecc-bits: 4 is not of type 'array'
> 	from schema $id: http://devicetree.org/schemas/property-units.yaml#
> 
> doc reference errors (make refcheckdocs):
> 
> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241005-ondie-v3-2-459d9c32225c@gmail.com
> 
> The base for the series is generally the latest rc1. A different dependency
> should be noted in *this* patch.
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
> 
> pip3 install dtschema --upgrade
> 
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your schema.
> 

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
