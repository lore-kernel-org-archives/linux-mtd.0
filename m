Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA87C25B75
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 12:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Subject:To:From:Cc:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fPSWq6hBNForG60GprS6NPGlJq5qz++KttmjmUHA7Bk=; b=3FpuWxeqWGFoNAaJwsx3f0cpOi
	Sul/XdVdDVG9VOMzx7RKHlzUpMepguCqBHfM0vb1XQO5DiDXaCJNlZwwXcj3Rztb4pXtZFpirofxp
	GYgM5sWNJdm5grSxArU2SBbp8P/tnbwFKt7T9yd2AwEYr1K/csAEauEv1McdvY7tioVuHBL19ChDl
	DDY3fyjLgF0J+3D+HMBVwtNsyd9AK/qMC5x560wHTwFH7Ewjhh+9l1JjuF9V/+YN1od6CFieBM/qe
	VqeNm+o8t2RBcoRSB8VChWt+OP04eQjm6Ow20cRlHyciunUTwiVIydGfN8BVRGsmfq7y9a/X0zikw
	TwVpQKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCKb-00000009iOG-2fHy;
	Thu, 06 Jun 2024 12:35:01 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFCKY-00000009iLp-0po5
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 12:34:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 965EECE1B13;
	Thu,  6 Jun 2024 12:34:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B47AEC4AF09;
	Thu,  6 Jun 2024 12:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717677230;
	bh=S+qbvMG0BL+YaI5flrkXNhbh2Jah5zeZQOOyRZfywTo=;
	h=Date:Cc:From:To:Subject:References:In-Reply-To:From;
	b=UN2W7WBZWMtB8VjN+FitzjT/UejoSLC0Q4+NpYIgQTIpnNVIN7nVQr3kzOjICR7AE
	 VnOItjTFGCIZJ2YicQV0AOijXshcWI7Ulcb9JtCB97RumvgDEwdR/ATLP5bIiXx7CA
	 XCw3qfg5cKQiDSFODrSC21QfUpS96TxS+kolWUUXSFBM5Uc+2bSpsIktFo7gIEkB/r
	 IcNw2FVfm7N6wrqOhLJcEcTHRgecw09cKo7nZ+7aoIgq2VBRdNk+JTZyDQbXwlEopj
	 k99Di79HmE7KJMg2ycB+yfBkXW2V7dCEsrXVaYHVcJOr7su+BppMOI+KyyzLSIdgp+
	 8CAYAHzhezfZw==
Date: Thu, 06 Jun 2024 14:33:39 +0200
Message-Id: <D1SXR8ZVNR3F.2SNEOVX5ZC6G5@kernel.org>
Cc: "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, "Rob Herring" <robh@kernel.org>,
 "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley"
 <conor+dt@kernel.org>, <linux-mtd@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Marek
 Vasut" <marex@denx.de>, "Imre Kaloz" <kaloz@openwrt.org>, "Andrew Lunn"
 <andrew@lunn.ch>, "Flavio Suligoi" <f.suligoi@asem.it>,
 <kernel@pengutronix.de>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Thorsten Scherer"
 <T.Scherer@eckelmann.de>
Subject: Re: [PATCH] dt-bindings: mtd: spi-nor: deprecate Everspin MRAM
 devices
X-Mailer: aerc 0.16.0
References: <20240604074231.1874972-1-mwalle@kernel.org>
 <kl4ikwh4fpkhhlpneuujyk2j4a2byif7l27n7kgb4pm72hb4an@akhbc4jg6hyq>
 <1094fbfd-0ee7-430e-b62c-20764c1fbeec@linaro.org>
In-Reply-To: <1094fbfd-0ee7-430e-b62c-20764c1fbeec@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_053458_429048_EB8588FC 
X-CRM114-Status: GOOD (  16.93  )
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7931095555895858216=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7931095555895858216==
Content-Type: multipart/signed;
 boundary=1cc637e5afad55ee26a7009fa07180f3ee198532ca034bcf93ed2a891362;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--1cc637e5afad55ee26a7009fa07180f3ee198532ca034bcf93ed2a891362
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Thu Jun 6, 2024 at 2:14 PM CEST, Tudor Ambarus wrote:
> > The ci4x10 is still being used and sold.  Right now I do not have a cle=
ar
> > view on the implications of moving to that driver.  I'd like to invest =
some
> > time to sharpen my picture (or find the person that claims responsibili=
ty), but
> > this will propably not happen this week.
> >=20
>
> if it's used then we are forced to keep the entry in SPI NOR for
> backward compatibility. But we can still deprecate the use and forbid
> new support in SPI NOR while directing users to the other driver.

As mentioned, this is intended to be the first step towards removal.
And yes, we won't accept any new such devices, but at the same time,
new device trees should refrain from using this compatible, thus the
mark as deprecated.

How to handle boards which are actively using this device is a
different topic. I'm sure there is some kind of deprecation process.
I doubt we are forced to keep that support until the end of the
world :) Maybe some kind of grace period where we nag the user to
switch to a different interface, etc. Not sure.

Any ideas are welcome.

-michael

--1cc637e5afad55ee26a7009fa07180f3ee198532ca034bcf93ed2a891362
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZmGsoxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/gn2AF8CcOTEM8x6BLUFvKR6+ekuxoYS/63p47G
6ph5zNQVYwJNufYOwBjvmv17D1kMUY12AYDDc/RYlTNDrJhQra9djygf5N8N0F5T
5mt2/Xrf/vrCDSAPxdcdb2vsF/O7tY28EA4=
=741n
-----END PGP SIGNATURE-----

--1cc637e5afad55ee26a7009fa07180f3ee198532ca034bcf93ed2a891362--


--===============7931095555895858216==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7931095555895858216==--

