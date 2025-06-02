Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E91BC5AD49
	for <linux-mtd@archiver.kernel.org>; Mon,  2 Jun 2025 12:44:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NWdQqL1XE3gPJOPGSo2XQQ2eVjOJ5An/P56/CZEwb2A=; b=0JtSDZ0s3z/2G5
	GUWTQdmZHqVkD0V/8s2S9hZpO9/1WWqomsFKXkcBXglLHexaJnwQwI76A48VpLYcM/TY3aBVXV706
	znLtpnaHPA67pJFxDAONiE8NEi2v/CSJWWZHEu6eodTxYzYT0HfuEhqHekvCWC5lFSV9eMTopy24E
	KmIbdOmW1ITf2+tzOz6XO9BH+6j/gjIhLO9XREGi95NMvLMZhPWdGaw5PTqH7FonGUQObL5c/JRvd
	bD6sFEU5mXuVvVA7bhFCOCToe697rAxKa/L7pFvIV+n1KjMKUZHIo5QvYfAz0d6O3OFpZScYYJZAw
	kRRr9UmCPoZCiNves70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4X7-00000007OF8-1B4O;
	Mon, 02 Jun 2025 12:44:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uM4Uu-00000007O1h-2uvO;
	Mon, 02 Jun 2025 12:42:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ABBFD4A52C;
	Mon,  2 Jun 2025 12:42:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D069C4CEEB;
	Mon,  2 Jun 2025 12:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748868155;
	bh=J8jwLwCGOlD4UX5mfWw+eqPyJEord+KPBbR+LYQWEs0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSqO/LFXXTIKqwNn7Bwr5oX05wCy2BwopOyVreSbRdtz4Lz/NXozxsM6Cvbcd79QL
	 hYLFS8aZXz4Xz2CELUsSs9PXAwsCnFT7ZNUOhENNv/FVpKS+VDdj32JkKLBlsIcsJR
	 sZ9fuQZY8Mw0hoJ4FoviZ0hE+5LORbBhrgGlu7IDcqASt4UE6eivg/cdW2XJtMxCzA
	 OsQ5/KWpn0ohL87BmonFjSyjbBXCax46yn/ndrL/scaXoeufeNZGfLi9t9C2eto8jv
	 JGa+PptDSrfVc9RjNw+WFJ57MzKSod1jo77d6/p3Yxyj4gLvQfnOqnBIb9JSItSw2+
	 kvYxRLIM5UJSw==
Date: Mon, 2 Jun 2025 07:42:33 -0500
From: Rob Herring <robh@kernel.org>
To: Balamanikandan.Gunasundar@microchip.com
Cc: miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
	claudiu.beznea@tuxon.dev, krzysztof.kozlowski+dt@linaro.org,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: mtd: microchip-nand: convert txt to
 yaml
Message-ID: <20250602124233.GA715676-robh@kernel.org>
References: <20250602053507.25864-1-balamanikandan.gunasundar@microchip.com>
 <20250602053507.25864-2-balamanikandan.gunasundar@microchip.com>
 <654d2653-9152-449c-b3ee-4a91c700045e@microchip.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <654d2653-9152-449c-b3ee-4a91c700045e@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250602_054236_778738_4F8EFD9B 
X-CRM114-Status: GOOD (  38.46  )
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

