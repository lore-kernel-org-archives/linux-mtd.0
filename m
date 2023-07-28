Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA651C0015E
	for <linux-mtd@archiver.kernel.org>; Fri, 28 Jul 2023 16:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KE1lLLoO1btnetZ0G6lSHgVDM0zTSWfSUh5cXzLb2Ks=; b=PxPiHuRaXSv9Wg9o/SAdL8VSC6
	T5a9AzkL7e4MxQ/i4s6GJEUpaEsBLjtiExfdUZKGAR07jEiczD/x5xzfJY5x2SkKuW6hKJdK0FLWx
	Tp5M4M9CKgh5tyiqh3Tqxeu8ksHQ8kkaVGI6E6puki/+cLXHTa3uSRxcRk9P8GBkOdt4hymh+R3QI
	umM1cme6FoLRo8+wSZCC5HiY3ccTgbhXg5s/LA0NLm7qNNzMDbQbKAVGhDBQD5XMjifjNhzOB1WsN
	C+cE5nqRaai30ETx0saB55XYpUUqdzdUvu5LFT2ztKixddmJOYfIVg2XRjwB40Qjo4vyDmgR3NpoW
	r+AFqkJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qPQ3g-0041kh-16;
	Fri, 28 Jul 2023 16:11:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qPQ3b-0041ji-25;
	Fri, 28 Jul 2023 16:11:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C2BAA62185;
	Fri, 28 Jul 2023 16:11:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4871FC433C7;
	Fri, 28 Jul 2023 16:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690560670;
	bh=tjGuSrDwTbS2bQDCEbJvPIHSpBadcYgXq8DyDZNK8XU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gyAzu+W+m+DUr2THVKr8nlypPSMO/0fSh5RLpztO0wYLpGqCdkGeG9LwczxcmgwFh
	 1xsiWwYcgbX3PSQ2CIVG2rBb9D1JRNcAnfchiXceCXcI4a4Frro59/iv/kWqBzLW4O
	 aDEpZE6AH3utAOsXGRNYIIh/UGblZeJpwXYsh2/4DoLWPJW6K6/qrimrbrkQTl41sz
	 pfb15Sb49WK7O5dU14vI9hUNF+g44dcyEG6oEn4klzDM5xARx60q3qkBkxJ7cbepuZ
	 jMvTa9PMJm0QNsb1YUchIAU+F66g+DsywJoKLaSb3mKTaOcZehRaF/9JYoBOzmscUm
	 oSkxewggZst+w==
Date: Fri, 28 Jul 2023 17:10:54 +0100
From: Conor Dooley <conor@kernel.org>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Varshini Rajendran <varshini.rajendran@microchip.com>,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, nicolas.ferre@microchip.com,
	alexandre.belloni@bootlin.com, claudiu.beznea@microchip.com,
	mturquette@baylibre.com, sboyd@kernel.org,
	herbert@gondor.apana.org.au, davem@davemloft.net, vkoul@kernel.org,
	andi.shyti@kernel.org, tglx@linutronix.de, maz@kernel.org,
	lee@kernel.org, ulf.hansson@linaro.org, tudor.ambarus@linaro.org,
	richard@nod.at, vigneshr@ti.com, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, linus.walleij@linaro.org,
	sre@kernel.org, p.zabel@pengutronix.de, olivia@selenic.com,
	a.zummo@towertech.it, radu_nicolae.pirea@upb.ro,
	richard.genoud@gmail.com, gregkh@linuxfoundation.org,
	lgirdwood@gmail.com, broonie@kernel.org, wim@linux-watchdog.org,
	linux@roeck-us.net, linux@armlinux.org.uk,
	durai.manickamkr@microchip.com, andrew@lunn.ch,
	jerry.ray@microchip.com, andre.przywara@arm.com, mani@kernel.org,
	alexandre.torgue@st.com, gregory.clement@bootlin.com, arnd@arndb.de,
	rientjes@google.com, deller@gmx.de, 42.hyeyoo@gmail.com,
	vbabka@suse.cz, mripard@kernel.org, mihai.sain@microchip.com,
	codrin.ciubotariu@microchip.com, eugen.hristev@collabora.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-crypto@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org, linux-mmc@vger.kernel.org,
	linux-mtd@lists.infradead.org, netdev@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-rtc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-serial@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-usb@vger.kernel.org, linux-watchdog@vger.kernel.org
Subject: Re: [PATCH v3 00/50] Add support for sam9x7 SoC family
Message-ID: <20230728-perfectly-online-499ba99ce421@spud>
References: <20230728102223.265216-1-varshini.rajendran@microchip.com>
 <c0792cfd-db4f-7153-0775-824912277908@linaro.org>
 <20230728-floss-stark-889158f968ea@spud>
 <20230728180443.55363550@xps-13>
MIME-Version: 1.0
In-Reply-To: <20230728180443.55363550@xps-13>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230728_091112_089969_1C525CD9 
X-CRM114-Status: GOOD (  27.91  )
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
Content-Type: multipart/mixed; boundary="===============1263053857928475428=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1263053857928475428==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="JwCxVt0P/WwXvHk3"
Content-Disposition: inline


--JwCxVt0P/WwXvHk3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 28, 2023 at 06:04:43PM +0200, Miquel Raynal wrote:
> Hi Conor,
>=20
> conor@kernel.org wrote on Fri, 28 Jul 2023 16:50:24 +0100:
>=20
> > On Fri, Jul 28, 2023 at 01:32:12PM +0200, Krzysztof Kozlowski wrote:
> > > On 28/07/2023 12:22, Varshini Rajendran wrote: =20
> > > > This patch series adds support for the new SoC family - sam9x7.
> > > >  - The device tree, configs and drivers are added
> > > >  - Clock driver for sam9x7 is added
> > > >  - Support for basic peripherals is added
> > > >  - Target board SAM9X75 Curiosity is added
> > > >  =20
> > >=20
> > > Your threading is absolutely broken making it difficult to review and=
 apply. =20
> >=20
> > I had a chat with Varshini today, they were trying to avoid sending the
> > patches to a massive CC list, but didn't set any in-reply-to header.
> > For the next submission whole series could be sent to the binding &
> > platform maintainers and the individual patches additionally to their
> > respective lists/maintainers. Does that sound okay to you, or do you
> > think it should be broken up?
>=20
> I usually prefer receiving the dt-bindings *and* the driver changes, so
> I can give my feedback on the description side, as well as looking at
> the implementation and see if that really matches what was discussed
> with you :)

Right, that is what I was suggesting. Respective maintainers would get
the drivers *and* bindings for their subsystems - IOW, each patch is
sent to what get_maintainer.pl outputs for it.

--JwCxVt0P/WwXvHk3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZMPojgAKCRB4tDGHoIJi
0kkfAP4ga1L8W2nIhESI6nBrFIrWddcSQtR9qdorSuJaMVMayQD8DIEJcInDpQKd
xcNO0xMMpnCF1rhZL6BPvkIZHuZ5Ygk=
=CpFU
-----END PGP SIGNATURE-----

--JwCxVt0P/WwXvHk3--


--===============1263053857928475428==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1263053857928475428==--

