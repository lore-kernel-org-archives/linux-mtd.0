Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF88CCD183
	for <linux-mtd@archiver.kernel.org>; Mon, 13 Oct 2025 19:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XUB/0DgkPDmJ6+5ptRCt0qeHG7maLx625CnErYt2vfI=; b=ZMCnG5tL7lg5aL73bEw8WMWlqe
	Qbck4wWeyjuBbrjU6v21Ysku59a93Qfl0GvwGzNO34kOqNRzzVbd/Tzx/XNX3qmBbnS0QaMciZrOK
	VwnstlXC2NOkVBNdoE5g+TM+x/ttSOhadSopLZPcPBq09JFSTNrM2YAFeT5vLm84bhk21hRAxlwDK
	eMi2cChS4HMZuBH26gY6itjsGAq/rwJIrtoRm7eB5ji3UjkcAK181Alz8ZuRQYtxBo2zMRXvRLqGF
	fUQep0uK2Nqwb9VZTvO9qj9xv93+8Xj+HM1mY4wUf3mSuryRiGj47S9d1jCXgWafXerRW1nPiS5b8
	badpPGiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8OTZ-0000000EJbZ-0Lhg;
	Mon, 13 Oct 2025 19:44:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8OTV-0000000EJaa-35n4;
	Mon, 13 Oct 2025 19:44:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE7D360503;
	Mon, 13 Oct 2025 19:44:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1C21C4CEFE;
	Mon, 13 Oct 2025 19:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760384692;
	bh=E6/pf/UHO5d8TA7le9I1V6YxxiNG8tLSd+VRH9o46Yo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=id2g8kpeBR5QwQ6e0kXWljvUjTPSpyKdsb8J1BeAPFmyzUOGXSq6fs4e34eWqemi0
	 pED7RGJj7jmCfeuzJqxoaBGNiMrbw0JjlmQnGKfFg8fL4WoW5OjHCeKpmgka7jlVW0
	 Zlo6mcresiBg4OWQNhLXjIQ8SBWRX7eNTqA4gYRfgabt8CGCmRe8o+jV410mN8T3x2
	 KvctzSks6htq+3ZSw7K6mbTxlKBUY7/eKaICyrtXfSqxit5K5qCMngjJBv8e1tPBOk
	 qiRtX43mzj80iJqBWR1WdEqjgXUih6KELbeoiU4CqrjjFOWctVZV14jHDaT6Le/yIA
	 FxtB/0qGW3BEQ==
Date: Mon, 13 Oct 2025 20:44:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>, Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 14/15] dt-bindings: mtd: sunxi: Add H616 compatible
Message-ID: <20251013-parrot-sandpaper-4e31d2d1a6b3@spud>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
 <20251013152645.1119308-15-richard.genoud@bootlin.com>
MIME-Version: 1.0
In-Reply-To: <20251013152645.1119308-15-richard.genoud@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============1544475470062014232=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1544475470062014232==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5/wzhoHrgV6FnNRe"
Content-Disposition: inline


--5/wzhoHrgV6FnNRe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 13, 2025 at 05:26:44PM +0200, Richard Genoud wrote:
> The H616 NAND controller is quite different from the A10 and A23 ones,
> some registers offset changed, and some new one are introduced.
> Also, the DMA handling is different (it uses chained descriptors)
>=20
> So, introduce a new compatible to represent this version of the IP.
>=20
> Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
> ---
>  .../mtd/allwinner,sun4i-a10-nand.yaml         | 57 ++++++++++++++++---
>  1 file changed, 48 insertions(+), 9 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-na=
nd.yaml b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.ya=
ml
> index 054b6b8bf9b9..4b82de9fae17 100644
> --- a/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
> +++ b/Documentation/devicetree/bindings/mtd/allwinner,sun4i-a10-nand.yaml
> @@ -6,9 +6,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
>  title: Allwinner A10 NAND Controller
> =20
> -allOf:
> -  - $ref: nand-controller.yaml
> -
>  maintainers:
>    - Chen-Yu Tsai <wens@csie.org>
>    - Maxime Ripard <mripard@kernel.org>
> @@ -18,6 +15,8 @@ properties:
>      enum:
>        - allwinner,sun4i-a10-nand
>        - allwinner,sun8i-a23-nand-controller
> +      - allwinner,sun50i-h616-nand-controller
> +
>    reg:
>      maxItems: 1
> =20
> @@ -25,14 +24,12 @@ properties:
>      maxItems: 1
> =20
>    clocks:
> -    items:
> -      - description: Bus Clock
> -      - description: Module Clock
> +    minItems: 2
> +    maxItems: 4
> =20
>    clock-names:
> -    items:
> -      - const: ahb
> -      - const: mod
> +    minItems: 2
> +    maxItems: 4

The clock descriptions and names should remain out here, with your new
min/max constraints, since they're identical at indices 0 and 1 to for
both types of device. The if/then should only set the min to 4 for the
new device and the max to 2 for the existing ones.

Cheers,
Conor.

pw-bot: changes-requested

> =20
>    resets:
>      maxItems: 1
> @@ -85,6 +82,48 @@ required:
> =20
>  unevaluatedProperties: false
> =20
> +allOf:
> +  - $ref: nand-controller.yaml
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun4i-a10-nand
> +              - allwinner,sun8i-a23-nand-controller
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus Clock
> +            - description: Module Clock
> +        clock-names:
> +          items:
> +            - const: ahb
> +            - const: mod
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun50i-h616-nand-controller
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: Bus Clock
> +            - description: Module Clock
> +            - description: ECC Clock
> +            - description: MBus Clock
> +        clock-names:
> +          items:
> +            - const: ahb
> +            - const: mod
> +            - const: ecc
> +            - const: mbus
> +
>  examples:
>    - |
>      #include <dt-bindings/interrupt-controller/arm-gic.h>

--5/wzhoHrgV6FnNRe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaO1WrgAKCRB4tDGHoIJi
0r4LAQDT8m+TkP4HrMMysI/Hu7Y+VtRgvMLmFVew9qCn3J+QbAD7BhGtjw9fUtP4
VHnuq+fhXnIRGUy0ntVx+tS+PGfOtgI=
=gy6j
-----END PGP SIGNATURE-----

--5/wzhoHrgV6FnNRe--


--===============1544475470062014232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1544475470062014232==--