On Mon, Jun 02, 2025 at 06:58:52AM +0000, Balamanikandan.Gunasundar@microchip.com wrote:
> Hi,
> 
> On 02/06/25 11:05 am, Balamanikandan Gunasundar wrote:
> > Convert text to yaml for microchip nand controller
> > 
> > Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> > ---
> >   .../devicetree/bindings/mtd/atmel-nand.txt    |  50 ------
> >   .../mtd/microchip,nand-controller.yaml        | 169 ++++++++++++++++++
> >   2 files changed, 169 insertions(+), 50 deletions(-)
> >   create mode 100644 Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.txt b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > index e36c35b17873..dbbc17a866f2 100644
> > --- a/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.txt
> > @@ -1,53 +1,3 @@
> > -Atmel NAND flash controller bindings
> > -
> > -The NAND flash controller node should be defined under the EBI bus (see
> > -Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt).
> > -One or several NAND devices can be defined under this NAND controller.
> > -The NAND controller might be connected to an ECC engine.
> > -
> > -* NAND controller bindings:
> > -
> > -Required properties:
> > -- compatible: should be one of the following
> > -	"atmel,at91rm9200-nand-controller"
> > -	"atmel,at91sam9260-nand-controller"
> > -	"atmel,at91sam9261-nand-controller"
> > -	"atmel,at91sam9g45-nand-controller"
> > -	"atmel,sama5d3-nand-controller"
> > -	"microchip,sam9x60-nand-controller"
> > -- ranges: empty ranges property to forward EBI ranges definitions.
> > -- #address-cells: should be set to 2.
> > -- #size-cells: should be set to 1.
> > -- atmel,nfc-io: phandle to the NFC IO block. Only required for sama5d3
> > -		controllers.
> > -- atmel,nfc-sram: phandle to the NFC SRAM block. Only required for sama5d3
> > -		  controllers.
> > -
> > -Optional properties:
> > -- ecc-engine: phandle to the PMECC block. Only meaningful if the SoC embeds
> > -	      a PMECC engine.
> > -
> > -* NAND device/chip bindings:
> > -
> > -Required properties:
> > -- reg: describes the CS lines assigned to the NAND device. If the NAND device
> > -       exposes multiple CS lines (multi-dies chips), your reg property will
> > -       contain X tuples of 3 entries.
> > -       1st entry: the CS line this NAND chip is connected to
> > -       2nd entry: the base offset of the memory region assigned to this
> > -		  device (always 0)
> > -       3rd entry: the memory region size (always 0x800000)
> > -
> > -Optional properties:
> > -- rb-gpios: the GPIO(s) used to check the Ready/Busy status of the NAND.
> > -- cs-gpios: the GPIO(s) used to control the CS line.
> > -- det-gpios: the GPIO used to detect if a Smartmedia Card is present.
> > -- atmel,rb: an integer identifying the native Ready/Busy pin. Only meaningful
> > -	    on sama5 SoCs.
> > -
> > -All generic properties are described in the generic yaml files under
> > -Documentation/devicetree/bindings/mtd/.
> > -
> >   * ECC engine (PMECC) bindings:
> >   
> >   Required properties:
> > diff --git a/Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml b/Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
> > new file mode 100644
> > index 000000000000..2b0d03343611
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/mtd/microchip,nand-controller.yaml
> > @@ -0,0 +1,169 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/mtd/microchip,nand-controller.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Microchip NAND flash controller
> > +
> > +maintainers:
> > +  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> > +
> > +description: |

Don't need '|'

> > +  The NAND flash controller node should be defined under the EBI bus (see
> > +  Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt).

Please don't keep references to old bindings. Really, you should convert 
this binding first.

> > +  One or several NAND devices can be defined under this NAND controller.
> > +  The NAND controller might be connected to an ECC engine.
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - atmel,at91rm9200-nand-controller
> > +      - atmel,at91sam9260-nand-controller
> > +      - atmel,at91sam9261-nand-controller
> > +      - atmel,at91sam9g45-nand-controller
> > +      - atmel,sama5d3-nand-controller
> > +      - microchip,sam9x60-nand-controller
> > +
> > +  ranges:
> > +    description: empty ranges property to forward EBI ranges definitions.
> > +
> > +  ecc-engine:
> > +    description:
> > +      phandle to the PMECC block. Only meaningful if the SoC embeds a PMECC
> > +      engine. Refer microchip,pmecc.yaml
> > +
> > +  "#address-cells":
> > +    const: 2
> > +
> > +  "#size-cells":
> > +    const: 1
> nand-controller.yaml has this values defined as
> 
>    "#address-cells":
>      const: 1
> 
>    "#size-cells":
>      const: 0
> 
> I am unable to overwrite this as they are const values. Microchip's 
> nand_controller is a child node of ebi unlike other nand controllers 
> where i need to overwrite this. I didn't inherit nand-controller.yaml to 
> has this defined locally.

It is matching on the node name. More below...

