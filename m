Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0E5C6FD1F
	for <linux-mtd@archiver.kernel.org>; Wed, 20 Mar 2024 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i3arbXKmrdjMQv43CY4Okm+wXple6j3kDp6kw3FzzBQ=; b=t4zn6VVhsewB4TLOG2fMKwoXQ7
	9u9lpSxIt3prBR5qoYYGpMNq8q2eZEF/qfRLUBx2duHq+XtIGZDos9AN5bpnV75sbq68OaOKJETsV
	jv5Z1ZkPJBmn1tApefgMdZhkZu6AMSSnmTxj7xuITH/LgWKRSFQdLaOEO0maBXpgNbBJ36Q75Onet
	i1iOsgMf0wn8hxl9t/VN4ZMkjHQC4Y4PCYKNTN9mCUJAHdGyFwmitTXpNGIZLvAuA6LBaxePffo3h
	gCXHhGFmR+KMKOjzLW/AGhqK4EGKRd8q8FT+Zoiu228DpKlPKWKOtAjhy8Sks1shhoOf8FX9fQOyZ
	TG4D9wYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyzF-00000000Ltt-3rId;
	Wed, 20 Mar 2024 16:40:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyzC-00000000LsW-0KXV;
	Wed, 20 Mar 2024 16:40:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 49A3FCE10EA;
	Wed, 20 Mar 2024 16:40:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7EBEC433F1;
	Wed, 20 Mar 2024 16:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710952815;
	bh=1Jiit+psOx+w3ZLWPRwFAlOd6Nj6twJmRshP++j8nWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MOKmvughlofy+rngsD/rKW+tCtOXQ3l2f8RY8A0GFHgGpvF+Yp5g5+Xro8AMAfuOk
	 8cIjDMngUJyF2j5GMFwV62c2hbj+c3n5BNdvvZy5FSfq88SMfe9NskXd3wca1GI9Nu
	 /+bJZtXHsrDy+2RVIeG4oIKq3bfZtGiSIhkRtcRs1RgBaYCxwsSugXPCh/1dpVElSy
	 FDjTqg+lH/SfLdC/5sfX5APEWpUreM8khaEFlqw/T33kWhF9IGER4+eoLr6agn9xDs
	 l7edI1tFVbcr8sPGdFtw4zhY0aCOJX9CUfbwGlrTLz8vGvweZo3PE6F/EwIPc3hF5G
	 5NH3NWc+ylUFg==
Date: Wed, 20 Mar 2024 16:40:10 +0000
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
Subject: Re: [PATCH 2/3] dt-bindings: mtd: atmel-nand: add atmel pmecc
Message-ID: <20240320-unafraid-fidelity-669f937c846a@spud>
References: <20240320-linux-next-nand-yaml-v1-0-2d2495363e88@microchip.com>
 <20240320-linux-next-nand-yaml-v1-2-2d2495363e88@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240320-linux-next-nand-yaml-v1-2-2d2495363e88@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_094018_503775_9A3AC40B 
X-CRM114-Status: GOOD (  17.27  )
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
Content-Type: multipart/mixed; boundary="===============4115029093222492054=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4115029093222492054==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Z/ovpiDLJ7pJUqlX"
Content-Disposition: inline


--Z/ovpiDLJ7pJUqlX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 20, 2024 at 11:22:08AM +0530, Balamanikandan Gunasundar wrote:
> Add bindings for programmable multibit error correction code controller
> (PMECC).
>=20
> Signed-off-by: Balamanikandan Gunasundar <balamanikandan.gunasundar@micro=
chip.com>
> diff --git a/Documentation/devicetree/bindings/mtd/atmel-pmecc.yaml b/Doc=
umentation/devicetree/bindings/mtd/atmel-pmecc.yaml

Filename matching a compatible please.

> new file mode 100644
> index 000000000000..872401e9dda3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/atmel-pmecc.yaml
> @@ -0,0 +1,58 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mtd/atmel-pmecc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Microchip pmecc controller
> +
> +maintainers:
> +  - Balamanikandan Gunasundar <balamanikandan.gunasundar@microchip.com>
> +
> +description: |
> +  Bindings for microchip Programmable Multibit Error Correction Code
> +  Controller (PMECC). pmecc is a programmable BCH encoder/decoder. This
> +  block is passed as the value to the "ecc-engine" property of microchip
> +  nand flash controller node.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - atmel,at91sam9g45-pmecc
> +          - atmel,sama5d2-pmecc
> +          - atmel,sama5d4-pmecc
> +          - microchip,sam9x60-pmecc
> +          - microchip,sam9x7-pmecc
> +      - items:
> +          - const: microchip,sam9x60-pmecc
> +          - const: atmel,at91sam9g45-pmecc
> +
> +  reg:
> +    description:
> +      The first should point to the PMECC block. The second should point=
 to the
> +      PMECC_ERRLOC block.

Constraints please. In fact, describe it as an items list and then you
don't need constraints or a free-form text explanation of what each
entry is :)

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: microchip,sam9x7-pmecc
> +    then:
> +      properties:
> +        clocks:
> +          description:
> +            The clock source for pmecc controller
> +          maxItems: 1

Please define the property at the top level and constrain it on a per
device basis.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    pmecc: ecc-engine@ffffc070 {

Drop the unused label please.

Thanks,
Conor.

> +            compatible =3D "microchip,sam9x7-pmecc";
> +            reg =3D <0xffffe000 0x300>,
> +                  <0xffffe600 0x100>;
> +            clocks =3D <&pmc 2 48>;
> +    };
>=20
> --=20
> 2.25.1
>=20

--Z/ovpiDLJ7pJUqlX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZfsRagAKCRB4tDGHoIJi
0gpnAPsFDklQs2uawCixXd1EqxeDXmWagdQ0y/IUTND16hB7UgEA/SExCMWY8kCh
TPV2Y3aXY+TdAAOAGsf6xL8p9JGcPQ8=
=c65W
-----END PGP SIGNATURE-----

--Z/ovpiDLJ7pJUqlX--


--===============4115029093222492054==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4115029093222492054==--

