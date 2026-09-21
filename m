Return-Path: <linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38649C982DE
	for <linux-mtd@archiver.kernel.org>; Mon, 21 Sep 2026 09:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:References:From:Cc:Subject:To:Message-Id:Date:Mime-Version:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VRDxsrayleZm8pVS6O08OeDyQhATKLaR0IcyEAmiLPg=; b=glYaWG3UCMoXDWUHnzvi0Xrn+2
	W+OFd43uK1xgt4AOOgappQUjjVj35XtMoBOSFGjmhazxFB1Bjk6z+88AKFaltp11FRzyezfp3ehGs
	GK8msOw8imy3dIkud8JD9yGqIn0Gd61Ka0nDJEPnDpVxlx5LLKECb6JTaUuYsLNrqhgVQj2n4Cwgb
	tNnZ1UzoJhHYqUXxC5ivKkkLTg9uRhvrtXT7SOrJCU+gZOMhOI9EQI54OXNzb9H5rWpm7pVhNHoT0
	NI4s0eEai6kphHL5cM4vJi4pJUE96F2UFLZP3+TnpdTi3G+Cux1POyWwVzEANMNdb5QGqX9A+MSBd
	6YecMoQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aGO-00000001Uy1-0XWo;
	Mon, 21 Sep 2026 09:24:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8aGM-00000001Uxl-1vO5
	for linux-mtd@lists.infradead.org;
	Mon, 21 Sep 2026 09:24:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 0648B40A41;
	Mon, 21 Sep 2026 09:24:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 5B0E31F000FF;
	Mon, 21 Sep 2026 09:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789982677;
	bh=5MbD/mb2k5cZZYD/imnkofeHdbIdhHQWD75O5hW319E=;
	h=Date:To:Subject:Cc:From:References:In-Reply-To;
	b=KKIdwxCCsM1xE5UchyNeydDAF9tr1Tj3nHonTNI77ZA+KX6Gu5yDqp6iqResHub09
	 /65h7cRKs9CWB4Q9CtFq3DJaEpBwRjzRWk1OJZz2bD0pKe1At9liY8jBy8HaeQAwf+
	 vFtvwTigBWQGjS0FaJFOQ2Qtixl4j1dlYQr0oxXEPPQs9NbzpDtp+VfJiU6ZDUAhka
	 Zm66/o2eTvxsqKNSW5GAgzivRPEOrjwc3XZboWRPjkKEqd1lyQ1Nm7TqJJ8nk4qGyk
	 uDEzF/eN4p9Fdclxdg+bEJxPklRsK/sN6nlYMxUZyuLsKsLVBvmUoAQsRgIEf+mjzE
	 aizzWqvC/HbUw==
Mime-Version: 1.0
Date: Mon, 21 Sep 2026 11:24:33 +0200
Message-Id: <DLKVWGBO3B13.JQ0A04TWA66E@kernel.org>
To: "David Laight" <david.laight.linux@gmail.com>
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
X-Mailer: aerc 0.20.0
References: <20260915194203.3511147-1-arnd@kernel.org>
 <DLKU0CTP0OES.30VZXJXDXRLNW@kernel.org> <20260921095924.2f845215@pumpkin>
In-Reply-To: <20260921095924.2f845215@pumpkin>
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
Content-Type: multipart/mixed; boundary="===============4076480550174593036=="
Sender: "linux-mtd" <linux-mtd-bounces@lists.infradead.org>
Errors-To: linux-mtd-bounces+linux-mtd=archiver.kernel.org@lists.infradead.org

--===============4076480550174593036==
Content-Type: multipart/signed;
 boundary=81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Mon Sep 21, 2026 at 10:59 AM CEST, David Laight wrote:
> On Mon, 21 Sep 2026 09:55:37 +0200
> "Michael Walle" <mwalle@kernel.org> wrote:
>
>> Hi Arnd,
>>=20
>> On Tue Sep 15, 2026 at 9:40 PM CEST, Arnd Bergmann wrote:
>> > From: Arnd Bergmann <arnd@arndb.de>
>> >
>> > Two large spi_nor_flash_parameter structures on a function stack
>> > is really too much, and this can exceed an otherwise reasonable
>> > frame limit:
>> >
>> > drivers/mtd/spi-nor/sfdp.c: In function 'spi_nor_parse_sfdp':
>> > drivers/mtd/spi-nor/sfdp.c:1717:1: error: the frame size of 1600 bytes=
 is larger than 1536 bytes [-Werror=3Dframe-larger-than=3D]
>> >
>> > Change one of them to a dynamic allocation to make this more reasonabl=
e. =20
>>=20
>> Thanks for taking care of that. Will you respin the patch with what
>> David suggested?
>
> This compiles...
> David
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
> +       struct spi_nor_flash_parameter sv_params __free(kfree) =3D kmallo=
c_objs(*sv_params, 2);

What does sv_ stands for?

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
> +       if (!sv_params)
> +               return -ENOMEM
> +       sv_params[0] =3D nor->params;
>
>         /* Get the SFDP header. */
>         err =3D spi_nor_read_sfdp_dma_unsafe(nor, 0, sizeof(header), &hea=
der);
> @@ -1653,7 +1655,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>
>         /* Parse optional parameter tables. */
>         for (i =3D 0; i < header.nph; i++) {
> -               memcpy(&params2, nor->params, sizeof(params2));
> +               sv_params[1] nor->params;

sv_params[1] =3D nor->params;

-michael

>                 param_header =3D &param_headers[i];
>
>                 switch (SFDP_PARAM_HEADER_ID(param_header)) {
> @@ -1691,7 +1693,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>                          * spi_nor_flash_parameter data.
>                          */
>                         err =3D 0;
> -                       memcpy(nor->params, &params2, sizeof(*nor->params=
));
> +                       nor->params =3D sv_params[1];
>                 }
>         }
>
> @@ -1712,7 +1714,7 @@ int spi_nor_parse_sfdp(struct spi_nor *nor)
>  free_param_headers:
>         kfree(param_headers);
>         if (err)
> -               memcpy(nor->params, &params, sizeof(*nor->params));
> +               nor->params =3D sv_params[0];
>
>         return err;
>  }
> --
>
>>=20
>> -michael
>>=20
>> > Fixes: d20029474a76 ("mtd: spi-nor: push the rollback mechanism into t=
he sfdp module")
>> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> > ---
>> >  drivers/mtd/spi-nor/sfdp.c | 10 +++++++---
>> >  1 file changed, 7 insertions(+), 3 deletions(-) =20


--81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKgEABMJADAWIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCarD30hIcbXdhbGxlQGtl
cm5lbC5vcmcACgkQEic87j4CH/hSbgF+OlwlmYBW5BJ479b1HeQQJYlpv3Eh3O9L
GdP4f/bCdkveoO0B3/zWZmpZ59TY8ugLAYDztcQSZ373+Hvqzs2Ny6awAGjxBCbx
CdzClYJca94KPS6XQjSI8AEZ3dN/oG77WQc=
=MfCb
-----END PGP SIGNATURE-----

--81ddfdbab27d5c10a9c7c6d3785b90fcc3965ba71c3967c3081e3d33d28e--


--===============4076480550174593036==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

______________________________________________________
Linux MTD discussion mailing list
http://lists.infradead.org/mailman/listinfo/linux-mtd/

--===============4076480550174593036==--

