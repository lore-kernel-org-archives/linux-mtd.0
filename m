Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C054BEB64DC
	for <linux-mtd@archiver.kernel.org>; Thu, 20 Jul 2023 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FA/ZUpVVpeUob+FgkJiipFwrX/L0P0QyMtWrYDVbDpk=; b=GkrBX5j8ktauqSy7fGdzYKS7VA
	MqqJA7tGMz5YZIJoP2Y36FZxXsPrn7D9VXP13/6W4kmxsPqFtEgSz/oKGsxdfSryULaQN93YxKAX1
	7vvvvPXEDaigTqFbvdLpAJ9bE4ll/sbJTOXGAJ8mfQXbnSkehnv2me+iKDh8mAQyp/nyidVQZO94G
	8h671DaiT+CvGJNCQBZWIXKEy9vFdqsp9QOpjJU/HSz/LPuDXUPKlloagqgSjnQnrDABp2bEvMtIj
	lmTgzPj4lvTdiFe7HNPTMCTpHJ+l1W8mq0/AbcWTseh8zmCmk5vgLbl21R8HRwe53cBAc3nMIv27i
	bcjeYeBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMStM-00B9MV-1v;
	Thu, 20 Jul 2023 12:36:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMStI-00B9M1-23;
	Thu, 20 Jul 2023 12:36:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 53C3661A41;
	Thu, 20 Jul 2023 12:36:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34E69C433C7;
	Thu, 20 Jul 2023 12:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689856578;
	bh=tx4bjwgSSJSb6YT5+Vwiw5cr91ahSeHGqQoHPOhKX8c=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=OxsinWvIFF5gSYzeC9nprmcJnexZ2+pzRTEtCPGSDVXBXTxmtyD8J6cScmlKDK3cB
	 5yE1supJc9fsWZHybibJENoDpuz2+JtJq0G0/o1M9H5vusZ/mbBNE89kmITtLNWiUv
	 VoYJp6D/sT5jvqV22YqlSQtVCg1Ds1tBAbxEP0qahLvXW+mcnCR+r5IZSf1AolV+A8
	 TLA3CjFa77OdSPos2Qg4O1B7BjDbMZaGdV7iiw3FoGeIJWPra6iLOe3D7hFUktjPhd
	 pswJWK5/sxEEqZ7EFzaPyQhlO+ROBbnAN36OJeucLXcjKaVy7Z0N1/uAdQi0D9efa3
	 FUZwjDuSIiyQw==
Date: Thu, 20 Jul 2023 13:36:01 +0100
From: Mark Brown <broonie@kernel.org>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>,
	Lennert Buytenhek <kernel@wantstofly.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Lukasz Majewski <lukma@denx.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Sebastian Reichel <sre@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
	soc@kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andy@kernel.org>,
	Michael Peters <mpeters@embeddedts.com>,
	Kris Bahnsen <kris@embeddedts.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-watchdog@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-spi@vger.kernel.org,
	netdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, alsa-devel@alsa-project.org
Subject: Re: [PATCH v3 42/42] ASoC: cirrus: edb93xx: Delete driver
Message-ID: <d77bee81-190a-4aa2-98ac-8da3a9801b50@sirena.org.uk>
References: <20230605-ep93xx-v3-0-3d63a5f1103e@maquefel.me>
 <20230605-ep93xx-v3-42-3d63a5f1103e@maquefel.me>
MIME-Version: 1.0
In-Reply-To: <20230605-ep93xx-v3-42-3d63a5f1103e@maquefel.me>
X-Cookie: Ginger snap.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_053620_787094_A1C4413C 
X-CRM114-Status: GOOD (  13.30  )
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
Content-Type: multipart/mixed; boundary="===============1626978913037728149=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1626978913037728149==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5GyV5EkRHy37I+rH"
Content-Disposition: inline


--5GyV5EkRHy37I+rH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 20, 2023 at 02:29:42PM +0300, Nikita Shubin via B4 Relay wrote:
> From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
>=20
> Can be replaced with "simple-audio-card" for the rates up to 50kHz, refer
> to commit "ARM: dts: ep93xx: Add EDB9302 DT".

Acked-by: Mark Brown <broonie@kernel.org>

--5GyV5EkRHy37I+rH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmS5KjEACgkQJNaLcl1U
h9B6aQf/XDtbT4LN4vU9F6keDfckOFzxaWiUcy57r8jPcwHJg8vCxhKWHLrclREk
XH6ynZJ84wMW6ghI1RW3NJ06CVhs/KPzBcZ30la2LplfkeaUXMcB6Gh7C3NSzzkZ
47MAW/Y4HgC8BFFwixdr6vcqulgad7GD8AZcJq0FfaRSuv0OBYpicItwd2Hjxyev
yx3wdBDRiwxBn4FdFOd1KU3fnLZbvVBEmrF54V5z8AM3nkN+u0tSyAHyoaEMNQ+N
bBbcQi0/TIdD0ktmis2z41SHRJJUpLB65MWk6Kjs92gE9GS7g4m3LJrDtrm/FqVT
81KRIgPAl1ZTlDxAZhUIyTGU9MecZw==
=aMu7
-----END PGP SIGNATURE-----

--5GyV5EkRHy37I+rH--


--===============1626978913037728149==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1626978913037728149==--

