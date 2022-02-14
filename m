Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4FFBC43217
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 13:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXFE7vBXKtDaIk9NnKmfhxyiIelsmQB0pcjZ5BKFtnY=; b=Bt9d+1/NNgvNdAkJlz+pIgNBH9
	3SQromXCMMFo58fnQ2cx96GhW75ZU51nSWvDat0/FOYVkR2Tb4dKS36v71YOnPGtyxRjBC2TeaLON
	e8uXIzC6Qr8ARXenvVcsr413vH67DbftuFTd1bUiniUcWM37vuycujKo0XmFDpnCgYzBzlDD0DIvt
	TZjLbyUr4844nXIBc7r+/MOKFjV9S9Z1yQu9uLllg2Oa4AgPomBdrArcuE342jHPPcbHoQ3HeSH/J
	rJLImoUVcLvzMWDo5PNBwNT+GSSkvcmFBWDsdBTtfVUL9ZEY3w8Vk6xSuBdYWKqe2l07OdijlKNhR
	S5UO3GkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJbqo-00FVx8-SM; Mon, 14 Feb 2022 13:57:11 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJbqk-00FVtA-Fx
 for linux-mtd@lists.infradead.org; Mon, 14 Feb 2022 13:57:08 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbqA-0006T5-AI; Mon, 14 Feb 2022 14:56:30 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbq0-00GYf6-Ms; Mon, 14 Feb 2022 14:56:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJbpy-0038Nh-VX; Mon, 14 Feb 2022 14:56:18 +0100
Date: Mon, 14 Feb 2022 14:56:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, kvm@vger.kernel.org,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-phy@lists.infradead.org,
 Oleksij Rempel <linux@rempel-privat.de>, Lee Jones <lee.jones@linaro.org>,
 "David S. Miller" <davem@davemloft.net>,
 Peter Korsgaard <peter@korsgaard.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Jiri Slaby <jirislaby@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list@broadcom.com, linux-serial@vger.kernel.org,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 platform-driver-x86@vger.kernel.org, linux-pwm@vger.kernel.org,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Corey Minyard <minyard@acm.org>, linux-pm@vger.kernel.org,
 John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, linux-gpio@vger.kernel.org,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Eric Auger <eric.auger@redhat.com>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 openipmi-developer@lists.sourceforge.net, Jaroslav Kysela <perex@perex.cz>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Sergey Shtylyov <s.shtylyov@omp.ru>, Mun Yew Tham <mun.yew.tham@intel.com>,
 Hans de Goede <hdegoede@redhat.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Zha Qipeng <qipeng.zha@intel.com>, Richard Weinberger <richard@nod.at>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Brian Norris <computersforpeace@gmail.com>, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220214135618.kdiikxi3j4j4erks@pengutronix.de>
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
 <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
 <YgorLXUr8aT+1ttv@smile.fi.intel.com>
MIME-Version: 1.0
In-Reply-To: <YgorLXUr8aT+1ttv@smile.fi.intel.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_055706_594533_9BD607B5 
X-CRM114-Status: GOOD (  29.21  )
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
Content-Type: multipart/mixed; boundary="===============4793080320161641380=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============4793080320161641380==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="woc7fbustut2ntcm"
Content-Disposition: inline


--woc7fbustut2ntcm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Andy,

On Mon, Feb 14, 2022 at 12:13:01PM +0200, Andy Shevchenko wrote:
> On Mon, Feb 14, 2022 at 08:13:51AM +0100, Uwe Kleine-K=F6nig wrote:
> > On Sat, Feb 12, 2022 at 11:16:30PM +0300, Sergey Shtylyov wrote:
> > > This patch is based on the former Andy Shevchenko's patch:
> > >=20
> > > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko=
@linux.intel.com/
> > >=20
> > > Currently platform_get_irq_optional() returns an error code even if I=
RQ
> > > resource simply has not been found.  It prevents the callers from bei=
ng
> > > error code agnostic in their error handling:
> > >=20
> > > 	ret =3D platform_get_irq_optional(...);
> > > 	if (ret < 0 && ret !=3D -ENXIO)
> > > 		return ret; // respect deferred probe
> > > 	if (ret > 0)
> > > 		...we get an IRQ...
> > >=20
> > > All other *_optional() APIs seem to return 0 or NULL in case an optio=
nal
> > > resource is not available.  Let's follow this good example, so that t=
he
> > > callers would look like:
> > >=20
> > > 	ret =3D platform_get_irq_optional(...);
> > > 	if (ret < 0)
> > > 		return ret;
> > > 	if (ret > 0)
> > > 		...we get an IRQ...
> > >=20
> > > Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> >=20
> > While this patch is better than v1, I still don't like it for the
> > reasons discussed for v1. (i.e. 0 isn't usable as a dummy value which I
> > consider the real advantage for the other _get_optional() functions.)
>=20
> I think you haven't reacted anyhow to my point that you mixing apples and
> bananas together when comparing this 0 to the others _optional APIs.

Is this a question to me or Sergey?

I fully agree, when the 0 of platform_get_irq_optional is an apple and
the NULL of gpio_get_optional is a banana, I doubt "All other
*_optional() APIs seem to return 0 or NULL in case an optional resource
is not available.  Let's follow this good example, [...]".

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--woc7fbustut2ntcm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKX38ACgkQwfwUeK3K
7AnLpgf9EdBYBZTRjJVoNGFFTEqmmhehKa4KFk5v/UfvgXZenr00B/u2K/MHO4lF
HHazTdjZ6XfXR0zlckqQaisXEU2TXb/YxxUC3K7hBgh1k2dtS14XlUQHbh2zQXQI
HKw3Yitn6vDghQH9WkSROTJNBOvMg3PcAg8i5h8g17e0D9BI5sdJERnMTFNeMzpz
cY95lA6BqyVoJn2GW+QxAKYiYCMB5CSNw3yIxV8nd8CKPKMUQNt4aX4EFwglsJKP
dB7ddBCRW0+mJcywV7mjkU7B7q6hTtPyAkNBQrWYtaAY4xcsIH7E2T64AaNc4Rah
C/iCiRD7LGScn9QG72fV+C+upY3/gg==
=VmOP
-----END PGP SIGNATURE-----

--woc7fbustut2ntcm--


--===============4793080320161641380==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4793080320161641380==--