> 
> I upgraded dtschema and ran dt_binding_check and dtb_check again for all 
> the bindings in this series as recommended in v2 comments. But I don't 
> get the error below
> 
> https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250311122847.90081-2-balamanikandan.gunasundar@microchip.com/
> 
> I am not sure what else I am missing. Your comments please?
> 
> Bala.
> 
> 
> > +
> > +  atmel,nfc-io:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the NFC IO block. Only applicable for atmel,sama5d3-nand-controller
> > +
> > +  atmel,nfc-sram:
> > +    $ref: /schemas/types.yaml#/definitions/phandle
> > +    description: phandle to the NFC SRAM block. Only applicable for atmel,sama5d3-nand-controller
> > +
> > +required:
> > +  - compatible
> > +  - ranges
> > +  - "#address-cells"
> > +  - "#size-cells"
> > +
> > +patternProperties:
> > +  "^nand@[a-f0-9]$":
> > +    type: object
> > +    $ref: raw-nand-chip.yaml#
> > +    description:
> > +      NAND chip bindings.
> > +
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      reg:
> > +        items:
> > +          - items:
> > +              - description: describes the CS lines assigned to the NAND device.
> > +              - description: the base offset of the memory region assigned to this device (always 0)
> > +              - description: the memory region size (always 0x800000)
> > +      rb-gpios:
> > +        description:
> > +          the GPIO(s) used to check the Ready/Busy status of the NAND.
> > +
> > +      cs-gpios:
> > +        description:
> > +          the GPIO(s) used to control the CS line.
> > +
> > +      det-gpios:
> > +        description:
> > +          the GPIO used to detect if a Smartmedia Card is present.
> > +
> > +      atmel,rb:
> > +        description: |

Don't need '|'.

> > +          an integer identifying the native Ready/Busy pin.
> > +        $ref: /schemas/types.yaml#/definitions/uint32

Constraints? I'd assume there's a limit much lower than 2^32.

> > +
> > +      nand-ecc-step-size:
> > +        const: 512
> > +
> > +      nand-ecc-strength:
> > +        enum: [2, 4, 8]
> > +
> > +      nand-ecc-mode:
> > +        enum: [soft, hw]
> > +
> > +      nand-bus-width:
> > +        const: 8
> > +
> > +      nand-on-flash-bbt: true
> > +
> > +      partitions:
> > +        $ref: /schemas/mtd/partitions/partitions.yaml
> > +
> > +      label:
> > +        description: Name or Label of the device
> > +
> > +    allOf:
> > +      - if:
> > +          properties:
> > +            compatible:
> > +              contains:
> > +                const: atmel,sama5d3-nand-controller
> > +        then:
> > +          properties:
> > +            "atmel,rb":
> > +              description: an integer identifying the native Ready/Busy pin.

This is wrong. This sub-schema applies to the 'nand' nodes, but 
compatible is in the parent node for which the sub-schema has no 
visibility. The 'if' is always true because 'compatible' is not present. 
The 'then' is also always true. I would just drop the constraint.

> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    nfc_io: nfc-io@70000000 {
> > +        compatible = "atmel,sama5d3-nfc-io", "syscon";
> > +        reg = <0x70000000 0x8000000>;
> > +    };
> > +
> > +    nfc_sram: sram@200000 {
> > +        compatible = "mmio-sram";
> > +        no-memory-wc;
> > +        reg = <0x200000 0x2400>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +        ranges = <0 0x200000 0x2400>;
> > +    };
> > +
> > +    ebi@10000000 {
> > +        compatible = "atmel,sama5d3-ebi";
> > +        #address-cells = <2>;
> > +        #size-cells = <1>;
> > +        atmel,smc = <&hsmc>;
> > +        reg = <0x10000000 0x10000000
> > +               0x40000000 0x30000000>;
> > +        ranges = <0x0 0x0 0x10000000 0x10000000
> > +                  0x1 0x0 0x40000000 0x10000000
> > +                  0x2 0x0 0x50000000 0x10000000
> > +                  0x3 0x0 0x60000000 0x10000000>;
> > +        clocks = <&mck>;
> > +
> > +        nand_controller: nand-controller {
> > +            compatible = "atmel,sama5d3-nand-controller";
> > +            atmel,nfc-sram = <&nfc_sram>;
> > +            atmel,nfc-io = <&nfc_io>;
> > +            ecc-engine = <&pmecc>;
> > +            #address-cells = <2>;
> > +            #size-cells = <1>;
> > +            ranges;

I think this should be '<0x3 0x3 0x0>' to translate this from a EBI 
chipselect to the nand chip chipselect.

> > +
> > +            nand@3 {
> > +                reg = <0x3 0x0 0x800000>;

And then just 'reg = <3>;' here.

That assumes changing this would work with the existing driver.

Otherwise, we might need to add 'select: false' to nand-controller.yaml 
and make sure all the controller schemas reference it (except this one).

Rob

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/
