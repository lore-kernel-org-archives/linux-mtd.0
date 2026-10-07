Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3E2CCA5FF1
	for <linux-mtd@archiver.kernel.org>; Wed,  7 Oct 2026 12:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:To:From:Cc:Subject:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n7fUc8pBCxFUtN2/Hc+PDKarFwHsaZLKGXPBQzyRDV0=; b=N+TCftRqG3Vk5Aq/YHajUyLU0t
	iNbnzRk2zCQaPiecpfNEuZ6eYvn+8Fje1TTfpO2EmSbnacce3Mh8p6NDa6K1mLWZpmySZxz5r/xHb
	qrxyZ46MspTxHS/LMY/J/LN3FVtFUkzjkC5uOxr8r4US5eWLxhH2kFLpD5MK+9bnp71PV7E3qugHZ
	QHmTm9fYy8Be2wdbh+nNkBYNCRvaTBR+cut9piV+bqSgTz5M7O6fsNvTkbhep3Rqdm0YVIk5I2dHY
	Eu+mCkgDL7qiyc/GyluUVZ7Fr5Af2IjKfxRMNARWEdc6tANsKE4SsZbQA86i0Bem38pJUJ+H24UIl
	l+gNFWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERD2-00000002UCC-1VTs;
	Wed, 07 Oct 2026 12:57:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xERCz-00000002UBy-1WKU
	for linux-mtd@lists.infradead.org;
	Wed, 07 Oct 2026 12:57:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 815F9601FB;
	Wed,  7 Oct 2026 12:57:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id B07A51F0089B;
	Wed,  7 Oct 2026 12:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791377840;
	bh=Kx3edEac2KhM6Wf3jhztHRI5P975VrjqrGGMsTYHC0w=;
	h=Date:Subject:Cc:From:To:References:In-Reply-To;
	b=fWHwObOWF6JA5zrFzkTxlqMrRjf2LFO2sn7uG0kisTsnM4nb99a5fLiMAB86BU/Hl
	 GWgAwvqqilkvoOPt6s5XxIMxYcw7mmhp7FZRvKK9pfAWk5A0iNYDpF8ybwfbB76MHl
	 YFzSGJRCJrKaDhcmGZEBosAC8nt/REu8IAiLOnA27/wl4RfRTtFwDWq54wkd2ecx2T
	 STc1O97Xm0Y4qo+CKK1oJ77NktM+UkvMWKtuLZWdOLcrYKwEGGWKT6iD/Yzmzh9CGb
	 x/dnQTgxQh6kj6F59LW5JPSnU6GQrBsL7mp7IJv7QdTEkGl5/uZNBlATE7emSydrRL
	 zPSQewVDDj3PA==
Mime-Version: 1.0
Date: Wed, 07 Oct 2026 14:57:16 +0200
Message-Id: <DLYMG0XY8T4Q.2B4KXOQ9QRM2F@kernel.org>
Subject: Re: [PATCH] mtd: spi-nor: reduce stack usage in
 spi_nor_parse_sfdp()
Cc: "Arnd Bergmann" <arnd@kernel.org>, "Pratyush Yadav"
 <pratyush@kernel.org>, "Miquel Raynal" <miquel.raynal@bootlin.com>,
 "Richard Weinberger" <richard@nod.at>, "Vignesh Raghavendra"
 <vigneshr@ti.com>, "Arnd Bergmann" <arnd@arndb.de>, "Takahiro Kuwano"
 <takahiro.kuwano@infineon.com>, "Tudor Ambarus" <tudor.ambarus@linaro.org>,
 "HyeongJun An" <sammiee5311@gmail.com>, <linux-mtd@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
From: "Michael Walle" <mwalle@kernel.org>
To: "David Laight" <david.laight.linux@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260915194203.3511147-1-arnd@kernel.org>
 <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org> <20260921095924.2f845215@pumpkin>
 <20260921114111.525a2257@pumpkin>
