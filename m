Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9702C4345F
	for <linux-mtd@archiver.kernel.org>; Wed, 17 Apr 2024 14:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:References:Cc:Subject:To:From:Message-Id:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P58N3Yqdw4zmO3YHiGAQ/joqvPveFRbzXKrZ0J1B2yM=; b=IzDG+IFJM5m4gM2pSpp285+Dwr
	MssKaT8tPsSrdVG+zDEODuDcJAU8hThd/5JiOeCAoz6voSNDY8VOKlAEZ5lSv+uQkwB9rdIRbHHey
	Krc86wBlev/GqSkZI8TqOhrook7Hdb8/oqSXNZ8cMjuA50uSEHAjtuqmGda8NcVZgFYFd/UizbPWF
	PR7Ww2XaSvU5S1KbTnW92qO0xuxAxVTKMvHSN8tJHwLmSoxEZ0PM8mO8DVHf7DOSV+dA+wPHSdopK
	C7iiWWpcwjWnwvmaeKivf/NuVCahV0JVvrBZetu3RIVaNstHgiNa3YMGxcGasMiHtt6EArwfGUTfu
	8r/7BesA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6ec-0000000GS3f-3pL6;
	Wed, 17 Apr 2024 14:52:54 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6eY-0000000GS18-0xQ9
	for linux-mtd@lists.infradead.org;
	Wed, 17 Apr 2024 14:52:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3A2C5CE13AD;
	Wed, 17 Apr 2024 14:52:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9F89C072AA;
	Wed, 17 Apr 2024 14:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713365566;
	bh=1HgaS+nDZFRHl/RIdVOdvy6E21/5+MqUrX5IPEQaVJ8=;
	h=Date:From:To:Subject:Cc:References:In-Reply-To:From;
	b=oqea5TbBb5nNM25HaRBloDKRmLJmRPyMGQpkY01KHNsWgfF09RTGH0uApUt07Yd7y
	 Ksh5u1LKo085w9zJVJI376QMlCzKFTe2ua2fdMzKfpeUSQVO/bbtZ3G8xiZGRRzR8h
	 K3V3CuosWh4bTPKNYP9BTr/IkA2peCvrX2aBcPJmzUYvHMa++X1F2cRS1BD/p2v121
	 mAK0OO07GNlT1nNkrxVyTDZcHwGk+Tc+Jj6tivM6gGEMhmmI+1rBq5ljXPRqhHPDJP
	 yPJb4gWmObyYHB1g8SAElyW9JlyXcj7vWSTNrP/eVf6rbCOsK/jVI0xX4X0yM3kJOd
	 pBA4WWkVa5Ruw==
Date: Wed, 17 Apr 2024 16:52:42 +0200
Message-Id: <D0MHEH8OOS44.2PPBZ3LFU4QG3@kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Pratyush Yadav" <pratyush@kernel.org>
Subject: Re: [RFC PATCH v1 6/6] mtd: spi-nor: introduce support for
 displaying deprecation message
Cc: "Tudor Ambarus" <tudor.ambarus@linaro.org>, "Miquel Raynal"
 <miquel.raynal@bootlin.com>, "Richard Weinberger" <richard@nod.at>,
 "Vignesh Raghavendra" <vigneshr@ti.com>, <linux-kernel@vger.kernel.org>,
 <linux-mtd@lists.infradead.org>
X-Mailer: aerc 0.16.0
References: <20240412134405.381832-1-mwalle@kernel.org>
 <20240412134405.381832-7-mwalle@kernel.org> <mafs0jzkw6oq1.fsf@kernel.org>
In-Reply-To: <mafs0jzkw6oq1.fsf@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_075250_659768_70E5B2EA 
X-CRM114-Status: GOOD (  37.13  )
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
Content-Type: multipart/mixed; boundary="===============1145772883762265419=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============1145772883762265419==
Content-Type: multipart/signed;
 boundary=708fc41844f140b3d840031632678d0e44008df68536d14dad2e9ff8531b;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--708fc41844f140b3d840031632678d0e44008df68536d14dad2e9ff8531b
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

On Wed Apr 17, 2024 at 4:36 PM CEST, Pratyush Yadav wrote:
> On Fri, Apr 12 2024, Michael Walle wrote:
>
> > SPI-NOR will automatically detect the attached flash device most of the
> > time. We cannot easily find out if boards are using a given flash.
> > Therefore, introduce a (temporary) flag to display a message on boot if
>
> Why temporary? There will always be a need to deprecate one flash or
> another. Might as well keep the flag around.

