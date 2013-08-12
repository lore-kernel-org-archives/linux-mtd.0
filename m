From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH 01/10] mtd: set the cell information for ONFI nand
Date: Mon, 12 Aug 2013 07:22:38 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9F2A6B@DBDE04.ent.ti.com>
References: <1376286173-12581-1-git-send-email-b32955@freescale.com>
 <1376286173-12581-2-git-send-email-b32955@freescale.com>
In-Reply-To: <1376286173-12581-2-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
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

Hi,
>=20
> The current code does not set the SLC/MLC information for onfi nand.
> (This makes that the kernel treats all the onfi nand as SLC nand.)
>=20
> This patch fills the chip->cellinfo when the onfi nand is a MLC(or TLC) n=
and
> (p->bits_per_cell > 1).
>=20
> The macro NAND_CI_CELLTYPE_SHIFT is added to avoid the hardcode.
>=20
> Signed-off-by: Huang Shijie <b32955@freescale.com>
> ---
>  drivers/mtd/nand/nand_base.c |    3 +++
>  include/linux/mtd/nand.h     |    1 +
>  2 files changed, 4 insertions(+), 0 deletions(-)
>=20
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ff605c8..ee1aa52 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -2988,6 +2988,9 @@ static int nand_flash_detect_onfi(struct mtd_info
> *mtd, struct nand_chip *chip,
>  	chip->chipsize =3D le32_to_cpu(p->blocks_per_lun);
>  	chip->chipsize *=3D (uint64_t)mtd->erasesize * p->lun_count;
>=20
> +	/* @bits_per_cell equals 1 means this is a SLC nand. */
> +	chip->cellinfo =3D (p->bits_per_cell - 1) << NAND_CI_CELLTYPE_SHIFT;
> +
[Pekon]: For future scalability, good to update only MLC related bit-fields
So ORing instead of assigning..
chip->cellinfo |=3D (p->bits_per_cell - 1) << NAND_CI_CELLTYPE_SHIFT;

>  	if (onfi_feature(chip) & ONFI_FEATURE_16_BIT_BUS)
>  		*busw =3D NAND_BUSWIDTH_16;
>  	else
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index ac8e89d..bf743ba 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -198,6 +198,7 @@ typedef enum {
>  /* Cell info constants */
>  #define NAND_CI_CHIPNR_MSK	0x03
>  #define NAND_CI_CELLTYPE_MSK	0x0C
> +#define NAND_CI_CELLTYPE_SHIFT	2
>=20
>  /* Keep gcc happy */
>  struct nand_chip;
> --
> 1.7.1
>=20

With regards, pekon
