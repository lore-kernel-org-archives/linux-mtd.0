Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eYfXn-0000u2-E3
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 22:05:25 +0000
Date: Mon, 8 Jan 2018 23:04:55 +0100
From: Miquel RAYNAL <miquel.raynal@free-electrons.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>,
 Kyungmin Park <kyungmin.park@samsung.com>, Peter Pan
 <peterpansjtu@gmail.com>, Frieder Schrempf <frieder.schrempf@exceet.de>,
 Ladislav Michl <ladis@linux-mips.org>
Subject: Re: [PATCH v4 3/3] mtd: Remove duplicate checks on mtd_oob_ops
 parameter
Message-ID: <20180108230455.10c0cb83@xps13>
In-Reply-To: <20180108211542.11891-4-boris.brezillon@free-electrons.com>
References: <20180108211542.11891-1-boris.brezillon@free-electrons.com>
 <20180108211542.11891-4-boris.brezillon@free-electrons.com>
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

Hello Boris,

On Mon,  8 Jan 2018 22:15:42 +0100
Boris Brezillon <boris.brezillon@free-electrons.com> wrote:

> Some of the check done in custom ->_read/write_oob() implementation
> are already done by the core (in mtd_check_oob_ops()).

Not sure this is relevant here as your series introduces changes for
the SPI NAND framework, but there are other places where these checks
are, IMHO, also redundant and could be removed. The "past end" string
when grepped in the MTD folder core returns a few more hits.

In the NAND core:
  - nand_do_read_oob()
  - nand_read_oob()
  - nand_do_write_oob()
  - nand_write_oob()
Maybe also in onenand_base.c, but I am less confident for this one:
  - onenand_bbt_read_oob()

What do you think?

Thanks,
Miqu=C3=A8l

