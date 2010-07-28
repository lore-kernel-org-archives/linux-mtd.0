MIME-Version: 1.0
In-Reply-To: <AANLkTi=J0=y8FPb5jyRR3apLi7-PfufCyq77fj-mjo-Y@mail.gmail.com>
References: <AANLkTi=J0=y8FPb5jyRR3apLi7-PfufCyq77fj-mjo-Y@mail.gmail.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Wed, 28 Jul 2010 14:50:12 +0800
Message-ID: <AANLkTikzFr-Jdcj2pHHgF+BxGho2uxpNS5Ppj3rF2DCi@mail.gmail.com>
Subject: Re: [PATCH 04/29] pxa3xx_nand: remove the flash info in driver
	structure
To: Haojian Zhuang <haojian.zhuang@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: David Woodhouse <david.woodhouse@intel.com>, Lei Wen <leiwen@marvell.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 28, 2010 at 1:56 PM, Haojian Zhuang
<haojian.zhuang@gmail.com> wrote:
> From 8cd336aefc192495a2ce1222e99d8c3105dbe2a0 Mon Sep 17 00:00:00 2001
> From: Lei Wen <leiwen@marvell.com>
> Date: Tue, 22 Jun 2010 20:28:19 +0800
> Subject: [PATCH 04/29] pxa3xx_nand: remove the flash info in driver struc=
ture
>
> After probe, all info already transfer to driver structure.
> There is no need to keep the original flash info.
> So that we could safely free the flash info in memory, which may grows
> larger when more flash is suported.

Hrm... I like this idea.

