Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 844B1C54E58
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 16:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DR+XLJzmcKYBiEzp1hUmkGNvYvWZinkFJNEUhfb7ZaY=; b=sXttI8zHvwbAa3vPtu+mcrMrkS
	tkTfhtzhQCYxMydpiFnCmIMtcXbulpv35A2l97XEClM+obW2NohC+w09M4nEZDoXHjmAi3O8ycZHx
	jU6w0tVMl2EfqnkoaFd1iYKe6W0ZHYuguuXLtn7UozD/nTvyJloIqBbMUfG1vvSW8y+4wdQlwqALj
	i4s+FQgHKJWl3zyVwNcVoRaoy+FNcSveRXmsndq1dlzy4FTOmE3wmEr060UDzuPt2y8j/zwe9klKS
	YyUjPj3sHNo1HyGxA2OnVIgkHLy97Cac6W4xoH/Z32aOykw4KcU5H1x+OJLH3CZRiIRt8u9B46p3z
	8YVh8X5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmylX-00000000Iml-1Qz2;
	Wed, 20 Mar 2024 16:26:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmylR-00000000Ilp-3hB0;
	Wed, 20 Mar 2024 16:26:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 655C161040;
	Wed, 20 Mar 2024 16:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47769C433F1;
	Wed, 20 Mar 2024 16:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710951963;
	bh=AbAffIR7MFEWLLKn/T3bv0OnBju5rB/FzYNjiIim1XI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OeAzk6+Uknf8lI/ls+NRpQRLUwIHUEClV0ZXFnBYSj6z1K3MssrjL31lHxT2bdSxI
	 7tASlVdmjqFVCz9xbohcXZ6pRB8R3lnoQdhJQrkcB+szwi594VbhF2Ekpqrac6UfE7
	 5ZwqjuCfzovF2sNiDf6sWvpOiIveEP7EjcsGtFK34APyQT6zRiPNIURKHIRyt2cMay
	 ZTszs7Ugs4kgtgDNdt8eC+Q4xcYyEoXNKlFboaYn0gzp4Qt/L8VgLTqwlF4n7kJiDf
	 ZguGeuiAa6AWvvoaz46nzuVTUzlP4JDCVagVMC0BgiP3dY+G2/npXF0VVm+CdMmOdr
	 jd7UPX0jhxUsA==
Date: Wed, 20 Mar 2024 16:25:58 +0000
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
Subject: Re: [PATCH 3/3] dt-bindings: mtd: atmel-nand: add deprecated bindings
Message-ID: <20240320-audibly-emoticon-400e3a42550b@spud>
References: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
 <20240320-linux-next-nand-yaml-v1-3-2d2495363e88@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240320-linux-next-nand-yaml-v1-3-2d2495363e88@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_092606_232509_AD16C731 
X-CRM114-Status: GOOD (  35.20  )
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
Content-Type: multipart/mixed; boundary="===============6614246082430141576=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6614246082430141576==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="bLcjqDi7D14ZgMoA"
Content-Disposition: inline


--bLcjqDi7D14ZgMoA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 11:22:09AM +0530, Balamanikandan Gunasundar wrote:
> Add nand bindings for legacy nand controllers. These bindings are not used
> with the new device trees. This is still maintained to support legacy dt
> bindings.
>=20
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@micro=
chip.com>
> ---
>  .../bindings/mtd/atmel-nand-deprecated.yaml        | 156 +++++++++++++++=
++++++
>  .../devicetree/bindings/mtd/atmel-nand.txt         | 116 ---------------
>  2 files changed, 156 insertions(+), 116 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-nand-deprecated.=
yaml b/Documentation/devicetree/bindings/mtd/atmel-nand-deprecated.yaml
> new file mode 100644
> index 000000000000..c8922ab0f1d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-nand-deprecated.yaml

Node name matching the devices please.

> @@ -0,0 +1,156 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/atmel-nand-deprecated.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel NAND flash controller deprecated bindings

/stuff/linux-dt/Documentation/devicetree/bindings/mtd/atmel-nand-deprecated=
=2Eyaml: title: 'Atmel NAND flash controller deprecated bindings' should no=
t be valid under {'pattern': '([Bb]inding| [Ss]chema)'}
	hint: Everything is a binding/schema, no need to say it. Describe what har=
dware the binding is for.

> +
> +maintainers:
> +  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> +
> +description: |
> +  This should not be used in the new device trees.

If these should not be used in new files, where are the replacement
bindings for the three devices listed here? I think, rather than being
deprecated, these are the only bindings for these devices and what you
actually want to say here is that these should not be used for /new
devices/. I'd drop mention of deprecation from the title as these
bindings are the only ones for this hardware AFAICT and just say that
new devices should be documented in $new_file.

> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91rm9200-nand
> +      - atmel,sama5d2-nand
> +      - atmel,sama5d4-nand
> +
> +  reg:

Missing constraints.

> +    description:
> +      should specify localbus address and size used for the chip, and
> +      hardware ECC controller if available. If the hardware ECC is PMECC,
> +      it should contain address and size for PMECC and PMECC Error Locat=
ion
> +      controller.  The PMECC lookup table address and size in ROM is
> +      optional. If not specified, driver will build it in runtime.
> +
> +  atmel,nand-addr-offset:
> +    description:
> +      offset for the address latch.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Missing constraints.

