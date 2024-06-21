Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA984C27C4F
	for <linux-mtd@archiver.kernel.org>; Fri, 21 Jun 2024 07:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zmQUC3Ifj9lyOLAiJ3sltnb7BfayEdGx5cfugdV5C4I=; b=hvphlywvp8JTrwFFiS9x1zlrNw
	8mxYceUdn/siRTHZ1UmrD0spF4FbKxfbRtrX2tgmIZ1P5416o0yr2HyvLKdiCJbQELaalRKWP6ylK
	gVwilkichOhPKQvpVczpFKj69ob+fN8LQX8IdzH4DsSMcmomMSVtEYO2clX/yAA/IY0UO5rF6XS7P
	CYs6Pbr32rVpdeYhipv5eTHrU+t4XY3FQ0FUWVowhgSa71Ro+/seo8yVjd2W345QTY/pnenrjRSRo
	v/hbEBw6xG52SHwF7pT2OM0mSk0olKhsICEYvsEMZzIdlBzv7XYKVShGFlDaBCLHSljLQkIeQJQpU
	5VY94MLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKYPU-000000085PO-22J6;
	Fri, 21 Jun 2024 07:10:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKYPR-000000085Ou-3qYK
	for linux-mtd@lists.infradead.org;
	Fri, 21 Jun 2024 07:10:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id D78B9CE0317;
	Fri, 21 Jun 2024 07:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4142C4AF07;
	Fri, 21 Jun 2024 07:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718953805;
	bh=n65H7FsUgfmgUo7tOvRNM/n2pfXo1WYRu0MNCvY3RO4=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=abe8VxSQaHu9setF8pMa+ryHBejechFVrzVwWO1cOpwuSrohWAaxIftnWbmXu15LZ
	 k3bcHBkak8igmAKbkPwINg/vIjYyCJTBKEzMJImXzBKG/LktEvXeoiqjUpeItjOa9f
	 JjVKIhmPQ5LOzC8GsafbStVyb2su0AR5ErOMobNHoezlCtj4Tn3MlmeRXpz4AW+ipc
	 TjhBZMoXXOj2KzBiN2o4OWipljXn7uGrigmY80E2+oajB1oxnpQE8MSItgzkt8yzma
	 H4jhK1a0aFCzgpIG5bN/O5qDa9kLnyWxTp7RJeMAcFcFRdZyrXnRj5f7F33xrzKRm5
	 g814XmF7xQJEw==
Date: Fri, 21 Jun 2024 09:09:56 +0200
Message-Id: <D25I9KDHREE9.29RPCOHXUA70A@kernel.org>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
Cc: <linux-mtd@lists.infradead.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@pengutronix.de>, "Thorsten Scherer"
 <t.scherer@eckelmann.de>, "Marek Vasut" <marex@denx.de>, "Imre Kaloz"
 <kaloz@openwrt.org>, "Andrew Lunn" <andrew@lunn.ch>, "Flavio Suligoi"
 <f.suligoi@asem.it>
From: "Michael Walle" <mwalle@kernel.org>
To: "Alexander Stein" <alexander.stein@ew.tq-group.com>, "Tudor Ambarus"
 <tudor.ambarus@linaro.org>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel
 Raynal" <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240604074231.1874972-1-mwalle@kernel.org>
 <23574950.6Emhk5qWAg@steina-w>