>=20
> Suggested-by: Peter Pan <peterpansjtu@gmail.com>
> [Remove redundant checks done in mtdpart.c]
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> ---
> Changes in v4:
> - integrated into the SPI NAND preparation patchset
>=20
> Changes in v3:
> - Rebased on mtd/next after "mtd: Stop directly calling master
> ->_xxx() hooks from mtdpart code" had been dropped
>=20
> Changes in v2:
> - Merge "mtd: Remove unneeded checks in part_{read,write}_oob()" into
>   this commit
> ---
>  drivers/mtd/devices/docg3.c        |  5 -----
>  drivers/mtd/mtdpart.c              | 23 -----------------------
>  drivers/mtd/nand/nand_base.c       | 31
> ------------------------------- drivers/mtd/onenand/onenand_base.c |
> 18 ------------------ 4 files changed, 77 deletions(-)
>=20
> diff --git a/drivers/mtd/devices/docg3.c b/drivers/mtd/devices/docg3.c
> index 5fb5e93d1547..a85af236b44d 100644
> --- a/drivers/mtd/devices/docg3.c
> +++ b/drivers/mtd/devices/docg3.c
> @@ -904,9 +904,6 @@ static int doc_read_oob(struct mtd_info *mtd,
> loff_t from, if (ooblen % DOC_LAYOUT_OOB_SIZE)
>  		return -EINVAL;
> =20
> -	if (from + len > mtd->size)
> -		return -EINVAL;
> -
>  	ops->oobretlen =3D 0;
>  	ops->retlen =3D 0;
>  	ret =3D 0;
> @@ -1441,8 +1438,6 @@ static int doc_write_oob(struct mtd_info *mtd,
> loff_t ofs, if (len && ooblen &&
>  	    (len / DOC_LAYOUT_PAGE_SIZE) !=3D (ooblen / oobdelta))
>  		return -EINVAL;
> -	if (ofs + len > mtd->size)
> -		return -EINVAL;
> =20
>  	ops->oobretlen =3D 0;
>  	ops->retlen =3D 0;
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 07ef168ded98..131bb1d52871 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -108,25 +108,6 @@ static int part_read_oob(struct mtd_info *mtd,
> loff_t from, struct mtd_ecc_stats stats;
>  	int res;
> =20
> -	if (from >=3D mtd->size)
> -		return -EINVAL;
> -	if (ops->datbuf && from + ops->len > mtd->size)
> -		return -EINVAL;
> -
> -	/*
> -	 * If OOB is also requested, make sure that we do not read
> past the end
> -	 * of this partition.
> -	 */
> -	if (ops->oobbuf) {
> -		size_t len, pages;
> -
> -		len =3D mtd_oobavail(mtd, ops);
> -		pages =3D mtd_div_by_ws(mtd->size, mtd);
> -		pages -=3D mtd_div_by_ws(from, mtd);
> -		if (ops->ooboffs + ops->ooblen > pages * len)
> -			return -EINVAL;
> -	}
> -
>  	res =3D part->parent->_read_oob(part->parent, from +
> part->offset, ops); if (unlikely(mtd_is_eccerr(res)))
>  		mtd->ecc_stats.failed +=3D
> @@ -190,10 +171,6 @@ static int part_write_oob(struct mtd_info *mtd,
> loff_t to, {
>  	struct mtd_part *part =3D mtd_to_part(mtd);
> =20
> -	if (to >=3D mtd->size)
> -		return -EINVAL;
> -	if (ops->datbuf && to + ops->len > mtd->size)
> -		return -EINVAL;
>  	return part->parent->_write_oob(part->parent, to +
> part->offset, ops); }
> =20
> diff --git a/drivers/mtd/nand/nand_base.c
> b/drivers/mtd/nand/nand_base.c index 889ceadbf607..61eeac233683 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2187,21 +2187,6 @@ static int nand_do_read_oob(struct mtd_info
> *mtd, loff_t from,=20
>  	len =3D mtd_oobavail(mtd, ops);
> =20
> -	if (unlikely(ops->ooboffs >=3D len)) {
> -		pr_debug("%s: attempt to start read outside oob\n",
> -				__func__);
> -		return -EINVAL;
> -	}
> -
> -	/* Do not allow reads past end of device */
> -	if (unlikely(from >=3D mtd->size ||
> -		     ops->ooboffs + readlen > ((mtd->size >>
> chip->page_shift) -
> -					(from >> chip->page_shift))
> * len)) {
> -		pr_debug("%s: attempt to read beyond end of
> device\n",
> -				__func__);
> -		return -EINVAL;
> -	}
> -
>  	chipnr =3D (int)(from >> chip->chip_shift);
>  	chip->select_chip(mtd, chipnr);
> =20
> @@ -2820,22 +2805,6 @@ static int nand_do_write_oob(struct mtd_info
> *mtd, loff_t to, return -EINVAL;
>  	}
> =20
> -	if (unlikely(ops->ooboffs >=3D len)) {
> -		pr_debug("%s: attempt to start write outside oob\n",
> -				__func__);
> -		return -EINVAL;
> -	}
> -
> -	/* Do not allow write past end of device */
> -	if (unlikely(to >=3D mtd->size ||
> -		     ops->ooboffs + ops->ooblen >
> -			((mtd->size >> chip->page_shift) -
> -			 (to >> chip->page_shift)) * len)) {
> -		pr_debug("%s: attempt to write beyond end of
> device\n",
> -				__func__);
> -		return -EINVAL;
> -	}
> -
>  	chipnr =3D (int)(to >> chip->chip_shift);
> =20
>  	/*
> diff --git a/drivers/mtd/onenand/onenand_base.c
> b/drivers/mtd/onenand/onenand_base.c index 050ba8a87543..979f4031f23c
> 100644 --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -1383,15 +1383,6 @@ static int onenand_read_oob_nolock(struct
> mtd_info *mtd, loff_t from, return -EINVAL;
>  	}
> =20
> -	/* Do not allow reads past end of device */
> -	if (unlikely(from >=3D mtd->size ||
> -		     column + len > ((mtd->size >> this->page_shift)
> -
> -				     (from >> this->page_shift)) *
> oobsize)) {
> -		printk(KERN_ERR "%s: Attempted to read beyond end of
> device\n",
> -			__func__);
> -		return -EINVAL;
> -	}
> -
>  	stats =3D mtd->ecc_stats;
> =20
>  	readcmd =3D ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_READ :
> ONENAND_CMD_READOOB; @@ -2024,15 +2015,6 @@ static int
> onenand_write_oob_nolock(struct mtd_info *mtd, loff_t to, return
> -EINVAL; }
> =20
> -	/* Do not allow reads past end of device */
> -	if (unlikely(to >=3D mtd->size ||
> -		     column + len > ((mtd->size >> this->page_shift)
> -
> -				     (to >> this->page_shift)) *
> oobsize)) {
> -		printk(KERN_ERR "%s: Attempted to write past end of
> device\n",
> -		       __func__);
> -		return -EINVAL;
> -	}
> -
>  	oobbuf =3D this->oob_buf;
> =20
>  	oobcmd =3D ONENAND_IS_4KB_PAGE(this) ? ONENAND_CMD_PROG :
> ONENAND_CMD_PROGOOB;



--=20
Miquel Raynal, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