> +
> +  atmel,nand-cmd-offset:
> +    description:
> +      offset for the command latch.
> +    $ref: /schemas/types.yaml#/definitions/uint32

Missing contraints.

> +
> +  "#address-cells":
> +    description:
> +      Must be present if the device has sub-nodes representing partitions

Does this binding even allow partition child nodes? Hint: it doesn't.

> +  "#size-cells":
> +    description:
> +      Must be present if the device has sub-nodes representing partition=
s.
> +
> +  gpios:
> +    description:
> +      specifies the gpio pins to control the NAND device. detect is an
> +      optional gpio and may be set to 0 if not present.

Missing constraints (and maybe a type too? I dunno if "gpios" has a
special case in the -gpios regexes).

> +  atmel,nand-has-dma:
> +    description:
> +      support dma transfer for nand read/write.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  atmel,has-pmecc:
> +    description:
> +      enable Programmable Multibit ECC hardware, capable of BCH encoding
> +      and decoding, on devices where it is present.
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  nand-on-flash-bbt:
> +    description:
> +      enable on flash bbt option if not present false
> +    $ref: /schemas/types.yaml#/definitions/flag
> +
> +  nand-ecc-mode:

Missing a default since this is optional.

> +    description:
> +      operation mode of the NAND ecc mode, soft by default.  Supported
> +    enum:
> +      [none, soft, hw, hw_syndrome, hw_oob_first, soft_bch]
> +    $ref: /schemas/types.yaml#/definitions/string
> +
> +  atmel,pmecc-cap:
> +    description:
> +      error correct capability for Programmable Multibit ECC Controller.=
 If
> +      the compatible string is "atmel,sama5d2-nand", 32 is also valid.
> +    enum:
> +      [2, 4, 8, 12, 24]

You're missing an extra permitted value for the sama5d2.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  atmel,pmecc-sector-size:

Missing a default since this is optional.

> +    description:
> +      sector size for ECC computation.
> +    enum:
> +      [512, 1024]
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  atmel,pmecc-lookup-table-offset:

Missing a default since this is optional.

> +    description:
> +      includes two offsets of lookup table in ROM for different sector
> +      size. First one is for sector size 512, the next is for sector size
> +      1024. If not specified, driver will build the table in runtime.
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +
> +  nand-bus-width:
> +    description:
> +      nand bus width
> +    enum:
> +      [8, 16]

Missing a default of 8 here.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +

You're missing the optional child node for the "nand flash controller" on
sama5d2.

> +required:
> +  - compatible
> +  - reg
> +  - atmel,nand-addr-offset
> +  - atmel,nand-cmd-offset
> +  - "#address-cells"
> +  - "#size-cells"
> +  - gpios
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    nand0: nand@40000000,0 {

Drop the unused node name.

> +            compatible =3D "atmel,at91rm9200-nand";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +            reg =3D <0x40000000 0x10000000
> +                   0xffffe800 0x200>;
> +            atmel,nand-addr-offset =3D <21>;	/* ale */
> +            atmel,nand-cmd-offset =3D <22>;	/* cle */
> +            nand-on-flash-bbt;
> +            nand-ecc-mode =3D "soft";
> +            gpios =3D <&pioC 13 0	/* rdy */
> +                     &pioC 14 0 /* nce */
> +                     0		/* cd */
> +                    >;

Please follow the coding style rather than copy-paste from the text
based binding. Applies to both examples. An example with the nfc would
be more helpful than two bindings for the same device.


Thanks,
Conor.

> +    };
> +  - |
> +    /* for PMECC supported chips */
> +    nand1@40000000 {
> +            compatible =3D "atmel,at91rm9200-nand";
> +            #address-cells =3D <1>;
> +            #size-cells =3D <1>;
> +            reg =3D <0x40000000 0x10000000	/* bus addr & size */
> +                   0xffffe000 0x00000600	/* PMECC addr & size */
> +                   0xffffe600 0x00000200	/* PMECC ERRLOC addr & size */
> +                   0x00100000 0x00100000>;	/* ROM addr & size */
> +
> +            atmel,nand-addr-offset =3D <21>;	/* ale */
> +            atmel,nand-cmd-offset =3D <22>;	/* cle */
> +            nand-on-flash-bbt;
> +            nand-ecc-mode =3D "hw";
> +            atmel,has-pmecc;	/* enable PMECC */
> +            atmel,pmecc-cap =3D <2>;
> +            atmel,pmecc-sector-size =3D <512>;
> +            atmel,pmecc-lookup-table-offset =3D <0x8000 0x10000>;
> +            gpios =3D <&pioD 5 0	/* rdy */
> +                     &pioD 4 0	/* nce */
> +                     0		/* cd */
> +                    >;
> +    };

--bLcjqDi7D14ZgMoA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfsOFQAKCRB4tDGHoIJi
0t3kAP9jY8HZKToi98ltz47V6tQojJLjSgDRdnCw6LafnC0+wgD+JYw2mnTfdEk6
AskqOwNiZoOOmlMA/wdsvn9DUlQKOwo=
=XKaT
-----END PGP SIGNATURE-----

--bLcjqDi7D14ZgMoA--


--===============6614246082430141576==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6614246082430141576==--