In-Reply-To: <23574950.6Emhk5qWAg@steina-w>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_001010_408550_8BB606C2 
X-CRM114-Status: GOOD (  39.02  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5465216580409232887=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============5465216580409232887==
Content-Type: multipart/signed;
 boundary=2166d04db5b2b3c19279014449532fc9d1958729fc6021e7fe2f711ac40d;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--2166d04db5b2b3c19279014449532fc9d1958729fc6021e7fe2f711ac40d
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Fri Jun 21, 2024 at 8:49 AM CEST, Alexander Stein wrote:
> Hi everyone,
>
> sorry for being late to the party. I just noticed this discussion while
> reading [1].
>
> Am Dienstag, 4. Juni 2024, 09:42:31 CEST schrieb Michael Walle:
> > These devices are more like an AT25 compatible EEPROM instead of
> > flashes. Like an EEPROM the user doesn't need to explicitly erase the
> > memory, nor are there sectors or pages. Thus, instead of the SPI-NOR
> > (flash) driver, one should instead use the at25 EEPROM driver.
> >=20
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > Cc: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > Cc: Thorsten Scherer <t.scherer@eckelmann.de>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Imre Kaloz <kaloz@openwrt.org>
> > Cc: Andrew Lunn <andrew@lunn.ch>
> > Cc: Flavio Suligoi <f.suligoi@asem.it>
> > ---
> > The referenced binding only supports the true AT25 compatible EEPROMs
> > where you have to specify additional properties like size and page size
> > or cypress FRAM devices where all the properties are discovered by the
> > driver. I don't have the actual hardware, therefore I can't work on a
> > proper driver and binding. But I really want to deprecate the use of
> > these EEPROM like devices in SPI-NOR. So as a first step, mark the
> > devices in the DT bindings as deprecated.
> >=20
> > There are three in-tree users of this. I hope I've CCed all the relevan=
t
> > people. With the switch to the at25 driver also comes a user-space
> > facing change: there is no more MTD device. Instead there is an "eeprom=
"
> > file in /sys now, just like for every other EEPROM.
> >=20
> > Marek already expressed, that the sps1 dts can likely be removed
> > altogether. I'd like to hear from the other board DTS maintainers if
> > they seem some problems moving to the EEPROM interface - or maybe that
> > device isn't used at all anyway. So in the end, we can hopefully move
> > all the users over to the at25 driver.
>
> So instead of spi-nor you want to use at25 for this MRAM devices?

Yes.

> AFAICS at25 is a spi only driver, but spi-nor is a spi-mem driver. So I a=
m
> wondering if at25 driver is capable of using QSPI hosts.

spi-mem support could be added to the at25 driver. But probably
mainly because there are SPI controllers out there which only have
an interface to attach memory (like the FlexSPI from NXP).

> Everspin EMxxLXB devices are capable of running in xSPI modes.
> Regarding QSPI (DSPI/OSPI as well) I assumed spi-nor is a given, but mayb=
e
> I am completely wrong here. Maybe someone could clarify this.

These newer devices should also support the erase command, right? So
they can be a "real" flash. If they support SFDP, the would even be
supported out of the box. The mentioned everspin devices are much
older and behaves more like an EEPROM instead of a flash.

-michael

>
> Best regards,
> Alexander
>
> [1] https://lore.kernel.org/linux-kernel/20240405100104.480779-1-f.suligo=
i@asem.it/
>
> > ---
> >  Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml b=
/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > index 6e3afb42926e..2dccb6b049ea 100644
> > --- a/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > +++ b/Documentation/devicetree/bindings/mtd/jedec,spi-nor.yaml
> > @@ -21,7 +21,6 @@ properties:
> >                (m25p(40|80|16|32|64|128)|\
> >                n25q(32b|064|128a11|128a13|256a|512a|164k)))|\
> >                atmel,at25df(321a|641|081a)|\
> > -              everspin,mr25h(10|40|128|256)|\
> >                (mxicy|macronix),mx25l(4005a|1606e|6405d|8005|12805d|256=
35e)|\
> >                (mxicy|macronix),mx25u(4033|4035)|\
> >                (spansion,)?s25fl(128s|256s1|512s|008k|064k|164k)|\
> > @@ -42,6 +41,14 @@ properties:
> >                - spansion,s25fs512s
> >            - const: jedec,spi-nor
> >        - const: jedec,spi-nor
> > +
> > +      # Deprecated bindings
> > +      - items:
> > +          - pattern: "^everspin,mr25h(10|40|128|256)$"
> > +          - const: jedec,spi-nor
> > +        description:
> > +          Deprecated binding, use Documentation/devicetree/bindings/ee=
prom/at25.yaml.
> > +        deprecated: true
> >      description:
> >        SPI NOR flashes compatible with the JEDEC SFDP standard or which=
 may be
> >        identified with the READ ID opcode (0x9F) do not deserve a speci=
fic
> >=20


--2166d04db5b2b3c19279014449532fc9d1958729fc6021e7fe2f711ac40d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZnUnRBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/j+8AGAtupdesFKhkaz5tdt6TTk5KypeDUg4kse
swSjdUykLgrXafelPJzbZaqZjzhMB3K2AX9R9MmawdLhS0RaUIcpMzilo1ydQJC0
8dpqaL0EmIYFMTWc/qrtPiwaBp8eegqUK9E=
=LIns
-----END PGP SIGNATURE-----

--2166d04db5b2b3c19279014449532fc9d1958729fc6021e7fe2f711ac40d--


--===============5465216580409232887==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5465216580409232887==--

