Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1ctrWO-0000NU-Qv
 for linux-mtd@lists.infradead.org; Fri, 31 Mar 2017 08:03:02 +0000
Date: Fri, 31 Mar 2017 10:02:39 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Linus Walleij <linus.walleij@linaro.org>, Jason Gunthorpe
 <jgunthorpe@obsidianresearch.com>, linux-mtd@lists.infradead.org,
 devicetree@vger.kernel.org, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>
Subject: Re: [PATCH] mtd: physmap_of: use OF helpers for reading strings
Message-ID: <20170331100239.37a14f37@bbrezillon>
In-Reply-To: <20170330155853.30349-1-zajec5@gmail.com>
References: <20170330155853.30349-1-zajec5@gmail.com>
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

On Thu, 30 Mar 2017 17:58:53 +0200
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> OF core code provides helpers for counting strings and reading them so
> use them instead of doing this manually. This simplifies the code a bit.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>

> ---
>  drivers/mtd/maps/physmap_of.c | 30 ++++++++++--------------------
>  1 file changed, 10 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/mtd/maps/physmap_of.c b/drivers/mtd/maps/physmap_of.c
> index 14e8909c9955..62fa6836f218 100644
> --- a/drivers/mtd/maps/physmap_of.c
> +++ b/drivers/mtd/maps/physmap_of.c
> @@ -116,32 +116,22 @@ static const char * const part_probe_types_def[] =
=3D {
> =20
>  static const char * const *of_get_probes(struct device_node *dp)
>  {
> -	const char *cp;
> -	int cplen;
> -	unsigned int l;
> -	unsigned int count;
>  	const char **res;
> +	int count;
> =20
> -	cp =3D of_get_property(dp, "linux,part-probe", &cplen);
> -	if (cp =3D=3D NULL)
> +	count =3D of_property_count_strings(dp, "linux,part-probe");
> +	if (count < 0)
>  		return part_probe_types_def;
> =20
> -	count =3D 0;
> -	for (l =3D 0; l !=3D cplen; l++)
> -		if (cp[l] =3D=3D 0)
> -			count++;
> -
> -	res =3D kzalloc((count + 1)*sizeof(*res), GFP_KERNEL);
> +	res =3D kzalloc((count + 1) * sizeof(*res), GFP_KERNEL);
>  	if (!res)
>  		return NULL;
> -	count =3D 0;
> -	while (cplen > 0) {
> -		res[count] =3D cp;
> -		l =3D strlen(cp) + 1;
> -		cp +=3D l;
> -		cplen -=3D l;
> -		count++;
> -	}
> +
> +	count =3D of_property_read_string_array(dp, "linux,part-probe", res,
> +					      count);
> +	if (count < 0)
> +		return NULL;
> +
>  	return res;
>  }
> =20
