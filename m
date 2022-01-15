Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BADBC433EF
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jan 2022 15:23:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0fxOI5rZxUiKcNRKAndYGxiukv/X+jB++HXZybP1B9c=; b=V0EyZZD9XN19bB9kYOxqamYFt0
	ctKjas2UZwBa6BDsWSN+0aMr6j6cyqrPHcSZlDg684fqwokffO5zg35QzXGLFZ5Mslmfo5hgcjk/D
	ltMCMT6BVhK+UaP62zS8wKvh3y260L+AEXlhvY/wuXAMxFtjxzjY6N5uHiXGtzHBbyVftcrX56ZTM
	AStuNU3h7Y9PbwpHsZvSaj/2l06Jcib/Igni5KGEjR4C2ud2NTDZ+CfEhAl+8/lCOHGtp/HRntMkc
	WxUUqizLojpu2ZIifUd3TAGDebyTPX1tkY0fZFeT2birD5DkqSA1D+zC3SrNLiQ1uTb1QoXq+RlfI
	Eq/gJCCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8ktJ-00BD93-Ak; Sat, 15 Jan 2022 15:22:53 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8ktF-00BD7t-NU
 for linux-mtd@lists.infradead.org; Sat, 15 Jan 2022 15:22:51 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8krk-00024Z-CN; Sat, 15 Jan 2022 16:21:16 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8kra-00ASwx-3H; Sat, 15 Jan 2022 16:21:05 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8krY-0003aa-TV; Sat, 15 Jan 2022 16:21:04 +0100
Date: Sat, 15 Jan 2022 16:21:02 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>, KVM list <kvm@vger.kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, Amit Kucheria <amitk@kernel.org>,
 ALSA Development Mailing List <alsa-devel@alsa-project.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jaroslav Kysela <perex@perex.cz>, Guenter Roeck <groeck@chromium.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Linux I2C <linux-i2c@vger.kernel.org>,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 linux-phy@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
 openipmi-developer@lists.sourceforge.net,
 Khuong Dinh <khuong@os.amperecomputing.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Matthias Schiffer <matthias.schiffer@ew.tq-group.com>,
 Joakim Zhang <qiangqing.zhang@nxp.com>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Lee Jones <lee.jones@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Tony Luck <tony.luck@intel.com>, Kishon Vijay Abraham I <kishon@ti.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Zhang Rui <rui.zhang@intel.com>,
 Linux PWM List <linux-pwm@vger.kernel.org>,
 Robert Richter <rric@kernel.org>, Saravanan Sekar <sravanhome@gmail.com>,
 Corey Minyard <minyard@acm.org>, Linux PM list <linux-pm@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 John Garry <john.garry@huawei.com>, Peter Korsgaard <peter@korsgaard.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Sebastian Reichel <sre@kernel.org>, Eric Auger <eric.auger@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Takashi Iwai <tiwai@suse.com>, platform-driver-x86@vger.kernel.org,
 Benson Leung <bleung@chromium.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-edac@vger.kernel.org, Sergey Shtylyov <s.shtylyov@omp.ru>,
 Mun Yew Tham <mun.yew.tham@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 netdev <netdev@vger.kernel.org>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Linux MMC List <linux-mmc@vger.kernel.org>,
 Liam Girdwood <lgirdwood@gmail.com>, linux-spi <linux-spi@vger.kernel.org>,
 Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
 Vinod Koul <vkoul@kernel.org>, James Morse <james.morse@arm.com>,
 Zha Qipeng <qipeng.zha@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Richard Weinberger <richard@nod.at>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH] driver core: platform: Rename
 platform_get_irq_optional() to platform_get_irq_silent()
Message-ID: <20220115152102.m47snsdrw2elagak@pengutronix.de>
References: <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
 <YeA7CjOyJFkpuhz/@sirena.org.uk>
 <20220113194358.xnnbhsoyetihterb@pengutronix.de>
 <YeCI47ltlWzjzjYy@sirena.org.uk>
 <1df04d74-8aa2-11f1-54e9-34d0e8f4e58b@omp.ru>
 <20220113224319.akljsjtu7ps75vun@pengutronix.de>
 <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWjo36UGde3g5ysdXpLJn=mrPp31SDODuQNPUqoc-ARrQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220115_072249_962438_8671DD70 
