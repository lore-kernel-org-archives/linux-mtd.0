Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D65BEC27C55
	for <linux-mtd@archiver.kernel.org>; Thu,  6 Jun 2024 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zoiTf3JLjNvZmCplY4xi9QlET7OQVZK0su7ITrekCgg=; b=mHWNSfe3MwO2J1w3m+7hW/akk2
	eXsL8E8HI3BkJWSq6GlXOq2BFce/JrL4v8mVHw5dzrP5QJkG44/j1NxTMICNGu89yycUocge1QIIP
	NP1D1Z3Shv+erF1fsX0xj+mt8EIs3BSXLS39PtZrAH2pHDcRu0mbuM+f2wt+OkPtz2nP4zZSI2lEn
	dzRdGBHHqdhmUs6OWVZ5NBDdBZUOkJmYBBGt/5TxurM/TzL52g3BxLM7sQaUkOO/GUmzFDFDa2+oU
	dMNf685CSVRKk3Pgexq/H3BfWHSd6oYhZf0e1KQoHCY/Rb620/I+kdiRhQPOIMLqLGXrjXvfOlKny
	YAPqMrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDe2-00000009yrG-27J0;
	Thu, 06 Jun 2024 13:59:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFDdz-00000009yqd-2mxV
	for linux-mtd@lists.infradead.org;
	Thu, 06 Jun 2024 13:59:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6816661DD9;
	Thu,  6 Jun 2024 13:59:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB5B1C4AF09;
	Thu,  6 Jun 2024 13:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717682346;
	bh=2Ve9ZFIgEEJtTpjQsDrIZbNhAjC7L4m5KDK2f+Vh7Yg=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To:From;
	b=Wn8hi4P9U2qBFgDuVgEjHlWAwhuILkAUGFbm97IYCmfvDAAorXQ78B9Qqq6+X6k42
	 sKArPhW7tfZQHG/hdqdd8x2sBDkPtzj25rFf4VwhPTSk73sYzbLeJ/N2ejhtOHU0fR
	 kzVR14F3lQWcz2lRrfgQKvYbvwUNN58GAuhu/bthqHFFWoNcSraff8IbhVT4R8TRF1
	 kY8MXOTZZ395Bzigl28E4T6HvlGjdRfacF0VuESvNkWT1pwJaH6Pw2s9a+jCplAzda
	 MvoBF7vcbFlsSTU35w+yysetz2HihXS7olV2kye1vaoXEYGHDPq3cChIMwHESbkC38
	 jZBZpWPGrHnlw==
Date: Thu, 06 Jun 2024 15:59:01 +0200
Message-Id: <D1SZKLZBDDBA.1Z7ZD4UEOX05F@kernel.org>
Subject: Re: [PATCH v2 1/2] mtd: spi-nor: core: add flag for doing optional
 SFDP
Cc: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Rasmus
 Villemoes" <rasmus.villemoes@prevas.dk>
From: "Michael Walle" <mwalle@kernel.org>
To: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Esben Haabendal"
 <esben@geanix.com>, "Pratyush Yadav" <pratyush@kernel.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>
X-Mailer: aerc 0.16.0
References: <20240603-macronix-mx25l3205d-fixups-v2-0-ff98da26835c@geanix.com> <20240603-macronix-mx25l3205d-fixups-v2-1-ff98da26835c@geanix.com> <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
In-Reply-To: <a379a411-2c9e-4d9d-aa8f-4c4f3463cc27@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_065907_918641_1BEE1C79 
X-CRM114-Status: GOOD (  20.75  )
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
Content-Type: multipart/mixed; boundary="===============1998054595830681506=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1998054595830681506==
Content-Type: multipart/signed;
 boundary=40d3332916f6cfb5de41c586af81bc2c52a481e977090dafbcaf8e3348e3;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--40d3332916f6cfb5de41c586af81bc2c52a481e977090dafbcaf8e3348e3
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Jun 6, 2024 at 3:31 PM CEST, Tudor Ambarus wrote:
> On 6/3/24 14:09, Esben Haabendal wrote:
> > A dedicated flag for triggering call to
> > spi_nor_sfdp_init_params_deprecated() allows enabling optional SFDP rea=
d
> > and parse, with fallback to legacy flash parameters, without having dua=
l,
> > quad or octal parameters set in the legacy flash parameters.
> >=20
> > With this, spi-nor flash parts without SFDP that is replaced with a
> > different flash NOR flash part that does have SFDP, but shares the same
> > manufacturer and device ID is easily handled.
> >=20
> > Signed-off-by: Esben Haabendal <esben@geanix.com>
> > ---
> >  drivers/mtd/spi-nor/core.c | 3 ++-
> >  drivers/mtd/spi-nor/core.h | 1 +
> >  2 files changed, 3 insertions(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 3e1f1913536b..1c4d66fc993b 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2933,7 +2933,8 @@ static void spi_nor_init_params_deprecated(struct=
 spi_nor *nor)
> > =20
> >  	spi_nor_manufacturer_init_params(nor);
> > =20
> > -	if (nor->info->no_sfdp_flags & (SPI_NOR_DUAL_READ |
> > +	if (nor->info->no_sfdp_flags & (SPI_NOR_TRY_SFDP |
>
> I don't like that we update deprecated methods. The solution though is
> elegant.

I actually had the same concern. But currently there is no
non-deprecated way to handle this case, right?

Right now we have the following cases:
 (1) pure SFDP parsing
 (2) non-SFDP flashes with static configuration only
 (3) legacy implementation, where the magic flags decide whether we
     use SFDP

Which case is eventually used depends on the ID of the flash -
assuming there will only be IDs which either fall into (1) *or* (2).
That assumption is clearly wrong :)

I'd propose a new case in spi_nor_init_params()
 (4) try SFDP with a fallback to the static flags from the
     flash_info db.

-michael

--40d3332916f6cfb5de41c586af81bc2c52a481e977090dafbcaf8e3348e3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZmHApRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jQQgGAsuqjHK9tnVfMizoJMfOwKCWc/YHYfi9P
/XFj/2o3leAtvFU9UaG6P7wRv4SZ8q6EAX4kTKZ6JJn6zIr/yKseuvNNTtENChOi
6ljlYeYbdzELIbsX3+YzBARrFtx/x51cgzQ=
=rQmu
-----END PGP SIGNATURE-----

--40d3332916f6cfb5de41c586af81bc2c52a481e977090dafbcaf8e3348e3--


--===============1998054595830681506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1998054595830681506==--

