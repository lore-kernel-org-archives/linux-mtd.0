Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76932C433EF
	for <linux-mtd@archiver.kernel.org>; Wed, 29 Jun 2022 13:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tQe8GBwnu1OQXX4npdNsgiTek7dfkx6QsMbj4fKy6+g=; b=S0Zh4Xi8oLMuqRR8IO2upx64NN
	QCNMijpPSAjDAEEYPqbmkDmrOrHAg9xCpZVxQNgFbUeVUpxg/TVgb14trM69av3/Mzb8SOpupWCV0
	Qqdk4VHeBLdCREsEG9P3jGXJL55Yy/VXwxupKugHp1xKs0NgQyCvAOswGxPArDLrcsq0cxrERgP42
	XfNneyMAqFqNw2bbZjmcElXDJmXiilGou5fLg2liGNbS/BDrSeEFYh8nc3ytxhj0WupLAqscKskx7
	YKnDb/oSuVOFsF2q8jJEIkTgIGtqaS2iykurtQddfT/5b+fI/X3hyqzwwCIa2A8+XZcgQvcXI+LYR
	LRqdQZdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XrX-00CFqX-Fl; Wed, 29 Jun 2022 13:36:11 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6XrU-00CFon-5y
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2022 13:36:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6Xqa-0006SP-06; Wed, 29 Jun 2022 15:35:12 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6XqQ-003PNQ-Vz; Wed, 29 Jun 2022 15:35:06 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o6XqT-001txR-NY; Wed, 29 Jun 2022 15:35:05 +0200
Date: Wed, 29 Jun 2022 15:35:04 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Wolfram Sang <wsa@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-omap@vger.kernel.org, linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-mtd@lists.infradead.org,
	linux-leds@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-crypto@vger.kernel.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-clk@vger.kernel.org, alsa-devel@alsa-project.org,
	linux-watchdog@vger.kernel.org,
	acpi4asus-user@lists.sourceforge.net,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org,
	linux-usb@vger.kernel.org, platform-driver-x86@vger.kernel.org,
	linux-integrity@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-rtc@vger.kernel.org, netdev@vger.kernel.org,
	chrome-platform@lists.linux.dev, linux-input@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	openipmi-developer@lists.sourceforge.net,
	linux-hwmon@vger.kernel.org, linux-fbdev@vger.kernel.org,
	patches@opensource.cirrus.com, UNGLinuxDriver@microchip.com,
	linux-pwm@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-staging@lists.linux.dev
Subject: Re: [PATCH 6/6] i2c: Make remove callback return void
Message-ID: <20220629133504.syc6x4ptia3mnof5@pengutronix.de>
References: <20220628140313.74984-1-u.kleine-koenig@pengutronix.de>
 <20220628140313.74984-7-u.kleine-koenig@pengutronix.de>
 <CAPAsAGwP4Mw_CJfsi7oapABdTBwO1HfiQux6X4UahspU74VjtQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAPAsAGwP4Mw_CJfsi7oapABdTBwO1HfiQux6X4UahspU74VjtQ@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_063608_296774_CF81D03C 
X-CRM114-Status: GOOD (  26.08  )
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
Content-Type: multipart/mixed; boundary="===============1519851136277090314=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1519851136277090314==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5z6hgi6euioj5d47"
Content-Disposition: inline


--5z6hgi6euioj5d47
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[Dropped most people from Cc, keeping only lists]

On Wed, Jun 29, 2022 at 04:11:26PM +0300, Andrey Ryabinin wrote:
> On 6/28/22 17:03, Uwe Kleine-K=F6nig wrote:
> > From: Uwe Kleine-K=F6nig <uwe@kleine-koenig.org>
> >
> > The value returned by an i2c driver's remove function is mostly ignored.
> > (Only an error message is printed if the value is non-zero that the
> > error is ignored.)
> >
> > So change the prototype of the remove function to return no value. This
> > way driver authors are not tempted to assume that passing an error to
> > the upper layer is a good idea. All drivers are adapted accordingly.
> > There is no intended change of behaviour, all callbacks were prepared to
> > return 0 before.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
>                                     | 2 +-
> >  lib/Kconfig.kasan                                         | 1 +
>=20
> > diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
> > index f0973da583e0..366e61639cb2 100644
> > --- a/lib/Kconfig.kasan
> > +++ b/lib/Kconfig.kasan
> > @@ -149,6 +149,7 @@ config KASAN_STACK
> >       depends on KASAN_GENERIC || KASAN_SW_TAGS
> >       depends on !ARCH_DISABLE_KASAN_INLINE
> >       default y if CC_IS_GCC
> > +     depends on !ARM
> >       help
> >         Disables stack instrumentation and thus KASAN's ability to dete=
ct
> >         out-of-bounds bugs in stack variables.
>=20
>=20
> What is this doing here?

Huh, that is wrong. I needed that for build testing, but it shouldn't
have been added to the patch. I'm dropping that for the final
submission.

Thanks for spotting.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--5z6hgi6euioj5d47
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmK8VQUACgkQwfwUeK3K
7AkL0wf/Ra+JtsXozoGjhV4ADtJcJAo/mOIZQ6qOdPZGqHYkMvBmkEJ9zbvY4Edk
SwYoapiHgVT4tDX56ekEGnm/x3udNUt5wugpsqDm4oAgYtbBCMEVtHbp3t/AqMp2
sZcn0JsvUs6FVWSTomD396Pt10x0r+JrPTJVY2pwj1nUUV63/25oIT/4I77IughK
LvQBMIesHK9damtObmRGqI5Ljz1L6SP7WgiLSEq1R/LjSeEwbURT3ijca95YO2Jv
YyxoC7TiNJj2uJiisjl/r1T/LdGF6RpMN197XQjcvaZ0sbTZRF2vXlqp3cSyXrCG
BbT2nohQYXjznouz9TIuBFtA0iX7SA==
=YEZr
-----END PGP SIGNATURE-----

--5z6hgi6euioj5d47--


--===============1519851136277090314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1519851136277090314==--

