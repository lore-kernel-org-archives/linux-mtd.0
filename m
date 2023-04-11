Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52304C76196
	for <linux-mtd@archiver.kernel.org>; Tue, 11 Apr 2023 11:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rRIOhfx/LOR8cfSyg++pQXhuHvfeAA01ovyjODWNn6A=; b=ABKd2dFVy9eUB0da0UUrKb07mB
	1Uakp6Q5ICXUKvYC0+W2LptqhKe87Sn5kMHJYOKoUbtfZUtN7+EHtCXFyyb03XzUyDVf3YtCcxJoi
	rUV2X6nGuOxPs6rQAg2Y5yt7uzp5lo65z/YoKz1ZSgldfzGMQ4JMklPK4zt8qb1YLYL8jnKNDPm5U
	jKqEaEkmMOtX8pg5jJ19q13Zr//ZcWUqRGaKQTKg5m5rIqsgDJbs6wmEL+M2YFcGY8otVTOxoAPga
	ciRV2A3lga4cG0WzuRG7cKGONR9PYIEEhGepp1SIzz0sOdKioDAWwuLHya8oBNeid+6NgSeoD1Esw
	XwvKWxUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmC93-00HRUC-1f;
	Tue, 11 Apr 2023 11:26:41 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmC90-00HRTM-0o
	for linux-mtd@lists.infradead.org;
	Tue, 11 Apr 2023 11:26:39 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmC8y-0006dA-BN; Tue, 11 Apr 2023 13:26:36 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmC8x-00AUTM-Ej; Tue, 11 Apr 2023 13:26:35 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pmC8w-00CHY8-Nb; Tue, 11 Apr 2023 13:26:34 +0200
Date: Tue, 11 Apr 2023 13:26:34 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: postmaster@lists.infradead.org
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: Convert to platform remove callback returning
 void
Message-ID: <20230411112634.qtaiqzjj4ceqejfd@pengutronix.de>
References: <20230401161938.2503204-1-u.kleine-koenig@pengutronix.de>
 <20230407101043.299f5e22@xps-13>
 <20230408185332.d2g2ao4tdp6ltm4i@pengutronix.de>
 <20230411102025.6b2fdc9e@xps-13>
 <20230411111148.yefmzohsvk3facq3@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230411111148.yefmzohsvk3facq3@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_042638_284762_D6223805 
X-CRM114-Status: GOOD (  16.73  )
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
Content-Type: multipart/mixed; boundary="===============2344470700478016590=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============2344470700478016590==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gheyn55uh6y52jqw"
Content-Disposition: inline


--gheyn55uh6y52jqw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Apr 11, 2023 at 01:11:48PM +0200, Uwe Kleine-K=C3=B6nig wrote:
> > > BTW, I constructed the lists of acks/reviews myself and found the same
> > > set. However b4 wailed about each patch claiming:
> > >=20
> > > 	    =E2=9C=97 BADSIG: DKIM/infradead.org
> >=20
> > No idea what this means, any pointer?
>=20
> lists.infradead.org signs all outgoing mail and something between these
> outgoing mails and b4 consuming them breaks the signature. I didn't
> debug, but depending on where the problem is, either
> postmaster@lists.infradead.org or the admins of lore.kernel.org or the
> maintainer of b4 might want to know and fix.

I checked and it's not all patches that fail. One of the mails that
fails to verify is

	https://lore.kernel.org/all/20230401161938.2503204-49-u.kleine-koenig@peng=
utronix.de/raw

It has two DKIM-Signatures, one from casper.infradead.org and another by
bombadil.infradead.org (=3D lists.infradead.org). I guess the problem is
that casper signs the mail before mailman on bombadil mangles the mail.
The fix would be to not let casper sign mails that should be forwarded
to bombadil, or mailman should be fixed to not change the mail. (The
latter is the nicer but also harder thing to do.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=C3=B6nig         =
   |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gheyn55uh6y52jqw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ1Q+kACgkQj4D7WH0S
/k65wwgAsPmZ2pNblWZWHPc+lkcmUp3uftwjsgPmOymbIdK1BtNnwA99/57iS5zY
lnHHw3MvMAfJKC7jG6imu48tTUH16odRKJYEfsIzWnA50W0alc53YI9SggqinWmb
/e/ibmHfwZTLVMehOyglbRSY7ngFyiiaYilouS+aXYAXZd9Wurzxz66ddCqz4lT+
bgGHxmqNNXprJzuAydbBYzzU08diIAn+aSlmDLCTmqtkGB0Cms6CUxmIXMC/lqQ5
dbvjZjaW9JMJfx8K/VEA9y5kWG1qHExUfS7FZwuBLJo9+c3HZmagn9sdYNPSbdul
wLXQOEQgUVMuugBDteyWcrGMxaG5HA==
=rlk+
-----END PGP SIGNATURE-----

--gheyn55uh6y52jqw--


--===============2344470700478016590==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============2344470700478016590==--