In-Reply-To: <20260921114111.525a2257@pumpkin>
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
Content-Type: multipart/mixed; boundary="===============4143046141569769421=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4143046141569769421==
Content-Type: multipart/signed;
 boundary=73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Arnd,

>> > On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote: =20
>> > > From: Arnd Bergmann <arnd@arndb.de>
>> > >
>> > > Two large spi_nor_flash_parameter structures on a function stack
>> > > is really too much, and this can exceed an otherwise reasonable
>> > > frame limit:
>> > >
>> > > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
>> > > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 byt=
es is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]

Will you resend a v2 with Davids proposal? I'd like to get this
fixed in this cycle. I could also take your patch and add Davids
proposal on top.

-michael

>> > >
>> > > Change one of them to a dynamic allocation to make this more reasona=
ble.   =20
>> >=20
>> > Thanks for taking care of that. Will you respin the patch with what
>> > David suggested? =20
>>=20
>> This compiles...
>
> It didn't - I thought I had compiled it :-(
> Try:
>
> diff --git a/drivers/mtd/spi-nor/sfdp.c b/drivers/mtd/spi-nor/sfdp.c
> index 641f17ad51a0..cec699b52f27 100644
> --- a/drivers/mtd/spi-nor/sfdp.c
> +++ b/drivers/mtd/spi-nor/sfdp.c
> @@ -1519,9 +1519,9 @@ int spi_nor_check_sfdp_signature(struct spi_nor *no=
r)
>   */
>  int spi_nor_parse_sfdp(struct spi_nor *nor)
>  {
> +       struct spi_nor_flash_parameter *save_params __free(kfree) =3D kma=
lloc_objs(*save_params, 2);
>         const struct sfdp_parameter_header *param_header, *bfpt_header;
>         struct sfdp_parameter_header *param_headers =3D NULL;
> -       struct spi_nor_flash_parameter params, params2;
>         struct sfdp_header header;
>         struct device *dev =3D nor->dev;
>         struct sfdp *sfdp;
> @@ -1533,7 +1533,9 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>          * Get a backup of all the parameter to roll back to in case of a=
n
>          * error.
>          */
> -       memcpy(&params, nor->params, sizeof(params));
> +       if (!save_params)
> +               return -ENOMEM;
> +       save_params[0] =3D *nor->params;
>
>         /* Get the SFDP header. */
>         err =3D spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &hea=
der);
> @@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>
>         /* Parse optional parameter tables. */
>         for (i =3D 0; i < header.nph; i++) {
> -               memcpy(&params2, nor->params, sizeof(params2));
> +               save_params[1] =3D *nor->params;
>                 param_header =3D &param_headers[i];
>
>                 switch (SFDP_PARAM_HEADER_ID(param_header)) {
> @@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>                          * spi_nor_flash_parameter data.
>                          */
>                         err =3D 0;
> -                       memcpy(nor->params, &params2, sizeof(*nor->params=
));
> +                       *nor->params =3D save_params[1];
>                 }
>         }
>
> @@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  free_param_headers:
>         kfree(param_headers);
>         if (err)
> -               memcpy(nor->params, &params, sizeof(*nor->params));
> +               *nor->params =3D save_params[0];
>
>         return err;
>  }
> --
>
> David

--73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCasZBrBIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/jPwQGAzJN9vg6AA+UH8+JKVqFQ6aIhdIkH1XtP
gMAf8hyzbau0/OS4WGQSy8Mdsctu8/y0AX40njhA942j0wZLMJ6+z84eKdQn7y2P
PXzaN2uQ7AfLs+FV/SxjwnqwU2UrLiO+7Wk=
=RlNn
-----END PGP SIGNATURE-----

--73be48b148e7b17077f1c56dfb7fdf66a9b981e49f0285ce01772ff65752--


--===============4143046141569769421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4143046141569769421==--

