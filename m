Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D0DC433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 19 Jan 2022 15:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U6Wnwa2vukFslU1Zb/u1bRqE5UfvqD4MbZIx33vHjRM=; b=1epXKYFjJoADUXAGlsmiDm16wt
	bhT7SVV91t1nrUguym1yNcrGV/nbQSm868HoPOXQ6QqxheFb5B8CKX+X1zb0we3c8NQj9fK01WnBu
	yf0ILOZwkmeU3s/ZZiS1vD8eXKZRo3o7jsaHmSF79oQ7BBYTSCKYrJLgadHeICHJMNKIz6zQWlkgm
	BZwS90BkTjJN8o+WRLj1zE0lXkINsRe21ZR8wGYPJkWwZk1gguLddJ9AfGNA7YLvykBEfZ+83N6Q5
	cGuDv1FOsv89U2CUAiTFOrnY+WIsdsOehQjVdYUkGWazq/LwoXkIISlYCity2JqODgIK/3x8duJgX
	NfIi+/ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nACVe-0060yZ-2i; Wed, 19 Jan 2022 15:04:26 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nACVa-0060w1-SN
 for linux-mtd@lists.infradead.org; Wed, 19 Jan 2022 15:04:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nACU6-0000Mu-Qo; Wed, 19 Jan 2022 16:02:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nACTw-00BCee-8V; Wed, 19 Jan 2022 16:02:39 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nACTv-0005e5-0v; Wed, 19 Jan 2022 16:02:39 +0100
Date: Wed, 19 Jan 2022 16:02:38 +0100
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
Message-ID: <20220119150238.5sru3vtuwsswdnkx@pengutronix.de>
References: <20220110195449.12448-1-s.shtylyov@omp.ru>
 <20220110195449.12448-2-s.shtylyov@omp.ru>
 <770fb569-03c8-78f9-c174-94b31e866017@omp.ru>
MIME-Version: 1.0
In-Reply-To: <770fb569-03c8-78f9-c174-94b31e866017@omp.ru>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220119_070423_098660_6FCE3883 
X-CRM114-Status: GOOD (  40.26  )
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
Content-Type: multipart/mixed; boundary="===============2052563653273172348=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2052563653273172348==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="axfsyc4ql4z6wxfj"
Content-Disposition: inline


--axfsyc4ql4z6wxfj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 17, 2022 at 02:57:32PM +0300, Sergey Shtylyov wrote:
> On 1/10/22 10:54 PM, Sergey Shtylyov wrote:
>=20
> > This patch is based on the former Andy Shevchenko's patch:
> >=20
> > https://lore.kernel.org/lkml/20210331144526.19439-1-andriy.shevchenko@l=
inux.intel.com/
> >=20
> > Currently platform_get_irq_optional() returns an error code even if IRQ
> > resource simply has not been found. It prevents the callers from being
> > error code agnostic in their error handling:
> >=20
> > 	ret =3D platform_get_irq_optional(...);
> > 	if (ret < 0 && ret !=3D -ENXIO)
> > 		return ret; // respect deferred probe
> > 	if (ret > 0)
> > 		...we get an IRQ...
> >=20
> > All other *_optional() APIs seem to return 0 or NULL in case an optional
> > resource is not available. Let's follow this good example, so that the
> > callers would look like:
> >=20
> > 	ret =3D platform_get_irq_optional(...);
> > 	if (ret < 0)
> > 		return ret;
> > 	if (ret > 0)
> > 		...we get an IRQ...
> >=20
> > Reported-by: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
> > Signed-off-by: Sergey Shtylyov <s.shtylyov@omp.ru>
> [...]
>=20
>    Please don't merge this as yet, I'm going thru this patch once again
> and have already found some sloppy code. :-/

Who would you expect to merge this? I would have expected Greg, but he
seems to have given up this thread.

