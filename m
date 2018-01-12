Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ea0zp-0000rD-Cz
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 15:11:55 +0000
Date: Fri, 12 Jan 2018 16:11:31 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 2/2] mtd: get rid of the mtd_add_device_partitions function
Message-ID: <20180112161131.3cae7841@bbrezillon>
In-Reply-To: <20180112144034.6655-3-zajec5@gmail.com>
References: <20180112144034.6655-1-zajec5@gmail.com>
 <20180112144034.6655-3-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 12 Jan 2018 15:40:34 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This simplifies code a bit by:
> 1) Avoiding an extra (tiny) function
> 2) Checking for amount of parsed (found) partitions just once
> 3) Avoiding clearing/filling struct mtd_partitions manually
>=20
> With this commit a proper functions are called directly from the
> mtd_device_parse_register. It doesn't need to use minor tricks like
> memsetting struct to 0 to trigger an expected mtd_add_device_partitions
> behavior.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/mtdcore.c | 29 +++++++----------------------
>  1 file changed, 7 insertions(+), 22 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index f6460862e2ad..0a414750bc8b 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -636,21 +636,6 @@ int del_mtd_device(struct mtd_info *mtd)
>  	return ret;
>  }
> =20
> -static int mtd_add_device_partitions(struct mtd_info *mtd,
> -				     struct mtd_partitions *parts)
> -{
> -	const struct mtd_partition *real_parts =3D parts->parts;
> -	int nbparts =3D parts->nr_parts;
> -
> -	if (nbparts =3D=3D 0 && !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> -		return add_mtd_device(mtd);
> -
> -	if (nbparts > 0)
> -		return add_mtd_partitions(mtd, real_parts, nbparts);
> -
> -	return 0;
> -}
> -
>  /*
>   * Set a few defaults based on the parent devices, if not provided by the
>   * driver
> @@ -717,19 +702,19 @@ int mtd_device_parse_register(struct mtd_info *mtd,=
 const char * const *types,
>  	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
>  	if ((ret < 0 || parsed.nr_parts =3D=3D 0) && parts && nr_parts) {
>  		/* Fall back to driver-provided partitions */
> -		parsed =3D (struct mtd_partitions){
> -			.parts		=3D parts,
> -			.nr_parts	=3D nr_parts,
> -		};
> +		ret =3D add_mtd_partitions(mtd, parts, nr_parts);
>  	} else if (ret < 0) {
>  		/* Didn't come up with parsed OR fallback partitions */
>  		pr_info("mtd: failed to find partitions; one or more parsers reports e=
rrors (%d)\n",
>  			ret);
>  		/* Don't abort on errors; we can still use unpartitioned MTD */
> -		memset(&parsed, 0, sizeof(parsed));
> +		if (!IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +			ret =3D add_mtd_device(mtd);
> +		else
> +			ret =3D 0;
> +	} else {
> +		ret =3D add_mtd_partitions(mtd, parsed.parts, parsed.nr_parts);
>  	}

How about:

	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
	if (!ret && parsed.nr_parts) {
		parts =3D parsed.parts;
		nr_parts =3D parsed.nr_parts;
	}

	if (nr_parts)
		ret =3D add_mtd_partitions(mtd, parts, nr_parts);
	else if (!device_is_registered(&mtd->dev))
		ret =3D add_mtd_device(mtd);
	else
		ret =3D 0;

	...
> -
> -	ret =3D mtd_add_device_partitions(mtd, &parsed);
>  	if (ret)
>  		goto out;
> =20
