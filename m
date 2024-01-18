Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F08D0C47DAF
	for <linux-mtd@archiver.kernel.org>; Thu, 18 Jan 2024 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eb1Ayl44AJoVDBnLrVZHqWhOIqdTkz1Tlul8ir3tZVI=; b=nWbg53jnJugUUCysexIAEJkvyz
	HlRRlSDK/YDqnz1fNqO3UQ17Ot7+nkQoZpTN1n6uMxdW+gGjBl3SENVKq33d9vp7ImzJCzKbp5NHW
	oBAhCWoQYA71Os4uqjAyzOdgsreZ3rEIRosUgXdsIpMQJ7nXnHZzY3q52UFNJM1KcVLX8q6Ms+eOV
	47nImke3++LSPryUcSBGlNJBS14tqSrvJisjZVwLQ3p6ahsm8nBzTcgkkxorSnHIWWzvUlp+D0e3r
	WS8+hiAO9uBTFimVTwaGF59qkC3l/+L687va121o2ogF/aosWFBuvoiOJ5+N0eGE4YF/thOXDgKcD
	KA9D4DpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQOkf-002IMw-2E;
	Thu, 18 Jan 2024 09:31:57 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQOkd-002IMD-0K
	for linux-mtd@lists.infradead.org;
	Thu, 18 Jan 2024 09:31:56 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQOj3-0002xz-Tn; Thu, 18 Jan 2024 10:30:17 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQOiy-000etK-Ax; Thu, 18 Jan 2024 10:30:12 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rQOiy-002Ifg-0Y;
	Thu, 18 Jan 2024 10:30:12 +0100
Date: Thu, 18 Jan 2024 10:30:11 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: nikita.shubin@maquefel.me
Cc: Hartley Sweeten <hsweeten@visionengravers.com>, 
	Alexander Sverdlin <alexander.sverdlin@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Lukasz Majewski <lukma@denx.de>, Linus Walleij <linus.walleij@linaro.org>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Guenter Roeck <linux@roeck-us.net>, Thierry Reding <thierry.reding@gmail.com>, 
	Mark Brown <broonie@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Miquel Raynal <miquel.raynal@bootlin.com>, 
	Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Damien Le Moal <dlemoal@kernel.org>, Sergey Shtylyov <s.shtylyov@omp.ru>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Ralf Baechle <ralf@linux-mips.org>, "Wu, Aaron" <Aaron.Wu@analog.com>, Lee Jones <lee@kernel.org>, 
	Olof Johansson <olof@lixom.net>, Niklas Cassel <cassel@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
	dmaengine@vger.kernel.org, linux-watchdog@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-spi@vger.kernel.org, netdev@vger.kernel.org, linux-mtd@lists.infradead.org, 
	linux-ide@vger.kernel.org, linux-input@vger.kernel.org, linux-sound@vger.kernel.org, 
	Arnd Bergmann <arnd@arndb.de>, Andy Shevchenko <andriy.shevchenko@intel.com>, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Andrew Lunn <andrew@lunn.ch>, 
	Andy Shevchenko <andy.shevchenko@gmail.com>
Subject: Re: [PATCH v7 00/39] ep93xx device tree conversion
Message-ID: <a54csycouodnmj6qarfel7cvgupaerl7uhrruixuy7uaekqgzw@2whufrjqunme>
References: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
MIME-Version: 1.0
In-Reply-To: <20240118-ep93xx-v7-0-d953846ae771@maquefel.me>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_013155_169787_B8C20FB9 
X-CRM114-Status: GOOD (  13.08  )
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
Content-Type: multipart/mixed; boundary="===============4963714756695992984=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4963714756695992984==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="s7rbtueqy4vwjth4"
Content-Disposition: inline


--s7rbtueqy4vwjth4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jan 18, 2024 at 11:20:43AM +0300, Nikita Shubin via B4 Relay wrote:
> No major changes since last version (v6) all changes are cometic.

Never saw changes described as "cometic". I guess that means "fast" and
"high impact"?

SCNR
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--s7rbtueqy4vwjth4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWo76MACgkQj4D7WH0S
/k5uKAf/Z0JDYxAVHNppDOc31mQ8q/h4mL5VX4NFHWitBkLRBX5sufWi6uUBbK7h
KA9Z1DHWGNNXUXsV2IsXKsw6WcsC+Wj/g+hUfWMx2kvbnvD8JtYBl1+MJALeBVlt
aQCy1yMPL36xcy8vSLyh63vZXUHyBaWuooRwVqOhklHSg7/rwSEwECEZZqsg748Z
iiYmSVRjLlktw1yUtJBvlO1fXWQ41DSbyaQWaIJvbym8B5+2XXW2BTGZOg7CuDz5
HG9KvXf2AnAEM4RAV6Oo/WKBBEq0kfQ/UBkkH85YOaXrDlNblggfMix84LyansxB
43g95kkMn3JP3koNgEA+nk73+SCctA==
=1qlI
-----END PGP SIGNATURE-----

--s7rbtueqy4vwjth4--


--===============4963714756695992984==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4963714756695992984==--

