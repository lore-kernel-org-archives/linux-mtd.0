Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37EE1C25B76
	for <linux-mtd@archiver.kernel.org>; Wed,  5 Jun 2024 17:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i6V4CO/mMwffwvq3sgD22AjH7Dt0melwOO3MnDvzbYo=; b=wtLZVI864nPjHZ/QUnKP8zcdRr
	uG1giiZsYip9VZGwYCGEhMrZXpV5V2ZC5nyQqEFsYiuVKDFOELBb/tElZDNnbz7cykM9sE0YWeLs1
	7lO078ldZoiwZQRreasmnlzQ/JqkP+4lELY7Ng4dJvfmc0+Ok+B+XYXFhoQ1T3X68QQps4yc5ASr1
	/Xi0lBh6t8vaX7uCsyNZlQMWy0IXdKdXlhH4arlrNOJQsat2NTvvBzKn+jj/bQl+frYSOQ/o5V0eu
	j3Nsv62x8OSojBiH61r9cCBb2fbEJQKpniQWEUa99fzUIygFojFNXR0c9ijviiBbGvDttOGE8fBj4
	0P3BpFHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEuct-000000070NA-1xu5;
	Wed, 05 Jun 2024 17:40:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEucq-000000070MR-2rEs
	for linux-mtd@lists.infradead.org;
	Wed, 05 Jun 2024 17:40:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A627161917;
	Wed,  5 Jun 2024 17:40:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E44ACC2BD11;
	Wed,  5 Jun 2024 17:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717609238;
	bh=CKS6iYqS40zJomaUzCL7cLtl2HG//3bkjoqgTiDMYRE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KYqTCkXZaR/rfoTARNJgJLoRy174DfcfO0fElOzeLUNBLw5xypFs97Jw9z1pGh9Q3
	 gfOP60FUfdsF+0H4LOrwRRxTYgfZy6o17y9xvs853VLINN4TSf64mOUBLS21E2Nl5u
	 e5Fosn4cV1sjvxeKQsrXV6ZIa92COVgprwVheklrnmF7Bo4w/3EeL2QCTupKVO4fnh
	 Dj3P9O4Y6mkfLAh0EVddZCJ7XnSHTG/TSeBzVlV98evTInw1ASfbzOVSzbBowIDjHe
	 ZxUJTfmCUpDFrAUsQdkj1uiyJXI0iitH8M8TP+mi6MBebmAXyq6bI0ZRIGLd1JkVbs
	 1zBYdiiZ9asqg==
Date: Wed, 5 Jun 2024 18:40:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Michael Walle <mwalle@kernel.org>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Thorsten Scherer <t.scherer@eckelmann.de>,
	Marek Vasut <marex@denx.de>, Imre Kaloz <kaloz@openwrt.org>,
	Andrew Lunn <andrew@lunn.ch>, Flavio Suligoi <f.suligoi@asem.it>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
Message-ID: <20240605-cosmetics-upgrade-837934256ede@spud>
References: <20240604074231.1874972-1-mwalle@kernel.org>
 <20240604-ladylike-gout-6fd6ae992712@spud>
 <D1RF2GI60GXE.3A3W7Q3W19GPN@kernel.org>
MIME-Version: 1.0
In-Reply-To: <D1RF2GI60GXE.3A3W7Q3W19GPN@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_104040_851285_9B6B0D4C 
X-CRM114-Status: GOOD (  48.23  )
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
Content-Type: multipart/mixed; boundary="===============5672177627948387215=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5672177627948387215==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="o639TIyIFJbIbFT2"
Content-Disposition: inline


