Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D71E4C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 16:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cT7QFjMiLQfHIDiCJYP+xiquiHDhJ8rCVZ8LJY/Ypuk=; b=e7wd4kDthKBcv9msTpV3Vg4uTv
	upZ+QcdV4xim/fyG/Hy6GCWP1VsxwfySz+uX0p4IGpwdsIMDq7M9xK4NR/41GZDotpDm1voAUBaHz
	/zD69jye+TQxmcRqsogrmFpOGc0KZ0fd+daCj/IR+qIQv1dVGMxPSveSVX3f7FYt8jiA4rIRXbGab
	kQVwFwxKxCjVn5+UkmY7CxT7J2fL5DmNXEezB/51L4kWwEXetrc9ZsSS1qSKTL0MrE22UjhkUhooo
	XlrM4UxVmZ/2YoRrFzLBMhrWS/Wco+3PW5nQ/34jymSwh1HoBDaJQ0InFptT7H7S9s//p7pEaED85
	AaE40ukQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyun-00000000Kbk-4Bon;
	Wed, 20 Mar 2024 16:35:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyuk-00000000KaS-13vw;
	Wed, 20 Mar 2024 16:35:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9BE9CE117C;
	Wed, 20 Mar 2024 16:35:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E190DC433F1;
	Wed, 20 Mar 2024 16:35:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710952538;
	bh=XXysw+Fp50tmDvgt52SH9gz9silSVStNGQhh5AqQXC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P3Q641ILZ0No81xX3jZUcFVi2vSrDDqy73xLyc1DCJv8XVFZoxDQVYAvUBfFLzoEa
	 qDkncCb/4CouGt8j9uXafZWnwzc4dBg/xC7IKmXFOUyBK7YQp6WUxko+WX3qOK7vrA
	 K5W9LJSFT5DgE+CGt4cB++/1nmew5/L+znkLT1clGllGiTvdVQWEPLngqN4/J6fafv
	 GP7BZymDBz825X6b5+QrOdBNZ/lMPp2CnwiCerKQvN6Lq/gR+77S5Appm/rgtwvDXv
	 gg9hPKerTHSeWg17roDqwlZlyt+7BuZ6dGqnBzMHBjAkqfm5wM8/NY4tpdQVSQIDrJ
	 OqRObsj3u+rjQ==
Date: Wed, 20 Mar 2024 16:35:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: mtd: atmel-nand: convert txt to yaml
Message-ID: <20240320-quicksand-attentive-14610103237b@spud>
References: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
 <20240320-linux-next-nand-yaml-v1-1-2d2495363e88@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240320-linux-next-nand-yaml-v1-1-2d2495363e88@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_093542_674695_A6B983EB 
X-CRM114-Status: GOOD (  31.65  )
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
Content-Type: multipart/mixed; boundary="===============5622311521397533768=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5622311521397533768==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="c4iHnKnVlwr9DxCN"
Content-Disposition: inline


--c4iHnKnVlwr9DxCN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 11:22:07AM +0530, Balamanikandan Gunasundar wrote:
> Convert text to yaml for atmel nand controller
>=20
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@micro=
chip.com>
> ---
>  .../devicetree/bindings/mtd/atmel-nand.txt         |  50 -------
>  .../devicetree/bindings/mtd/atmel-nand.yaml        | 166 +++++++++++++++=
++++++
>  MAINTAINERS                                        |   2 +-
>  3 files changed, 167 insertions(+), 51 deletions(-)
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand.yaml b/Docu=
mentation/devicetree/bindings/mtd/atmel-nand.yaml
> new file mode 100644
> index 000000000000..a5482d292293
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand.yaml

Filename matching a compatible please.

> @@ -0,0 +1,166 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/atmel-nand.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel NAND flash controller
> +
> +maintainers:
> +  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> +
> +description: |
> +  The NAND flash controller node should be defined under the EBI bus (see
> +  Documentation/devicetree/bindings/memory-controllers/atmel,ebi.txt|yam=
l).

text|yaml?

> +  One or several NAND devices can be defined under this NAND controller.
> +  The NAND controller might be connected to an ECC engine.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:

This is just an enum, drop the items and oneof.

> +              - atmel,at91rm9200-nand-controller
> +              - atmel,at91sam9260-nand-controller
> +              - atmel,at91sam9261-nand-controller
> +              - atmel,at91sam9g45-nand-controller
> +              - atmel,sama5d3-nand-controller
> +              - microchip,sam9x60-nand-controller
> +
> +  ranges:
> +    description: empty ranges property to forward EBI ranges definitions.
> +
> +  ecc-engine:
> +    description:
> +      phandle to the PMECC block. Only meaningful if the SoC embeds a PM=
ECC
> +      engine.
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - atmel,at91rm9200-nand-controller
> +              - atmel,at91sam9260-nand-controller
> +              - atmel,at91sam9261-nand-controller
> +              - atmel,at91sam9g45-nand-controller
> +              - atmel,sama5d3-nand-controller
> +              - microchip,sam9x60-nand-controller
> +    then:
> +      properties:
> +        "#address-cells":
> +          const: 2
> +
> +        "#size-cells":
> +          const: 1

