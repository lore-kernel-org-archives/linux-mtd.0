Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A9F4C433EF
	for <linux-mtd@archiver.kernel.org>; Thu, 13 Jan 2022 14:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jlga8GKRqzhMFNbrszj968Qz/jsyataiuuIW/uC2vmA=; b=m1cscOh78oqJBw1/h7drEqFF8d
	lN1lODDhiL9Dq5ApK6bmfXof9zDFjgEplACPdAXf00Ju7M453gkbW0IwSsycqP0/tcCyqZdsY/pZO
	eusa5ySwokz4AKw5r/bF2PkTQ+wckpnQy2qJhjjQlL2AEKlmnj2DSfFPb1IgRrFmQnuZX7V5nGBRR
	M0jFwRuFB60nt3kOX3GrAxlqM8GoBI0ut5ijzbAmo1rpuI5K7EMFxi8VSjn5Yaz2gvJZatjUOAYa2
	mCIoB6KCHsb3pHhhAOlznBiBa61i/8o6GJHhhRDzwo53MZaRwNUATU2f8HoU7dWW9KKU8uMpBpPpA
	4vKMt2ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n81MR-006GQq-Vx; Thu, 13 Jan 2022 14:45:56 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n81MN-006GOd-Ct; Thu, 13 Jan 2022 14:45:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E19ACB822A0;
 Thu, 13 Jan 2022 14:45:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA3CC36AEB;
 Thu, 13 Jan 2022 14:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642085148;
 bh=qGUpScSrM6PHOQ9896+ovOSrylwTkuQlIpt7KlyEp5s=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rIF3lS/tm9sqFT+BginWJM2+mt1t0i+1rbRTwFGO/b5RO54FFqysidEmT2WSnXujo
 cGDZLPUBbnFnBovZVRCzJE12OIxe0UaqPbmDiXkUfgTiIFTn2YGRAzH3LqjFaP+tZD
 stowk5nOSDH2HzMR+0nMTCmGiZrfOpEXlbtFzEEyyHKSnxaKn6wp5i+0CBOwWaYud8
 h6IHjIqf66cMB/zCEPF7AQwqZAp9MkoApoumfwu6VFfqqNiQcfv/H1IDJvKTA9xbou
 r4uQpom3hKk5szByYDLACU4vgN5e9UWDsM5Igx38QRWaZyToUoz1pHBLnnGGGgQZOi
 t54X3kfj11igw==
Date: Thu, 13 Jan 2022 14:45:30 +0000
From: Mark Brown <broonie@kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Ulf Hansson <ulf.hansson@linaro.org>,
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
 Sergey Shtylyov <s.shtylyov@omp.ru>, Borislav Petkov <bp@alien8.de>,
 Eric Auger <eric.auger@redhat.com>, Jakub Kicinski <kuba@kernel.org>,
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
 Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
 linux-mediatek@lists.infradead.org,
 Brian Norris <computersforpeace@gmail.com>,
 "David S. Miller" <davem@davemloft.net>
Subject: Re: [PATCH 1/2] platform: make platform_get_irq_optional() optional
Message-ID: <YeA7CjOyJFkpuhz/@sirena.org.uk>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <20220110201014.mtajyrfcfznfhyqm@pengutronix.de>
 <YdyilpjC6rtz6toJ@lunn.ch>
 <CAMuHMdWK3RKVXRzMASN4HaYfLckdS7rBvSopafq+iPADtGEUzA@mail.gmail.com>
 <20220112085009.dbasceh3obfok5dc@pengutronix.de>
 <CAMuHMdWsMGPiQaPS0-PJ_+Mc5VQ37YdLfbHr_aS40kB+SfW-aw@mail.gmail.com>
 <20220112213121.5ruae5mxwj6t3qiy@pengutronix.de>
 <Yd9L9SZ+g13iyKab@sirena.org.uk>
 <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220113110831.wvwbm75hbfysbn2d@pengutronix.de>
X-Cookie: Slow day.  Practice crawling.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220113_064551_745961_5C5F4457 
X-CRM114-Status: GOOD (  23.28  )
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
Content-Type: multipart/mixed; boundary="===============5941130293750183242=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============5941130293750183242==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="W6TsDGUCC61npB/4"
Content-Disposition: inline


--W6TsDGUCC61npB/4
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 13, 2022 at 12:08:31PM +0100, Uwe Kleine-K=F6nig wrote:

> This is all very unfortunate. In my eyes b) is the most sensible
> sense, but the past showed that we don't agree here. (The most annoying
> part of regulator_get is the warning that is emitted that regularily
> makes customers ask what happens here and if this is fixable.)

Fortunately it can be fixed, and it's safer to clearly specify things.
The prints are there because when the description is wrong enough to
cause things to blow up we can fail to boot or run messily and
forgetting to describe some supplies (or typoing so they haven't done
that) and people were having a hard time figuring out what might've
happened.

> I think at least c) is easy to resolve because
> platform_get_irq_optional() isn't that old yet and mechanically
> replacing it by platform_get_irq_silent() should be easy and safe.
> And this is orthogonal to the discussion if -ENOXIO is a sensible return
> value and if it's as easy as it could be to work with errors on irq
> lookups.

It'd certainly be good to name anything that doesn't correspond to one
of the existing semantics for the API (!) something different rather
than adding yet another potentially overloaded meaning.

--W6TsDGUCC61npB/4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmHgOwoACgkQJNaLcl1U
h9DB2wf+MsmuWAbFkx7w6dSqBFg+5BMfRX917lHiCsn2CYARHwyaPL5M5EVrbehK
70/euCaJWItviAfkx+6AAOYCmbHs8mt+zpvgLriDTnZOumRiZfiGXMZHt85uxFOg
+CON0NcPugM2d7SZyRdxLTQBcBJt3wzMoV71nZv43fG+BMfssZy/ADYB75p648wU
r7n86P+i3Kh+8hkINY1UdrfNXf7GkWehj0fZhkQ6PO+sH6jH8JFft+mMsKvTkCfp
th2g66aUCkHb8ML7wNc5DEOQZlW9A7QyBKZpFWcduJs7uD92dqsoRJ7ch05zM3z/
HtLt6l6YJ3XD702pvFQA2C4cb/OGkA==
=d1L9
-----END PGP SIGNATURE-----

--W6TsDGUCC61npB/4--


--===============5941130293750183242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============5941130293750183242==--

