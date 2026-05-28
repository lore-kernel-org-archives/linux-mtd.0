Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7008CD4F54
	for <linux-mtd@archiver.kernel.org>; Thu, 28 May 2026 17:37:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=In2vpkAVryIe2qH0DAkiYDFiJoZeVInxBmNz6hlL0js=; b=uKv7tWRIjUHpevfuuWZbazsyW4
	P9aZqxPFJzL+4aRq9khJ99MyviNWTPT9fJAYRd3hGWxp6XBGOQAL05ijDWycmYrmpsdKm059gM/Lw
	YGgaI4CHMjbbQCvnk5zlFGXwOB+wzqVuhVhcTIUabLP6qjbbCpyV6bbw66BsY0amqW3SXVqreV/m/
	VVLj8X5fSWuZzxGqGDp3P8sPHC7yIeldlzRGFgY7qM99bVh/+Rz9uEmHvVWIm/sEsOg2BOC9njk1H
	O79XD3KJMGOlpEuT29mJlvKF722KAI1PDyufFPJHcLFJOpRS7r3HuNnINfwXBCwe1b9GQM1mZf/Y2
	K3xR3uVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSefK-00000006722-2pHW;
	Thu, 28 May 2026 17:37:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSefI-0000000671c-0HaM
	for linux-mtd@lists.infradead.org;
	Thu, 28 May 2026 17:37:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 59DBA43F0D;
	Thu, 28 May 2026 17:37:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22881F000E9;
	Thu, 28 May 2026 17:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779989823;
	bh=Ew+PCmfH8+DLsOwWNMBYxmqZmSklKm/4ETgUFhXg9U0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=D1NWSE88IZHKHzj0tlR39Y8NgfRrnNXWwA0F+h2NYM7OD/4tZNAPq+h+Fp/10Fe3W
	 srednJmCWPp4AN+rRShTEU9k67QguKkuzScp0RHzNyHnh2YafJiZBqB2DMKVSVH+CR
	 pMbVlEz4A15oeXjrPlNK5EV9EJ70eMQ816Qf9PIU2Qkq7fhumFr51cAoKgO9qF53hM
	 Uf5asWGQlyochEMKyu3A/+IOiMoVJTfKyM2rRLP8nCj/aZyGF2dBXo8n5Q5ihaaHzk
	 aOgWbsubLI3sYQLvN+ovVW1zOpDVyZnCrPVuSQMqL4wI9s8P/j6MzpqX9fE+HhZomD
	 N+IryXlU2O4HA==
Date: Thu, 28 May 2026 18:36:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Santhosh Kumar K <s-k6@ti.com>
Cc: broonie@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, miquel.raynal@bootlin.com, richard@nod.at,
	vigneshr@ti.com, pratyush@kernel.org, mwalle@kernel.org,
	takahiro.kuwano@infineon.com, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, praneeth@ti.com, u-kumar1@ti.com,
	a-dutta@ti.com
Subject: Re: [PATCH v3 01/13] spi: dt-bindings: allow spi-max-frequency to
 specify a frequency pair
Message-ID: <20260528-clergyman-kindling-20971775ba78@spud>
References: <20260527175527.2247679-1-s-k6@ti.com>
 <20260527175527.2247679-2-s-k6@ti.com>
MIME-Version: 1.0
In-Reply-To: <20260527175527.2247679-2-s-k6@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_103704_148879_276AE491 
X-CRM114-Status: GOOD (  22.73  )
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
Content-Type: multipart/mixed; boundary="===============1050788214164198808=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1050788214164198808==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pQNz/q7IjnyAqEJl"
Content-Disposition: inline


--pQNz/q7IjnyAqEJl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 27, 2026 at 11:25:15PM +0530, Santhosh Kumar K wrote:
> Some SPI controllers support high-speed operating modes that require
> controller-side configuration before the device can be driven at its
> rated maximum frequency. In these cases two frequencies are relevant:
> a conservative speed usable without any such configuration, and the
> maximum speed achievable once the controller is set up accordingly.
>=20
> The existing spi-max-frequency property accepts only a single u32,
> which cannot express this distinction. Extend it to accept either a
> single value (retaining full backward compatibility) or a two-element
> array [base-frequency, max-frequency], where base-frequency is the
> conservative operating speed and max-frequency is the highest speed
> the device supports after controller-side configuration.
>=20
> Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> ---
>  .../devicetree/bindings/spi/spi-peripheral-props.yaml  | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

Pretty sure this hasn't been tested, dt_binding_check cannot even build
processed-schema.json with this applied because there are multiple
definitions of spi-max-frequency with it applied.

The sashiko makes the point that this breaks every binding that uses
minimum/maximum to set constraints too, because these properties do not
apply to arrays unless applied per item.

I also don't get the point of this property, why can't you just set the
max that the device can do and if the controller can configure itself to
be fast enough it will do so, and if it can't then it'll pick whatever
the fastest it can actually do instead?
Seems like you're abusing a peripheral property to encode information
about the controller.

pw-bot: changes-requested

Thanks,
Conor.

>=20
> diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props.y=
aml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> index 880a9f624566..c88f6f3a1801 100644
> --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> @@ -41,9 +41,15 @@ properties:
>        The device requires the LSB first mode.
> =20
>    spi-max-frequency:
> -    $ref: /schemas/types.yaml#/definitions/uint32
> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 2
>      description:
> -      Maximum SPI clocking speed of the device in Hz.
> +      SPI clocking speed of the device in Hz. Either a single maximum
> +      frequency, or two values [base-frequency, max-frequency] where
> +      base-frequency is the conservative speed and max-frequency is the
> +      highest speed the device supports after controller-side configurat=
ions
> +      such as data training.
> =20
>    spi-cs-setup-delay-ns:
>      description:
> --=20
> 2.34.1
>=20

--pQNz/q7IjnyAqEJl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCahh9OQAKCRB4tDGHoIJi
0lxfAQCiYNypuQYi25j9taj720oiiR9VKl5PbBX+BUJBEjZjqwD+MX89+OgpNete
q9HGB/H/VITdOUGVene2p+OvlTO+QQE=
=veuz
-----END PGP SIGNATURE-----

--pQNz/q7IjnyAqEJl--


--===============1050788214164198808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1050788214164198808==--

