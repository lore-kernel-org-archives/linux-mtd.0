Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C83AC433F5
	for <linux-mtd@archiver.kernel.org>; Sat, 15 Jan 2022 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=at6EplN3vnwdmGJLbx6Y/fTHQyIHDFPfYv91gAUsXVA=; b=meOOmreJ3FuGnjdqKMbK91ZSTR
	RQkuuOHti837M0FGM3qTyq+lKxLla+eqyb/h+a8/YY6CLoINb16BI988IR233BaOIt204Oc9HMCpW
	UDNZSZYFlL0MyAuAG3N/zgezXZwaTawIoYPu9rcbsV5In6hyjk8YH4uWV13TWkZRTP2FRt4u8zV0d
	Qw0rZy+jyf9DcL+ykOFslw5KB8Ka6Dgf8oaplmmW9j9TipTXfyIP207boZ72Dgmg64Q/nlIh7uya7
	4RKtE/ISXqN8CYxznThQOODMGYF9a1FbuevDGc9rtpqyvxQjfRlRx2qFT4sYakv+AR9tu3IDQ36Kv
	5R0tp4qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n8nwj-00BS5p-7e; Sat, 15 Jan 2022 18:38:37 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n8nwf-00BS4Z-Ta
 for linux-mtd@lists.infradead.org; Sat, 15 Jan 2022 18:38:36 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8nvA-0003Jj-3l; Sat, 15 Jan 2022 19:37:00 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8nux-00AUOf-7m; Sat, 15 Jan 2022 19:36:46 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1n8nuv-0005gB-Q6; Sat, 15 Jan 2022 19:36:45 +0100
Date: Sat, 15 Jan 2022 19:36:43 +0100
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
 (summary)
Message-ID: <20220115183643.6zxalxqxrhkfgdfq@pengutronix.de>
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
X-CRM114-CacheID: sfid-20220115_103834_151337_6048B7A8 
X-CRM114-Status: GOOD (  20.46  )
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
Content-Type: multipart/mixed; boundary="===============7055176678381243867=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7055176678381243867==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j6ppxzwmobiijznr"
Content-Disposition: inline


--j6ppxzwmobiijznr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

I'm trying to objectively summarize the discussions in this thread in
the hope this helps finding a way that most people can live with.

First a description of the status quo:

There are several function pairs *get() and *get_optional() that however
are different in various aspects. Their relevant properties are listes
in the following table. Ideally each line had only identical entries.

					| clk_get		| gpiod_get		| platform_get_irq	| regulator_get		|
	return value			|			|			|			|			|
	on not-found			| ERR_PTR(-ENOENT)	| ERR_PTR(-ENOENT)	| -ENXIO		| dummy[1]	=
	|
	(plain get)			|			|			|			|			|
					|			|			|			|			|
	return value			|			|			|			|			|
	on not-found			| dummy[1]		| dummy[1]		| -ENXIO		| ERR_PTR(-ENOENT)	|
	(get_optional)			|			|			|			|			|
					|			|			|			|			|
	emits an error message		|			|			|			|			|
	on error (including 		| no			| no			| yes[2]		| no			|
	not-found)			|			|			|			|			|
					|			|			|			|			|
	get_optional emits an error	|			|			|			|			|
	message on error (including	| no			| no			| no			| no			|
	not-found)			|			|			|			|			|
					|			|			|			|			|
	summary:			| returning a dummy	| returning a dummy	| doesn't emit an	| ret=
urning error code	|
	*_get_optional() differs from	| on not-found		| on not-found		| error mess=
age		| on not-found		|
	*_get by:			|			|			|			|			|


	[1] the dummy value is a valid resource descriptor, the API functions
	    are a noop for this dummy value. This dummy value is NULL for
	    all three subsystems.
	[2] no error is printed for -EPROBE_DEFER.

The inversion between clk+gpio vs. regulator is unforunate, swaping one
or the other would be good for consistency, but this isn't the topic of
this thread. Only so much: It's not agreed upon which variant is the
better one and the difference is of historical origin.

There are now different suggestions to improve the situation regarding
platform_get_irq() compared to the other functions:

a) by Sergey
   platform_get_irq_optional() is changed to return 0 on not-found.

b) by Uwe
   rename platform_get_irq_optional() to platform_get_irq_silent()

The argument pro a) is:

	platform_get_irq_optional() is aligned to clk_get() and
	gpiod_get() by returning 0 on not-found.

The argument contra a)=20

	The return value 0 for platform_get_irq() is only syntactically
	nearer to the dummy value of clk_get() and gpiod_get(). A dummy
	value isn't available and probably not sensible to introduce for
	irq because most drivers have to check for the not-found
	situation anyhow to setup polling.=20

The argument pro b) is:

	The relevant difference between platform_get_irq() and its
	optional variant is that the latter is silent. This is a
	different concept for the meaning of optional compared to the
	other *_get_optional().

The argument contra b) is:

	The chosen name is bad, because driver authors might wonder what
	a silent irq is.

---- end of summary
=09
A possible compromise: We can have both. We rename
platform_get_irq_optional() to platform_get_irq_silent() (or
platform_get_irq_silently() if this is preferred) and once all users are
are changed (which can be done mechanically), we reintroduce a
platform_get_irq_optional() with Sergey's suggested semantic (i.e.
return 0 on not-found, no error message printking).

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--j6ppxzwmobiijznr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHjFDcACgkQwfwUeK3K
7Al8ywf+IeUGmQ++ZSqrHA1sy8iG93DkE7XqgEI+/OYaQABSzKpE6w55cBp0EbHJ
TXkVcUUkd5e6eFtr5FwZEgzO1/vKIlB6IkuD5jbuqXJy0oRz9whaVLAJvpYN/mmy
KTHzmFssgA4mbUBx8XRteoVSNn6k9z0UF6EGrb0Vyfu70Q4yTdZKDP2mznyAnLee
rw1Oj2UCu2Jn5QrSTg0jNrPqGbHrmEeadE08d3oZRpL/ZcO1Er30Oj3aYFDiiE1V
p0J5fzDs0GZN4r/mwNSUDyq2edsIF3F2/ILOt05pf6AsFudhufarTMh2VWIu/mz7
mMHkAm6dYTtw1VKd1mp/RwSpxhhJSw==
=6uea
-----END PGP SIGNATURE-----

--j6ppxzwmobiijznr--


--===============7055176678381243867==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7055176678381243867==--

