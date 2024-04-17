Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A80ADC4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 14:43:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnwGKvTTU/uXG0CSjjP22rCDyaeZccTzcRQe5ZG7I1o=; b=xBehDP/cIt6RN+dJhBJ6U3AzaY
	RU75k0Rs5H32oPu3GEECH7EtwjD5nePlGBWJZsb9wXL9c4fWQvLJvMq/7bbXaHQ2hzR+FbGQQ8o+o
	qA0d6jV1wrjXi8Xho/ASc4QYiqHlPWtfa/nPmq/abtrRVjS49TN97qYvPynvCoJE2RJIutIpiQEix
	rYMxikbnHOJibowoEbfldS3mUsjJovDifpp4mJOS1mRqxSer/LWf+En9ycMsWSdOy1iejHtCNrhxS
	6bdSn2YKERiP/2HUz5Aan6OJASR7fM42JaCr/4owoLkcWeVuvp3OvbsqkDAjTENA1qPjC8XAi+NtJ
	cpx72Ovg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6Vg-0000000GP1Z-31Xf;
	Wed, 17 Apr 2024 14:43:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6Ve-0000000GP0G-0cwP
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 14:43:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2D426123F;
	Wed, 17 Apr 2024 14:43:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29C02C2BD11;
	Wed, 17 Apr 2024 14:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713365016;
	bh=dG6QbvSGBr85d4qsnF99BtQTXrMCUcA4EMBTDxvnqJI=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To:From;
	b=eVc3xXoN3WjMjWVkYPeIrzjR9x3rGzjp05VaN6nD74mTSzRjTaCpPmSz0PvNu6lpg
	 sRWTlO0Qalf/HxgqdDGNEMuTmdpH9Etr4DIKk08Vt8McjFmV5dO/Oi9WtyJvQe54QE
	 CvOBqR/eDdSelVMdyAXeP/RWQAiXsXQduLepmsCzBXXjEpKvATgNSHgYYaEWbVxI5J
	 59OB6R+R2MKy3ZsXBH92ccIPOkFawmrBOM0QjwhAKMpMD4cyrZb4IfNBPyHgJcHd4Y
	 iJzXYNq2FgCDq2Erzz4G6vmDY+KtvSTHrslDxBRksqTW8YzPh4UL4yW+1mf3+CP0y3
	 GpuHu9LDhvS5A==
Date: Wed, 17 Apr 2024 16:43:15 +0200
Message-Id: <D0MH78KYG87L.ETRH24X6MK6X@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>
Subject: Re: [PATCH v1 3/6] mtd: spi-nor: get rid of SPI_NOR_NO_FR
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
From: "Michael Walle" <mwalle@kernel.org>
X-Mailer: aerc 0.16.0
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-4-mwalle@kernel.org> <mafs0sezk6rcr.fsf@kernel.org>
In-Reply-To: <mafs0sezk6rcr.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_074338_370800_7F923C0A 
X-CRM114-Status: GOOD (  35.12  )
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
Content-Type: multipart/mixed; boundary="===============7796719357348162446=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============7796719357348162446==
Content-Type: multipart/signed;
 boundary=b827ff6a1d6e7c0f215599c0781d4f0d62eb4fdb77172072f70a52582924;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--b827ff6a1d6e7c0f215599c0781d4f0d62eb4fdb77172072f70a52582924
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Apr 17, 2024 at 3:39 PM CEST, Pratyush Yadav wrote:
> On Fri, Apr 12 2024, Michael Walle wrote:
>
> > The evervision FRAM devices are the only user of the NO_FR flag. Drop
> > the global flag and instead use a manufacturer fixup for the evervision
> > flashes to drop the fast read support.
> >
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> > Please note, that the fast read opcode will still be set in
> > spi_nor_init_default_params(), but the selection of the read opcodes
> > just depends on the mask.
>
> Since that is the case now, might as well drop the
>
>     if (params->hwcaps.mask & SNOR_HWCAPS_READ_FAST)
>
> in spi_nor_init_default_params().

I want to address that in another patch where I'll do that for all
the opcodes. Just doing it for the fast read looks odd.

> > That is also something I want to fix soon: the opcodes can always
> > be set and the drivers/SFDP will only set the mask. Opcodes then can be
> > switched between 3b and 4b ones if necessary.
> > ---
> >  drivers/mtd/spi-nor/core.c     | 12 +++++-------
> >  drivers/mtd/spi-nor/core.h     |  2 --
> >  drivers/mtd/spi-nor/everspin.c | 19 +++++++++++++++----
> >  3 files changed, 20 insertions(+), 13 deletions(-)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index fb76e0522665..65e6531ada0a 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -2952,14 +2952,12 @@ static void spi_nor_init_default_params(struct =
spi_nor *nor)
> >  	params->page_size =3D info->page_size ?: SPI_NOR_DEFAULT_PAGE_SIZE;
> >  	params->n_banks =3D info->n_banks ?: SPI_NOR_DEFAULT_N_BANKS;
> > =20
> > -	if (!(info->flags & SPI_NOR_NO_FR)) {
> > -		/* Default to Fast Read for DT and non-DT platform devices. */
> > -		params->hwcaps.mask |=3D SNOR_HWCAPS_READ_FAST;
> > +	/* Default to Fast Read for DT and non-DT platform devices. */
> > +	params->hwcaps.mask |=3D SNOR_HWCAPS_READ_FAST;
> > =20
> > -		/* Mask out Fast Read if not requested at DT instantiation. */
> > -		if (np && !of_property_read_bool(np, "m25p,fast-read"))
> > -			params->hwcaps.mask &=3D ~SNOR_HWCAPS_READ_FAST;
> > -	}
> > +	/* Mask out Fast Read if not requested at DT instantiation. */
> > +	if (np && !of_property_read_bool(np, "m25p,fast-read"))
> > +		params->hwcaps.mask &=3D ~SNOR_HWCAPS_READ_FAST;
>
> Nit: move this above where SNOR_CMD_READ_FAST is set up.
>
> Also, I think this is a bit clearer:
>
> 	/* Default to Fast Read for non-DT and enable it if requested by DT. */
> 	if (!np || of_property_read_bool(np, "m25p,fast-read"))
> 		params->hwcaps.mask |=3D SNOR_HWCAPS_READ_FAST;

