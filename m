Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fGRPj-0006pV-HZ
 for linux-mtd@lists.infradead.org; Wed, 09 May 2018 15:54:24 +0000
Date: Wed, 9 May 2018 17:53:36 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Brian Norris <computersforpeace@gmail.com>, David Woodhouse
 <dwmw2@infradead.org>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, Cyrille Pitchen
 <cyrille.pitchen@wedev4u.fr>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, linux-mtd@lists.infradead.org, Jonas Gorski
 <jonas.gorski@gmail.com>
Subject: Re: [PATCH] mtd: move code adding (registering) partitions to the
 parse_mtd_partitions()
Message-ID: <20180509175336.46e4d1bd@bbrezillon>
In-Reply-To: <20180327203541.1118-1-zajec5@gmail.com>
References: <20180327203541.1118-1-zajec5@gmail.com>
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

On Tue, 27 Mar 2018 22:35:41 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> This commit slightly simplifies the code. Every parse_mtd_partitions()
> caller (out of two existing ones) had to add partitions & cleanup parser
> on its own. This moves that responsibility into the function.
>=20
> That change also allows dropping struct mtd_partitions argument.
>=20
> There is one minor behavior change caused by this cleanup. If
> parse_mtd_partitions() fails to add partitions (add_mtd_partitions()
> return an error) then mtd_device_parse_register() will still try to
> add (register) fallback partitions. It's a real corner case affecting
> one of uncommon error paths and shouldn't cause any harm.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Applied.

Thanks,

Boris

