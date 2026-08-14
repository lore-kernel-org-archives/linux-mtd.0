Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 133EAC5B572
	for <linux-mtd@archiver.kernel.org>; Fri, 14 Aug 2026 09:40:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GogZ93/7P360vh1gJ1dhawkXp4+32rYe8kEIAj8WDZk=; b=ZEplGwC69qw8XDqSDNM8zCj/Is
	nbWmBSsBa9UkmVAbsH02mryq1PDMmA8C8hhqUbnoYbPVe2SB7vcmcYsZPooBZUYCtH94vx5FEgqwu
	mNLiwY0zkRizH6eaPjh1zPTPVqDXQxyRtj28dFL/m7J6c0lp3P1RFKSK/eph93WZeV9ltAELPjkr4
	o0PFp0qb49Tc4X+M2ksejKaPJhW18CvfLmBJVB6XGWSlW1+q7wsbBOnCS1EihB+vZiFt1ljV1soXt
	aaudp10rSwJgVCBbmraRa41EPqdLd/NTowOuBvVxdJAw1hQqzajiiCQBsPfs9ZQxaxSh5T8zyt/C7
	+02ZSRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoOq-00000002PXu-3YcV;
	Fri, 14 Aug 2026 09:40:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuoOp-00000002PXh-05Ip;
	Fri, 14 Aug 2026 09:40:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id DF474601DE;
	Fri, 14 Aug 2026 09:40:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B3BC61F000E9;
	Fri, 14 Aug 2026 09:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786700425;
	bh=dQzi4uw4ljTLEnoLMXwhop8N+1TMdnou+Ut3pXkQFQA=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=FgCxmsQx2rfRAj98RJSid4/FmXNuoblmC2kcZ0TNiKCXD+fYYV+nKNfegPm2NWiwO
	 Q7+7Re4TCQ+H2aKCP8+Zl6O9VWIzIbtP1RaF33spzp9s3JDBLkp9cCHFuoea9rAHMj
	 sfKXEzIdXLD/Jd2nIVxtWbgeJJnj4/TfITM3Gl8C6RxLLdZxrs7L7qupZGp67owZR7
	 hbX/BR1NWSK0WCWlHXzPTudoRJyXPV3Rpt5dXwDdxNaESwN5JFNZYOLjk9xizviZgE
	 O0LCUleY3qqqj0+z02WUpMjDnkFz0alZnws5nD7ZjIonwqaEQQYun2Fp7Azm1fkV+d
	 sCxQs/JEw8F6w==
Mime-Version: 1.0
Date: Fri, 14 Aug 2026 11:40:21 +0200
Message-Id: <DKOKFU8AD2U6.151AX0VOBX67H@kernel.org>
Subject: Re: [PATCH v3 05/23] mtd: spi-nor: Create the concept of fixup
 table with match function
Cc: "Steam Lin" <STLin2@winbond.com>, "Hsin-Yi Wang" <hsinyi@chromium.org>,
 "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <linux-mtd@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "Miquel Raynal" <miquel.raynal@bootlin.com>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Takahiro Kuwano" <takahiro.kuwano@infineon.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Nicolas Ferre" <nicolas.ferre@microchip.com>,
 "Alexandre Belloni" <alexandre.belloni@bootlin.com>, "Claudiu Beznea"
 <claudiu.beznea@tuxon.dev>, "Jonathan Corbet" <corbet@lwn.net>, "Shuah
 Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.20.0
References: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-0-b637cf120d5c@bootlin.com> <20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com>
In-Reply-To: <20260813-winbond-v7-1-spi-nor-rv-addition-v3-5-b637cf120d5c@bootlin.com>
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
Content-Type: multipart/mixed; boundary="===============4780532182906590186=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4780532182906590186==
Content-Type: multipart/signed;
 boundary=295fba22dfa326321d815668ca00fad395fba4775ca2fbae89cebd9b5daa;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--295fba22dfa326321d815668ca00fad395fba4775ca2fbae89cebd9b5daa
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Aug 13, 2026 at 5:19 PM CEST, Miquel Raynal wrote:
> Manufacturer ID tables increase and fixup() hooks proliferate. Having
> one possible structure per chip was fine until the fixups started being
> more and more common and needed, to some extend due to ID reuses. Mixing
> fixups and chips becomes hard and requires extra helpers to sort which
> ones are needed for a given chip, which every time this happens requires
> a lot of rework.

Thanks, this patch looks really promising!

> Replace the two-level fixup association (a manufacturer wide hook and a
> per flash_info hook) with a per-manufacturer list of fixups that can be
> looked up by flash ID and/or match function.
>
> The match logic works as follows:
> - If there is an ID, it must match
> - If there is a match function, it must match (cumulative)
> - If there is no identifier (no ID nor any match function), it's a
>   catch-all entry typically used for flagging manufacturer fixups.

This mimics, how it's currently handled. But since the fixups are
now treated as a separate list, i.e. it has it's own SNOR_ID, we
shall move away from this manufacturer thingy too. IMHO that really
clutters the code. As a fun fact, spi_nor_match_id() will have the
unexpected side effect of setting nor->manufacturer.

So here's how I'd do it:=20
(1) remove spi_nor_manufacturer.
(2) have a list of initcalls in the core to call into the individual
    vendor modules (that could later be replaced by something more
    sophiticated)
(3) that initcall will then call spi_nor_register_parts(const struct
    flash_info *parts, int nparts)
(4) (optionally) calls spi_nor_register_fixups(const struct
    spi_nor_fixup *fixups, int nfixups)

Also both could be a macro, then we can get rid of the size
argument.

The current manufacturer fixups gets registered with a
"SNOR_ID(vendor)".=20

That leaves us with the manufacturer name, which should be set by
that vendor catch all fixup.

Btw, I'm fine with deprecating the name as well as the manufacturer
sysfs entry, but it shouldn't be as in "it just goes away". There
should be a transition period. Although I'm not sure, how a user
could be notified, that this property will go away soon, honestly.
Print a warning on the kernel buffer? Not sure someone actually
notice that. Put it behind a Kconfig option which is "default y"
then after some time, that default is dropped and eventually removed
altogether? Looks like quite some churn and distros might just
enable it in their config. Any other ideas?