Why is this in an if? Isn't this all of the devices in the binding?

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: atmel,sama5d3-nand-controller
> +    then:
> +      properties:
> +        atmel,nfc-io:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description: phandle to the NFC IO block.
> +
> +        atmel,nfc-sram:
> +          $ref: /schemas/types.yaml#/definitions/phandle
> +          description: phandle to the NFC SRAM block

Please define the properties at the top level and use if statements to
constrain them.

> +
> +required:
> +  - compatible
> +  - ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +patternProperties:
> +  "^nand@[a-f0-9]$":
> +    type: object
> +    $ref: nand-chip.yaml#
> +    description:
> +      NAND chip bindings. All generic properties described in
> +      Documentation/devicetree/bindings/mtd/{common,nand}.txt also apply=
 to
> +      the NAND device node, and NAND partitions should be defined under =
the
> +      NAND node as described in
> +      Documentation/devicetree/bindings/mtd/partition.txt.

These files do not exist.

> +    properties:
> +      reg:
> +        minItems: 1
> +        description:
> +          describes the CS lines assigned to the NAND device. If the NAN=
D device
> +          exposes multiple CS lines (multi-dies chips), your reg propert=
y will
> +          contain X tuples of 3 entries.

The "if" here is not accurate. Your binding mandates there being 3
entries.

> +         reg =3D <0x3 0x0 0x800000>;
> +          1st entry - the CS line this NAND chip is connected to
> +          2nd entry - the base offset of the memory region assigned to t=
his
> +                      device (always 0)
> +          3rd entry - the memory region size (always 0x800000)
> +
> +      rb-gpios:
> +        description:
> +          the GPIO(s) used to check the Ready/Busy status of the NAND.
> +
> +      cs-gpios:
> +        description:
> +          the GPIO(s) used to control the CS line.
> +
> +      det-gpios:
> +        description:
> +          the GPIO used to detect if a Smartmedia Card is present.
> +
> +      "atmel,rb":
> +        description:
> +          an integer identifying the native Ready/Busy pin. Only meaning=
ful
> +          on sama5 SoCs.

Then please constrain it to sama5 SoCs only :)

> +        $ref: /schemas/types.yaml#/definitions/uint32
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nfc_io: nfc-io@70000000 {
> +            compatible =3D "atmel,sama5d3-nfc-io", "syscon";
> +            reg =3D <0x70000000 0x8000000>;
> +    };

What's this got to do with the binding?

> +    pmecc: ecc-engine@ffffc070 {
> +            compatible =3D "atmel,at91sam9g45-pmecc";
> +            reg =3D <0xffffc070 0x490>,
> +                  <0xffffc500 0x100>;
> +    };
> +
> +    ebi: ebi@10000000 {

Drop the unused label.

Same applies here, read the coding style about how to write dts nodes
please.

Thanks,
Conor.

> +            compatible =3D "atmel,sama5d3-ebi";
> +            #address-cells =3D <2>;
> +            #size-cells =3D <1>;
> +            atmel,smc =3D <&hsmc>;
> +            reg =3D <0x10000000 0x10000000
> +                   0x40000000 0x30000000>;
> +            ranges =3D <0x0 0x0 0x10000000 0x10000000
> +                      0x1 0x0 0x40000000 0x10000000
> +                      0x2 0x0 0x50000000 0x10000000
> +                      0x3 0x0 0x60000000 0x10000000>;
> +            clocks =3D <&mck>;
> +
> +            nandflash_controller: nandflash-controller {
> +                    compatible =3D "atmel,sama5d3-nand-controller";
> +                    ecc-engine =3D <&pmecc>;
> +                    #address-cells =3D <2>;
> +                    #size-cells =3D <1>;
> +                    ranges;
> +
> +                    nand@3 {
> +                            reg =3D <0x3 0x0 0x800000>;
> +                            atmel,rb =3D <0>;
> +
> +                            /*
> +                             * Put generic NAND/MTD properties and
> +                             * subnodes here.
> +                             */
> +                    };
> +             };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b6582bd3eb2c..3f2a6756223f 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -14503,7 +14503,7 @@ MICROCHIP NAND DRIVER
>  M:	Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
>  L:	linux-mtd@lists.infradead.org
>  S:	Supported
> -F:	Documentation/devicetree/bindings/mtd/atmel-nand.txt
> +F:	Documentation/devicetree/bindings/mtd/atmel-*.yaml
>  F:	drivers/mtd/nand/raw/atmel/*
> =20
>  MICROCHIP OTPC DRIVER
>=20
> --=20
> 2.25.1
>=20

--c4iHnKnVlwr9DxCN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfsQVQAKCRB4tDGHoIJi
0koTAP4tmQxWlMJxtREutkSakIUYmZspbFGKbQ8eJnAwETV95AD/Y/aeQTbfPVFf
J+/ZBy5T6kUykFIsMfA9+lz5Yea25gM=
=yzG5
-----END PGP SIGNATURE-----

--c4iHnKnVlwr9DxCN--


--===============5622311521397533768==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5622311521397533768==--

