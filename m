Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cxAej-00005U-Pk
 for linux-mtd@lists.infradead.org; Sun, 09 Apr 2017 11:05:19 +0000
Date: Sun, 9 Apr 2017 13:04:46 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Frank Rowand <frowand.list@gmail.com>, Linus Walleij
 <linus.walleij@linaro.org>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH V3 3/3] mtd: physmap_of: drop duplicated support for
 linux,part-probe property
Message-ID: <20170409130446.107a3a32@bbrezillon>
In-Reply-To: <20170331114016.26858-3-zajec5@gmail.com>
References: <20170331114016.26858-1-zajec5@gmail.com>
 <20170331114016.26858-3-zajec5@gmail.com>
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

On Fri, 31 Mar 2017 13:40:16 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> Now support for linux,part-probe has been added to the MTD core there is
> no need to duplicate support for it in physmap_of.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Acked-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/maps/physmap_of.c | 46 +------------------------------------=
------
>  1 file changed, 1 insertion(+), 45 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 14e8909c9955..49dbb7235848 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -114,47 +114,9 @@ static struct mtd_info *obsolete_probe(struct platfo=
rm_device *dev,
>  static const char * const part_probe_types_def[] =3D {
>  	"cmdlinepart", "RedBoot", "ofpart", "ofoldpart", NULL };
> =20
> -static const char * const *of_get_probes(struct device_node *dp)
> -{
> -	const char *cp;
> -	int cplen;
> -	unsigned int l;
> -	unsigned int count;
> -	const char **res;
> -
> -	cp =3D of_get_property(dp, "linux,part-probe", &cplen);
> -	if (cp =3D=3D NULL)
> -		return part_probe_types_def;
> -
> -	count =3D 0;
> -	for (l =3D 0; l !=3D cplen; l++)
> -		if (cp[l] =3D=3D 0)
> -			count++;
> -
> -	res =3D kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
> -	if (!res)
> -		return NULL;
> -	count =3D 0;
> -	while (cplen > 0) {
> -		res[count] =3D cp;
> -		l =3D strlen(cp) + 1;
> -		cp +=3D l;
> -		cplen -=3D l;
> -		count++;
> -	}
> -	return res;
> -}
> -
> -static void of_free_probes(const char * const *probes)
> -{
> -	if (probes !=3D part_probe_types_def)
> -		kfree(probes);
> -}
> -
>  static const struct of_device_id of_flash_match[];
>  static int of_flash_probe(struct platform_device *dev)
>  {
> -	const char * const *part_probe_types;
>  	const struct of_device_id *match;
>  	struct device_node *dp =3D dev->dev.of_node;
>  	struct resource res;
> @@ -320,14 +282,8 @@ static int of_flash_probe(struct platform_device *de=
v)
> =20
>  	info->cmtd->dev.parent =3D &dev->dev;
>  	mtd_set_of_node(info->cmtd, dp);
> -	part_probe_types =3D of_get_probes(dp);
> -	if (!part_probe_types) {
> -		err =3D -ENOMEM;
> -		goto err_out;
> -	}
> -	mtd_device_parse_register(info->cmtd, part_probe_types, NULL,
> +	mtd_device_parse_register(info->cmtd, part_probe_types_def, NULL,
>  			NULL, 0);
> -	of_free_probes(part_probe_types);
> =20
>  	kfree(mtd_list);
> =20