> > diff --git a/drivers/char/ipmi/bt-bmc.c b/drivers/char/ipmi/bt-bmc.c
> > index 7450904e330a..fdc63bfa5be4 100644
> > --- a/drivers/char/ipmi/bt-bmc.c
> > +++ b/drivers/char/ipmi/bt-bmc.c
> > @@ -382,12 +382,14 @@ static int bt_bmc_config_irq(struct bt_bmc *bt_bm=
c,
> >  	bt_bmc->irq =3D platform_get_irq_optional(pdev, 0);
> >  	if (bt_bmc->irq < 0)
> >  		return bt_bmc->irq;
> > +	if (!bt_bmc->irq)
> > +		return 0;
>=20
>    Hm, this is sloppy. Will recast and rebase to the -next branch.

I didn't think about what you mean with sloppy, but the code is
equivalent to

	if (bt_bmc->irq <=3D 0)
		return bt_bmc->irq;=20

> > =20
> >  	rc =3D devm_request_irq(dev, bt_bmc->irq, bt_bmc_irq, IRQF_SHARED,
> >  			      DEVICE_NAME, bt_bmc);
> >  	if (rc < 0) {
> >  		dev_warn(dev, "Unable to request IRQ %d\n", bt_bmc->irq);
> > -		bt_bmc->irq =3D rc;
> > +		bt_bmc->irq =3D 0;
>=20
>    This change isn't needed...
>=20
> >  		return rc;
> >  	}
> > =20
> [...]
> > diff --git a/drivers/edac/xgene_edac.c b/drivers/edac/xgene_edac.c
> > index 2ccd1db5e98f..0d1bdd27cd78 100644
> > --- a/drivers/edac/xgene_edac.c
> > +++ b/drivers/edac/xgene_edac.c
> > @@ -1917,7 +1917,7 @@ static int xgene_edac_probe(struct platform_devic=
e *pdev)
> > =20
> >  		for (i =3D 0; i < 3; i++) {
> >  			irq =3D platform_get_irq_optional(pdev, i);
>=20
>    Is *_optinal() even correct here?

_optinal isn't correct, _optional maybe is. :-)
Anyhow, look at e26124cd5f7099949109608845bba9e9bf96599c, the driver was
fixed not to print two error messages and the wrong option was picked.

> > -			if (irq < 0) {
> > +			if (irq <=3D 0) {
> >  				dev_err(&pdev->dev, "No IRQ resource\n");
> >  				rc =3D -EINVAL;
> >  				goto out_err;

What's wrong here is that the return code is hardcoded ...

> [...]
> > diff --git a/drivers/mtd/nand/raw/brcmnand/brcmnand.c b/drivers/mtd/nan=
d/raw/brcmnand/brcmnand.c
> > index f75929783b94..ac222985efde 100644
> > --- a/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > +++ b/drivers/mtd/nand/raw/brcmnand/brcmnand.c
> > @@ -1521,7 +1521,7 @@ static irqreturn_t brcmnand_ctlrdy_irq(int irq, v=
oid *data)
> > =20
> >  	/* check if you need to piggy back on the ctrlrdy irq */
> >  	if (ctrl->edu_pending) {
> > -		if (irq =3D=3D ctrl->irq && ((int)ctrl->edu_irq >=3D 0))
> > +		if (irq =3D=3D ctrl->irq && ((int)ctrl->edu_irq > 0))
>=20
>    Note to self: the cast to *int* isn't needed, the edu_irq field is *in=
t* already...
>=20
> [...]
> > diff --git a/drivers/power/supply/mp2629_charger.c b/drivers/power/supp=
ly/mp2629_charger.c
> > index bdf924b73e47..51289700a7ac 100644
> > --- a/drivers/power/supply/mp2629_charger.c
> > +++ b/drivers/power/supply/mp2629_charger.c
> > @@ -581,9 +581,9 @@ static int mp2629_charger_probe(struct platform_dev=
ice *pdev)
> >  	platform_set_drvdata(pdev, charger);
> > =20
> >  	irq =3D platform_get_irq_optional(to_platform_device(dev->parent), 0);
>=20
>    Again, is *_optional() even correct here?
>=20
> > -	if (irq < 0) {
> > +	if (irq <=3D 0) {
> >  		dev_err(dev, "get irq fail: %d\n", irq);
> > -		return irq;
> > +		return irq < 0 ? irq : -ENXIO;

Ack, could be simplified by switching to platform_get_irq().

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--axfsyc4ql4z6wxfj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmHoKAsACgkQwfwUeK3K
7AnJ3wf8Cq4VBWsvtLpuPywS2t8zcX9OLW+0bsxWsDjOHqeg0f9tl0AUgxmt8S9X
SWtqXkvnd0fKD/AWHIowmqZNGujzE45BD9vwkw+ukhavxyl0lKuWHitl19jLf2tF
LaBokU8H4RFjBZg81G2SeyXBeDWI+toak3seZ4mnpeDIrSgl7RrEyyKdZRVyeCvS
PVAC4TvXo94UopGC0KiLom/BRpY9pB6M4M2J/vZRYI2+Eb2tjizO6vc77DQlqTEs
SVeOuA4nagghgp5Ej7LJ1RpUqI/Ud34jbrXinsPr+F53/9ObxRRRShqRTqmRTQwj
91WhtqHtqhEzcn1OajDmLZZRPbVc3A==
=bHLP
-----END PGP SIGNATURE-----

--axfsyc4ql4z6wxfj--


--===============2052563653273172348==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2052563653273172348==--