> Suggested-by: Michael Walle <mwalle@kernel.org>
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  drivers/mtd/spi-nor/atmel.c      | 23 ++++++-----
>  drivers/mtd/spi-nor/core.c       | 82 ++++++++++++++++++++++++++++------=
------
>  drivers/mtd/spi-nor/core.h       | 23 +++++++++--
>  drivers/mtd/spi-nor/everspin.c   |  7 +++-
>  drivers/mtd/spi-nor/gigadevice.c |  7 +++-
>  drivers/mtd/spi-nor/issi.c       | 22 ++++++++---
>  drivers/mtd/spi-nor/macronix.c   | 23 ++++++-----
>  drivers/mtd/spi-nor/micron-st.c  | 43 +++++++++++++++------
>  drivers/mtd/spi-nor/sfdp.c       | 56 ++++++++++++++++++---------
>  drivers/mtd/spi-nor/spansion.c   | 41 +++++++++++---------
>  drivers/mtd/spi-nor/sst.c        | 11 ++++--
>  drivers/mtd/spi-nor/winbond.c    | 17 ++++++---
>  12 files changed, 247 insertions(+), 108 deletions(-)
>
> diff --git a/drivers/mtd/spi-nor/atmel.c b/drivers/mtd/spi-nor/atmel.c
> index 8741c0bda497..bccc702a2c4a 100644
> --- a/drivers/mtd/spi-nor/atmel.c
> +++ b/drivers/mtd/spi-nor/atmel.c
> @@ -194,47 +194,40 @@ static const struct flash_info atmel_nor_parts[] =
=3D {
>  		.size =3D SZ_512K,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &atmel_nor_global_protection_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x45, 0x01),
>  		.name =3D "at26df081a",
>  		.size =3D SZ_1M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &atmel_nor_global_protection_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x46, 0x01),
>  		.name =3D "at26df161a",
>  		.size =3D SZ_2M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &atmel_nor_global_protection_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x47, 0x00),
>  		.name =3D "at25df321",
>  		.size =3D SZ_4M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &atmel_nor_global_protection_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x47, 0x01),
>  		.name =3D "at25df321a",
>  		.size =3D SZ_4M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &atmel_nor_global_protection_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x47, 0x08),
>  		.name =3D "at25ff321a",
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> -		.fixups =3D &atmel_nor_global_protection_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x48, 0x00),
>  		.name =3D "at25df641",
>  		.size =3D SZ_8M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &atmel_nor_global_protection_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x66, 0x01),
>  		.name =3D "at25fs010",
> @@ -242,14 +235,12 @@ static const struct flash_info atmel_nor_parts[] =
=3D {
>  		.size =3D SZ_128K,
>  		.flags =3D SPI_NOR_HAS_LOCK,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &at25fs_nor_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x66, 0x04),
>  		.name =3D "at25fs040",
>  		.size =3D SZ_512K,
>  		.flags =3D SPI_NOR_HAS_LOCK,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &at25fs_nor_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x1f, 0x87, 0x01),
>  		.size =3D SZ_4M,
> @@ -257,8 +248,22 @@ static const struct flash_info atmel_nor_parts[] =3D=
 {
>  	},
>  };
> =20
> +static const struct spi_nor_fixup atmel_fixups[] =3D {
> +	{ .id =3D SNOR_ID(0x1f, 0x44, 0x01), .fixups =3D &atmel_nor_global_prot=
ection_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x45, 0x01), .fixups =3D &atmel_nor_global_prot=
ection_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x46, 0x01), .fixups =3D &atmel_nor_global_prot=
ection_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x47, 0x00), .fixups =3D &atmel_nor_global_prot=
ection_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x47, 0x01), .fixups =3D &atmel_nor_global_prot=
ection_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x47, 0x08), .fixups =3D &atmel_nor_global_prot=
ection_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x48, 0x00), .fixups =3D &atmel_nor_global_prot=
ection_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x66, 0x01), .fixups =3D &at25fs_nor_fixups },
> +	{ .id =3D SNOR_ID(0x1f, 0x66, 0x04), .fixups =3D &at25fs_nor_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_atmel =3D {
>  	.name =3D "atmel",
>  	.parts =3D atmel_nor_parts,
>  	.nparts =3D ARRAY_SIZE(atmel_nor_parts),
> +	.fixups =3D atmel_fixups,
> +	.nfixups =3D ARRAY_SIZE(atmel_fixups),
>  };
> diff --git a/drivers/mtd/spi-nor/core.c b/drivers/mtd/spi-nor/core.c
> index ac7812562047..3a611283a9e6 100644
> --- a/drivers/mtd/spi-nor/core.c
> +++ b/drivers/mtd/spi-nor/core.c
> @@ -2367,19 +2367,24 @@ int spi_nor_post_bfpt_fixups(struct spi_nor *nor,
>  			     const struct sfdp_parameter_header *bfpt_header,
>  			     const struct sfdp_bfpt *bfpt)
>  {
> +	const struct spi_nor_fixup *fixups;
>  	int ret;
> +	unsigned int i;
> =20
> -	if (nor->manufacturer && nor->manufacturer->fixups &&
> -	    nor->manufacturer->fixups->post_bfpt) {
> -		ret =3D nor->manufacturer->fixups->post_bfpt(nor, bfpt_header,
> -							   bfpt);
> -		if (ret)
> -			return ret;
> +	if (!nor->manufacturer || !nor->manufacturer->fixups)
> +		return 0;
> +
> +	fixups =3D nor->manufacturer->fixups;
> +
> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
> +		if (fixups[i].fixups->post_bfpt &&
> +		    spi_nor_fixup_match(nor, &fixups[i])) {
> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
> +			if (ret)
> +				return ret;
> +		}

This is repeated several times, can we have something like

spi_nor_apply_fixups(struct spi_nor *nor, int (*fixup_fn), void *fixup_args=
);

int spi_nor_post_bfpt_fixup(struct spi_nor *nor, const struct spi_nor_fixup=
 *fixup, void *_args)
{
	struct post_bfpt_fixup_args *args =3D _args;

	if (!fixup->post_bfpt)
		return 0;

	return fixup->post_bfpt(nor, args->bfpt_header, args->bfpt);
}

which then will be called with
spi_nor_apply_fixups(nor, spi_nor_post_bfpt_fixup, args);

> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
> +		if (fixups[i].fixups->post_bfpt &&
> +		    spi_nor_fixup_match(nor, &fixups[i])) {
> +			ret =3D fixups[i].fixups->post_bfpt(nor, bfpt_header, bfpt);
> +			if (ret)
> +				return ret;
>  	}
> =20
> -	if (nor->info->fixups && nor->info->fixups->post_bfpt)
> -		return nor->info->fixups->post_bfpt(nor, bfpt_header, bfpt);
> -
>  	return 0;
>  }
> =20
> @@ -2636,6 +2641,26 @@ static int spi_nor_setup(struct spi_nor *nor,
>  	return spi_nor_set_addr_nbytes(nor);
>  }
> =20
> +bool spi_nor_fixup_match(const struct spi_nor *nor,
> +			 const struct spi_nor_fixup *fixup)
> +{
> +	const struct spi_nor_id *id =3D nor->info ? nor->info->id : NULL;
> +
> +	/* Filter by ID first, if available */
> +	if (fixup->id) {
> +		if (!id || fixup->id->len > id->len ||
> +		    memcmp(id->bytes, fixup->id->bytes, fixup->id->len))
> +			return false;
> +	}
> +
> +	/* Further filter with the match callback, if provided */
> +	if (fixup->match)
> +		return fixup->match(nor);
> +
> +	/* Either there was an ID and it matched, or it is a catch-all entry */
> +	return true;
> +}
> +
>  /**
>   * spi_nor_manufacturer_init_params() - Initialize the flash's parameter=
s and
>   * settings based on MFR register and ->default_init() hook.
> @@ -2643,12 +2668,19 @@ static int spi_nor_setup(struct spi_nor *nor,
>   */
>  static void spi_nor_manufacturer_init_params(struct spi_nor *nor)
>  {
> -	if (nor->manufacturer && nor->manufacturer->fixups &&
> -	    nor->manufacturer->fixups->default_init)
> -		nor->manufacturer->fixups->default_init(nor);
> +	const struct spi_nor_fixup *fixups;
> +	unsigned int i;
> =20
> -	if (nor->info->fixups && nor->info->fixups->default_init)
> -		nor->info->fixups->default_init(nor);
> +	if (!nor->manufacturer || !nor->manufacturer->fixups)
> +		return;
> +
> +	fixups =3D nor->manufacturer->fixups;
> +
> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
> +		if (fixups[i].fixups->default_init &&
> +		    spi_nor_fixup_match(nor, &fixups[i]))
> +			fixups[i].fixups->default_init(nor);
> +	}
>  }
> =20
>  /**
> @@ -2797,22 +2829,24 @@ static void spi_nor_init_fixup_flags(struct spi_n=
or *nor)
>  static int spi_nor_late_init_params(struct spi_nor *nor)
>  {
>  	struct spi_nor_flash_parameter *params =3D nor->params;
> +	const struct spi_nor_fixup *fixups;
> +	unsigned int i;
>  	int ret;
> =20
>  	/* Needed by some late_init hooks */
>  	spi_nor_init_flags(nor);
> =20
> -	if (nor->manufacturer && nor->manufacturer->fixups &&
> -	    nor->manufacturer->fixups->late_init) {
> -		ret =3D nor->manufacturer->fixups->late_init(nor);
> -		if (ret)
> -			return ret;
> -	}
> +	if (nor->manufacturer && nor->manufacturer->fixups) {
> +		fixups =3D nor->manufacturer->fixups;
> =20
> -	if (nor->info->fixups && nor->info->fixups->late_init) {
> -		ret =3D nor->info->fixups->late_init(nor);
> -		if (ret)
> -			return ret;
> +		for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
> +			if (fixups[i].fixups->late_init &&
> +			    spi_nor_fixup_match(nor, &fixups[i])) {
> +				ret =3D fixups[i].fixups->late_init(nor);
> +				if (ret)
> +					return ret;
> +			}
> +		}
>  	}
> =20
>  	if (!nor->params->opcodes.die_erase)
> diff --git a/drivers/mtd/spi-nor/core.h b/drivers/mtd/spi-nor/core.h
> index 7d43d3ba47ee..b650778a10de 100644
> --- a/drivers/mtd/spi-nor/core.h
> +++ b/drivers/mtd/spi-nor/core.h
> @@ -445,6 +445,19 @@ struct spi_nor_fixups {
>  	int (*late_init)(struct spi_nor *nor);
>  };
> =20
> +/**
> + * struct spi_nor_fixup - SPI NOR fixup registration.
> + * @id:		(optional) flash ID this fixup applies to, may only match the
> + *		ID prefix, eg. just the first few bytes to match a whole family
> + * @match:	(optional) custom match function (can be used together with @=
id)
> + * @fixups:	the fixup hooks to apply when this entry matches
> + */
> +struct spi_nor_fixup {
> +	const struct spi_nor_id *id;
> +	bool (*match)(const struct spi_nor *nor);
> +	const struct spi_nor_fixups *fixups;
> +};
> +
>  /**
>   * struct spi_nor_id - SPI NOR flash ID.
>   *
> @@ -560,7 +573,6 @@ struct flash_info {
>  	u8 mfr_flags;
> =20
>  	const struct spi_nor_otp_organization *otp;
> -	const struct spi_nor_fixups *fixups;
>  };
> =20
>  #define SNOR_ID(...)							\
> @@ -582,13 +594,16 @@ struct flash_info {
>   * @name: manufacturer name
>   * @parts: array of parts supported by this manufacturer
>   * @nparts: number of entries in the parts array
> - * @fixups: hooks called at various points in time during spi_nor_scan()
> + * @fixups: list of fixups, each matched by ID (or a custom match functi=
on),
> + *          applied to any part of this manufacturer.
> + * @nfixups: number of entries in the fixups array
>   */
>  struct spi_nor_manufacturer {
>  	const char *name;
>  	const struct flash_info *parts;
>  	unsigned int nparts;
> -	const struct spi_nor_fixups *fixups;
> +	const struct spi_nor_fixup *fixups;
> +	unsigned int nfixups;
>  };
> =20
>  /**
> @@ -619,6 +634,8 @@ extern const struct spi_nor_manufacturer spi_nor_xmc;
> =20
>  extern const struct attribute_group *spi_nor_sysfs_groups[];
> =20
> +bool spi_nor_fixup_match(const struct spi_nor *nor,
> +			 const struct spi_nor_fixup *fixup);
>  void spi_nor_spimem_setup_op(const struct spi_nor *nor,
>  			     struct spi_mem_op *op,
>  			     const enum spi_nor_protocol proto);
> diff --git a/drivers/mtd/spi-nor/everspin.c b/drivers/mtd/spi-nor/everspi=
n.c
> index add37104d673..864dffba0e9c 100644
> --- a/drivers/mtd/spi-nor/everspin.c
> +++ b/drivers/mtd/spi-nor/everspin.c
> @@ -44,9 +44,14 @@ static const struct spi_nor_fixups everspin_nor_fixups=
 =3D {
>  	.default_init =3D everspin_nor_default_init,
>  };
> =20
> +static const struct spi_nor_fixup everspin_fixups[] =3D {
> +	{ .fixups =3D &everspin_nor_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_everspin =3D {
>  	.name =3D "everspin",
>  	.parts =3D everspin_nor_parts,
>  	.nparts =3D ARRAY_SIZE(everspin_nor_parts),
> -	.fixups =3D &everspin_nor_fixups,
> +	.fixups =3D everspin_fixups,
> +	.nfixups =3D ARRAY_SIZE(everspin_fixups),
>  };
> diff --git a/drivers/mtd/spi-nor/gigadevice.c b/drivers/mtd/spi-nor/gigad=
evice.c
> index 4070a692e968..f76fd0dedd0a 100644
> --- a/drivers/mtd/spi-nor/gigadevice.c
> +++ b/drivers/mtd/spi-nor/gigadevice.c
> @@ -64,7 +64,6 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xc8, 0x40, 0x19),
>  		.name =3D "gd25q256",
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6,
> -		.fixups =3D &gd25q256_fixups,
>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,

The fixup_flags should also go into the fixups list.

>  	}, {
>  		.id =3D SNOR_ID(0xc8, 0x60, 0x16),
> @@ -87,8 +86,14 @@ static const struct flash_info gigadevice_nor_parts[] =
=3D {
>  	},
>  };
> =20
> +static const struct spi_nor_fixup gigadevice_fixups[] =3D {
> +	{ .id =3D SNOR_ID(0xc8, 0x40, 0x19), .fixups =3D &gd25q256_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_gigadevice =3D {
>  	.name =3D "gigadevice",
>  	.parts =3D gigadevice_nor_parts,
>  	.nparts =3D ARRAY_SIZE(gigadevice_nor_parts),
> +	.fixups =3D gigadevice_fixups,
> +	.nfixups =3D ARRAY_SIZE(gigadevice_fixups),
>  };
> diff --git a/drivers/mtd/spi-nor/issi.c b/drivers/mtd/spi-nor/issi.c
> index 04db42b5141e..4842f8acd074 100644
> --- a/drivers/mtd/spi-nor/issi.c
> +++ b/drivers/mtd/spi-nor/issi.c
> @@ -52,13 +52,11 @@ static const struct flash_info issi_nor_parts[] =3D {
>  		.sector_size =3D SZ_32K,
>  		.size =3D SZ_64K,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &pm25lv_nor_fixups
>  	}, {
>  		.name =3D "pm25lv010",
>  		.sector_size =3D SZ_32K,
>  		.size =3D SZ_128K,
>  		.no_sfdp_flags =3D SECT_4K,
> -		.fixups =3D &pm25lv_nor_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x7f, 0x9d, 0x20),
>  		.name =3D "is25cd512",
> @@ -103,7 +101,6 @@ static const struct flash_info issi_nor_parts[] =3D {
>  	}, {
>  		.id =3D SNOR_ID(0x9d, 0x60, 0x19),
>  		.name =3D "is25lp256",
> -		.fixups =3D &is25lp256_fixups,
>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>  	}, {
>  		.id =3D SNOR_ID(0x9d, 0x70, 0x16),
> @@ -124,7 +121,6 @@ static const struct flash_info issi_nor_parts[] =3D {
>  		.id =3D SNOR_ID(0x9d, 0x70, 0x19),
>  		.name =3D "is25wp256",
>  		.flags =3D SPI_NOR_QUAD_PP,
> -		.fixups =3D &is25lp256_fixups,
>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
>  	}
>  };
> @@ -139,9 +135,25 @@ static const struct spi_nor_fixups issi_fixups =3D {
>  	.default_init =3D issi_nor_default_init,
>  };
> =20
> +/* PM25LV parts have no JEDEC ID and are likely matched by name */
> +static bool issi_pm25lv_match(const struct spi_nor *nor)
> +{
> +	const char *name =3D nor->info ? nor->info->name : NULL;
> +
> +	return name && !strncmp(name, "pm25lv", 6);

Won't just strcmp("pm25lv", name) do it? Both arguments are
guaranteed to be NUL terminated. The above would also match
"pm25lvextrabytes", no, and we get rid of that redundant size
argument.

> +}
> +
> +static const struct spi_nor_fixup issi_fixup_list[] =3D {
> +	{ .fixups =3D &issi_fixups },
> +	{ .match =3D issi_pm25lv_match, .fixups =3D &pm25lv_nor_fixups },
> +	{ .id =3D SNOR_ID(0x9d, 0x60, 0x19), .fixups =3D &is25lp256_fixups },
> +	{ .id =3D SNOR_ID(0x9d, 0x70, 0x19), .fixups =3D &is25lp256_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_issi =3D {
>  	.name =3D "issi",
>  	.parts =3D issi_nor_parts,
>  	.nparts =3D ARRAY_SIZE(issi_nor_parts),
> -	.fixups =3D &issi_fixups,
> +	.fixups =3D issi_fixup_list,
> +	.nfixups =3D ARRAY_SIZE(issi_fixup_list),
>  };
> diff --git a/drivers/mtd/spi-nor/macronix.c b/drivers/mtd/spi-nor/macroni=
x.c
> index 55612237c1ef..04b431bf5f13 100644
> --- a/drivers/mtd/spi-nor/macronix.c
> +++ b/drivers/mtd/spi-nor/macronix.c
> @@ -137,20 +137,16 @@ static const struct flash_info macronix_nor_parts[]=
 =3D {
>  	}, {
>  		/* MX25L25635E, MX25L25645G */
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x19),
> -		.fixups =3D &mx25l25635_fixups
>  	}, {
>  		/* MX66L51235F */
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x1a),
>  		.fixup_flags =3D SPI_NOR_4B_OPCODES,
> -		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {
>  		/* MX66L1G45G */
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x1b),
> -		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {
>  		/* MX66L2G45G */
>  		.id =3D SNOR_ID(0xc2, 0x20, 0x1c),
> -		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0xc2, 0x23, 0x14),
>  		.name =3D "mx25v8035f",
> @@ -189,15 +185,12 @@ static const struct flash_info macronix_nor_parts[]=
 =3D {
>  	}, {
>  		/* MX25U51245G */
>  		.id =3D SNOR_ID(0xc2, 0x25, 0x3a),
> -		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {
>  		/* MX66U1G45G */
>  		.id =3D SNOR_ID(0xc2, 0x25, 0x3b),
> -		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {
>  		/* MX66U2G45G */
>  		.id =3D SNOR_ID(0xc2, 0x25, 0x3c),
> -		.fixups =3D &macronix_qpp4b_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0xc2, 0x26, 0x18),
>  		.name =3D "mx25l12855e",
> @@ -229,7 +222,6 @@ static const struct flash_info macronix_nor_parts[] =
=3D {
>  	}, {
>  		/* MX25L3255E */
>  		.id =3D SNOR_ID(0xc2, 0x9e, 0x16),
> -		.fixups =3D &mx25l3255e_fixups,
>  	},
>  	/*
>  	 * This spares us of adding new flash entries for flashes that can be
> @@ -333,9 +325,22 @@ static const struct spi_nor_fixups macronix_nor_fixu=
ps =3D {
>  	.late_init =3D macronix_nor_late_init,
>  };
> =20
> +static const struct spi_nor_fixup macronix_fixups[] =3D {
> +	{ .fixups =3D &macronix_nor_fixups },
> +	{ .id =3D SNOR_ID(0xc2, 0x20, 0x19), .fixups =3D &mx25l25635_fixups },
> +	{ .id =3D SNOR_ID(0xc2, 0x20, 0x1a), .fixups =3D &macronix_qpp4b_fixups=
 },
> +	{ .id =3D SNOR_ID(0xc2, 0x20, 0x1b), .fixups =3D &macronix_qpp4b_fixups=
 },
> +	{ .id =3D SNOR_ID(0xc2, 0x20, 0x1c), .fixups =3D &macronix_qpp4b_fixups=
 },
> +	{ .id =3D SNOR_ID(0xc2, 0x25, 0x3a), .fixups =3D &macronix_qpp4b_fixups=
 },
> +	{ .id =3D SNOR_ID(0xc2, 0x25, 0x3b), .fixups =3D &macronix_qpp4b_fixups=
 },
> +	{ .id =3D SNOR_ID(0xc2, 0x25, 0x3c), .fixups =3D &macronix_qpp4b_fixups=
 },
> +	{ .id =3D SNOR_ID(0xc2, 0x9e, 0x16), .fixups =3D &mx25l3255e_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_macronix =3D {
>  	.name =3D "macronix",
>  	.parts =3D macronix_nor_parts,
>  	.nparts =3D ARRAY_SIZE(macronix_nor_parts),
> -	.fixups =3D &macronix_nor_fixups,
> +	.fixups =3D macronix_fixups,
> +	.nfixups =3D ARRAY_SIZE(macronix_fixups),
>  };
> diff --git a/drivers/mtd/spi-nor/micron-st.c b/drivers/mtd/spi-nor/micron=
-st.c
> index 344539d2a36a..2aabd6d487ba 100644
> --- a/drivers/mtd/spi-nor/micron-st.c
> +++ b/drivers/mtd/spi-nor/micron-st.c
> @@ -206,13 +206,11 @@ static const struct flash_info micron_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0x2c, 0x5b, 0x1a),
>  		.mfr_flags =3D USE_FSR,
>  		.fixup_flags =3D SPI_NOR_IO_MODE_EN_VOLATILE,
> -		.fixups =3D &mt35xu512aba_fixups,
>  	}, {
>  		/* MT35XU01GBBA */
>  		.id =3D SNOR_ID(0x2c, 0x5b, 0x1b),
>  		.mfr_flags =3D USE_FSR,
>  		.fixup_flags =3D SPI_NOR_IO_MODE_EN_VOLATILE,
> -		.fixups =3D &mt35_two_die_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x2c, 0x5b, 0x1c),
>  		.name =3D "mt35xu02g",
> @@ -221,7 +219,6 @@ static const struct flash_info micron_nor_parts[] =3D=
 {
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_OCTAL_READ,
>  		.mfr_flags =3D USE_FSR,
>  		.fixup_flags =3D SPI_NOR_4B_OPCODES | SPI_NOR_IO_MODE_EN_VOLATILE,
> -		.fixups =3D &mt35_two_die_fixups,
>  	},
>  };
> =20
> @@ -233,6 +230,17 @@ static int mt25qu512a_post_bfpt_fixup(struct spi_nor=
 *nor,
>  	return 0;
>  }
> =20
> +/*
> + * n25q00a parts share the first same 3 ID bytes with mt25qu01g.
> + * In order to not mix the fixups, further filter out using the part nam=
e.

How would that work? The part name is also set by the duplicated ID,
so the first one wins, no?

-michael

> + */
> +static bool n25q00a_match(const struct spi_nor *nor)
> +{
> +	const char *name =3D nor->info ? nor->info->name : NULL;
> +
> +	return name && !strncmp(name, "n25q00a", 7);
> +}
> +
>  static const struct spi_nor_fixups mt25qu512a_fixups =3D {
>  	.post_bfpt =3D mt25qu512a_post_bfpt_fixup,
>  };
> @@ -426,14 +434,12 @@ static const struct flash_info st_nor_parts[] =3D {
>  			 SPI_NOR_BP3_SR_BIT6,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_QUAD_READ,
>  		.mfr_flags =3D USE_FSR,
> -		.fixups =3D &n25q00_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x20, 0xba, 0x22),
>  		.name =3D "mt25ql02g",
>  		.size =3D SZ_256M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_QUAD_READ,
>  		.mfr_flags =3D USE_FSR,
> -		.fixups =3D &mt25q02_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x20, 0xbb, 0x15),
>  		.name =3D "n25q016a",
> @@ -480,7 +486,6 @@ static const struct flash_info st_nor_parts[] =3D {
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_4BIT_BP |
>  			 SPI_NOR_BP3_SR_BIT6,
>  		.mfr_flags =3D USE_FSR,
> -		.fixups =3D &mt25qu512a_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x20, 0xbb, 0x20),
>  		.name =3D "n25q512a",
> @@ -493,21 +498,18 @@ static const struct flash_info st_nor_parts[] =3D {
>  		.id =3D SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00),
>  		.name =3D "mt25qu01g",
>  		.mfr_flags =3D USE_FSR,
> -		.fixups =3D &mt25q01_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x20, 0xbb, 0x21),
>  		.name =3D "n25q00a",
>  		.size =3D SZ_128M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_QUAD_READ,
>  		.mfr_flags =3D USE_FSR,
> -		.fixups =3D &n25q00_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x20, 0xbb, 0x22),
>  		.name =3D "mt25qu02g",
>  		.size =3D SZ_256M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.mfr_flags =3D USE_FSR,
> -		.fixups =3D &mt25q02_fixups,
>  	}
>  };
> =20
> @@ -657,16 +659,35 @@ static const struct spi_nor_fixups micron_st_nor_fi=
xups =3D {
>  	.late_init =3D micron_st_nor_late_init,
>  };
> =20
> +static const struct spi_nor_fixup micron_fixups[] =3D {
> +	{ .fixups =3D &micron_st_nor_fixups },
> +	{ .id =3D SNOR_ID(0x2c, 0x5b, 0x1a), .fixups =3D &mt35xu512aba_fixups }=
,
> +	{ .id =3D SNOR_ID(0x2c, 0x5b, 0x1b), .fixups =3D &mt35_two_die_fixups }=
,
> +	{ .id =3D SNOR_ID(0x2c, 0x5b, 0x1c), .fixups =3D &mt35_two_die_fixups }=
,
> +};
> +
> +static const struct spi_nor_fixup st_fixups[] =3D {
> +	{ .fixups =3D &micron_st_nor_fixups },
> +	{ .id =3D SNOR_ID(0x20, 0xba, 0x21), .fixups =3D &n25q00_fixups },
> +	{ .id =3D SNOR_ID(0x20, 0xba, 0x22), .fixups =3D &mt25q02_fixups },
> +	{ .id =3D SNOR_ID(0x20, 0xbb, 0x20, 0x10, 0x44, 0x00), .fixups =3D &mt2=
5qu512a_fixups },
> +	{ .id =3D SNOR_ID(0x20, 0xbb, 0x21, 0x10, 0x44, 0x00), .fixups =3D &mt2=
5q01_fixups },
> +	{ .id =3D SNOR_ID(0x20, 0xbb, 0x21), .match =3D n25q00a_match, .fixups =
=3D &n25q00_fixups },
> +	{ .id =3D SNOR_ID(0x20, 0xbb, 0x22), .fixups =3D &mt25q02_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_micron =3D {
>  	.name =3D "micron",
>  	.parts =3D micron_nor_parts,
>  	.nparts =3D ARRAY_SIZE(micron_nor_parts),
> -	.fixups =3D &micron_st_nor_fixups,
> +	.fixups =3D micron_fixups,
> +	.nfixups =3D ARRAY_SIZE(micron_fixups),
>  };
> =20
>  const struct spi_nor_manufacturer spi_nor_st =3D {
>  	.name =3D "st",
>  	.parts =3D st_nor_parts,
>  	.nparts =3D ARRAY_SIZE(st_nor_parts),
> -	.fixups =3D &micron_st_nor_fixups,
> +	.fixups =3D st_fixups,
> +	.nfixups =3D ARRAY_SIZE(st_fixups),
>  };
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 285ac781fba8..39cb8ac3a037 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -727,12 +727,19 @@ static u8 spi_nor_smpt_addr_nbytes(const struct spi=
_nor *nor, const u32 settings
>  static void spi_nor_smpt_read_dummy_fixups(const struct spi_nor *nor,
>  					   u8 *read_dummy)
>  {
> -	if (nor->manufacturer && nor->manufacturer->fixups &&
> -	    nor->manufacturer->fixups->smpt_read_dummy)
> -		nor->manufacturer->fixups->smpt_read_dummy(nor, read_dummy);
> +	const struct spi_nor_fixup *fixups;
> +	unsigned int i;
> =20
> -	if (nor->info->fixups && nor->info->fixups->smpt_read_dummy)
> -		nor->info->fixups->smpt_read_dummy(nor, read_dummy);
> +	if (!nor->manufacturer || !nor->manufacturer->fixups)
> +		return;
> +
> +	fixups =3D nor->manufacturer->fixups;
> +
> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
> +		if (fixups[i].fixups->smpt_read_dummy &&
> +		    spi_nor_fixup_match(nor, &fixups[i]))
> +			fixups[i].fixups->smpt_read_dummy(nor, read_dummy);
> +	}
>  }
> =20
>  /**
> @@ -757,12 +764,19 @@ static u8 spi_nor_smpt_read_dummy(const struct spi_=
nor *nor, const u32 settings)
> =20
>  static void spi_nor_smpt_map_id_fixups(const struct spi_nor *nor, u8 *ma=
p_id)
>  {
> -	if (nor->manufacturer && nor->manufacturer->fixups &&
> -	    nor->manufacturer->fixups->smpt_map_id)
> -		nor->manufacturer->fixups->smpt_map_id(nor, map_id);
> +	const struct spi_nor_fixup *fixups;
> +	unsigned int i;
> =20
> -	if (nor->info->fixups && nor->info->fixups->smpt_map_id)
> -		nor->info->fixups->smpt_map_id(nor, map_id);
> +	if (!nor->manufacturer || !nor->manufacturer->fixups)
> +		return;
> +
> +	fixups =3D nor->manufacturer->fixups;
> +
> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
> +		if (fixups[i].fixups->smpt_map_id &&
> +		    spi_nor_fixup_match(nor, &fixups[i]))
> +			fixups[i].fixups->smpt_map_id(nor, map_id);
> +	}
>  }
> =20
>  /**
> @@ -1406,17 +1420,23 @@ static int spi_nor_parse_sccr_mc(struct spi_nor *=
nor,
>   */
>  static int spi_nor_post_sfdp_fixups(struct spi_nor *nor)
>  {
> +	const struct spi_nor_fixup *fixups;
> +	unsigned int i;
>  	int ret;
> =20
> -	if (nor->manufacturer && nor->manufacturer->fixups &&
> -	    nor->manufacturer->fixups->post_sfdp) {
> -		ret =3D nor->manufacturer->fixups->post_sfdp(nor);
> -		if (ret)
> -			return ret;
> -	}
> +	if (!nor->manufacturer || !nor->manufacturer->fixups)
> +		return 0;
> =20
> -	if (nor->info->fixups && nor->info->fixups->post_sfdp)
> -		return nor->info->fixups->post_sfdp(nor);
> +	fixups =3D nor->manufacturer->fixups;
> +
> +	for (i =3D 0; i < nor->manufacturer->nfixups; i++) {
> +		if (fixups[i].fixups->post_sfdp &&
> +		    spi_nor_fixup_match(nor, &fixups[i])) {
> +			ret =3D fixups[i].fixups->post_sfdp(nor);
> +			if (ret)
> +				return ret;
> +		}
> +	}
> =20
>  	return 0;
>  }
> diff --git a/drivers/mtd/spi-nor/spansion.c b/drivers/mtd/spi-nor/spansio=
n.c
> index ca2703a5a338..f3862eb1a23a 100644
> --- a/drivers/mtd/spi-nor/spansion.c
> +++ b/drivers/mtd/spi-nor/spansion.c
> @@ -905,7 +905,6 @@ static const struct flash_info spansion_nor_parts[] =
=3D {
>  		.sector_size =3D SZ_256K,
>  		.no_sfdp_flags =3D SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.mfr_flags =3D USE_CLSR,
> -		.fixups =3D &s25fs_s_nor_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x01, 0x20, 0x18, 0x03, 0x00),
>  		.name =3D "s25sl12800",
> @@ -941,7 +940,6 @@ static const struct flash_info spansion_nor_parts[] =
=3D {
>  		.size =3D SZ_16M,
>  		.no_sfdp_flags =3D SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.mfr_flags =3D USE_CLSR,
> -		.fixups =3D &s25fs_s_nor_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01),
>  		.name =3D "s25fl129p1",
> @@ -1001,76 +999,61 @@ static const struct flash_info spansion_nor_parts[=
] =3D {
>  		.id =3D SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90),
>  		.name =3D "s25hl512t",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s25hx_t_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x2a, 0x1b, 0x0f, 0x03, 0x90),
>  		.name =3D "s25hl01gt",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s25hx_t_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90),
>  		.name =3D "s25hl02gt",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s25hx_t_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90),
>  		.name =3D "s25fs256t",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s25fs256t_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x2b, 0x1a, 0x0f, 0x03, 0x90),
>  		.name =3D "s25hs512t",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s25hx_t_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x2b, 0x1b, 0x0f, 0x03, 0x90),
>  		.name =3D "s25hs01gt",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s25hx_t_fixups
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90),
>  		.name =3D "s25hs02gt",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s25hx_t_fixups
>  	}, {
>  		/* S28HL256T */
>  		.id =3D SNOR_ID(0x34, 0x5a, 0x19),
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x5a, 0x1a),
>  		.name =3D "s28hl512t",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x5a, 0x1b),
>  		.name =3D "s28hl01gt",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		/* S28HL02GT */
>  		.id =3D SNOR_ID(0x34, 0x5a, 0x1c),
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x5b, 0x19),
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x5b, 0x1a),
>  		.name =3D "s28hs512t",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x5b, 0x1b),
>  		.name =3D "s28hs01gt",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0x34, 0x5b, 0x1c),
>  		.name =3D "s28hs02gt",
>  		.mfr_flags =3D USE_CLPEF,
> -		.fixups =3D &s28hx_t_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x40, 0x13),
>  		.name =3D "s25fl004k",
> @@ -1170,9 +1153,31 @@ static const struct spi_nor_fixups spansion_nor_fi=
xups =3D {
>  	.late_init =3D spansion_nor_late_init,
>  };
> =20
> +static const struct spi_nor_fixup spansion_fixups[] =3D {
> +	{ .fixups =3D &spansion_nor_fixups },
> +	{ .id =3D SNOR_ID(0x01, 0x02, 0x20, 0x4d, 0x00, 0x81), .fixups =3D &s25=
fs_s_nor_fixups },
> +	{ .id =3D SNOR_ID(0x01, 0x20, 0x18, 0x4d, 0x01, 0x81), .fixups =3D &s25=
fs_s_nor_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x2a, 0x1a, 0x0f, 0x03, 0x90), .fixups =3D &s25=
hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x2a, 0x1b, 0x0f, 0x03, 0x90), .fixups =3D &s25=
hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x2a, 0x1c, 0x0f, 0x00, 0x90), .fixups =3D &s25=
hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x2b, 0x19, 0x0f, 0x08, 0x90), .fixups =3D &s25=
fs256t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x2b, 0x1a, 0x0f, 0x03, 0x90), .fixups =3D &s25=
hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x2b, 0x1b, 0x0f, 0x03, 0x90), .fixups =3D &s25=
hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x2b, 0x1c, 0x0f, 0x00, 0x90), .fixups =3D &s25=
hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5a, 0x19), .fixups =3D &s28hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5a, 0x1a), .fixups =3D &s28hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5a, 0x1b), .fixups =3D &s28hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5a, 0x1c), .fixups =3D &s28hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5b, 0x19), .fixups =3D &s28hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5b, 0x1a), .fixups =3D &s28hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5b, 0x1b), .fixups =3D &s28hx_t_fixups },
> +	{ .id =3D SNOR_ID(0x34, 0x5b, 0x1c), .fixups =3D &s28hx_t_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_spansion =3D {
>  	.name =3D "spansion",
>  	.parts =3D spansion_nor_parts,
>  	.nparts =3D ARRAY_SIZE(spansion_nor_parts),
> -	.fixups =3D &spansion_nor_fixups,
> +	.fixups =3D spansion_fixups,
> +	.nfixups =3D ARRAY_SIZE(spansion_fixups),
>  };
> diff --git a/drivers/mtd/spi-nor/sst.c b/drivers/mtd/spi-nor/sst.c
> index 77a0bc41d4e5..c460803b278b 100644
> --- a/drivers/mtd/spi-nor/sst.c
> +++ b/drivers/mtd/spi-nor/sst.c
> @@ -152,14 +152,12 @@ static const struct flash_info sst_nor_parts[] =3D =
{
>  		.id =3D SNOR_ID(0xbf, 0x26, 0x42),
>  		.name =3D "sst26vf032b",
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
> -		.fixups =3D &sst26vf_nor_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0xbf, 0x26, 0x43),
>  		.name =3D "sst26vf064b",
>  		.size =3D SZ_8M,
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_SWP_IS_VOLATILE,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
> -		.fixups =3D &sst26vf_nor_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0xbf, 0x26, 0x51),
>  		.name =3D "sst26wf016b",
> @@ -278,9 +276,16 @@ static const struct spi_nor_fixups sst_nor_fixups =
=3D {
>  	.late_init =3D sst_nor_late_init,
>  };
> =20
> +static const struct spi_nor_fixup sst_fixups[] =3D {
> +	{ .fixups =3D &sst_nor_fixups },
> +	{ .id =3D SNOR_ID(0xbf, 0x26, 0x42), .fixups =3D &sst26vf_nor_fixups },
> +	{ .id =3D SNOR_ID(0xbf, 0x26, 0x43), .fixups =3D &sst26vf_nor_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_sst =3D {
>  	.name =3D "sst",
>  	.parts =3D sst_nor_parts,
>  	.nparts =3D ARRAY_SIZE(sst_nor_parts),
> -	.fixups =3D &sst_nor_fixups,
> +	.fixups =3D sst_fixups,
> +	.nfixups =3D ARRAY_SIZE(sst_fixups),
>  };
> diff --git a/drivers/mtd/spi-nor/winbond.c b/drivers/mtd/spi-nor/winbond.=
c
> index 01a693033448..583b1669270f 100644
> --- a/drivers/mtd/spi-nor/winbond.c
> +++ b/drivers/mtd/spi-nor/winbond.c
> @@ -219,7 +219,6 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.size =3D SZ_16M,
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.flags =3D SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_N=
OR_HAS_CMP,
> -		.fixups =3D &w25q128_fixups,
>  	}, {
>  		/* W25Q256JV-Q/N */
>  		.id =3D SNOR_ID(0xef, 0x40, 0x19),
> @@ -228,7 +227,6 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.no_sfdp_flags =3D SECT_4K | SPI_NOR_DUAL_READ | SPI_NOR_QUAD_READ,
>  		.flags =3D SPI_NOR_QUAD_PP | SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB |
>  			 SPI_NOR_TB_SR_BIT6 | SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> -		.fixups =3D &w25q256_fixups,
>  	}, {
>  		/* W25Q512JV-Q/N */
>  		.id =3D SNOR_ID(0xef, 0x40, 0x20),
> @@ -242,7 +240,6 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x40, 0x21),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>  			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> -		.fixups =3D &winbond_nor_multi_die_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x50, 0x12),
>  		.name =3D "w25q20bw",
> @@ -345,13 +342,11 @@ static const struct flash_info winbond_nor_parts[] =
=3D {
>  		.id =3D SNOR_ID(0xef, 0x70, 0x21),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>  			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> -		.fixups =3D &winbond_nor_multi_die_fixups,
>  	}, {
>  		/* W25Q02JV-M */
>  		.id =3D SNOR_ID(0xef, 0x70, 0x22),
>  		.flags =3D SPI_NOR_HAS_LOCK | SPI_NOR_HAS_TB | SPI_NOR_TB_SR_BIT6 |
>  			 SPI_NOR_4BIT_BP | SPI_NOR_HAS_CMP,
> -		.fixups =3D &winbond_nor_multi_die_fixups,
>  	}, {
>  		.id =3D SNOR_ID(0xef, 0x71, 0x19),
>  		.name =3D "w25m512jv",
> @@ -553,9 +548,19 @@ static const struct spi_nor_fixups winbond_nor_fixup=
s =3D {
>  	.late_init =3D winbond_nor_late_init,
>  };
> =20
> +static const struct spi_nor_fixup winbond_fixups[] =3D {
> +	{ .fixups =3D &winbond_nor_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x40, 0x18), .fixups =3D &w25q128_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x40, 0x19), .fixups =3D &w25q256_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x40, 0x21), .fixups =3D &winbond_nor_multi_die=
_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x70, 0x21), .fixups =3D &winbond_nor_multi_die=
_fixups },
> +	{ .id =3D SNOR_ID(0xef, 0x70, 0x22), .fixups =3D &winbond_nor_multi_die=
_fixups },
> +};
> +
>  const struct spi_nor_manufacturer spi_nor_winbond =3D {
>  	.name =3D "winbond",
>  	.parts =3D winbond_nor_parts,
>  	.nparts =3D ARRAY_SIZE(winbond_nor_parts),
> -	.fixups =3D &winbond_nor_fixups,
> +	.fixups =3D winbond_fixups,
> +	.nfixups =3D ARRAY_SIZE(winbond_fixups),
>  };


--295fba22dfa326321d815668ca00fad395fba4775ca2fbae89cebd9b5daa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCan7ihRIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hWXgF/fmvxoAnWsWrb4s4lIUJSNKdPAhtIrJXr
42AkwLdavpx3RnCP0d0Pd9aDx9o1RgX8AX94vGU43H/8I/UKoOI+KtTe4jiqxnKK
USI+p+9tqJHCqwbu8kPUxszljKPcaW6ZI3M=
=In0l
-----END PGP SIGNATURE-----

--295fba22dfa326321d815668ca00fad395fba4775ca2fbae89cebd9b5daa--


--===============4780532182906590186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4780532182906590186==--

