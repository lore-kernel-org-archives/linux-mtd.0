Return-Path: <SRS0=kZCR=PB=lists.infradead.org=linux-mtd-bounces+linux-mtd=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92BF5C433F5
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 14:09:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A9EF60F94
	for <linux-mtd@archiver.kernel.org>; Wed, 13 Oct 2021 14:09:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4A9EF60F94
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xuZuWWn5TKj3P3MhBtOGqUIeLNehXQPHw2UduqXiBoQ=; b=p8MqK4aoN9cLnzbI3ivku76Osc
	4zXJsnl+34RcEQMD4jb+nHH9ZlxdfKfK3cAdLIDOMZkfx3iBVo/vuFjwgjSxjGmEaqP2qvxXIQfV3
	Q/qoeO6Fa1eB2L/8+2HQWSIm5zC2aDfFwiy2M57eGNg0zJLOTsXwI6rOP/ojK38AVk8p0LLnpuQCL
	E+N5jO4/Px/CS3Y99i53ToYyFg2FWzJfvb36BhYvSI7jHZDC1b/LyMw3oxIfRIuXhZZBPw0CQF+Wb
	xe/NWHO4rVWNRG1/HZ7MklMcIQAG1Ul408EK65LHGDl9q8lHjsIu6v7CWvsrP++VCRV1GM4iPUJgD
	X4vzd0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maew7-00H4cu-R7; Wed, 13 Oct 2021 14:08:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maew4-00H4cJ-FS
 for linux-mtd@lists.infradead.org; Wed, 13 Oct 2021 14:08:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maevt-0005KE-Ls; Wed, 13 Oct 2021 16:08:37 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maevr-0005ch-Ur; Wed, 13 Oct 2021 16:08:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1maevr-0007hN-T5; Wed, 13 Oct 2021 16:08:35 +0200
Date: Wed, 13 Oct 2021 16:08:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, linux-spi@vger.kernel.org,
 Mark Brown <broonie@kernel.org>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
Subject: Re: [PATCH v2 13/20] mtd: dataflash: Warn about failure to
 unregister mtd device
Message-ID: <20211013140835.olo2dxdno6zlom7n@pengutronix.de>
References: <20211012153945.2651412-1-u.kleine-koenig@pengutronix.de>
 <20211012153945.2651412-14-u.kleine-koenig@pengutronix.de>
 <20211013144429.65b294e5@xps13>
MIME-Version: 1.0
In-Reply-To: <20211013144429.65b294e5@xps13>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_070848_538594_390BD5FE 
X-CRM114-Status: GOOD (  28.38  )
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
Content-Type: multipart/mixed; boundary="===============0559832535672418776=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============0559832535672418776==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4oiamhcwsch7pebo"
Content-Disposition: inline


--4oiamhcwsch7pebo
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 13, 2021 at 02:44:29PM +0200, Miquel Raynal wrote:
> Hi Uwe,
>=20
> u.kleine-koenig@pengutronix.de wrote on Tue, 12 Oct 2021 17:39:38 +0200:
>=20
> > When an spi driver's remove function returns a non-zero error code
>=20
> Should we s/an spi/a SPI/?

My (German) knowledge about the English Grammar claims that independent
of how you spell SPI, it must be "an" because when I say it, it's
[=C9=9Bspi:a=C9=AA] (unless you call it [spa=C9=AA]?)

In my eyes "spi" is right, because SPI is the protocol and "spi" is the
kernel framework. But I don't feel strong here and you're already the
second who suggests something similar.
=20
> > nothing happens apart from emitting a generic error message. Make this
> > error message more device specific and return zero instead.
> >=20
> > Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/mtd/devices/mtd_dataflash.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/devices/mtd_dataflash.c b/drivers/mtd/devices/=
mtd_dataflash.c
> > index 9802e265fca8..2691b6b79df8 100644
> > --- a/drivers/mtd/devices/mtd_dataflash.c
> > +++ b/drivers/mtd/devices/mtd_dataflash.c
> > @@ -919,7 +919,10 @@ static int dataflash_remove(struct spi_device *spi)
> >  	status =3D mtd_device_unregister(&flash->mtd);
> >  	if (status =3D=3D 0)
> >  		kfree(flash);
> > -	return status;
> > +	else
> > +		dev_warn(&spi->dev, "Failed to unregister mtd device (%pe)\n",
> > +			 ERR_PTR(status));
> > +	return 0;
>=20
> As part of a recent NAND cleanup series we ended up adding WARN_ON() [1]
> to make it very clear that if this happens, it's not expected at all (it
> was Boris' advice).
>=20
> I don't think there is only one good solution but perhaps its best to
> keep it sync'ed with the other drivers in MTD?

Well, if WARN_ON or dev_warn is the right thing is subjective. Your
subjective counts more as you're an MTD maintainer. Can rework
accordingly for v3.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4oiamhcwsch7pebo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmFm6GAACgkQwfwUeK3K
7AlUtQf+IHBiQyXezi4wzKiSkQvRhNa/hJarXpJUkdBSTDEf0TTYy8LuUwsaogqp
+5oSqdLjzgHTFVqFzEXXQ9+jKsKHGfjwbM3Ns8cbRYM3m97LVdYO5WhiiauSWcap
yzg0zF9T19dSg6DJtYhVoFb88bzq2kmpu9pUmD9lwUUpcbC+cABHQnEF4tBU53XE
4ZvilTboIB8y465QA7w0fRF7K8/Y/8/qix7JVbeg30qfbPHkuqC1RJIgC/c/S7W/
sSirILxk3snigVHrwkUsy95JRE6k2puxrIDpI7YYHHMeCtBGxOCtBWRV1EXgmvaZ
UuxUTrxUSUbODJAtCy3fAZ5w/O55Ow==
=jrzI
-----END PGP SIGNATURE-----

--4oiamhcwsch7pebo--


--===============0559832535672418776==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============0559832535672418776==--

