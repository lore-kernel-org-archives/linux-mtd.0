Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC25C4725D
	for <linux-mtd@archiver.kernel.org>; Fri, 19 Jan 2024 17:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PV7A8mvozKcxHXGodA5O5GbcIG9GH90xYmr2DrM60eU=; b=VrN0/3TGAEG8tlYWR9Tkr3gRu3
	P0htOOU+zUtyI+eCpjWgnjSUOaZ1nBFVdNKWmEq3WEcqxLFKfQh2OLHStcCGmXaV2SOJH2wVdkS9X
	ARQgFY11F11c74KhbMB1ywwX3EJljFfIRHT144zwRpA/T6Ty5n6l8uOOFWoO5D0dafr7wfbpArot9
	NhurtkfkIz2jHsVRz9q4zQm932yQzTLLA9tqbWzU+1xbGXSr/hMqhWyJKZCmBtgh7h9VDvcRkjkf4
	CfgPQDQS/MUVBHArvBkJItKYU7lkZxfNqhbCO8UAbuPG4kSyFR1X36SaAl4iKUIJBlmcDnBTfOp1w
	4nHGxH7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsQo-006EGD-2w;
	Fri, 19 Jan 2024 17:13:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsQc-006E72-13;
	Fri, 19 Jan 2024 17:13:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D707D61A0A;
	Fri, 19 Jan 2024 17:12:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F990C43394;
	Fri, 19 Jan 2024 17:12:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705684362;
	bh=Dcqp7/pvJEgygQnbr91Pot2HzAlXhB7Lg1wmlCmNdS0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E62nRLONJ54r1VfXOfJeKQpH3lMD7CqZEk1T1QCWb60NJ6PGZl1AGmK+y3AegaCRM
	 HGA7YiFHDGPHfZVAuVwCn0dy6gMNCpMDi7XZd3f+DnPJU7s2R5j2P1xbPszf6QkRrl
	 JcjZZqiIsy61Gejd2kXH9IGI2nIE5awBhIoKBI/TSRuMHZ5KRJNqGhBIp/Xxe4TgL1
	 zKy6aG7vYCBrev7JS2LPlqjpkpuS5GpEUN/wIctjlshngnW9WObvRY0ttm0Vmq3eC/
	 NbjCp9Iz1WNLaKPeIqcHGt3o1OPLHfgonsycpinafcSo/oF08Q3GAOJRcT3kwb8e71
	 AgHmQ0CiTN8wQ==
Date: Fri, 19 Jan 2024 17:12:35 +0000
From: Conor Dooley <conor@kernel.org>
To: dregan@broadcom.com
Cc: dregan@mail.com, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	computersforpeace@gmail.com, kdasu.kdev@gmail.com,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, joel.peshkin@broadcom.com,
	tomer.yacoby@broadcom.com, dan.beygelman@broadcom.com,
	william.zhang@broadcom.com, anand.gore@broadcom.com,
	kursad.oney@broadcom.com, florian.fainelli@broadcom.com,
	rafal@milecki.pl, bcm-kernel-feedback-list@broadcom.com,
	andre.przywara@arm.com, baruch@tkos.co.il,
	linux-arm-kernel@lists.infradead.org, dan.carpenter@linaro.org
