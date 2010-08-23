MIME-Version: 1.0
In-Reply-To: <AANLkTikngmRrF35E66NN2cOfgHf1kc0QY6h+40k9mUxT@mail.gmail.com>
References: <AANLkTikngmRrF35E66NN2cOfgHf1kc0QY6h+40k9mUxT@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Mon, 23 Aug 2010 16:20:13 +0800
Message-ID: <AANLkTime=GLNgAooUOr2AsgYc62eF2Rk0N=vCetCAyFg@mail.gmail.com>
Subject: Re: [PATCH 5/5] pxa3xx_nand: set oob length in the runtime
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 18, 2010 at 10:36 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 85d8cdc6774445d3ec7842de5227e9798f13efa3 Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Tue, 17 Aug 2010 14:09:30 +0800
> Subject: [PATCH 5/5] pxa3xx_nand: set oob length in the runtime
>
> For different command need different oob requirement, set the proper
> oob length by different cmd.
>
> Signed-off-by: Lei Wen <leiwen@marvell.com>

Acked-by: Eric Miao <eric.y.miao@gmail.com>

> ---
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 25 ++++++++++++++++++------=
-
> =C2=A01 files changed, 18 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index dce9407..5d24968 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -273,13 +273,20 @@ static int wait_for_event(struct
> pxa3xx_nand_info *info, uint32_t event)
>
> =C2=A0static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 /* calculate data size */
> + =C2=A0 =C2=A0 =C2=A0 int oob_enable =3D info->reg_ndcr & NDCR_SPARE_EN;
> +
> + =C2=A0 =C2=A0 =C2=A0 info->data_size =3D info->page_size;
> + =C2=A0 =C2=A0 =C2=A0 if (!oob_enable) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D 0;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0switch (info->page_size) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case 2048:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->data_size =3D (i=
nfo->use_ecc) ? 2088 : 2112;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D (in=
fo->use_ecc) ? 40 : 64;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case 512:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->data_size =3D (i=
nfo->use_ecc) ? 520 : 528;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D (in=
fo->use_ecc) ? 8 : 16;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> =C2=A0}
> @@ -333,6 +340,7 @@ static int prepare_other_cmd(struct
> pxa3xx_nand_info *info, uint16_t cmd)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb1 =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb2 =3D 0;
>
> + =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D 0;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (cmd =3D=3D cmdset->read_id) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 |=3D N=
DCB0_CMD_TYPE(3);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->data_size =
=3D 8;
> @@ -401,6 +409,9 @@ static int handle_data_pio(struct pxa3xx_nand_info *i=
nfo)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case STATE_PIO_WRITING:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__raw_writesl(info=
->mmio_base + NDDB, info->data_buff,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP(info->data_size, 4));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->oob_size > 0=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __raw_writesl(info->mmio_base + NDDB, info->oob_buff,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_ROUND_UP=
(info->oob_size, 4));
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable_int(info, N=
DSR_CS0_BBD | NDSR_CS0_CMDD);
>
> @@ -413,6 +424,9 @@ static int handle_data_pio(struct pxa3xx_nand_info *i=
nfo)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case STATE_PIO_READING:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__raw_readsl(info-=
>mmio_base + NDDB, info->data_buff,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP(info->data_size, 4));
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->oob_size > 0=
)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __raw_readsl(info->mmio_base + NDDB, info->oob_buff,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_ROUND_UP=
(info->oob_size, 4));
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_ERR "%=
s: invalid state %d\n", __func__,
> @@ -427,7 +441,7 @@ static int handle_data_pio(struct pxa3xx_nand_info *i=
nfo)
> =C2=A0static void start_data_dma(struct pxa3xx_nand_info *info, int dir_o=
ut)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa_dma_desc *desc =3D info->data_desc;
> - =C2=A0 =C2=A0 =C2=A0 int dma_len =3D ALIGN(info->data_size, 32);
> + =C2=A0 =C2=A0 =C2=A0 int dma_len =3D ALIGN(info->data_size + info->oob_=
size, 32);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->ddadr =3D DDADR_STOP;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->dcmd =3D DCMD_ENDIRQEN | DCMD_WIDTH4 | D=
CMD_BURST32 | dma_len;
> @@ -833,7 +847,6 @@ static int pxa3xx_nand_config_flash(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->cmdset =3D f->cmdset;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->page_size =3D f->page_size;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->oob_buff =3D info->data_buff + f->page_s=
ize;
> - =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D (f->page_size =3D=3D 2048) ? 64=
 : 16;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (f->page_size =3D=3D 2=
048) ? 4 : 2;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate addressing information */
> @@ -892,8 +905,6 @@ static int pxa3xx_nand_detect_config(struct
> pxa3xx_nand_info *info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0i =3D __ffs(page_per_block * info->page_size);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0num_blocks =3D type->chipsize << (20 - i);
>
> - =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D (info->page_size =3D=3D 2048) ?=
 64 : 16;
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate addressing information */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->col_addr_cycles =3D (info->page_size =3D=
=3D 2048) ? 2 : 1;
>
> --
> 1.7.0.4
>
