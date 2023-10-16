Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC16CCDB465
	for <linux-mtd@archiver.kernel.org>; Mon, 16 Oct 2023 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TeGLo0FIcZcKObmChUkW0WGURpAz3kiAAbvi1nJ1WPY=; b=m11yDHQnMPi5NJ3/mOnSWpfFEe
	C7pALduxdHfAioSvkhCj2w2kz+AVoehRbpJiJfTaPVDnwUPLqG8pa2b99cVIGvQorSQrhR3eN7PLD
	C3gY/6ovzVkLn9kPtCvKK0wSizIDvKbsP72W2PfCQbAp1kci0OMVha5BiiFS9xX0tQy0CEjBdE/2R
	bTS+zipZchzO77r20Hq9f1O83JGxn5xYQkuMgEcnBrKhNWoFu//b3YhUpLqnP1XZtcAXJSuaHt39d
	ztSCKl7J0hsoVe0Zcx0NMGrUfriRKlKvdUjdmjvh6psLbT0VXce+0glWDia5dgQSxclQ4B+vEgXu7
	njZmy2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKjT-009Cdv-08;
	Mon, 16 Oct 2023 10:21:55 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qsKjP-009CZL-1K
	for linux-mtd@lists.infradead.org;
	Mon, 16 Oct 2023 10:21:53 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsKjF-0001kr-Th; Mon, 16 Oct 2023 12:21:41 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsKjC-0023n2-RY; Mon, 16 Oct 2023 12:21:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qsKjC-00H8J4-Hr; Mon, 16 Oct 2023 12:21:38 +0200
Date: Mon, 16 Oct 2023 12:21:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, linux-kbuild@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Richard Weinberger <richard@nod.at>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Woodhouse <dwmw2@infradead.org>,
	Atsushi Nemoto <anemo@mba.ocn.ne.jp>
Subject: Re: [PATCH 01/20] mtd: rawnand: txx9ndfmc: Mark driver struct with
 __refdata to prevent section mismatch warning
Message-ID: <20231016102134.q6k2jb5ewu3flg6j@pengutronix.de>
References: <20231008200143.196369-1-u.kleine-koenig@pengutronix.de>
 <20231008200143.196369-2-u.kleine-koenig@pengutronix.de>
 <CAK7LNASB2HhO6iWNnG-tAzs9wu9mV2PLRf-brnNGkSJj+W23Vw@mail.gmail.com>
 <e38b8a8e-5bd6-41e2-87a1-3b2d23b68bc0@app.fastmail.com>
 <20231009103037.j44gkzqv7cpn4zpu@pengutronix.de>
 <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com>
MIME-Version: 1.0
In-Reply-To: <4c27130c-e924-4f24-b833-794e0acac858@app.fastmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231016_032151_453313_639FAD7A 
X-CRM114-Status: GOOD (  29.42  )
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
Content-Type: multipart/mixed; boundary="===============0186677151288186941=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0186677151288186941==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2coqb4akpehzrfqz"
Content-Disposition: inline


--2coqb4akpehzrfqz
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2023 at 11:25:44AM +0200, Arnd Bergmann wrote:
> On Mon, Oct 9, 2023, at 12:30, Uwe Kleine-K=F6nig wrote:
> > On Mon, Oct 09, 2023 at 10:43:46AM +0200, Arnd Bergmann wrote:
> >
> > only a slight correction: As not having a remove callback can be fine
> > and platform_remove() only calls .remove (or .remove_new) when non-NULL
> > we're not hitting a NULL pointer dereference in the presence of
> >
> > 	.remove =3D __exit_p(somefunc),
> >
> > But a problem can arise later if some resource isn't properly freed and
> > so it might be used at a later point in time which then most likely
> > oopses.
> >
> > I didn't double check Arnd's list, but otherwise I agree to his
> > analysis.
>=20
> Hi Uwe,
>=20
> Based on a few days of randconfig build testing, the patch
> below addresses the remaining warnings I get for arm, arm64 and
> x86 on linux-next. This is a shorter list than the ones that
> I found in theory, possibly because some of the other ones
> are only used in built-in code, or because they are never used
> on these three architectures.
>=20
> Have you already sent patches for (some of) these?
>=20
>       Arnd
>=20
>  drivers/char/hw_random/mxc-rnga.c                                 | 2 +-
>  drivers/gpu/drm/bridge/ti-tpd12s015.c                             | 4 ++=
--
>  drivers/hwmon/smsc47m1.c                                          | 2 +-
>  drivers/hwtracing/coresight/coresight-etm4x-core.c                | 8 ++=
++----
>  drivers/media/i2c/et8ek8/et8ek8_driver.c                          | 4 ++=
--
>  drivers/memory/emif.c                                             | 2 +-
>  drivers/mmc/host/davinci_mmc.c                                    | 2 +-
>  drivers/mtd/nand/raw/txx9ndfmc.c                                  | 2 +-