Subject: Re: [PATCH v2 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
Message-ID: <20240119-retiree-fanciness-0f7bb37c4633@spud>
References: <20240118195356.133391-1-dregan@broadcom.com>
 <20240118195356.133391-2-dregan@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240118195356.133391-2-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_091314_477491_09A547F1 
X-CRM114-Status: GOOD (  33.73  )
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
Content-Type: multipart/mixed; boundary="===============0375588872205033729=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0375588872205033729==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jcqjXZ8cGgfI18QE"
Content-Disposition: inline


--jcqjXZ8cGgfI18QE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 18, 2024 at 11:53:47AM -0800, dregan@broadcom.com wrote:
> From: William Zhang <william.zhang@broadcom.com>
>=20
> Update the descriptions to reflect different families of broadband SoC and
> use the general name bcmbca for ARM based SoC.
>=20
> Add brcm,nand-use-wp property to have an option for disabling this
> feature on broadband board design that does not use write protection.
>=20
> Add brcm,nand-ecc-use-strap to get ecc setting from board boot strap for
> broadband board designs because they do not specify ecc setting in dts
> but rather using the strap setting.
>=20
> Remove the requirement of interrupts property to reflect the driver
> code. Also add myself to the list of maintainers.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>
> Reviewed-by: David Regan <dregan@broadcom.com>
> ---
> Changes in v2:
> - Revert the new compatible string nand-bcmbca
> - Drop the BCM63168 compatible fix to avoid any potential ABI
> incompatibility issue
> - Simplify the explanation for brcm,nand-use-wp
> - Keep the interrupt name requirement when interrupt number is specified
> ---
>  .../bindings/mtd/brcm,brcmnand.yaml           | 36 +++++++++++++++----
>  1 file changed, 30 insertions(+), 6 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/D=
ocumentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> index f57e96374e67..56176ec1a992 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> @@ -9,6 +9,7 @@ title: Broadcom STB NAND Controller
>  maintainers:
>    - Brian Norris <computersforpeace@gmail.com>
>    - Kamal Dasu <kdasu.kdev@gmail.com>
> +  - William Zhang <william.zhang@broadcom.com>
> =20
>  description: |
>    The Broadcom Set-Top Box NAND controller supports low-level access to =
raw NAND
> @@ -18,9 +19,10 @@ description: |
>    supports basic PROGRAM and READ functions, among other features.
> =20
>    This controller was originally designed for STB SoCs (BCM7xxx) but is =
now
> -  available on a variety of Broadcom SoCs, including some BCM3xxx, BCM63=
xx, and
> -  iProc/Cygnus. Its history includes several similar (but not fully regi=
ster
> -  compatible) versions.
> +  available on a variety of Broadcom SoCs, including some BCM3xxx, MIPS =
based
> +  Broadband SoC (BCM63xx), ARM based Broadband SoC (BCMBCA) and iProc/Cy=
gnus.
> +  Its history includes several similar (but not fully register compatibl=
e)
> +  versions.
> =20
>    -- Additional SoC-specific NAND controller properties --
> =20
> @@ -53,7 +55,7 @@ properties:
>                - brcm,brcmnand-v7.2
>                - brcm,brcmnand-v7.3
>            - const: brcm,brcmnand
> -      - description: BCM63138 SoC-specific NAND controller
> +      - description: BCMBCA SoC-specific NAND controller
>          items:
>            - const: brcm,nand-bcm63138
>            - enum:
> @@ -65,7 +67,7 @@ properties:
>            - const: brcm,nand-iproc
>            - const: brcm,brcmnand-v6.1
>            - const: brcm,brcmnand
> -      - description: BCM63168 SoC-specific NAND controller
> +      - description: BCM63xx SoC-specific NAND controller
>          items:
>            - const: brcm,nand-bcm63168
>            - const: brcm,nand-bcm6368
> @@ -111,6 +113,17 @@ properties:
>        earlier versions of this core that include WP
>      type: boolean
> =20
> +  brcm,nand-use-wp:
> +    description:
> +      Use this property to indicate if board design uses
> +      controller's write protection feature and connects its
> +      NAND_WPb pin to nand chip's WP_L pin. Driver defaults to
> +      use this feature when this property does not exist.
> +      Set to 0 if WP pins are not connected and feature is not
> +      used. Set to 1 if WP pins are connected and feature is used.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]

This property does not make sense to me. "Driver defaults to use this
feature when the property does not exist" - either the property name is
backwards or the description is. Secondly, I don't get why the property
is an enum in the first place - depending on which if the name or
description is wrong, either 0 or 1 would overlap with the default.

>  patternProperties:
>    "^nand@[a-f0-9]$":
>      type: object
> @@ -137,6 +150,16 @@ patternProperties:
>            layout.
>          $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +      brcm,nand-ecc-use-strap:
> +        description:
> +          This flag is used by the driver to get the ecc strength and
> +          spare area size from the SoC NAND boot strap setting. This
> +          is commonly used by the BCMBCA SoC board design. If ecc
> +          strength and spare area size are set by nand-ecc-strength
> +          and brcm,nand-oob-sector-size in the dts, these settings
> +          have precedence and override this flag.
> +        $ref: /schemas/types.yaml#/definitions/flag

This property I'm not all that sure about either. If the specific
properties that you mention here are not set in the DT what happens at
the moment?

I suppose what I am getting at is why are the bootstrap settings not
always used in the absence of specific values provided in the DT?

Thanks,
Conor.

> +
>      unevaluatedProperties: false
> =20
>  allOf:
> @@ -177,6 +200,8 @@ allOf:
>              - const: iproc-idm
>              - const: iproc-ext
>    - if:
> +      required:
> +        - interrupts
>        properties:
>          interrupts:
>            minItems: 2
> @@ -189,7 +214,6 @@ unevaluatedProperties: false
>  required:
>    - reg
>    - reg-names
> -  - interrupts
> =20
>  examples:
>    - |
> --=20
> 2.37.3
>=20

--jcqjXZ8cGgfI18QE
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZaqtgwAKCRB4tDGHoIJi
0tM1AQDSHcwxZJ+NQT0cWsDhVwldckv72GZ9yDKrNaKJmEleVAD/ZUv6v3juhAYD
SLR0IU2EORGMcuIFcZFFI+58duTmDQw=
=zaXk
-----END PGP SIGNATURE-----

--jcqjXZ8cGgfI18QE--


--===============0375588872205033729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0375588872205033729==--