--o639TIyIFJbIbFT2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 04, 2024 at 07:42:16PM +0200, Michael Walle wrote:
> On Tue Jun 4, 2024 at 7:01 PM CEST, Conor Dooley wrote:
> > On Tue, Jun 04, 2024 at 09:42:31AM +0200, Michael Walle wrote:
> > > These devices are more like an AT25 compatible EEPROM instead of
> > > flashes. Like an EEPROM the user doesn't need to explicitly erase the
> > > memory, nor are there sectors or pages. Thus, instead of the SPI-NOR
> > > (flash) driver, one should instead use the at25 EEPROM driver.
> > >=20
> > > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > > Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > > Cc: Thorsten Scherer <t.scherer@eckelmann.de>
> > > Cc: Marek Vasut <marex@denx.de>
> > > Cc: Imre Kaloz <kaloz@openwrt.org>
> > > Cc: Andrew Lunn <andrew@lunn.ch>
> > > Cc: Flavio Suligoi <f.suligoi@asem.it>
> > > ---
> > > The referenced binding only supports the true AT25 compatible EEPROMs
> > > where you have to specify additional properties like size and page si=
ze
> > > or cypress FRAM devices where all the properties are discovered by the
> > > driver. I don't have the actual hardware, therefore I can't work on a
> > > proper driver and binding. But I really want to deprecate the use of
> > > these EEPROM like devices in SPI-NOR. So as a first step, mark the
> > > devices in the DT bindings as deprecated.
> > >=20
> > > There are three in-tree users of this. I hope I've CCed all the relev=
ant
> > > people. With the switch to the at25 driver also comes a user-space
> > > facing change: there is no more MTD device. Instead there is an "eepr=
om"
> > > file in /sys now, just like for every other EEPROM.
> > >=20
> > > Marek already expressed, that the sps1 dts can likely be removed
> > > altogether. I'd like to hear from the other board DTS maintainers if
> > > they seem some problems moving to the EEPROM interface - or maybe that
> > > device isn't used at all anyway. So in the end, we can hopefully move
> > > all the users over to the at25 driver.
> > > ---
> > >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 9 +++++++=
+-
> > >  1 file changed, 8 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml=
 b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > index 6e3afb42926e..2dccb6b049ea 100644
> > > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > > @@ -21,7 +21,6 @@ properties:
> > >                (m25p(40|80|16|32|64|128)|\
> > >                n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
> > >                atmel,at25df(321a|641|081a)|\
> > > -              everspin,mr25h(10|40|128|256)|\
> > >                (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|2=
5635e)|\
> > >                (mxicy|macronix),mx25u(4033|4035)|\
> > >                (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
> > > @@ -42,6 +41,14 @@ properties:
> > >                - spansion,s25fs512s
> > >            - const: jedec,spi-nor
> > >        - const: jedec,spi-nor
> > > +
> > > +      # Deprecated bindings
> > > +      - items:
> > > +          - pattern: "^everspin,mr25h(10|40|128|256)$"
> > > +          - const: jedec,spi-nor
> > > +        description:
> > > +          Deprecated binding, use Documentation/devicetree/bindings/=
eeprom/at25.yaml.
> > > +        deprecated: true
> >
> > The idea here seems okay, but directing people to use the at25 binding,
> > without actually documenting the replacement compatibles etc is far from
> > ideal. I think even a wording change that points out that that these
> > devices need to be documented in that file would be an improvement, the
> > current wording makes it seem like the works been done.
> > Until there's a replacement driver, I don't think you could really
> > expect anyone to move to a new binding anyway.
>=20
> Fair enough. The driver is already there and it basically works -
> Flavio is already using it. It is just, that at the moment you have
> to use the (deprecated) "atmel,at25" compatible and you'll have to
> specify pagesize etc. That is really hacky, because F/MRAM devices
> doesn't have a pagesize.
>=20
> Anyway, I was already working on the at25 binding but then I've
> noticed that the current FRAM binding is really hardcoded to cypress
> devices and as mentioned in the commit message, I don't have any
> hardware to actually write the proper driver support. Maybe we
> should settle on the binding first, i.e.
>=20
>  compatible =3D "everspin,mr25", "atmel,at25";
>  size =3D <N>;
>=20
> vs
>=20
>  compatible =3D "everspin,mr25h256"; # no size needed

I dunno, I am usually biased to having the more specific compatible
and not needing the extra properties.

>=20
> For reference, the already supported cypress fram has the following:
>=20
>  compatible =3D "cypress,fm25", "atmel,at25";
>  # no size needed, because the driver will figure it out by reading
>  # the ID
>=20
> Besides that, I would really get some feedback from the three
> in-tree users on migrating to the EEPROM driver and thus away from
> MTD.
>=20
> -michael
>=20

--o639TIyIFJbIbFT2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmCjEAAKCRB4tDGHoIJi
0vmBAQDQxQ5szdr041sx7R+TpFAH4HedbmvxhYWiKlgzMsLOnQEAwq1Oaz5rvxm1
xP8LD1K4V3yS6vDch1ByCLRxQNPpCQ4=
=61oL
-----END PGP SIGNATURE-----

--o639TIyIFJbIbFT2--


--===============5672177627948387215==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5672177627948387215==--