>
> Signed-off-by: Lei Wen <leiwen@marvell.com>
> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
> ---
> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0116 +++++++++++++++---------=
----------------
> =C2=A01 files changed, 44 insertions(+), 72 deletions(-)
>
> diff --git a/drivers/mtd/nand/pxa3xx_nand.c b/drivers/mtd/nand/pxa3xx_nan=
d.c
> index b605147..50e08db 100644
> --- a/drivers/mtd/nand/pxa3xx_nand.c
> +++ b/drivers/mtd/nand/pxa3xx_nand.c
> @@ -117,7 +117,7 @@ struct pxa3xx_nand_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_chip =C2=A0 =C2=A0 =C2=A0 =C2=A0na=
nd_chip;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device =C2=A0 *pdev;
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *flash_info;
> + =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_cmdset *cmdset;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0*clk;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*mmio_base;
> @@ -131,6 +131,7 @@ struct pxa3xx_nand_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 drcmr_cmd;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *data_buff;
> + =C2=A0 =C2=A0 =C2=A0 unsigned char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 *=
oob_buff;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0data_buff_phys;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0data_buff_size;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 data_dma_ch;
> @@ -149,7 +150,8 @@ struct pxa3xx_nand_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 use_ecc; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use HW E=
CC ? */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 use_dma; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use DMA =
? */
>
> - =C2=A0 =C2=A0 =C2=A0 size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0data_size; =C2=A0 =C2=A0 =C2=A0/* data size in FIFO */
> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0page_size; =C2=A0 =C2=A0 =C2=A0/* page size of attached chip */
> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0data_size; =C2=A0 =C2=A0 =C2=A0/* data size in FIFO */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 retcode;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct completion =C2=A0 =C2=A0 =C2=A0 cmd_com=
plete;
>
> @@ -158,6 +160,10 @@ struct pxa3xx_nand_info {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ndcb1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ndcb2;
>
> + =C2=A0 =C2=A0 =C2=A0 /* timing calcuted from setting */
> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ndtr0cs0;
> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0ndtr1cs0;
> +
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculated from pxa3xx_nand_flash data */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oob_s=
ize;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read_=
id_bytes;
> @@ -174,8 +180,6 @@ MODULE_PARM_DESC(use_dma, "enable DMA for data
> transfering to/from NAND HW");
> =C2=A0* Default NAND flash controller configuration setup by the
> =C2=A0* bootloader. This configuration is used only when pdata->keep_conf=
ig is set
> =C2=A0*/
> -static struct pxa3xx_nand_timing default_timing;
> -static struct pxa3xx_nand_flash default_flash;
> =C2=A0static struct pxa3xx_nand_cmdset default_cmdset =3D {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read1 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x3000,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0.read2 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 0=
x0050,
> @@ -223,23 +227,9 @@ static struct pxa3xx_nand_flash __devinitdata
> builtin_flash_types[] =3D {
> =C2=A0#define NDTR1_tWHR(c) =C2=A0(min((c), 15) << 4)
> =C2=A0#define NDTR1_tAR(c) =C2=A0 (min((c), 15) << 0)
>
> -#define tCH_NDTR0(r) =C2=A0 (((r) >> 19) & 0x7)
> -#define tCS_NDTR0(r) =C2=A0 (((r) >> 16) & 0x7)
> -#define tWH_NDTR0(r) =C2=A0 (((r) >> 11) & 0x7)
> -#define tWP_NDTR0(r) =C2=A0 (((r) >> 8) & 0x7)
> -#define tRH_NDTR0(r) =C2=A0 (((r) >> 3) & 0x7)
> -#define tRP_NDTR0(r) =C2=A0 (((r) >> 0) & 0x7)
> -
> -#define tR_NDTR1(r) =C2=A0 =C2=A0(((r) >> 16) & 0xffff)
> -#define tWHR_NDTR1(r) =C2=A0(((r) >> 4) & 0xf)
> -#define tAR_NDTR1(r) =C2=A0 (((r) >> 0) & 0xf)
> -
> =C2=A0/* convert nano-seconds to nand flash controller clock cycles */
> =C2=A0#define ns2cycle(ns, clk) =C2=A0 =C2=A0 =C2=A0(int)(((ns) * (clk / =
1000000) / 1000) - 1)
>
> -/* convert nand flash controller clock cycles to nano-seconds */
> -#define cycle2ns(c, clk) =C2=A0 =C2=A0 =C2=A0 ((((c) + 1) * 1000000 + cl=
k / 500) / (clk / 1000))
> -
> =C2=A0static void pxa3xx_nand_set_timing(struct pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_timi=
ng *t)
> =C2=A0{
> @@ -257,6 +247,8 @@ static void pxa3xx_nand_set_timing(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NDTR1_tWHR(ns2cycl=
e(t->tWHR, nand_clk)) |
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NDTR1_tAR(ns2cycle=
(t->tAR, nand_clk));
>
> + =C2=A0 =C2=A0 =C2=A0 info->ndtr0cs0 =3D ndtr0;
> + =C2=A0 =C2=A0 =C2=A0 info->ndtr1cs0 =3D ndtr1;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR0CS0, ndtr0);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR1CS0, ndtr1);
> =C2=A0}
> @@ -280,23 +272,24 @@ static int wait_for_event(struct
> pxa3xx_nand_info *info, uint32_t event)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;
> =C2=A0}
>
> -static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint16_t cmd, int column, int page_addr)
> +static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *f =3D info->flash_=
info;
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D f->cmd=
set;
> -
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate data size */
> - =C2=A0 =C2=A0 =C2=A0 switch (f->page_size) {
> + =C2=A0 =C2=A0 =C2=A0 switch (info->page_size) {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case 2048:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->data_size =
=3D (info->use_ecc) ? 2088 : 2112;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case 512:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->data_size =
=3D (info->use_ecc) ? 520 : 528;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> - =C2=A0 =C2=A0 =C2=A0 default:
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
> +}
> +
> +static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t cmd, int colu=
mn, int page_addr)
> +{
> + =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D info->=
cmdset;
> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_set_datasize(info);
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* generate values for NDCBx registers */
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 =3D cmd | ((cmd & 0xff00) ? NDCB0_=
DBC : 0);
> @@ -335,7 +328,7 @@ static int prepare_erase_cmd(struct pxa3xx_nand_info =
*info,
>
> =C2=A0static int prepare_other_cmd(struct pxa3xx_nand_info *info, uint16_=
t cmd)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D info->=
flash_info->cmdset;
> + =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D info->=
cmdset;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 =3D cmd | ((cmd & 0xff00) ? NDCB0_=
DBC : 0);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb1 =3D 0;
> @@ -421,6 +414,7 @@ static int handle_data_pio(struct pxa3xx_nand_info *i=
nfo)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0case STATE_PIO_READING:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__raw_readsl(info-=
>mmio_base + NDDB, info->data_buff,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP(info->data_size, 4));
> +

Unnecessary empty line here, otherwise looks great.

> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_ERR "%=
s: invalid state %d\n", __func__,
> @@ -572,8 +566,7 @@ static void pxa3xx_nand_cmdfunc(struct mtd_info
> *mtd, unsigned command,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0int column, int page_addr)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info =3D mtd->priv;
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *flash_info =3D inf=
o->flash_info;
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D flash_=
info->cmdset;
> + =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D info->=
cmdset;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int ret;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->use_dma =3D (use_dma) ? 1 : 0;
> @@ -797,8 +790,7 @@ static int pxa3xx_nand_ecc_correct(struct mtd_info *m=
td,
>
> =C2=A0static int __readid(struct pxa3xx_nand_info *info, uint32_t *id)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *f =3D info->flash_=
info;
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D f->cmd=
set;
> + =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_cmdset *cmdset =3D info->=
cmdset;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ndcr;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint8_t =C2=A0id_buff[8];
>
> @@ -840,6 +832,9 @@ static int pxa3xx_nand_config_flash(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -EINVAL;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate flash information */
> + =C2=A0 =C2=A0 =C2=A0 info->cmdset =3D f->cmdset;
> + =C2=A0 =C2=A0 =C2=A0 info->page_size =3D f->page_size;
> + =C2=A0 =C2=A0 =C2=A0 info->oob_buff =3D info->data_buff + f->page_size;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->oob_size =3D (f->page_size =3D=3D 2048) =
? 64 : 16;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (f->page_size =3D=3D 2=
048) ? 4 : 2;
>
> @@ -864,44 +859,20 @@ static int pxa3xx_nand_config_flash(struct
> pxa3xx_nand_info *info,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->reg_ndcr =3D ndcr;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_set_timing(info, f->timing);
> - =C2=A0 =C2=A0 =C2=A0 info->flash_info =3D f;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
>
> -static void pxa3xx_nand_detect_timing(struct pxa3xx_nand_info *info,
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_=
timing *t)
> -{
> - =C2=A0 =C2=A0 =C2=A0 unsigned long nand_clk =3D clk_get_rate(info->clk)=
;
> - =C2=A0 =C2=A0 =C2=A0 uint32_t ndtr0 =3D nand_readl(info, NDTR0CS0);
> - =C2=A0 =C2=A0 =C2=A0 uint32_t ndtr1 =3D nand_readl(info, NDTR1CS0);
> -
> - =C2=A0 =C2=A0 =C2=A0 t->tCH =3D cycle2ns(tCH_NDTR0(ndtr0), nand_clk);
> - =C2=A0 =C2=A0 =C2=A0 t->tCS =3D cycle2ns(tCS_NDTR0(ndtr0), nand_clk);
> - =C2=A0 =C2=A0 =C2=A0 t->tWH =3D cycle2ns(tWH_NDTR0(ndtr0), nand_clk);
> - =C2=A0 =C2=A0 =C2=A0 t->tWP =3D cycle2ns(tWP_NDTR0(ndtr0), nand_clk);
> - =C2=A0 =C2=A0 =C2=A0 t->tRH =3D cycle2ns(tRH_NDTR0(ndtr0), nand_clk);
> - =C2=A0 =C2=A0 =C2=A0 t->tRP =3D cycle2ns(tRP_NDTR0(ndtr0), nand_clk);
> -
> - =C2=A0 =C2=A0 =C2=A0 t->tR =3D cycle2ns(tR_NDTR1(ndtr1), nand_clk);
> - =C2=A0 =C2=A0 =C2=A0 t->tWHR =3D cycle2ns(tWHR_NDTR1(ndtr1), nand_clk);
> - =C2=A0 =C2=A0 =C2=A0 t->tAR =3D cycle2ns(tAR_NDTR1(ndtr1), nand_clk);
> -}
> -
> =C2=A0static int pxa3xx_nand_detect_config(struct pxa3xx_nand_info *info)
> =C2=A0{
> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ndcr =3D nand_readl(info, NDCR);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_flash_dev *type =3D NULL;
> - =C2=A0 =C2=A0 =C2=A0 uint32_t id =3D -1;
> + =C2=A0 =C2=A0 =C2=A0 uint32_t id =3D -1, page_per_block, num_blocks;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0int i;
>
> - =C2=A0 =C2=A0 =C2=A0 default_flash.page_per_block =3D ndcr & NDCR_PG_PE=
R_BLK ? 64 : 32;
> - =C2=A0 =C2=A0 =C2=A0 default_flash.page_size =3D ndcr & NDCR_PAGE_SZ ? =
2048 : 512;
> - =C2=A0 =C2=A0 =C2=A0 default_flash.flash_width =3D ndcr & NDCR_DWIDTH_M=
 ? 16 : 8;
> - =C2=A0 =C2=A0 =C2=A0 default_flash.dfc_width =3D ndcr & NDCR_DWIDTH_C ?=
 16 : 8;
> -
> + =C2=A0 =C2=A0 =C2=A0 page_per_block =3D ndcr & NDCR_PG_PER_BLK ? 64 : 3=
2;
> + =C2=A0 =C2=A0 =C2=A0 info->page_size =3D ndcr & NDCR_PAGE_SZ ? 2048 : 5=
12;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set info fields needed to __readid */
> - =C2=A0 =C2=A0 =C2=A0 info->flash_info =3D &default_flash;
> - =C2=A0 =C2=A0 =C2=A0 info->read_id_bytes =3D (default_flash.page_size =
=3D=3D 2048) ? 4 : 2;
> + =C2=A0 =C2=A0 =C2=A0 info->read_id_bytes =3D (info->page_size =3D=3D 20=
48) ? 4 : 2;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->reg_ndcr =3D ndcr;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (__readid(info, &id))
> @@ -920,22 +891,22 @@ static int pxa3xx_nand_detect_config(struct
> pxa3xx_nand_info *info)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ENODEV;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fill the missing flash information */
> - =C2=A0 =C2=A0 =C2=A0 i =3D __ffs(default_flash.page_per_block * default=
_flash.page_size);
> - =C2=A0 =C2=A0 =C2=A0 default_flash.num_blocks =3D type->chipsize << (20=
 - i);
> + =C2=A0 =C2=A0 =C2=A0 i =3D __ffs(page_per_block * info->page_size);
> + =C2=A0 =C2=A0 =C2=A0 num_blocks =3D type->chipsize << (20 - i);
>
> - =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D (default_flash.page_size =3D=3D=
 2048) ? 64 : 16;
> + =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D (info->page_size =3D=3D 2048) ?=
 64 : 16;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate addressing information */
> - =C2=A0 =C2=A0 =C2=A0 info->col_addr_cycles =3D (default_flash.page_size=
 =3D=3D 2048) ? 2 : 1;
> + =C2=A0 =C2=A0 =C2=A0 info->col_addr_cycles =3D (info->page_size =3D=3D =
2048) ? 2 : 1;
>
> - =C2=A0 =C2=A0 =C2=A0 if (default_flash.num_blocks * default_flash.page_=
per_block > 65536)
> + =C2=A0 =C2=A0 =C2=A0 if (num_blocks * page_per_block > 65536)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->row_addr_cyc=
les =3D 3;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info->row_addr_cyc=
les =3D 2;
>
> - =C2=A0 =C2=A0 =C2=A0 pxa3xx_nand_detect_timing(info, &default_timing);
> - =C2=A0 =C2=A0 =C2=A0 default_flash.timing =3D &default_timing;
> - =C2=A0 =C2=A0 =C2=A0 default_flash.cmdset =3D &default_cmdset;
> + =C2=A0 =C2=A0 =C2=A0 info->ndtr0cs0 =3D nand_readl(info, NDTR0CS0);
> + =C2=A0 =C2=A0 =C2=A0 info->ndtr1cs0 =3D nand_readl(info, NDTR1CS0);
> + =C2=A0 =C2=A0 =C2=A0 info->cmdset =3D &default_cmdset;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
> =C2=A0}
> @@ -1036,10 +1007,9 @@ static struct nand_ecclayout hw_largepage_ecclayou=
t =3D {
> =C2=A0static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info)
> =C2=A0{
> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *f =3D info->flash_=
info;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_chip *this =3D &info->nand_chip;
>
> - =C2=A0 =C2=A0 =C2=A0 this->options =3D (f->flash_width =3D=3D 16) ? NAN=
D_BUSWIDTH_16: 0;
> + =C2=A0 =C2=A0 =C2=A0 this->options =3D (info->reg_ndcr & NDCR_DWIDTH_C)=
 ? NAND_BUSWIDTH_16: 0;
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->waitfunc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0=3D pxa3xx_nand_waitfunc;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->select_chip =C2=A0 =C2=A0 =C2=A0 =3D pxa=
3xx_nand_select_chip;
> @@ -1055,9 +1025,9 @@ static void pxa3xx_nand_init_mtd(struct mtd_info *m=
td,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.hwctl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D pxa3xx_nand_ecc_hwctl;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.calculate =C2=A0 =C2=A0 =3D pxa3xx_n=
and_ecc_calculate;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.correct =C2=A0 =C2=A0 =C2=A0 =3D pxa=
3xx_nand_ecc_correct;
> - =C2=A0 =C2=A0 =C2=A0 this->ecc.size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D f->page_size;
> + =C2=A0 =C2=A0 =C2=A0 this->ecc.size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D info->page_size;
>
> - =C2=A0 =C2=A0 =C2=A0 if (f->page_size =3D=3D 2048)
> + =C2=A0 =C2=A0 =C2=A0 if (info->page_size =3D=3D 2048)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.layout =
=3D &hw_largepage_ecclayout;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.layout =
=3D &hw_smallpage_ecclayout;
> @@ -1264,9 +1234,11 @@ static int pxa3xx_nand_resume(struct
> platform_device *pdev)
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd =3D (struct mtd_info *)pl=
atform_get_drvdata(pdev);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info =3D mtd->priv;
>
> + =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDTR0CS0, info->ndtr0cs0);
> + =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDTR1CS0, info->ndtr1cs0);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_enable(info->clk);
>
> - =C2=A0 =C2=A0 =C2=A0 return pxa3xx_nand_config_flash(info, info->flash_=
info);
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> =C2=A0}
> =C2=A0#else
> =C2=A0#define pxa3xx_nand_suspend =C2=A0 =C2=A0NULL
> --
> 1.7.0.4
>
