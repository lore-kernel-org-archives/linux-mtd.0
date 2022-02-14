Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DAC1C433EF
	for <linux-mtd@archiver.kernel.org>; Mon, 14 Feb 2022 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPb5Pzam7mfvkP12sC1ckdFlzY+YW8b0B/d1FIBJMVc=; b=Q50A0yBgahJz4vsghcLr+l3Y+d
	trX2bUwFINZJL7gd2b1OF/TbqNZPARbuTtxUPmQw6WOMQNWAQEl/qm22CMszmKOsqCyIxdvC0v0UR
	72JH8Ol9luwev1Z2vdgRKBcQiaoyZkNv6CAvCxg4rv4haWZbhe+NUAOrxKhCkqxJ9m48bRnHDNBDq
	T8FiODNtxUQwRjiqH9Ma815sZ60CU2jqnrVdrfcXWqV5sjgPlE7BqY8vbL/rfpjFIBy75R+30/YRU
	YeI3R03Cu/LXzme8wgmlpegLQlS2/HMYL6sRXtBp2fHLcLWKjJFpEMUyCkDZdO2Gd2Jg323DftAMg
	AzEtv6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJVmv-00Dhqw-Fa; Mon, 14 Feb 2022 07:28:46 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJVZq-00Dd5O-UP
 for linux-mtd@lists.infradead.org; Mon, 14 Feb 2022 07:15:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVZ0-0006l6-Nq; Mon, 14 Feb 2022 08:14:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVYf-00GV12-4n; Mon, 14 Feb 2022 08:14:00 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJVYd-002oWn-E1; Mon, 14 Feb 2022 08:13:59 +0100
Date: Mon, 14 Feb 2022 08:13:51 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Sergey Shtylyov <s.shtylyov@omp.ru>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-kernel@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Vignesh Raghavendra <vigneshr@ti.com>,
 Jiri Slaby <jirislaby@kernel.org>, linux-iio@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Amit Kucheria <amitk@kernel.org>, alsa-devel@alsa-project.org,
 Liam Girdwood <lgirdwood@gmail.com>, linux-phy@lists.infradead.org,
 Thierry Reding <thierry.reding@gmail.com>,
 linux-mtd@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-gpio@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Guenter Roeck <groeck@chromium.org>, linux-spi@vger.kernel.org,
 Lee Jones <lee.jones@linaro.org>, openipmi-developer@lists.sourceforge.net,
 Peter Korsgaard <peter@korsgaard.com>,
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
 Zha Qipeng <qipeng.zha@intel.com>, Corey Minyard <minyard@acm.org>,
 linux-pm@vger.kernel.org, John Garry <john.garry@huawei.com>,
 William Breathitt Gray <vilhelm.gray@gmail.com>,
 Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Takashi Iwai <tiwai@suse.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Benson Leung <bleung@chromium.org>, linux-arm-kernel@lists.infradead.org,
 Mun Yew Tham <mun.yew.tham@intel.com>,
 Eric Auger <eric.auger@redhat.com>, netdev@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Cornelia Huck <cohuck@redhat.com>, linux-mmc@vger.kernel.org,
 Joakim Zhang <qiangqing.zhang@nxp.com>,
 Oleksij Rempel <linux@rempel-privat.de>,
 linux-renesas-soc@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH v2 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <20220214071351.pcvstrzkwqyrg536@pengutronix.de>
References: <20220212201631.12648-1-s.shtylyov@omp.ru>
 <20220212201631.12648-2-s.shtylyov@omp.ru>
MIME-Version: 1.0
In-Reply-To: <20220212201631.12648-2-s.shtylyov@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220213_231515_061256_A19F6CAA 
X-CRM114-Status: GOOD (  22.49  )
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
Content-Type: multipart/mixed; boundary="===============7100834073701383520=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7100834073701383520==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r3c6abkz2rpak4yl"
Content-Disposition: inline


--r3c6abkz2rpak4yl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 12, 2022 at 11:16:30PM +0300, Sergey Shtylyov wrote:
> This patch is based on the former Andy Shevchenko's patch:
>=20
> https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@lin=
ux.intel.com/
>=20
> Currently platform_get_irq_optional() returns an error code even if IRQ
> resource simply has not been found.  It prevents the callers from being
> error code agnostic in their error handling:
>=20
> 	ret =3D platform_get_irq_optional(...);
> 	if (ret < 0 && ret !=3D -ENXIO)
> 		return ret; // respect deferred probe
> 	if (ret > 0)
> 		...we get an IRQ...
>=20
> All other *_optional() APIs seem to return 0 or NULL in case an optional
> resource is not available.  Let's follow this good example, so that the
> callers would look like:
>=20
> 	ret =3D platform_get_irq_optional(...);
> 	if (ret < 0)
> 		return ret;
> 	if (ret > 0)
> 		...we get an IRQ...
>=20
> Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>

While this patch is better than v1, I still don't like it for the
reasons discussed for v1. (i.e. 0 isn't usable as a dummy value which I
consider the real advantage for the other _get_optional() functions.)

Apart from that, I think the subject is badly chosen. With "Make
somefunc() optional" I would expect that you introduce a Kconfig symbol
that results in the function not being available when disabled.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--r3c6abkz2rpak4yl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKASwACgkQwfwUeK3K
7Ak1DAf/fgLBIz9p8Vx2hzG+I8aYoNMAmPLmUfMeIR1DWaBc26HTbyTBn6pFRiPZ
rztM2uc+royoY44/mp4H89WkPzZ0/v3AlRkdqI8UBny0ZKRbNtMfzL6f7wyVik5C
rxqc7EgXLRk2/0IxTohA6bwj7Vczei9NwYndm+QrxDHjmY5Dq95rdvxv9+8iaa9y
gLQ2x91x4bybaKnKVe36f5JfLeMhS9kLuCx82Wi1yqPK4UQQ6R/+QEE0zGS8QNHP
vMasmLHge9XqVx/c0SuPcLVZ/uRatkzzuqf1rY75peyQp4YpDDdkhkTws4kcVC22
lVFz9FjvbtVS4nxvPxNwZAnvq9sPaQ==
=UfDO
-----END PGP SIGNATURE-----

--r3c6abkz2rpak4yl--


--===============7100834073701383520==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7100834073701383520==--

