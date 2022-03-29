Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB31C433F5
	for <linux-mtd@archiver.kernel.org>; Tue, 29 Mar 2022 10:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mHMKZTzB6f1mGUZUt6aCiZUOcuWz73bMre9rDxmvtUs=; b=4DzAqVmvY9SujZxJhirKHK9mP3
	sk8sBeO2dsDWwJCJ53k2rxJQDUSlgdZJ3mqphdBlQOZ9+aTNiy+M4yDtLOJm/RIFaSthOJTMbr5ff
	iyRnQtiBU+RoytZ5Uwj/hxr+2Y5ANbycFQtfBC/Ympu9SKR5VQRB2gSwkgGDrsNzP5Q+Peyq+knhh
	oWa50EpLCi6wxQvATMRLtugCkGM92zqI8p1aBo7H6ax6Y8uBiFAFOpuP51XCKTa5tM/N+ZnqvPsp+
	jOSCI0icuKrB+5qfqAYi3f23Nv8++qWYb/6JcJfXQk3vPxUOYm53LbS5O9NAU3ahKz64hH2eHt1Nf
	tF3PazcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nZ9Qc-00Brd9-DH; Tue, 29 Mar 2022 10:50:22 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nZ9QQ-00BraL-9t; Tue, 29 Mar 2022 10:50:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 4D4A7B81658;
 Tue, 29 Mar 2022 10:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7AD4AC340ED;
 Tue, 29 Mar 2022 10:50:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648551007;
 bh=7ZLP9DUzWPlUi8XNl+MiJfBY6TO+lDRFlb4OqkVbP+o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=j3aeKPgOMMv9OvqAvV0Tx3Svpt82Xxq7kEcPvCZSQvN1s7c/lQicWX0ulWamF8MDn
 hGmkAdAvKgtMpMFH5K6USnmsvd2tV7Kd/aMSHZd+88jYs34/0qCvzIfLOVg5U/EcSI
 BJHwezlJaJlV4mTAUrbwXsp40opfssrcKg+62P0EgDvTOnwbbXUDHA6LA7I6/4KPwY
 tR0O7OQMMSRJ5m5woe+SN0OC5DVAde2jx1fVbHje9R41yQFuQl7u9INjsOIngIljr2
 tEuklk0aJAio8HtBAGJ+K75SZbLllUV7sw8IrUU+A/Ypvz8Vmfws1Z0k0BqM8+0+8i
 sR/3Ps4ukJ5fQ==
Date: Tue, 29 Mar 2022 11:49:59 +0100
From: Mark Brown <broonie@kernel.org>
To: =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Pratyush Yadav <p.yadav@ti.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>,
 linux-aspeed@lists.ozlabs.org, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@aj.id.au>,
 Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Tao Ren <rentao.bupt@gmail.com>
Subject: Re: [PATCH v4 03/11] spi: spi-mem: Convert Aspeed SMC driver to
 spi-mem
Message-ID: <YkLkV2mvHJ/EyVMn@sirena.org.uk>
References: <db2f4ec0-dffb-805b-ec5a-24bf724e8ab5@kaod.org>
MIME-Version: 1.0
In-Reply-To: <db2f4ec0-dffb-805b-ec5a-24bf724e8ab5@kaod.org>
X-Cookie: Available while quantities last.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220329_035010_533248_A6B82FF3 
X-CRM114-Status: GOOD (  12.35  )
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
Content-Type: multipart/mixed; boundary="===============1290795299237558829=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org


--===============1290795299237558829==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1574B9/rboLu0+nG"
Content-Disposition: inline


--1574B9/rboLu0+nG
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 29, 2022 at 10:56:49AM +0200, C=E9dric Le Goater wrote:

> This patchset was sent a bit early and commit 7f852ec58af6 ("mtd: aspeed-=
smc:
> improve probe resilience") was applied after which conflicts with the rem=
oval
> of the aspeed-smc.c file.

> Would you prefer a rebase and resend ? on -rc2 when the tree is stabilize=
d ?

A rebase on -rc1 (assuming the change makes it in there) would be good.

--1574B9/rboLu0+nG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmJC5FcACgkQJNaLcl1U
h9Brfwf/YGBbo7xm4jOlh2sAz+nAtFT+tL8ytILbSbuzuigt3u7EYOz51lPBDNM4
fy5qaOoAnw1rZHWxKoqrBRO1thIoQ444umt+kmR6QJXMNBhWFXrTiD6qbGPJY7KX
4eQi0MsHi4WLsXPdI91sHJuuWhgpvFe1adUqPKffqwTyMwCE+eTq7WB1pcbETEyP
OOj2HsPanXwIwW2hHf6IoohKlWRzb/zMCFxX/xxYYGMyHM0iW3Cy4O39xId4v47I
IKoe57VdcZwxv8kZs2Eivxz4JhXgwxBv9rVmECYMWnIPSDd39eVhRpPXnf4dIWRL
qqD5BVycLj+WHh0Cfwo8129wxzde/g==
=zub3
-----END PGP SIGNATURE-----

--1574B9/rboLu0+nG--


--===============1290795299237558829==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1290795299237558829==--

