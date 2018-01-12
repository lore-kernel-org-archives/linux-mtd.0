Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1ea0q7-0004Z2-JV
 for linux-mtd@lists.infradead.org; Fri, 12 Jan 2018 15:01:54 +0000
Date: Fri, 12 Jan 2018 16:01:27 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Jonas Gorski <jonas.gorski@gmail.com>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH 1/2] mtd: move code adding master MTD out of
 mtd_add_device_partitions
Message-ID: <20180112160127.0bfc3c57@bbrezillon>
In-Reply-To: <20180112144034.6655-2-zajec5@gmail.com>
References: <20180112144034.6655-1-zajec5@gmail.com>
 <20180112144034.6655-2-zajec5@gmail.com>
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

On Fri, 12 Jan 2018 15:40:33 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This change is a small cleanup of mtd_device_parse_register. When using
> MTD_PARTITIONED_MASTER it makes sure a master MTD is registered before
> dealing with partitions. There are 2 advantages of this:
> 1) Not mixing code handling master MTD with code handling partitions
> 2) Possibility of reusing mtd_parse_part in the future to avoid some
>    code duplication.
>=20
> This commit doesn't change any behavior except from a slightly different
> failure code path. The new code may need to call del_mtd_device when
> something goes wrong.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
> ---
>  drivers/mtd/mtdcore.c | 24 ++++++++++++------------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index f80e911b8843..f6460862e2ad 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -641,20 +641,12 @@ static int mtd_add_device_partitions(struct mtd_inf=
o *mtd,
>  {
>  	const struct mtd_partition *real_parts =3D parts->parts;
>  	int nbparts =3D parts->nr_parts;
> -	int ret;
> =20
> -	if (nbparts =3D=3D 0 || IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
> -		ret =3D add_mtd_device(mtd);
> -		if (ret)
> -			return ret;
> -	}
> +	if (nbparts =3D=3D 0 && !IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> +		return add_mtd_device(mtd);

Why not moving this part in mtd_device_parse_register() as well.

And I'd prefer something like:

	if (!nbparts && !device_is_registered(&mtd->dev))
		...

> =20
> -	if (nbparts > 0) {
> -		ret =3D add_mtd_partitions(mtd, real_parts, nbparts);
> -		if (ret && IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))
> -			del_mtd_device(mtd);
> -		return ret;
> -	}
> +	if (nbparts > 0)
> +		return add_mtd_partitions(mtd, real_parts, nbparts);
> =20
>  	return 0;
>  }
> @@ -714,6 +706,12 @@ int mtd_device_parse_register(struct mtd_info *mtd, =
const char * const *types,
> =20
>  	mtd_set_dev_defaults(mtd);
> =20
> +	if (IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER)) {
> +		ret =3D add_mtd_device(mtd);
> +		if (ret)
> +			return ret;
> +	}
> +
>  	memset(&parsed, 0, sizeof(parsed));
> =20
>  	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
> @@ -753,6 +751,8 @@ int mtd_device_parse_register(struct mtd_info *mtd, c=
onst char * const *types,
>  out:
>  	/* Cleanup any parsed partitions */
>  	mtd_part_parser_cleanup(&parsed);
> +	if (ret && IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER))

	if (ret && device_is_registered(&mtd->dev))

> +		del_mtd_device(mtd);

Blank line here, please.

>  	return ret;
>  }
>  EXPORT_SYMBOL_GPL(mtd_device_parse_register);
