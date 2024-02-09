Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E153FC48297
	for <linux-mtd@archiver.kernel.org>; Fri,  9 Feb 2024 17:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FOxS0fod2kX8vdvgzGpMhF2OJJt/jVGxRZedulpKrE=; b=D5M/y53bB+GOnEDUPpxXfcf4EN
	pL7b3kR5Ce9uABIo6xqa1nIGI6o5UlMBDp/6J4YfiKeYwwvftfPlV4kCEBITj/WkNzAYUbTbdMLHQ
	vFmtChqafPqm13Kk729ixQ2cbg4aHGLqEGTEnhJlE27ROK2x3fNmzl8Lis2QKmFFIdvLbMsJsYEp3
	N8IXlCO1s+yDmgFermxwCPmwvNYGx+y9D/nxNPWONarK+eswHy6smpRx98TDmY2iVFm2mvKTpjgdp
	JwRRlOqAFOeofAtAmalYOpGaz5G1YaC9AgL1bRqnhzWK6CO868gV/1LFTB1qVS+d+dKoKQonrabuF
	GM9bocLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUt9-000000009dU-1ZEv;
	Fri, 09 Feb 2024 17:42:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYUt6-000000009bR-2lc8;
	Fri, 09 Feb 2024 17:42:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B8BAE62126;
	Fri,  9 Feb 2024 17:42:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C992C433F1;
	Fri,  9 Feb 2024 17:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707500527;
	bh=HF9PftpJsOvVmalzJ2URbYmTYhyNPvu3Hk7v1fBL/aA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmXERWD4o3IX37eOr45+H2TjuzQgGl46WADdo35xY6KpftoYOEkD+OdAuJb3GycgC
	 1ySOeHpBhi1mGt3MBJos2MddUJgbGky+nd8ei8yhw4HnR351m4B9cQe3bw7018i4wD
	 Wdt/c5U+wuAhQLpe76toLC7rHaGvnIwQIdNc+Wb+ehQ4T6p8x3XwPg5QbAgF9Xitvg
	 bwUrvmz+lmChMYRRvr+xLik5/eZG7freTmCi3hIn6CTlVh+Dmu2C4GHNeNKxYZjkLK
	 SxoJhnvyd/dHX0jp9b799ULXoBx+NRw5KemrRcT4sLL8MwfDjIeFETOSjtZ9HGIZbl
	 tnFo5gLqFVYjQ==
Date: Fri, 9 Feb 2024 17:42:00 +0000
From: Conor Dooley <conor@kernel.org>
To: William Zhang <william.zhang@broadcom.com>
Cc: Linux MTD List <linux-mtd@lists.infradead.org>,
	Linux ARM List <linux-arm-kernel@lists.infradead.org>,
	Broadcom Kernel List <bcm-kernel-feedback-list@broadcom.com>,
	f.fainelli@gmail.com, kursad.oney@broadcom.com,
	joel.peshkin@broadcom.com, anand.gore@broadcom.com, dregan@mail.com,
	kamal.dasu@broadcom.com, tomer.yacoby@broadcom.com,
	dan.beygelman@broadcom.com, devicetree@vger.kernel.org,
	Brian Norris <computersforpeace@gmail.com>,
	linux-kernel@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v5 03/12] dt-bindings: mtd: brcmnand: Add ecc strap
 property
Message-ID: <20240209-jalapeno-estate-a1371c281bc7@spud>
References: <20240207202257.271784-1-william.zhang@broadcom.com>
 <20240207202257.271784-4-william.zhang@broadcom.com>
MIME-Version: 1.0
In-Reply-To: <20240207202257.271784-4-william.zhang@broadcom.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_094208_828763_4DEBFBDF 
X-CRM114-Status: GOOD (  20.96  )
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
Content-Type: multipart/mixed; boundary="===============6523461457650395963=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6523461457650395963==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4eFKpvXR/FSb5KR1"
Content-Disposition: inline


--4eFKpvXR/FSb5KR1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 07, 2024 at 12:22:48PM -0800, William Zhang wrote:
> Add brcm,nand-ecc-use-strap to get ecc and spare area size settings from
> board boot strap for broadband board designs because they do not specify
> ecc setting in dts but rather using the strap setting.
>=20
> Signed-off-by: William Zhang <william.zhang@broadcom.com>

If Miquel is happy with this, then I am too.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> ---
>=20
> Changes in v5:
> - Update the description for this ecc strap property
> - Add check to make sure brcm,nand-ecc-use-strap and
>   nand-ecc-strength/brcm,nand-oob-sector-size can not be used at the
>   same time
>=20
> Changes in v4:
> - Move ecc strap property to this separate patch and remove some
> non-binding related text from the description
>=20
> Changes in v3: None
> Changes in v2: None
>=20
>  .../bindings/mtd/brcm,brcmnand.yaml           | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml b/D=
ocumentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> index 6a717bcedfd3..52a4c993b6f1 100644
> --- a/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/brcm,brcmnand.yaml
> @@ -146,6 +146,13 @@ patternProperties:
>            layout.
>          $ref: /schemas/types.yaml#/definitions/uint32
> =20
> +      brcm,nand-ecc-use-strap:
> +        description:
> +          This property requires the host system to get the ECC strength
> +          and step size from the SoC NAND boot strap setting. This is a
> +          common hardware design on BCMBCA based boards.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
>      unevaluatedProperties: false
> =20
>  allOf:
> @@ -195,6 +202,18 @@ allOf:
>        required:
>          - interrupt-names
> =20
> +  - if:
> +      patternProperties:
> +        "^nand@[a-f0-9]$":
> +          required:
> +            - brcm,nand-ecc-use-strap
> +    then:
> +      patternProperties:
> +        "^nand@[a-f0-9]$":
> +          properties:
> +            nand-ecc-strength: false
> +            brcm,nand-oob-sector-size: false
> +
>  unevaluatedProperties: false
> =20
>  required:
> --=20
> 2.37.3
>=20

--4eFKpvXR/FSb5KR1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZcZj6AAKCRB4tDGHoIJi
0txwAP9L9cpXbp0KAt/EmZ9qFjK+FmzE6kOodOMW0T5ocDkcTgD/U7ygxkY+t+lE
Ip1OM3oe2ziXosKS9QoxgxRpePiD1gc=
=n7ED
-----END PGP SIGNATURE-----

--4eFKpvXR/FSb5KR1--


--===============6523461457650395963==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6523461457650395963==--

