Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cbqki-0000TF-GB
 for linux-mtd@lists.infradead.org; Thu, 09 Feb 2017 15:35:23 +0000
Date: Thu, 9 Feb 2017 16:34:58 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@pengutronix.de>,
 Brian Norris <computersforpeace@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Marek Vasut
 <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>, Cyrille
 Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de, Sascha Hauer <s.hauer@pengutronix.de>, Moritz
 Fischer <moritz.fischer@ettus.com>
Subject: Re: [PATCH] mtd: Add partition device node to mtd partition devices
Message-ID: <20170209163458.41b3bea7@bbrezillon>
In-Reply-To: <20170209105024.1579-1-u.kleine-koenig@pengutronix.de>
References: <20170209105024.1579-1-u.kleine-koenig@pengutronix.de>
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

+Moritz

On Thu,  9 Feb 2017 11:50:24 +0100
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de> wrote:

> From: Sascha Hauer <s.hauer@pengutronix.de>
>=20
> The user visible change here is that mtd partitions get an of_node link
> in sysfs.

The same patch has already been posted last year [1].
Brian, can we take one of these?

[1]https://patchwork.ozlabs.org/patch/625978/

>=20
> Signed-off-by: Sascha Hauer <s.hauer@pengutronix.de>
> Signed-off-by: Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> ---
>  drivers/mtd/mtdpart.c          | 1 +
>  drivers/mtd/ofpart.c           | 1 +
>  include/linux/mtd/partitions.h | 1 +
>  3 files changed, 3 insertions(+)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index fccdd49bb964..d0b919ab85c0 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -424,6 +424,7 @@ static struct mtd_part *allocate_partition(struct mtd=
_info *master,
>  	slave->mtd.dev.parent =3D IS_ENABLED(CONFIG_MTD_PARTITIONED_MASTER) ?
>  				&master->dev :
>  				master->dev.parent;
> +	slave->mtd.dev.of_node =3D part->of_node;
> =20
>  	slave->mtd._read =3D part_read;
>  	slave->mtd._write =3D part_write;
> diff --git a/drivers/mtd/ofpart.c b/drivers/mtd/ofpart.c
> index ede407d6e106..464470122493 100644
> --- a/drivers/mtd/ofpart.c
> +++ b/drivers/mtd/ofpart.c
> @@ -108,6 +108,7 @@ static int parse_ofpart_partitions(struct mtd_info *m=
aster,
> =20
>  		parts[i].offset =3D of_read_number(reg, a_cells);
>  		parts[i].size =3D of_read_number(reg + a_cells, s_cells);
> +		parts[i].of_node =3D pp;
> =20
>  		partname =3D of_get_property(pp, "label", &len);
>  		if (!partname)
> diff --git a/include/linux/mtd/partitions.h b/include/linux/mtd/partition=
s.h
> index 70736e1e6c8f..06df1e06b6e0 100644
> --- a/include/linux/mtd/partitions.h
> +++ b/include/linux/mtd/partitions.h
> @@ -41,6 +41,7 @@ struct mtd_partition {
>  	uint64_t size;			/* partition size */
>  	uint64_t offset;		/* offset within the master MTD space */
>  	uint32_t mask_flags;		/* master MTD flags to mask out for this partitio=
n */
> +	struct device_node *of_node;
>  };
> =20
>  #define MTDPART_OFS_RETAIN	(-3)
