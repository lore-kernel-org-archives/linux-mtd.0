Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF2A0CDB466
	for <linux-mtd@archiver.kernel.org>; Mon, 22 Jun 2026 19:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUkYM2RYHd1y9q6PsTY7z2hILHhsEa2ea+71wIOlDTo=; b=B/iE+gb1lXIQ4uqxYMp1kvtGV8
	hoCtZaEA3NjjpMabuRuKTMT5y+zKN2ZBD7Nc1ooc1xrYVDZvSwWk4HDUjY24kcK7nHyPEaTyXW7Kb
	NDtMMfvmd6++800gZfQbg7SXWHPkcybyVc6KJWI9zuCsVxhYExKR7S9DZ8tG+4yMDBFF0Ui7qAlrq
	+dmBnr20HpGOr6W0l48SqvXec7WFUMq0/2+1C0U0PaGtcTjMyRG1PRnWsNWzIvEp8VD7ua1+B8Fxu
	dMLMHruSigNU7HnLsXK4buIpO6Euzx1jfehfDbGxZIiJ+TmF/BbbxSirYQJUtZMJ8nTIomhkCaJ/q
	vwT4uE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbkbW-00000005Ldj-3mMM;
	Mon, 22 Jun 2026 19:46:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbkbV-00000005LdW-20cX
	for linux-mtd@lists.infradead.org;
	Mon, 22 Jun 2026 19:46:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 84F75601F3;
	Mon, 22 Jun 2026 19:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A721F000E9;
	Mon, 22 Jun 2026 19:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782157604;
	bh=iBmRIEo0Y3C537nc7m+qdd+Xo7/WqHEC+VjWqzHuMHk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iCM+BPJSYS2QMN3UtoBbVOX95l2Flr6TD/yiI8GOs3NGy+Rn3WiYq9chlfTsIZOgW
	 Y0218U+9VLmVogcC0MGI8TOk09omHOz8Dh7ENWjNy70OdK9kQdFXYQf6ZUDFf0JE/U
	 3vn8alKNYKf03Mfyl4S6FiNBFCAkMAeMKmQRDlvb0COhk887SM8XTHpU5fph5ecoEY
	 iSsiFsVXuDmVIBI1N1exHAGGNzzDyXgdIzJKgN2vFH1U+wNYtziSY/ErYlBWN3olSY
	 oG8CTscy4sBOiTzFtghzJAbBqaZ/k/TtHD2gx30uk0uT9qAJlYUm9ILX+dQLyekSim
	 Stl4jW1qW7d8Q==
Date: Mon, 22 Jun 2026 20:46:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Santhosh Kumar K <s-k6@ti.com>, broonie@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, miquel.raynal@bootlin.com,
	richard@nod.at, vigneshr@ti.com, pratyush@kernel.org,
	mwalle@kernel.org, takahiro.kuwano@infineon.com,
	linux-spi@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
	praneeth@ti.com, u-kumar1@ti.com, a-dutta@ti.com
Subject: Re: [PATCH v4 01/16] spi: dt-bindings: add
 spi-max-post-config-frequency property
Message-ID: <20260622-cartridge-foam-f3bdc9a1311f@spud>
References: <20260618073725.84733-1-s-k6@ti.com>
 <20260618073725.84733-2-s-k6@ti.com>
 <20260622-private-curly-fennec-7e1ad0@quoll>
MIME-Version: 1.0
In-Reply-To: <20260622-private-curly-fennec-7e1ad0@quoll>
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
Content-Type: multipart/mixed; boundary="===============5918805652866248841=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5918805652866248841==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ejSyi9hdaBgCwCQ8"
Content-Disposition: inline


--ejSyi9hdaBgCwCQ8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 22, 2026 at 11:14:32AM +0200, Krzysztof Kozlowski wrote:
> On Thu, Jun 18, 2026 at 01:07:10PM +0530, Santhosh Kumar K wrote:
> > Add spi-max-post-config-frequency, a generic uint32 property for SPI
> > peripherals that support two distinct clock rates: a conservative rate
> > always reachable without controller configuration, and a higher rate
> > reachable only after controller-side configuration such as PHY tuning.
> >=20
> > When both properties are present, spi-max-frequency gives the
> > conservative pre-configuration rate and spi-max-post-config-frequency
> > gives the higher post-configuration target.
> >=20
> > Signed-off-by: Santhosh Kumar K <s-k6@ti.com>
> > ---
> >  .../devicetree/bindings/spi/spi-peripheral-props.yaml       | 6 ++++++
> >  1 file changed, 6 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/spi/spi-peripheral-props=
=2Eyaml b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > index 880a9f624566..ece86f65930f 100644
> > --- a/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > +++ b/Documentation/devicetree/bindings/spi/spi-peripheral-props.yaml
> > @@ -45,6 +45,12 @@ properties:
> >      description:
> >        Maximum SPI clocking speed of the device in Hz.
> > =20
> > +  spi-max-post-config-frequency:
>=20
> -hz

Ah d'oh. I was hung up on matching the existing property that I didn't
include -hz in my original suggestion, sorry!

> https://github.com/devicetree-org/dt-schema/blob/main/dtschema/schemas/pr=
operty-units.yaml
>=20
> and you need maxItems: 1.
>=20
> Now, please take time and think if this should not be an array instead
> (maxItems: ...) to cover other possible cases, e.g. different tuning
> levels? IOW, having single spi-max-frequency turned out to be
> insufficient. You address that insufficiency with one more frequency,
> but what if this is going to be insufficient next month as well?
>=20
> I don't know, answer is rather for domain experts.
>=20
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      Maximum SPI clock frequency in Hz achievable post controller-side
> > +      configuration.
>=20
> Best regards,
> Krzysztof
>=20

--ejSyi9hdaBgCwCQ8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajmRHgAKCRB4tDGHoIJi
0umiAQCjDW5YPRvTWr8AmnJrT5KWog4MKK7CNWqLvCUUEmQq+QEA8S2hYQBmi9Pb
MYrjEqkaB0aZF/Os83V8DkGjn39+wQU=
=qY+b
-----END PGP SIGNATURE-----

--ejSyi9hdaBgCwCQ8--


--===============5918805652866248841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5918805652866248841==--

