Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC02C433EF
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Jan 2022 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=muSWo0D6aj17fMtbf2Sjt4iMvymWFEUzTsmUx4k2Tug=; b=r+DqC6Ya+xi/+YkbQGcX4dv0FQ
	QG9WVm9MavL+IzPPhNqfdLwEe4hxqndlF3Y1LMF2/OYhwnUEJkcVmiJEHZ+vKIEXqC3wsKt6LoLTx
	2M7vZJRS7QkzZcYa03HlSyV3msgU0LbiccbLCRFiPiVpYEvSm7Q9T+4GhR88Z1jdrb4z1y6CU/ft2
	phHEo2tUIKlwk5OlWBjwmmG86kmclS1NOXZpPnV2gFxVZhm1+B8+J8gaDND8v1dPuln0qyF78AQO5
	qLCdJ/NDiDSM3WrRwq8PVREnsj4HTGawjDOUKupBeYhbxVy03IbKRq4vww4GehhgRhoqHu9F5AqWW
	h1uFnsLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8Iro-008Uy9-R1; Fri, 14 Jan 2022 09:27:29 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8Irk-008Uvp-Ev
 for linux-mtd@lists.infradead.org; Fri, 14 Jan 2022 09:27:26 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8IqX-0007Po-Mn; Fri, 14 Jan 2022 10:26:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8IqP-00AEBU-7g; Fri, 14 Jan 2022 10:26:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8IqN-0000tG-Uq; Fri, 14 Jan 2022 10:25:59 +0100
Date: Fri, 14 Jan 2022 10:25:57 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Mark Brown <broonie@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Jaroslav Kysela <perex@perex.cz>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Zhang Rui <rui.zhang@intel.com>, platform-driver-x86@vger.kernel.org,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Takashi Iwai <tiwai@suse.com>,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Eric Auger <eric.auger@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-edac@vger.kernel.org, Tony Luck <tony.luck@intel.com>,
 Richard Weinberger <richard@nod.at>, Mun Yew Tham <mun.yew.tham@intel.com>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>, Sebastian Reichel <sre@kernel.org>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220114092557.jrkfx7ihg26ekzci@pengutronix.de>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
MIME-Version: 1.0
In-Reply-To: <29f0c65d-77f2-e5b2-f6cc-422add8a707d@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220114_012724_693942_E55C879D 
X-CRM114-Status: GOOD (  32.95  )
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
Content-Type: multipart/mixed; boundary="===============0317824643669084284=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0317824643669084284==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pqpclpjbrmroys3t"
Content-Disposition: inline


--pqpclpjbrmroys3t
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Sergey,

On Thu, Jan 13, 2022 at 11:35:34PM +0300, Sergey Shtylyov wrote:
> On 1/13/22 12:45 AM, Mark Brown wrote:
> >>> To me it sounds much more logical for the driver to check if an
> >>> optional irq is non-zero (available) or zero (not available), than to
> >>> sprinkle around checks for -ENXIO. In addition, you have to remember
> >>> that this one returns -ENXIO, while other APIs use -ENOENT or -ENOSYS
> >>> (or some other error code) to indicate absence. I thought not having
> >>> to care about the actual error code was the main reason behind the
> >>> introduction of the *_optional() APIs.
> >=20
> >> No, the main benefit of gpiod_get_optional() (and clk_get_optional()) =
is
> >> that you can handle an absent GPIO (or clk) as if it were available.
>=20
>    Hm, I've just looked at these and must note that they match 1:1 with
> platform_get_irq_optional(). Unfortunately, we can't however behave the
> same way in request_irq() -- because it has to support IRQ0 for the sake
> of i8253 drivers in arch/...

Let me reformulate your statement to the IMHO equivalent:

	If you set aside the differences between
	platform_get_irq_optional() and gpiod_get_optional(),
	platform_get_irq_optional() is like gpiod_get_optional().

The introduction of gpiod_get_optional() made it possible to simplify
the following code:

	reset_gpio =3D gpiod_get(...)
	if IS_ERR(reset_gpio):
		error =3D PTR_ERR(reset_gpio)
		if error !=3D -ENDEV:
			return error
	else:
		gpiod_set_direction(reset_gpiod, INACTIVE)

to

	reset_gpio =3D gpiod_get_optional(....)
	if IS_ERR(reset_gpio):
		return reset_gpio
	gpiod_set_direction(reset_gpiod, INACTIVE)

and I never need to actually know if the reset_gpio actually exists.
Either the line is put into its inactive state, or it doesn't exist and
then gpiod_set_direction is a noop. For a regulator or a clk this works
in a similar way.

However for an interupt this cannot work. You will always have to check
if the irq is actually there or not because if it's not you cannot just
ignore that. So there is no benefit of an optional irq.

Leaving error message reporting aside, the introduction of
platform_get_irq_optional() allows to change

	irq =3D platform_get_irq(...);
	if (irq < 0 && irq !=3D -ENXIO) {
		return irq;
	} else if (irq >=3D 0) {
		... setup irq operation ...
	} else { /* irq =3D=3D -ENXIO */
		... setup polling ...
	}

to
=09
	irq =3D platform_get_irq_optional(...);
	if (irq < 0 && irq !=3D -ENXIO) {
		return irq;
	} else if (irq >=3D 0) {
		... setup irq operation ...
	} else { /* irq =3D=3D -ENXIO */
		... setup polling ...
	}

which isn't a win. When changing the return value as you suggest, it can
be changed instead to:

	irq =3D platform_get_irq_optional(...);
	if (irq < 0) {
		return irq;
	} else if (irq > 0) {
		... setup irq operation ...
	} else { /* irq =3D=3D 0 */
		... setup polling ...
	}

which is a tad nicer. If that is your goal however I ask you to also
change the semantic of platform_get_irq() to return 0 on "not found".
Note the win is considerably less compared to gpiod_get_optional vs
gpiod_get however. And then it still lacks the semantic of a dummy irq
which IMHO forfeits the right to call it ..._optional().

Now I'm unwilling to continue the discussion unless there pops up a
suggestion that results in a considerable part (say > 10%) of the
drivers using platform_get_irq_optional not having to check if the
return value corresponds to "not found".

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--pqpclpjbrmroys3t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHhQaIACgkQwfwUeK3K
7AmkQAf/d5PfPw0IAOs7Wqvc6r/p6+1tkvEg9YM43cQ03LWApgcX+mJuGNq/lpcb
MvZUP4vJwOgXf4HlzKhY5cmrtlcjY+gTojfSCWGvV2oO7t1vx/19Mqh9zY3W297j
f5fYMWJx8DicM/I+7Clo5cNGZiBiwEcH3eptaX6YahEQXjSg45gPcXIpGNotj8AO
O/Xl9hviFVW48prFLlFLY+qfKNsJPVNtu/Gnl8qdD/USm6Wa7361ko6G32lHIHUf
7NnENwu96Qw92tZN7jHMMmHbiW1xwp5Yu3yd4xf2/h/RBc3iRsgbEoSgjoUYbMgS
v/GqERP7XEBCpDmg1fzMNr/LcXeBxQ==
=hCsr
-----END PGP SIGNATURE-----

--pqpclpjbrmroys3t--


--===============0317824643669084284==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0317824643669084284==--

