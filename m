Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D364C7618E
	for <linux-mtd@archiver.kernel.org>; Wed, 26 Apr 2023 21:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sU/BQ4/jqOS3uMxXcW+ZOdAiAp8/+segxGrz81OEZu0=; b=d8KFi0t2Zoc2pOwv0fjCuZxHp9
	IGuC9kv0e3Q65f1r6idabzmLN+/pWVH7hngADxutmKm1KB7RbDogE2qIV67yTLzUEI9nxoaJnIg7Z
	/ORqljpeZnApgsDW67u9tuPcUe/Hg0sG3Cb/Atl6AM2a44AX5tfoH0BDf0o5/WPpVH/07iUY89sFB
	DILB5Inl8HzAvGN/4/uuoHUW+L3IDD94vUGXQRrBPD9DY61E9E8Ozphd7ugcZXsj51W3oxdvgOSYa
	fpmzKKigTpSJtOKYVwiwmWsFR+lDZ4lJzr4hQr9+u49PhVbzXrl50EXPWJtD/wikgN3HAv9i+5oJr
	36VYcnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prmHI-004rkO-13;
	Wed, 26 Apr 2023 21:02:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1prmHF-004rk2-0Z;
	Wed, 26 Apr 2023 21:02:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7993262F96;
	Wed, 26 Apr 2023 21:02:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 647F8C433EF;
	Wed, 26 Apr 2023 21:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682542930;
	bh=dk6b/0HWYMRtfV9qMW3bV+XRoEDTJNDNRtBCLFI9nTo=;
	h=Date:From:To:List-Id:Cc:Subject:References:In-Reply-To:From;
	b=m0bRBe1jhR57bR0mjtiETvtuaXuGZqananSYQclAwPRk5Bc05FEF38a7OlNCkunkp
	 yBQP+THpgawS2bcxohkuSwA1g/yxRRDo/Qx/jwW9jGSbgdDd2RQtztsPcKxg48qS0N
	 j6mGkleLmQ/76VhIaG6rJn3NmV0qI41BRuUaAE5s6mtt2/MaLPRoquZ1/JKyKslu3s
	 tPojv3kgq6p2YBjq/CHaHu7SuJmdHGKRcbQfoSIGvDUgNcyZD8jh6xGRR+Np6u6lct
	 KildN95xpHCBTi2hLfVM8v4kCW4OSWdy8i+40d+rdjxtE/WgplWyCwLKM9PSaQ0Lke
	 h7s3jo1CsTstA==
Date: Wed, 26 Apr 2023 22:01:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Nikita Shubin <nikita.shubin@maquefel.me>,
	Arnd Bergmann <arnd@kernel.org>, Linus Walleij <linusw@kernel.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jonathan =?iso-8859-1?Q?Neusch=E4fer?= <j.neuschaefer@gmx.net>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Brian Norris <briannorris@chromium.org>,
	Chuanhong Guo <gch981213@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Hartley Sweeten <hsweeten@visionengravers.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Hitomi Hasegawa <hasegawa-hitomi@fujitsu.com>,
	Jakub Kicinski <kuba@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Jean Delvare <jdelvare@suse.de>, Joel Stanley <joel@jms.id.au>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Le Moal <damien.lemoal@opensource.wdc.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Liang Yang <liang.yang@amlogic.com>,
	Lukasz Majewski <lukma@denx.de>, Lv Ruyi <lv.ruyi@zte.com.cn>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Olof Johansson <olof@lixom.net>, Paolo Abeni <pabeni@redhat.com>,
	Qin Jian <qinjian@cqplus1.com>, Richard Weinberger <richard@nod.at>,
	Rob Herring <robh+dt@kernel.org>,
	Robert Jarzmik <robert.jarzmik@free.fr>,
	Russell King <linux@armlinux.org.uk>,
	Sebastian Reichel <sre@kernel.org>,
	Sergey Shtylyov <s.shtylyov@omp.ru>,
	Stephen Boyd <sboyd@kernel.org>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Sven Peter <sven@svenpeter.dev>, Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Vinod Koul <vkoul@kernel.org>,
	Walker Chen <walker.chen@starfivetech.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Yinbo Zhu <zhuyinbo@loongson.cn>, alsa-devel@alsa-project.org,
	devicetree@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-ide@vger.kernel.org,
	linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-pm@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
	linux-spi@vger.kernel.org, linux-watchdog@vger.kernel.org,
	netdev@vger.kernel.org, soc@kernel.org
Subject: Re: [PATCH 00/43] ep93xx device tree conversion
Message-ID: <b5396ef5-3fed-4e98-8f37-a9cd4473bddc@sirena.org.uk>
References: <20230424123522.18302-1-nikita.shubin@maquefel.me>
 <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACRpkdarANFQ7-p=-Pi_iuk6L=PfSLDsD3_w4dEVqarwXkEGMQ@mail.gmail.com>
X-Cookie: Drilling for oil is boring.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_140213_319027_754B64B4 
X-CRM114-Status: GOOD (  19.59  )
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
Content-Type: multipart/mixed; boundary="===============5407242484773809061=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5407242484773809061==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I5GnqS13l10kVXrY"
Content-Disposition: inline


--I5GnqS13l10kVXrY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Apr 26, 2023 at 10:56:53PM +0200, Linus Walleij wrote:

> This is a big patch set and the improvement to the ARM kernel it
> brings is great, so I am a bit worried about over-review stalling the
> merged. If there start to be nitpicky comments I would prefer that
> we merge it and let minor comments and "nice-to-haves" be
> addressed in-tree during the development cycle.

I'm really not enthusiastic about the SPI bindings being merged as-is.

--I5GnqS13l10kVXrY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmRJkT8ACgkQJNaLcl1U
h9B3Igf/QHH4S59NGDBfaDSgwwIyuYlvgVyy/BCHVqFNcP2pjHcpj0GHo+WkpjVP
wsDLG8hswF/nuh2Yy6i1bBVQ1ugfJUg7KkA+cj7Inagtdre2PIwXKkc8AiLH2c74
u0aKy1ihWmdVW49iT4tEm6vq8ar/UPuxorRa8RwkkFaEzFdRbC9+c0d8ZY50FdCe
erujumfY11ZfUuNVceFfDnEz9GKxjPo5w3uUE7KV9EwK6tPH20f8T9NdmH7FxtLi
k2V0DxnDxZWpGsmYFDjOI4pUDGjDxZ+KJLKKE4mSz5n+SckkAHkGhwAJQnXjl3Ct
6pcdgTLe0bfrxqlq1Hn6QWGqWMW7bw==
=5CpS
-----END PGP SIGNATURE-----

--I5GnqS13l10kVXrY--


--===============5407242484773809061==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5407242484773809061==--

