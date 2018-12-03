Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gTj3T-00019G-Kv
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2018 07:54:13 +0000
Date: Mon, 3 Dec 2018 08:53:49 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
Subject: Re: [PATCH V2] mtd: improve calculating partition boundaries when
 checking for alignment
Message-ID: <20181203085349.0cc85117@bbrezillon>
In-Reply-To: <20181120092409.13864-1-zajec5@gmail.com>
References: <20181120085612.8405-1-zajec5@gmail.com>
 <20181120092409.13864-1-zajec5@gmail.com>
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

On Tue, 20 Nov 2018 10:24:09 +0100
Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> wrote:

> From: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>
>=20
> When checking for alignment mtd should check absolute offsets. It's
> important for subpartitions as it doesn't make sense to check their
> relative addresses.
>=20
> Signed-off-by: Rafa=C5=82 Mi=C5=82ecki <rafal@milecki.pl>

Queued to mtd/next.

> ---
> V2: Switch from uint64_t to u64. I got incorrectly inspired by
>     uint64_t offset;
> ---
>  drivers/mtd/mtdpart.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 2b6e53af47da..b6af41b04622 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -61,6 +61,15 @@ static inline struct mtd_part *mtd_to_part(const struc=
t mtd_info *mtd)
>  	return container_of(mtd, struct mtd_part, mtd);
>  }
> =20
> +static u64 part_absolute_offset(struct mtd_info *mtd)
> +{
> +	struct mtd_part *part =3D mtd_to_part(mtd);
> +
> +	if (!mtd_is_partition(mtd))
> +		return 0;
> +
> +	return part_absolute_offset(part->parent) + part->offset;
> +}
> =20
>  /*
>   * MTD methods which simply translate the effective address and pass thr=
ough
> @@ -514,7 +523,7 @@ static struct mtd_part *allocate_partition(struct mtd=
_info *parent,
>  	if (!(slave->mtd.flags & MTD_NO_ERASE))
>  		wr_alignment =3D slave->mtd.erasesize;
> =20
> -	tmp =3D slave->offset;
> +	tmp =3D part_absolute_offset(parent) + slave->offset;
>  	remainder =3D do_div(tmp, wr_alignment);
>  	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
>  		/* Doesn't start on a boundary of major erase size */
> @@ -525,7 +534,7 @@ static struct mtd_part *allocate_partition(struct mtd=
_info *parent,
>  			part->name);
>  	}
> =20
> -	tmp =3D slave->mtd.size;
> +	tmp =3D part_absolute_offset(parent) + slave->mtd.size;
>  	remainder =3D do_div(tmp, wr_alignment);
>  	if ((slave->mtd.flags & MTD_WRITEABLE) && remainder) {
>  		slave->mtd.flags &=3D ~MTD_WRITEABLE;
