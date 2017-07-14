Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1dVybD-0000xt-QV
 for linux-mtd@lists.infradead.org; Fri, 14 Jul 2017 11:17:34 +0000
Date: Fri, 14 Jul 2017 13:17:06 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Marek Vasut <marek.vasut@gmail.com>, Richard
 Weinberger <richard@nod.at>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 kernel@pengutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [PATCH RFC] mtdpart: don't force alignment to eraseblock if
 flags have MTD_NO_ERASE
Message-ID: <20170714131706.5527200f@bbrezillon>
In-Reply-To: <20170714102027.9916-1-u.kleine-koenig@pengutronix.de>
References: <20170714102027.9916-1-u.kleine-koenig@pengutronix.de>
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

Le Fri, 14 Jul 2017 12:20:27 +0200,
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> a =C3=A9crit :

> Some mtd devices don't need to be erased before writing to them. For
> these it doesn't make sense to force partition alignment to erase
> blocks.
>=20
> This patch allows partitioning an Everspin mr25h256 that has
> erasesize=3D32768, size=3D32768 and writesize=3D1.

I might be wrong but it seems this patch is more or less addressing the
problem fixed by [1].

Can you try linux-next (or l2-mtd/master)?

[1]https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/comm=
it/drivers/mtd/mtdpart.c?h=3Dnext-20170714&id=3D1eeef2d7483a7e3f8d2dd2a5b99=
39b3b814dc549

>=20
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
> Hello,
>=20
> this is my followup suggestion for
>=20
> 	From: Bastian Stender <bst@pengutronix.de>
> 	Subject: Re: [PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 b=
it wide
> 	Message-Id: <afb06b83-e97b-48db-9875-9f76b365a5f4@pengutronix.de>
>=20
>=20
>=20
> It's IMHO ugly because the two bodys of the newly introduced if look very
> similar, but I think there is not much we can do about this.
>=20
> To ease your reviews: The else body is exactly what we had before.
>=20
> I'm a bit unsure about the check
>=20
> 	slave->mtd.erasesize >=3D slave->mtd.writesize
>=20
> because if that is false, the old code is not only inconvenient by not al=
lowing
> partitions, but also wrong. So probably the check can safely be dropped?
>=20
> Otherwise the logic should be:
>=20
> 	if (MTD_NO_ERASE):
> 		alignto =3D writesize
> 	else:
> 		alignto =3D max(writesize, erasesize)
> 	   =20
> Best regards
> Uwe
>=20
>  drivers/mtd/mtdpart.c | 47 +++++++++++++++++++++++++++++++++------------=
--
>  1 file changed, 33 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index ea5e5307f667..956c8f0ce2dd 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -567,20 +567,39 @@ static struct mtd_part *allocate_partition(struct m=
td_info *master,
>  		slave->mtd.erasesize =3D master->erasesize;
>  	}
> =20
> -	if ((slave->mtd.flags & MTD_WRITEABLE) &&
> -	    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
> -		/* Doesn't start on a boundary of major erase size */
> -		/* FIXME: Let it be writable if it is on a boundary of
> -		 * _minor_ erase size though */
> -		slave->mtd.flags &=3D ~MTD_WRITEABLE;
> -		printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase bl=
ock boundary -- force read-only\n",
> -			part->name);
> -	}
> -	if ((slave->mtd.flags & MTD_WRITEABLE) &&
> -	    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
> -		slave->mtd.flags &=3D ~MTD_WRITEABLE;
> -		printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase bloc=
k -- force read-only\n",
> -			part->name);
> +	if (slave->mtd.flags & MTD_NO_ERASE &&
> +	    slave->mtd.erasesize >=3D slave->mtd.writesize) {
> +		/* If we don't need to erase, then align to writesize */
> +		if ((slave->mtd.flags & MTD_WRITEABLE) &&
> +		    mtd_mod_by_ws(slave->offset, &slave->mtd)) {
> +			/* Doesn't start on a boundary of page */
> +			/* FIXME: Can a minor erase block be smaller than a page? */
> +			slave->mtd.flags &=3D ~MTD_WRITEABLE;
> +			printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on a page bou=
ndary -- force read-only\n",
> +			       part->name);
> +		}
> +		if ((slave->mtd.flags & MTD_WRITEABLE) &&
> +		    mtd_mod_by_ws(slave->mtd.size, &slave->mtd)) {
> +			slave->mtd.flags &=3D ~MTD_WRITEABLE;
> +			printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on a page bound=
ary -- force read-only\n",
> +			       part->name);
> +		}
> +	} else {
> +		if ((slave->mtd.flags & MTD_WRITEABLE) &&
> +		    mtd_mod_by_eb(slave->offset, &slave->mtd)) {
> +			/* Doesn't start on a boundary of major erase size */
> +			/* FIXME: Let it be writable if it is on a boundary of
> +			 * _minor_ erase size though */
> +			slave->mtd.flags &=3D ~MTD_WRITEABLE;
> +			printk(KERN_WARNING"mtd: partition \"%s\" doesn't start on an erase b=
lock boundary -- force read-only\n",
> +			       part->name);
> +		}
> +		if ((slave->mtd.flags & MTD_WRITEABLE) &&
> +		    mtd_mod_by_eb(slave->mtd.size, &slave->mtd)) {
> +			slave->mtd.flags &=3D ~MTD_WRITEABLE;
> +			printk(KERN_WARNING"mtd: partition \"%s\" doesn't end on an erase blo=
ck -- force read-only\n",
> +			       part->name);
> +		}
>  	}
> =20
>  	mtd_set_ooblayout(&slave->mtd, &part_ooblayout_ops);
