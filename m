Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A3E8C433F5
	for <linux-mtd@archiver.kernel.org>; Mon, 10 Jan 2022 20:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k6HKesQhJZi68P7+Q257jBDu1WGnp5YImmC+Hgcx1Js=; b=BYcwHYAzJ0ZDWURGnmhhs0Y+BE
	Cttw8IaMqR+lbp4U6rfQYqX8ZEdyoU12oH1OpaKNLwwrl5jTa6RWHQEoNUYbRdFEkXK/VcgsZSuaK
	blMytzedRn/UiBmJRhAHU73xWVyqiIu6h2/qAKzlBkdIPIl10p2Pp15+oRHAEsYa4EXv3KOO6itkl
	wrMPua6hx6lr6a2LfLgkfXknZdYqPv/X4LDfhQ4E1BF2t6bAA4SgOC5o7mxHkUrZ9Y6994aem8cYn
	84E39BqW0CHiMetVO5Gz3VXuCGVUyheihhDu5OihwFM1NqUJV414RkoIN16GboKHEWJB/Hh+fd5lc
	lOX8wViw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n711e-00DB28-HV; Mon, 10 Jan 2022 20:12:18 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n711b-00DAzJ-14
 for linux-mtd@lists.infradead.org; Mon, 10 Jan 2022 20:12:16 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n70zq-0000Jr-8q; Mon, 10 Jan 2022 21:10:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n70zg-009aNt-0Y; Mon, 10 Jan 2022 21:10:15 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n70ze-0007V8-8f; Mon, 10 Jan 2022 21:10:14 +0100
Date: Mon, 10 Jan 2022 21:10:14 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, Jiri Slaby <jirislaby@kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, Lee Jones <lee.jones@linaro.org>,
 openipmi-developer@lists.sourceforge.net,
 Saravanan Sekar <sravanhome@gmail.com>,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 kvm@vger.kernel.org, Kamal Dasu <kdasu.kdev@gmail.com>,
 Richard Weinberger <richard@nod.at>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Jaroslav Kysela <perex@perex.cz>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 John Garry <john.garry@huawei.com>,
 Robert Richter <rric@kernel.org>, Zha Qipeng <qipeng.zha@intel.com>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Benson Leung <bleung@chromium.org>,
 linux-arm-kernel@lists.infradead.org, linux-edac@vger.kernel.org,
 Tony Luck <tony.luck@intel.com>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 James Morse <james.morse@arm.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
MIME-Version: 1.0
In-Reply-To: <20220110195449.12448-2-s.shtylyov@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_121215_089705_9F130224 
X-CRM114-Status: GOOD (  26.29  )
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
Content-Type: multipart/mixed; boundary="===============6490496214961363010=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6490496214961363010==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="brvee3afuyivhyph"
Content-Disposition: inline


--brvee3afuyivhyph
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Jan 10, 2022 at 10:54:48PM +0300, Sergey Shtylyov wrote:
> This patch is based on the former Andy Shevchenko's patch:
>=20
> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@lin=
ux.intel.com/
>=20
> Currently platform_get_irq_optional() returns an error code even if IRQ
> resource simply has not been found. It prevents the callers from being
> error code agnostic in their error handling:
>=20
> 	ret =3D platform_get_irq_optional(...);
> 	if (ret < 0 && ret !=3D -ENXIO)
> 		return ret; // respect deferred probe
> 	if (ret > 0)
> 		...we get an IRQ...
>=20
> All other *_optional() APIs seem to return 0 or NULL in case an optional
> resource is not available. Let's follow this good example, so that the
> callers would look like:
>=20
> 	ret =3D platform_get_irq_optional(...);
> 	if (ret < 0)
> 		return ret;
> 	if (ret > 0)
> 		...we get an IRQ...

The difference to gpiod_get_optional (and most other *_optional) is that
you can use the NULL value as if it were a valid GPIO.

As this isn't given with for irqs, I don't think changing the return
value has much sense. In my eyes the problem with platform_get_irq() and
platform_get_irq_optional() is that someone considered it was a good
idea that a global function emits an error message. The problem is,
that's only true most of the time. (Sometimes the caller can handle an
error (here: the absence of an irq) just fine, sometimes the generic
error message just isn't as good as a message by the caller could be.
(here: The caller could emit "TX irq not found" which is a much nicer
message than "IRQ index 5 not found".)

My suggestion would be to keep the return value of
platform_get_irq_optional() as is, but rename it to
platform_get_irq_silent() to get rid of the expectation invoked by the
naming similarity that motivated you to change
platform_get_irq_optional().

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--brvee3afuyivhyph
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHckpoACgkQwfwUeK3K
7AmPEAf/e1sLmVHBLqGY9M4YYn2aUPQflQncGGvDAcCOcOjWhjj61Z53oAw8B/Eb
3J5RoNwe8DIoUyLHQa6DtxFAk+dFhxCCt/6oJngstFQmZYKw3pdpADTY7EDtYA8+
mYdn6pcScMhpA6OBtI9ybuLy2WaUubn5rCr+NsldDY9GS9GaUvCNWcayugGDQSH1
uHWNiupkgORajRdaD+ENzFqUohu0HSr6CPy0mid1+4h/9xcykRE38sjcmQ1n+7qs
/Rpe0taiRj94Ut9mV/MW8nEARhxt+bRH/oI91P369tNKqaWP2IdMcyB04zJvNeLc
YLmkZv+MpI9lIZU3TrRVSk9UVwA0BQ==
=/ril
-----END PGP SIGNATURE-----

--brvee3afuyivhyph--


--===============6490496214961363010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6490496214961363010==--