> ---
>  drivers/mtd/mtdcore.c | 14 ++++----------
>  drivers/mtd/mtdcore.h |  1 -
>  drivers/mtd/mtdpart.c | 44 ++++++++++++++++----------------------------
>  3 files changed, 20 insertions(+), 39 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
> index 20d5262c5b5c..7ad9f3a16866 100644
> --- a/drivers/mtd/mtdcore.c
> +++ b/drivers/mtd/mtdcore.c
> @@ -690,7 +690,6 @@ int mtd_device_parse_register(struct mtd_info *mtd, c=
onst char * const *types,
>  			      const struct mtd_partition *parts,
>  			      int nr_parts)
>  {
> -	struct mtd_partitions parsed =3D { };
>  	int ret;
> =20
>  	mtd_set_dev_defaults(mtd);
> @@ -702,13 +701,10 @@ int mtd_device_parse_register(struct mtd_info *mtd,=
 const char * const *types,
>  	}
> =20
>  	/* Prefer parsed partitions over driver-provided fallback */
> -	ret =3D parse_mtd_partitions(mtd, types, &parsed, parser_data);
> -	if (!ret && parsed.nr_parts) {
> -		parts =3D parsed.parts;
> -		nr_parts =3D parsed.nr_parts;
> -	}
> -
> -	if (nr_parts)
> +	ret =3D parse_mtd_partitions(mtd, types, parser_data);
> +	if (ret > 0)
> +		ret =3D 0;
> +	else if (nr_parts)
>  		ret =3D add_mtd_partitions(mtd, parts, nr_parts);
>  	else if (!device_is_registered(&mtd->dev))
>  		ret =3D add_mtd_device(mtd);
> @@ -734,8 +730,6 @@ int mtd_device_parse_register(struct mtd_info *mtd, c=
onst char * const *types,
>  	}
> =20
>  out:
> -	/* Cleanup any parsed partitions */
> -	mtd_part_parser_cleanup(&parsed);
>  	if (ret && device_is_registered(&mtd->dev))
>  		del_mtd_device(mtd);
> =20
> diff --git a/drivers/mtd/mtdcore.h b/drivers/mtd/mtdcore.h
> index 37accfd0400e..9887bda317cd 100644
> --- a/drivers/mtd/mtdcore.h
> +++ b/drivers/mtd/mtdcore.h
> @@ -15,7 +15,6 @@ int del_mtd_partitions(struct mtd_info *);
>  struct mtd_partitions;
> =20
>  int parse_mtd_partitions(struct mtd_info *master, const char * const *ty=
pes,
> -			 struct mtd_partitions *pparts,
>  			 struct mtd_part_parser_data *data);
> =20
>  void mtd_part_parser_cleanup(struct mtd_partitions *parts);
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 023516a63276..f8d3a015cdad 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -335,20 +335,7 @@ static inline void free_partition(struct mtd_part *p)
>   */
>  static int mtd_parse_part(struct mtd_part *slave, const char *const *typ=
es)
>  {
> -	struct mtd_partitions parsed;
> -	int err;
> -
> -	err =3D parse_mtd_partitions(&slave->mtd, types, &parsed, NULL);
> -	if (err)
> -		return err;
> -	else if (!parsed.nr_parts)
> -		return -ENOENT;
> -
> -	err =3D add_mtd_partitions(&slave->mtd, parsed.parts, parsed.nr_parts);
> -
> -	mtd_part_parser_cleanup(&parsed);
> -
> -	return err;
> +	return parse_mtd_partitions(&slave->mtd, types, NULL);
>  }
> =20
>  static struct mtd_part *allocate_partition(struct mtd_info *parent,
> @@ -933,30 +920,27 @@ static int mtd_part_of_parse(struct mtd_info *maste=
r,
>  }
> =20
>  /**
> - * parse_mtd_partitions - parse MTD partitions
> + * parse_mtd_partitions - parse and register MTD partitions
> + *
>   * @master: the master partition (describes whole MTD device)
>   * @types: names of partition parsers to try or %NULL
> - * @pparts: info about partitions found is returned here
>   * @data: MTD partition parser-specific data
>   *
> - * This function tries to find partition on MTD device @master. It uses =
MTD
> - * partition parsers, specified in @types. However, if @types is %NULL, =
then
> - * the default list of parsers is used. The default list contains only t=
he
> + * This function tries to find & register partitions on MTD device @mast=
er. It
> + * uses MTD partition parsers, specified in @types. However, if @types i=
s %NULL,
> + * then the default list of parsers is used. The default list contains o=
nly the
>   * "cmdlinepart" and "ofpart" parsers ATM.
>   * Note: If there are more then one parser in @types, the kernel only ta=
kes the
>   * partitions parsed out by the first parser.
>   *
>   * This function may return:
>   * o a negative error code in case of failure
> - * o zero otherwise, and @pparts will describe the partitions, number of
> - *   partitions, and the parser which parsed them. Caller must release
> - *   resources with mtd_part_parser_cleanup() when finished with the ret=
urned
> - *   data.
> + * o number of found partitions otherwise
>   */
>  int parse_mtd_partitions(struct mtd_info *master, const char *const *typ=
es,
> -			 struct mtd_partitions *pparts,
>  			 struct mtd_part_parser_data *data)
>  {
> +	struct mtd_partitions pparts =3D { };
>  	struct mtd_part_parser *parser;
>  	int ret, err =3D 0;
> =20
> @@ -970,7 +954,7 @@ int parse_mtd_partitions(struct mtd_info *master, con=
st char *const *types,
>  		 * handled in a separated function.
>  		 */
>  		if (!strcmp(*types, "ofpart")) {
> -			ret =3D mtd_part_of_parse(master, pparts);
> +			ret =3D mtd_part_of_parse(master, &pparts);
>  		} else {
>  			pr_debug("%s: parsing partitions %s\n", master->name,
>  				 *types);
> @@ -981,13 +965,17 @@ int parse_mtd_partitions(struct mtd_info *master, c=
onst char *const *types,
>  				parser ? parser->name : NULL);
>  			if (!parser)
>  				continue;
> -			ret =3D mtd_part_do_parse(parser, master, pparts, data);
> +			ret =3D mtd_part_do_parse(parser, master, &pparts, data);
>  			if (ret <=3D 0)
>  				mtd_part_parser_put(parser);
>  		}
>  		/* Found partitions! */
> -		if (ret > 0)
> -			return 0;
> +		if (ret > 0) {
> +			err =3D add_mtd_partitions(master, pparts.parts,
> +						 pparts.nr_parts);
> +			mtd_part_parser_cleanup(&pparts);
> +			return err ? err : pparts.nr_parts;
> +		}
>  		/*
>  		 * Stash the first error we see; only report it if no parser
>  		 * succeeds