The txx9ndfmc driver was fixed as part of this series, but Miqu=E8l didn't
take the patch, I guess because he wants it to be converted to
module_platform_driver().

>  drivers/pci/controller/dwc/pci-exynos.c                           | 4 ++=
--
>  drivers/pci/controller/dwc/pcie-kirin.c                           | 4 ++=
--

These two drivers were already covered in 20231001170254.2506508-1-u.kleine=
-koenig@pengutronix.de
where I also addressed a similar problem in the keystone driver.

>  drivers/power/reset/at91-poweroff.c                               | 2 +-
>  drivers/power/reset/at91-reset.c                                  | 2 +-
>  drivers/power/reset/at91-sama5d2_shdwc.c                          | 2 +-
>  drivers/rtc/rtc-at91rm9200.c                                      | 2 +-
>  drivers/rtc/rtc-imxdi.c                                           | 2 +-
>  drivers/rtc/rtc-mv.c                                              | 2 +-
>  drivers/rtc/rtc-pxa.c                                             | 2 +-
>  drivers/rtc/rtc-sh.c                                              | 2 +-

These rtc drivers are fixed in 20231002080529.2535610-1-u.kleine-koenig@pen=
gutronix.de

>  drivers/video/fbdev/atmel_lcdfb.c                                 | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/connector-analog-tv.c   | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/connector-dvi.c         | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/connector-hdmi.c        | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/encoder-opa362.c        | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/encoder-tfp410.c        | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/encoder-tpd12s015.c     | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/panel-dpi.c             | 2 +-
>  drivers/video/fbdev/omap2/omapfb/displays/panel-dsi-cm.c          | 2 +-
>  .../video/fbdev/omap2/omapfb/displays/panel-sharp-ls037v7dw01.c   | 2 +-
>  drivers/virt/coco/sev-guest/sev-guest.c                           | 2 +-
>  drivers/watchdog/at91sam9_wdt.c                                   | 2 +-
>  sound/soc/codecs/tlv320adc3xxx.c                                  | 4 ++=
--

I sent 20231004111624.2667753-1-u.kleine-koenig@pengutronix.de to fix
a/drivers/platform/x86/hp/hp-wmi.c, that's already applied so doesn't
occur in your patch. The others I didn't address yet.

I assume your question means you want to push that forward. That is very
welcome, the I remove this from my todo list.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--2coqb4akpehzrfqz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUtDq0ACgkQj4D7WH0S
/k7Quwf+LAmoFoJj5W1h4CYIm8fOfde+EqOvNhkVr9yMj+q7PFhh9RFh9IEHTCC/
HIrFwPoDbGxaybjY19nvlX5YSwK+FUFhBBPVSn96GT4OgHHFUEFv4CQmPlYEQ5zi
3E2mu0Wb32mxmeNKzzOAb5N9gfA3qE6EbuytiM4ax5KGZ10Hlm4UGqI2y3Xjzn2F
xeevn5bViVIvWm2v/FUTQcAPjyHZAOa4veqZg5tQ0BZAXp06KLS2lbo4ro8/Q/TQ
XC0rF/bzGePYaGLsmetUBjxJewjB/B1GlScXHsGckYLKyf5UR3Z3xE/kzXTJVpWt
oysgRzH5fnND7TnYdz5JrpP2y1j88g==
=1hMf
-----END PGP SIGNATURE-----

--2coqb4akpehzrfqz--


--===============0186677151288186941==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0186677151288186941==--

