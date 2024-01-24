Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D37E1C46CD2
	for <linux-mtd@archiver.kernel.org>; Wed, 24 Jan 2024 17:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gsEQKepEJ1oED3Y7mVIoTmBB7GJOiyKV2z7spObvVIU=; b=tOBD2qWkQuSdYAqrk2BLEayyDv
	rKtz5MkU96UVnpvw/QjFR6BHuKv9th4Jp9/lxqXX8w6EmKjoCC5j/yJJwYxAJu9Pt+hz5L5sNh4Jh
	VfYuhoI3U4paYCP7BqW+iTtzMN/pCHFZOUROl96oVmh4yOWmdqMZkdgb86vHU/FqLmoIP3da9cBdN
	5m34hjt0Hf6Jgt70F8oqcSZcs+EgcFvLYI/kQ+ThM2GbCN1vv5HcFHZCT6moM9elRwqN9fqUjUP6d
	rOZcHNhIVHdYIuDVzJNee1eDkQUQEuUegM0qz90Knhtg0VNwWouKUdKZrZsGTheRK44OgdHNFGmXo
	/9s+W4JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgzE-004S2z-2p;
	Wed, 24 Jan 2024 17:24:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSgzA-004RzE-0V;
	Wed, 24 Jan 2024 17:24:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id CE79B61DB8;
	Wed, 24 Jan 2024 17:24:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C9FEC43390;
	Wed, 24 Jan 2024 17:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706117062;
	bh=5NDG4ruRlNIX+UbrypiIwNk4QT0QTppyNY0YFyRXnYA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lQOvjnp55YW+eOWsG4YDOVjajkN/dypextnAU6y2Mf1k5b1DGUsjbKWkmOOCEeuNZ
	 G8R9ucH7IZYpauiWahLP4zaUGpdYGhTfSK2b3UTEjTMwGUUYdy5ClQVuvszG/mPGKz
	 4t/EFO+QP/yQjyLeX5MfwnmDtfDpeyu2SlJfFYws6QsSQoaG9fiXlAHZ7GCcLnCPyu
	 l7u/C+ROrZwH7fbNB6mTYmjl8ln7RI8pqwPXg5XnQ2obRUu7jE8cLH0uAF0p08LWJW
	 pSsv+L1F3FJyDS4xe8N3wpZ3QSehXLkB6PGlSWypTILg0qeOJ+THu5JworoN+OWQT1
	 fDr+vkpXQtG1Q==
Date: Wed, 24 Jan 2024 17:24:15 +0000
From: Conor Dooley <conor@kernel.org>
To: David Regan <dregan@broadcom.com>
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
Subject: Re: [PATCH v3 01/10] dt-bindings: mtd: brcmnand: Updates for bcmbca
 SoCs
Message-ID: <20240124-direness-outpost-bbc22550a161@spud>
References: <20240124030458.98408-1-dregan@broadcom.com>
 <20240124030458.98408-2-dregan@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240124030458.98408-2-dregan@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240124_092424_303489_C41DE2B4 
X-CRM114-Status: GOOD (  46.45  )
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
Content-Type: multipart/mixed; boundary="===============4712776611930360079=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4712776611930360079==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="LHu9IQ8b/LkMYX/w"
Content-Disposition: inline


--LHu9IQ8b/LkMYX/w
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Tue, Jan 23, 2024 at 07:04:49PM -0800, David Regan wrote:
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
> Changes in v3:
> - Update brcm,nand-use-wp description
> - Revert the description change to BCM63168 SoC-specific NAND controller
> ---
> Changes in v2:
> - Revert the new compatible string nand-bcmbca
> - Drop the BCM63168 compatible fix to avoid any potential ABI
> incompatibility issue
> - Simplify the explanation for brcm,nand-use-wp
> - Keep the interrupt name requirement when interrupt number is specified
> ---
>  .../bindings/mtd/brcm,brcmnand.yaml           | 37 ++++++++++++++++---
>  1 file changed, 32 insertions(+), 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/D=
ocumentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> index f57e96374e67..752c6ee98a7d 100644
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
> @@ -111,6 +113,20 @@ properties:
>        earlier versions of this core that include WP
>      type: boolean
> =20
> +  brcm,nand-use-wp:
> +    description:
> +      Use this property to indicate if board design uses
> +      controller's write protection feature and connects its
> +      NAND_WPb pin to nand chip's WP_L pin.