X-CRM114-Status: GOOD (  43.88  )
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
Content-Type: multipart/mixed; boundary="===============6758592108534385208=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============6758592108534385208==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ocudook43fjcrvv4"
Content-Disposition: inline


--ocudook43fjcrvv4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 14, 2022 at 10:58:51AM +0100, Geert Uytterhoeven wrote:
> Hi Uwe,
>=20
> On Thu, Jan 13, 2022 at 11:43 PM Uwe Kleine-K=F6nig
> <u.kleine-koenig@pengutronix.de> wrote:
> > On Thu, Jan 13, 2022 at 11:57:43PM +0300, Sergey Shtylyov wrote:
> > > On 1/13/22 11:17 PM, Mark Brown wrote:
> > > >> The subsystems regulator, clk and gpio have the concept of a dummy
> > > >> resource. For regulator, clk and gpio there is a semantic differen=
ce
> > > >> between the regular _get() function and the _get_optional() varian=
t.
> > > >> (One might return the dummy resource, the other won't. Unfortunate=
ly
> > > >> which one implements which isn't the same for these three.) The
> > > >> difference between platform_get_irq() and platform_get_irq_optiona=
l() is
> > > >> only that the former might emit an error message and the later won=
't.
> > >
> > >    This is only a current difference but I'm still going to return 0 =
ISO
> > > -ENXIO from latform_get_irq_optional(), no way I'd leave that -ENXIO =
there
> > > alone... :-)
> >
> > This would address a bit of the critic in my commit log. But as 0 isn't
> > a dummy value like the dummy values that exist for clk, gpiod and
> > regulator I still think that the naming is a bad idea because it's not
> > in the spirit of the other *_get_optional functions.
> >
> > Seeing you say that -ENXIO is a bad return value for
> > platform_get_irq_optional() and 0 should be used instead, I wonder why
> > not changing platform_get_irq() to return 0 instead of -ENXIO, too.
> > This question is for now only about a sensible semantic. That actually
> > changing platform_get_irq() is probably harder than changing
> > platform_get_irq_optional() is a different story.
> >
> > If only platform_get_irq_optional() is changed and given that the
> > callers have to do something like:
> >
> >         if (this_irq_exists()):
> >                 ... (e.g. request_irq)
> >         else:
> >                 ... (e.g. setup polling)
> >
> > I really think it's a bad idea that this_irq_exists() has to be
> > different for platform_get_irq() vs. platform_get_irq_optional().
>=20
> For platform_get_irq(), the IRQ being absent is an error condition,
> hence it should return an error code.
> For platform_get_irq_optional(), the IRQ being absent is not an error
> condition, hence it should not return an error code, and 0 is OK.

Please show a few examples how this simplifies the code. If it's only
that a driver has to check for =3D=3D 0 instead of =3D=3D -ENXIO, than that=
's
not a good enough motivation to make platform_get_irq_optional()
different to platform_get_irq().

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ocudook43fjcrvv4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHi5kAACgkQwfwUeK3K
7AmxjQf+LjEMbZ2BLPsszWOOyw2Xtjn8mpuOmCBImErsT+AnE5G2nUp9a//M8hxr
OxUaITVBvGpeAOf8afjOnacEHqcvNJGUdWblNwEGdc7auyl6qSe7agtR2LDjM5ir
x233Ner1R+O8K0t4zRM2+g/LeLLNwL9Y+9y6swNJvQcsqzy0z86I7/R1ebWk9NMa
w1paYTwYlIyghKS5pAN7yXeIAJFP9DFBDy0KGZG8uA+MZn1WWTk/vwK4/NR5XcrY
WXb6zM/0lZtQWhYlKW/dcj4b3LlOo8dgfuGuu8WIqoKxY0230JDSg1E+5ZNLyKq3
7VzijyuxAzaTNhwSnAvUB2ToosLs1g==
=EUgY
-----END PGP SIGNATURE-----

--ocudook43fjcrvv4--


--===============6758592108534385208==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============6758592108534385208==--

