Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69790C4345F
	for <linux-mtd@archiver.kernel.org>; Sat, 13 Apr 2024 08:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpQt55SMpX3OIV3pQrPsQ8a9PGtNBG3lYeGYU5M0vyM=; b=gprsESumCj2G8gb+3/uHVIxOe4
	+Pu52JXslyMtk7HPkImPGYZrbxNbbJWYFU5B0oRO40EJT0cvSAm85Q3zV3m6weeoZOfn9ab7AHsyz
	X/NfhwIHyGSKZqprbp7AY1LwyHLBNRIJaVvMLQPtaY/pwkbt7zlLi8WRrCbBKWMVNS2tJLL0wYUQZ
	c4SeHNpKzXqb14BFMCZbikYhbu8boBdmNpay6jY53Rq5eREB4+weBvuC2MqGlYXJZHGZ+UwajiEPL
	JRAIo/fjvEaWuO+o+TcyhGPI2OHQTrCIFuNk8pRNH2ulS+zGf7tX4qF/b6jsQnM3jdicfiHcdlfYX
	n/800OhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvZ4Y-00000002mL0-46da;
	Sat, 13 Apr 2024 08:49:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvZ4V-00000002mK5-2U3j
	for linux-mtd@lists.infradead.org;
	Sat, 13 Apr 2024 08:49:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvZ3g-00055f-W5; Sat, 13 Apr 2024 10:48:25 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvZ3a-00C201-5I; Sat, 13 Apr 2024 10:48:18 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rvZ3a-000gB5-03;
	Sat, 13 Apr 2024 10:48:18 +0200
Date: Sat, 13 Apr 2024 10:48:17 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>, 
	Hartley Sweeten <hsweeten@visionengravers.com>, Alexander Sverdlin <alexander.sverdlin@gmail.com>, 
	Russell King <linux@armlinux.org.uk>, Lukasz Majewski <lukma@denx.de>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	Andy Shevchenko <andy@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Thierry Reding <thierry.reding@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, Richard Weinberger <richard@nod.at>, 
	Vignesh Raghavendra <vigneshr@ti.com>, Damien Le Moal <dlemoal@kernel.org>, 
	Sergey Shtylyov <s.shtylyov@omp.ru>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, Aaron Wu <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org, Netdev <netdev@vger.kernel.org>, 
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-sound@vger.kernel.org, Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Andrew Lunn <andrew@lunn.ch>, Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v9 00/38] ep93xx device tree conversion
Message-ID: <izbjcqcvjjhwwbrrhk7jer536ydi5gr7gqdg5icsbmialrrepn@dp7q6jvjujrj>
References: <20240326-ep93xx-v9-0-156e2ae5dfc8@maquefel.me>
 <66e1da99-5cf4-4506-b0bf-4bdf04959f41@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <66e1da99-5cf4-4506-b0bf-4bdf04959f41@app.fastmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240413_014915_660748_91D1FD4F 
X-CRM114-Status: GOOD (  31.67  )
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
Content-Type: multipart/mixed; boundary="===============1607085946672172735=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1607085946672172735==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pjwf7nurmhwqoh67"
Content-Disposition: inline


--pjwf7nurmhwqoh67
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Arnd,

On Tue, Mar 26, 2024 at 11:07:06AM +0100, Arnd Bergmann wrote:
> On Tue, Mar 26, 2024, at 10:18, Nikita Shubin via B4 Relay wrote:
> > The goal is to recieve ACKs for all patches in series to merge it via=
=20
> > Arnd branch.
>=20
> Thank you for the continued updates, I really hope we can merge
> it all for 6.10. I've looked through it again and I'm pretty much
> ready to just merge it, though I admit that the process is not
> working out that great, and it would probably have been quicker
> to add DT support to drivers individually through the subsystem
> trees.
>=20
> > Stephen Boyd, Vinod Koul PLEASE! give some comments on following, couse=
=20
> > i hadn't one for a couple of iterations already:
> >
> > Following patches require attention from Stephen Boyd, as they were=20
> > converted to aux_dev as suggested:
> >
> > - ARM: ep93xx: add regmap aux_dev
> > - clk: ep93xx: add DT support for Cirrus EP93xx
> >
> > Following patches require attention from Vinod Koul:
> >
> > - dma: cirrus: Convert to DT for Cirrus EP93xx
> > - dma: cirrus: remove platform code
>=20
> I suspect that Stephen and Vinod may be missing this, as reviewing
> a 38 patch series tends to be a lot of work, and they may have
> missed that they are on the critical path here. I certainly
> tend to just ignore an entire thread when it looks like I'm not
> immediately going to be reviewing it all and other people are
> likely to have more comments first, so I'm not blaming them.
>=20
> To better catch their attention, I would suggest you repost the
> two smaller sets of patches as a separate series, with only the
> relevant people on Cc. Please also include the respective
> bindings when you send send these patches to Stephen and
> Vinod.

It seems this happend for the clock series; it's at
https://lore.kernel.org/all/20240408-ep93xx-clk-v1-0-1d0f4c324647@maquefel.=
me/
and received an ack by Stephen.

Vinod gave some feedback in this thread with some remarks that need
addressing.

With the latter I wonder if the plan to get this as a whole into v6.10
is screwed and if I should pick up the PWM bits (patches #12, #13 and
maybe #38) via my tree. Patch #38 touches arch/arm and
include/linux/soc, so I wouldn't pick that one up without an explicit
ack by (I guess) Arnd.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pjwf7nurmhwqoh67
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmYaRtAACgkQj4D7WH0S
/k4o+wgAuEjfWmNoFVoIX9NkVmNLAztPiy6Nh9yJ/HEcfVvrFbjsMvDotb4qsGsE
zfAz7mfofpUhLaFIGx1Sr9p8Zx4eXf0lmRH68rTiXE/hV39TXWKgmf03FG3yPOzN
1KouxDXOtKIiBxdhSBON/zWyYksJzI9WfjLtzPhcbS0N3CEWi7aTvVS7HmKStyAU
8/YI17F/4ym1Rf8Zm6JqyzQy5lOmmjy+Sq+BHfkB0ZpNIHQSoaOWISL3Y9bsFSJX
ALkkO6L4WJVqkAL718q6pYMtb9SiNVyQjyYgYddxFfM6c6cnhg1AV+QEk+VLTPHy
OgUVpigrpDXH/2JTVvZ7VetbpnSGAg==
=sCOf
-----END PGP SIGNATURE-----

--pjwf7nurmhwqoh67--


--===============1607085946672172735==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1607085946672172735==--