Mh, yes I agree. That also means that this flag will not have any
users (most) of the time (hopefully ;) ).

> Also, this patch/series does not add any users of the deprecated flag.
> If you have some flashes in mind, it would be good to add them to the
> patch/series.

This is just an RFC to see if whether you Tudor agree with me :) But
I was about to add it to the evervision/cypress FRAMs.

> I like the idea in general. Do you think we should also print a rough
> date for the deprecation as well?

Might make sense, any suggestions?

> > support for a given flash device is scheduled to be removed in the
> > future.
> >
> > Signed-off-by: Michael Walle <mwalle@kernel.org>
> > ---
> >  drivers/mtd/spi-nor/core.c | 12 ++++++++++++
> >  drivers/mtd/spi-nor/core.h |  1 +
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> > index 58d310427d35..a294eef2e34a 100644
> > --- a/drivers/mtd/spi-nor/core.c
> > +++ b/drivers/mtd/spi-nor/core.c
> > @@ -3312,6 +3312,7 @@ static const struct flash_info *spi_nor_get_flash=
_info(struct spi_nor *nor,
> >  						       const char *name)
> >  {
> >  	const struct flash_info *jinfo =3D NULL, *info =3D NULL;
> > +	const char *deprecated =3D NULL;
> > =20
> >  	if (name)
> >  		info =3D spi_nor_match_name(nor, name);
> > @@ -3326,6 +3327,17 @@ static const struct flash_info *spi_nor_get_flas=
h_info(struct spi_nor *nor,
> >  			return jinfo;
> >  	}
> > =20
> > +	if (info && (info->flags & SPI_NOR_DEPRECATED))
> > +		deprecated =3D info->name;
> > +	else if (jinfo && (jinfo->flags & SPI_NOR_DEPRECATED))
> > +		deprecated =3D jinfo->name;
> > +
> > +	if (deprecated)
> > +		pr_warn("Your board or device tree is using a SPI NOR flash (%s) wit=
h\n"
> > +			"deprecated driver support. It will be removed in future kernel\n"
>
> Nit: "removed in a future kernel version"
>
> > +			"version. If you feel this shouldn't be the case, please contact\n"
> > +			"us at linux-mtd@lists.infradead.org\n", deprecated);
> > +
>
> Hmm, this isn't so nice. I'd suggest doing something like:
>
> 	/*
>          * If caller has specified name of flash model that can normally =
be
>          * ...
>          */
> 	info =3D jinfo ?: info;
>
> 	if (info->flags & SPI_NOR_DEPRECATED)
>         	pr_warn(...);

Actually, I had that, *but* I was thinking we might only check the
detected flash and not the one specified in the device tree. But
thinking about that again, I guess it makes sense because:
 - that's the actually used flash driver
 - having jinfo !=3D info will print that other warning, thus this
   case is hopefully very unlikely.

>
> 	return info;
>
> >  	/*
> >  	 * If caller has specified name of flash model that can normally be
> >  	 * detected using JEDEC, let's verify it.
> > diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> > index 8552e31b1b07..0317d8e253f4 100644
> > --- a/drivers/mtd/spi-nor/core.h
> > +++ b/drivers/mtd/spi-nor/core.h
> > @@ -524,6 +524,7 @@ struct flash_info {
> >  #define SPI_NOR_NO_ERASE		BIT(6)
> >  #define SPI_NOR_QUAD_PP			BIT(8)
> >  #define SPI_NOR_RWW			BIT(9)
> > +#define SPI_NOR_DEPRECATED		BIT(15)
>
> If you do agree with my suggestion of making it permanent, would it make
> more sense to make it BIT(10) instead. Or BIT(9) once you move up the
> others because we no longer have BIT(7).

Or just BIT(7) and avoid any code churn :)

-michael

>
> > =20
> >  	u8 no_sfdp_flags;
> >  #define SPI_NOR_SKIP_SFDP		BIT(0)


--708fc41844f140b3d840031632678d0e44008df68536d14dad2e9ff8531b
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZh/iOhIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jTJwF+MfXaY0rJxf8esRAeR/YyzqP24TH0YPAh
rK75nCQk3ECO68GvG9Pk9Cj8/1uETtabAX97iBpwzQ1wB70yIGZin+I20ATWcX1W
hLecMdn8ML3b9cyRUNpKYaAxe2fUQLjZPZA=
=237x
-----END PGP SIGNATURE-----

--708fc41844f140b3d840031632678d0e44008df68536d14dad2e9ff8531b--


--===============1145772883762265419==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============1145772883762265419==--