Will do.

> >  	/* (Fast) Read settings. */
> >  	params->hwcaps.mask |=3D SNOR_HWCAPS_READ;
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 072c69b0d06c..9aa7d6399c8a 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -479,7 +479,6 @@ struct spi_nor_id {
> >   *                            Usually these will power-up in a write-p=
rotected
> >   *                            state.
> >   *   SPI_NOR_NO_ERASE:        no erase command needed.
> > - *   SPI_NOR_NO_FR:           can't do fastread.
> >   *   SPI_NOR_QUAD_PP:         flash supports Quad Input Page Program.
> >   *   SPI_NOR_RWW:             flash supports reads while write.
> >   *
> > @@ -528,7 +527,6 @@ struct flash_info {
> >  #define SPI_NOR_BP3_SR_BIT6		BIT(4)
> >  #define SPI_NOR_SWP_IS_VOLATILE		BIT(5)
> >  #define SPI_NOR_NO_ERASE		BIT(6)
> > -#define SPI_NOR_NO_FR			BIT(7)
> >  #define SPI_NOR_QUAD_PP			BIT(8)
> >  #define SPI_NOR_RWW			BIT(9)
>
> Move the other bits up since the slot is now free.

Mhh can't decide what's better here. On one hand I'd really like to
avoid too much code churn because it's already hard enough to follow
the development using git blame. OTOH, a new flag would need to be
added in between the existing flags. Not sure.. Or we if we run out
of free spots at the end we might get rid of the free slots.

-michael

> > diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/evers=
pin.c
> > index 5f321e24ae7d..0720a61947e7 100644
> > --- a/drivers/mtd/spi-nor/everspin.c
> > +++ b/drivers/mtd/spi-nor/everspin.c
> > @@ -14,28 +14,39 @@ static const struct flash_info everspin_nor_parts[]=
 =3D {
> >  		.size =3D SZ_16K,
> >  		.sector_size =3D SZ_16K,
> >  		.addr_nbytes =3D 2,
> > -		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> > +		.flags =3D SPI_NOR_NO_ERASE,
> >  	}, {
> >  		.name =3D "mr25h256",
> >  		.size =3D SZ_32K,
> >  		.sector_size =3D SZ_32K,
> >  		.addr_nbytes =3D 2,
> > -		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> > +		.flags =3D SPI_NOR_NO_ERASE,
> >  	}, {
> >  		.name =3D "mr25h10",
> >  		.size =3D SZ_128K,
> >  		.sector_size =3D SZ_128K,
> > -		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> > +		.flags =3D SPI_NOR_NO_ERASE,
> >  	}, {
> >  		.name =3D "mr25h40",
> >  		.size =3D SZ_512K,
> >  		.sector_size =3D SZ_512K,
> > -		.flags =3D SPI_NOR_NO_ERASE | SPI_NOR_NO_FR,
> > +		.flags =3D SPI_NOR_NO_ERASE,
> >  	}
> >  };
> > =20
> > +static void evervision_nor_default_init(struct spi_nor *nor)
> > +{
> > +	/* Everspin FRAMs don't support the fast read opcode. */
> > +	nor->params->hwcaps.mask &=3D ~SNOR_HWCAPS_READ_FAST;
> > +}
> > +
> > +static const struct spi_nor_fixups evervision_nor_fixups =3D {
> > +	.default_init =3D evervision_nor_default_init,
> > +};
> > +
> >  const struct spi_nor_manufacturer spi_nor_everspin =3D {
> >  	.name =3D "everspin",
> >  	.parts =3D everspin_nor_parts,
> >  	.nparts =3D ARRAY_SIZE(everspin_nor_parts),
> > +	.fixups =3D &evervision_nor_fixups,
> >  };


--b827ff6a1d6e7c0f215599c0781d4f0d62eb4fdb77172072f70a52582924
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZh/gAxIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jsVgGA3oMr36u2I/UnJ2cLt2sydND25+ZO+q9F
Bp7Ekmrmv3cgSPkp2AwHQCPRnpRjymPLAYDbE+G+w4jQtkeKYtO92o4lPhIW1wfV
L1hcmI3AlePxFb6EIoKtzN5ezyikhH0qtCA=
=fYjW
-----END PGP SIGNATURE-----

--b827ff6a1d6e7c0f215599c0781d4f0d62eb4fdb77172072f70a52582924--


--===============7796719357348162446==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============7796719357348162446==--