> By default the driver
> +      uses a module parameter with default value set to enable to
> +      control this feature for all boards. Use this dts property to
> +      override the default behavior and enable/disable this feature
> +      through board dts on a per board basis.

None of this information about module parameters is relevant in the
binding, as it should be independent of the implementation of one
particular operating system.

If the module parameter is not provided, what does the driver do?
If "wp_on" is the module parameter, then the default is to enable the
write protection feature. If that's correct, it seems to me that the
property should be called something like "brcm,no-wp". This property
would be a boolean that indicates that the NAND_WPb and WP_L pins are
not connected & nothing more. Clearly if the module param tries to
enable WP and the DT property indicates that it is not supported you
can decline to enable the feature, but that is up to the drivers in
the OS to decide.


> +      Set to 0 if WP pins are not connected and feature is not
> +      used. Set to 1 if WP pins are connected and feature is used.

As it stands, this property is firmly in the "software policy" side
of things, as it is being used as an override for a module parameter,
particularly given you have properties for each direction. Whether or
not the feature is to be used by the operating system is not relevant to
the binding.

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1]
> +
>  patternProperties:
>    "^nand@[a-f0-9]$":
>      type: object
> @@ -137,6 +153,16 @@ patternProperties:
>            layout.
>          $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +      brcm,nand-ecc-use-strap:
> +        description:
> +          This flag is used by the driver to get the ecc strength and
> +          spare area size from the SoC NAND boot strap setting. This
> +          is commonly used by the BCMBCA SoC board design.

Quoting from v1, as I didn't get to it in time:

| > This property I'm not all that sure about either. If the specific
| > properties that you mention here are not set in the DT what happens at
| > the moment?
| >=20
| In that case, the ecc strength and oob size come from ONFI or nand id=20
| decoding.  But that is usually the minimum requirement and user can=20
| choose to use stronger ecc as long as there is enough oob spare area in=
=20
| the nand chip.
|=20
| > I suppose what I am getting at is why are the bootstrap settings not
| > always used in the absence of specific values provided in the DT?
| >=20
| This is because the STB, iProc and other chip and their board design may=
=20
| not have or use the strap setting. But for BCMBCA SoC and board=20
| reference design, we always use the strap setting.

My main question here I suppose is why would you need this property at
all? If the specific properties are provided (nand-ecc-strength etc)
then use them, and if they are not use the strap settings?

If there's no properties and no strap settings, the this property does
not help. If there's properties and strap settings, but properties are
wrong, then you just have some devicetrees that incorrectly describe the
hardware and need to be fixed.

> If ecc
> +          strength and spare area size are set by nand-ecc-strength
> +          and brcm,nand-oob-sector-size in the dts, these settings
> +          have precedence and override this flag.

Again, IMO, this is not for the binding to decide. That is a decision
for the operating system to make.

I am confused!


> +        $ref: /schemas/types.yaml#/definitions/flag
> +
>      unevaluatedProperties: false
> =20
>  allOf:
> @@ -177,6 +203,8 @@ allOf:
>              - const: iproc-idm
>              - const: iproc-ext
>    - if:
> +      required:
> +        - interrupts
>        properties:
>          interrupts:
>            minItems: 2
> @@ -189,7 +217,6 @@ unevaluatedProperties: false
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

--LHu9IQ8b/LkMYX/w
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbFHvwAKCRB4tDGHoIJi
0nJ1AQCMOND3o35gksttzdifP3aYkpWo8/VZtCNTMq408XjJKQD+ItdQyhxh/ckc
RfB431tZbrTy/MCgA0r/jtTAkIbbJgE=
=ElNo
-----END PGP SIGNATURE-----

--LHu9IQ8b/LkMYX/w--


--===============4712776611930360079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4712776611930360079==--

