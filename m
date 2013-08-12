From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>, "dwmw2@infradead.org"
 <dwmw2@infradead.org>
Subject: RE: [PATCH v3 3/6] mtd: set the ecc step size for master/slave
 mtd_info
Date: Mon, 12 Aug 2013 07:00:50 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9F2A32@DBDE04.ent.ti.com>
References: <1376285092-19683-1-git-send-email-b32955@freescale.com>
 <1376285092-19683-4-git-send-email-b32955@freescale.com>
In-Reply-To: <1376285092-19683-4-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Set the ecc step size for master/slave mtd_info{}.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/mtdpart.c        |    1 +
>  drivers/mtd/nand/nand_base.c |    1 +
>  2 files changed, 2 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/mtdpart.c b/drivers/mtd/mtdpart.c
> index 3014933..63b42a6 100644
> --- a/drivers/mtd/mtdpart.c
> +++ b/drivers/mtd/mtdpart.c
> @@ -516,6 +516,7 @@ static struct mtd_part *allocate_partition(struct
> mtd_info *master,
>  	}
>=20
>  	slave->mtd.ecclayout =3D master->ecclayout;
> +	slave->mtd.ecc_step =3D master->ecc_step;
>  	slave->mtd.ecc_strength =3D master->ecc_strength;
>  	slave->mtd.bitflip_threshold =3D master->bitflip_threshold;
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index 8f04fb0..6e4095d 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3788,6 +3788,7 @@ int nand_scan_tail(struct mtd_info *mtd)
>  	/* propagate ecc info to mtd_info */
>  	mtd->ecclayout =3D chip->ecc.layout;
>  	mtd->ecc_strength =3D chip->ecc.strength;
> +	mtd->ecc_step =3D chip->ecc.size;

[Pekon]: Sorry for noticing this lately..=20
But do you really want to name ecc.*size* as *ecc_step* ?
Wouldn't it be better to follow same nomenclature everywhere ?
Like ' mtd->ecc_size =3D chip.ecc.size;'

Because we also have ecc.steps as another parameter here.
And someone might want to expose it in user-space later.
(Just a naming change requested here to keep things in sync..)

with regards, pekon

>  	/*
>  	 * Initialize bitflip_threshold to its default prior scan_bbt() call.
>  	 * scan_bbt() might invoke mtd_read(), thus bitflip_threshold must
> be
> --
> 1.7.1
