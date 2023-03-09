Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32F07C64EC4
	for <linux-mtd@archiver.kernel.org>; Thu,  9 Mar 2023 21:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVCUIvZVav6xDK7WSVMZceneIwY0SiO6Ky5b5vPcvRo=; b=dLXfWAorYfi5jwqzxULOKZpy8H
	8y8pv6l4ev440iTp6YyorkFghFAUvtfJu60eiT/ToWoIdp0tveMJUPkzP1Ei/aF04A00q8vZ1pL9F
	dwLtj/qVYDbGXDDh2uRR14DfEs01x5wkQlYKGxPZ6DIqQ6obDrwn1PTMaT4HO7jHv8ceA2cJjDioH
	vNbQmUhQxAMf5Mby9F3C4DkaeJa5Htsnuoj3WUgBxVl6P6yX/+pbchAyZIrkK3v70UoYhHNQNy/QY
	mbI8UMUhyeFcDtmsw01k0GUNLfRCWneJ+3bSFj/VPreSJi6FW/ald4J6c/MOjuYh7+RF+Z0uUmSew
	zVNq5ViA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNYo-00BwvP-JO; Thu, 09 Mar 2023 21:12:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paNYh-00Bwtr-TA
	for linux-mtd@lists.infradead.org; Thu, 09 Mar 2023 21:12:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BA16261CD8;
	Thu,  9 Mar 2023 21:12:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78835C433EF;
	Thu,  9 Mar 2023 21:12:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678396338;
	bh=emwxev2joapuzWTO2f23F5wjNsgEZTMzeCLrmUxz/FA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ob7Um5kAO7CzU59lJLPrYGoOplTDNcR1lqQU6UxANZX9ZLaHjs1EfDbjrwnu09o/c
	 Wm5lYIveSHn1KFBMxBeyi8AZQGIk13uJLqbG7V7Eof+vJj2mHctYJXq4AK9H8X5SvN
	 ZqoaVo4tAn9TST3j1CBWn6jgp4gnysyEbQY7xOTWMLAJk5t/xn9LatMfFQHxFzcZHn
	 YjFTc/G2ZjTevT1WhTPnrYsBoERCVMcvJSj3Wc/zioP6B6aSSvW+OHj1G2xaFEP6/9
	 NCpIynDWFmsi+fyf4NIHY99HQ8alW5INj0MiIWZunHeVRzOTYrt6itTVnSMi10vzGA
	 FYGj3lkobq3ew==
Date: Thu, 9 Mar 2023 22:12:14 +0100
From: Wolfram Sang <wsa@kernel.org>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
Message-ID: <ZApLrpD9Op59FgnB@shikoro>
Mail-Followup-To: Wolfram Sang <wsa@kernel.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	linux-i2c@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
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
References: <20230226222654.1741900-1-u.kleine-koenig@pengutronix.de>
 <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20230303220856.ebloz7kjw7sskxym@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_131220_082805_B9E5A247 
X-CRM114-Status: GOOD (  11.47  )
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
Content-Type: multipart/mixed; boundary="===============7972471545106099762=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============7972471545106099762==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="11BnIObYxkIk2nlY"
Content-Disposition: inline


--11BnIObYxkIk2nlY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> So this series is ready to be applied once Linus cuts -rc1.

I applied it to for-current now and plan to have it in -rc2. Thank you!


--11BnIObYxkIk2nlY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmQKS64ACgkQFA3kzBSg
KbZPuw/5AdHfkTRDnxz7iP/injeW9ZuXdUyU2WNYPhKG7gjBIddIl62rm7/IEca7
p3URnVMb58tnKqvQ8waKpNu/SdPTrtQ/Xp35h3lBN9z2hvybGDjHztUar08DijrQ
EU2K76NS83pZ2vQ0S4NRk3JQdGJVXmYs04hz3XBe9Fk61l+XgOaXjDfVMRYQdAHs
KvjbHB+fCKrRY4pTYO/+3rah9NGj7Igm6bxWs8bwqqSHL7O95xan/NyDFSj6ast7
5otOpDeFE90FeYuvJVhaDThUTf65ko6szMFT7tHRIYo2VPitA28I/Vq2/wei9e1K
d8hwgwd5X73mVLAWK6zYsLN2hyjna6/O/6+AaUSjYzHoKlOHCqjMhfllzCTmqrBc
tbxj4kw5uhH315V+S1wjdpQ/cCYqQQU1c1Lugrkgm/pAdFiyz9PxDap9ovxO5whY
cElHujAXXDjCHU/wVB8rGCjJMlwpr1/mWOrmt7AcWCLUsK7CvuQjqgvDkZ7XuoRJ
4PylU8+/MH+06JGUusE/bdCc1tR/lm1ZPWu0OVWTTdgvuWQ6fqT9xveERYleRl/M
SEUbzagdMe1OqVzEFNoymReVc4Ds8n3IvyltPkR4w4rwSAdWLtoRCXmlf/L6WrBj
SK0w5ZBTZKGdORg7eil1rxWED6YrQaAFOM9GnyCKapCPtM0zp+w=
=wGSr
-----END PGP SIGNATURE-----

--11BnIObYxkIk2nlY--


--===============7972471545106099762==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7972471545106099762==--

