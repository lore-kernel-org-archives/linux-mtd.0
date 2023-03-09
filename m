Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94D89C64EC4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 21:20:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p/yatNC+Wf37Q6U4VTQ5QX6s7fz5+8aRMjoHOACDRag=; b=GGnwixirUh33iSMBbkc48kJ9sc
	5TAzXqcR0hBlaM0uuiFunahlr/S9Z/fN2sIJ+M5UdJgXeD3bj23zrKEyKyvwJm85HcG+6EvigzVnc
	M/uO4o46yQS0/UWm98G3whe1poNFqhl+OzModpTiuoykl6EZb9CpyFOxoJ51r4JN3cR/DwDqslxUC
	+nwVqZQC0Q3Kh06T/ItYcytzJg3lnDn+g2I2f7BiTtH90OLQzMA52xUTnaqSyOBBwL09HxDBSh3Gj
	oAPjrjeIbSoKnslEc+tizemGjn5ob8kwjuPYQOBGwS2u6dTYhtM7FxyRlgv1QVHtFENef+fsqhyzd
	1KWTEpQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNgI-00By3S-QJ; Thu, 09 Mar 2023 21:20:10 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNgF-00By1K-No
	for linux-mtd@lists.infradead.org; Thu, 09 Mar 2023 21:20:09 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1paNfy-0008M4-6q; Thu, 09 Mar 2023 22:19:50 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paNfo-0032DX-LN; Thu, 09 Mar 2023 22:19:40 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1paNfn-003das-UG; Thu, 09 Mar 2023 22:19:39 +0100
Date: Thu, 9 Mar 2023 22:19:39 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Wolfram Sang <wsa@kernel.org>, linux-i2c@vger.kernel.org,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Ajay Gupta <ajayg@nvidia.com>,
	Peter Senna Tschudin <peter.senna@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	linux-mtd@lists.infradead.org, Jiri Slaby <jirislaby@kernel.org>,
	linux-serial@vger.kernel.org, Evgeniy Polyakov <zbr@ioremap.net>,
	Crt Mori <cmo@melexis.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Jean Delvare <jdelvare@suse.de>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Shunqian Zheng <zhengsq@rock-chips.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	Michael Hennerich <michael.hennerich@analog.com>,
	Peter Rosin <peda@axentia.se>, Guenter Roeck <linux@roeck-us.net>,
	Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v2 0/9] i2c: Switch .probe() to not take an id parameter
Message-ID: <20230309211939.un626kr6g2k35mbi@pengutronix.de>
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
 <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
 <ZApLrpD9Op59FgnB@shikoro>
MIME-Version: 1.0
In-Reply-To: <ZApLrpD9Op59FgnB@shikoro>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mtd@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_132007_797603_2D98B2AB 
X-CRM114-Status: GOOD (  16.09  )
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
Content-Type: multipart/mixed; boundary="===============3361693696915634326=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============3361693696915634326==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wjc75gu3bek7grdu"
Content-Disposition: inline


--wjc75gu3bek7grdu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 09, 2023 at 10:12:14PM +0100, Wolfram Sang wrote:
>=20
> > So this series is ready to be applied once Linus cuts -rc1.
>=20
> I applied it to for-current now and plan to have it in -rc2. Thank you!

Great, this is even quicker than I anticipated. I thought this will go
into next first and into mainline only during the next merge window.

If you can convince Linus to take that for -rc2, fine for me.

Best regards and thanks,
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--wjc75gu3bek7grdu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmQKTWgACgkQwfwUeK3K
7Amd9ggAnkPYgOLH8nXWAWn3gLt7YS/0TUTOTB61F6rwzHDIsXwQHdGInPjMXeEe
GTl9iZUcGCZVhXkpG1qSdbxqDefK9ysZVVvE4Mldiw7RlRcT4tm1AuX3Z4kSMvk2
6BaAqZ08nlpy8foNYj0SSMaobPMiNdlM/rfuntJ3L8pnVrd2zEWJDA58cyoNO6J8
1PGDByNC2ivf36/QlzATU+0woDT3JzbEs5UFIbI0hMetphMyDzfhahRp68YGBtfn
jLhWnVHc9x20CJOUZ5PU8Qv4YFQXtactIjrQcLDp2sp24KusYGYj0zDgLQaANyoO
Xs5TU2VfyI0xm5feCKooso6WyI+7uw==
=2Qsh
-----END PGP SIGNATURE-----

--wjc75gu3bek7grdu--


--===============3361693696915634326==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============3361693696915634326==--

