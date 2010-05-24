MIME-Version: 1.0
In-Reply-To: <4BFA2A02.2040605@compulab.co.il>
References: <AANLkTikU9yabdwx_a5SzpC11v9nowW_zglNHLaswaToB@mail.gmail.com>
	<4BFA2A02.2040605@compulab.co.il>
Date: Mon, 24 May 2010 16:41:03 +0800
Message-ID: <AANLkTil9Toz4DU7YJ2B3Qtw3S1LCr90R7tlri7KC_NCC@mail.gmail.com>
Subject: Re: [PATCH 03/20] mtd: pxa3xx_nand: remove the flash info in driver
	structure
From: Lei Wen <adrian.wenl@gmail.com>
To: Mike Rapoport <mike@compulab.co.il>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Eric Miao <eric.y.miao@gmail.com>,
	David Woodhouse <david.woodhouse@intel.com>,
	Haojian Zhuang <haojian.zhuang@gmail.com>, linux-mtd@lists.infradead.org,
	Marc Kleine-Budde <mkl@pengutronix.de>,
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

On Mon, May 24, 2010 at 3:25 PM, Mike Rapoport <mike@compulab.co.il> wrote:
> Haojian Zhuang wrote:
>>
>> From dd45d508745edb24e9e4129077e9f5bd20415a23 Mon Sep 17 00:00:00 2001
>> From: Lei Wen <leiwen@marvell.com>
>> Date: Mon, 22 Mar 2010 10:33:49 +0800
>> Subject: [PATCH] mtd: pxa3xx_nand: remove the flash info in driver
>> structure
>>
>> After probe, all info already transfer to driver structure.
>> There is no need to keep the original flash info.
>> So that we could safely free the flash info in memory, which may grows
>> larger when more flash is suported.
>>
>> Signed-off-by: Lei Wen <leiwen@marvell.com>
>> Signed-off-by: Haojian Zhuang <haojian.zhuang@marvell.com>
>> ---
>> =C2=A0drivers/mtd/nand/pxa3xx_nand.c | =C2=A0 70
>> ++++++++++++++++++++++++++--------------
>> =C2=A01 files changed, 46 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/mtd/nand/pxa3xx_nand.c
>> b/drivers/mtd/nand/pxa3xx_nand.c
>> index 5658398..2dfe6d9 100644
>> --- a/drivers/mtd/nand/pxa3xx_nand.c
>> +++ b/drivers/mtd/nand/pxa3xx_nand.c
>> @@ -152,7 +152,6 @@ struct pxa3xx_nand_info {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_chip =C2=A0 =C2=A0 =C2=A0 =C2=A0n=
and_chip;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct platform_device =C2=A0 *pdev;
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *flash_info;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct clk =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0*clk;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0void __iomem =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0*mmio_base;
>> @@ -166,6 +165,7 @@ struct pxa3xx_nand_info {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 drcmr_cmd;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0unsigned char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 *data_buff;
>> + =C2=A0 =C2=A0 =C2=A0 unsigned char =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
*oob_buff;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dma_addr_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0data_buff_phys;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0data_buff_size;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 data_dma_ch;
>> @@ -184,7 +184,8 @@ struct pxa3xx_nand_info {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_ecc; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use HW =
ECC ? */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 use_dma; =C2=A0 =C2=A0 =C2=A0 =C2=A0/* use DMA=
 ? */
>>
>> - =C2=A0 =C2=A0 =C2=A0 size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0data_size; =C2=A0 =C2=A0 =C2=A0/* data size in FIFO */
>> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0page_size; =C2=A0 =C2=A0 =C2=A0/* page size of attached
>> chip */
>> + =C2=A0 =C2=A0 =C2=A0 unsigned int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0data_size; =C2=A0 =C2=A0 =C2=A0/* data size in FIFO */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retcode;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct completion =C2=A0 =C2=A0 =C2=A0 cmd_co=
mplete;
>>
>> @@ -193,6 +194,10 @@ struct pxa3xx_nand_info {
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ndcb1;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0ndcb2;
>>
>> + =C2=A0 =C2=A0 =C2=A0 /* timing calcuted from setting */
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ndtr0cs0;
>> + =C2=A0 =C2=A0 =C2=A0 uint32_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0ndtr1cs0;
>> +
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculated from pxa3xx_nand_flash data */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0oob_=
size;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0size_t =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0read=
_id_bytes;
>> @@ -287,6 +292,8 @@ static void pxa3xx_nand_set_timing(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NDTR1_tWHR(ns2cyc=
le(t->tWHR, nand_clk)) |
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0NDTR1_tAR(ns2cycl=
e(t->tAR, nand_clk));
>>
>> + =C2=A0 =C2=A0 =C2=A0 info->ndtr0cs0 =3D ndtr0;
>> + =C2=A0 =C2=A0 =C2=A0 info->ndtr1cs0 =3D ndtr1;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR0CS0, ndtr0);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0nand_writel(info, NDTR1CS0, ndtr1);
>> =C2=A0}
>> @@ -310,22 +317,29 @@ static int wait_for_event(struct
>> pxa3xx_nand_info *info, uint32_t event)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return -ETIMEDOUT;
>> =C2=A0}
>>
>> -static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 uint16_t cmd, int column, int page_addr)
>> +static void pxa3xx_set_datasize(struct pxa3xx_nand_info *info)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *f =3D info->flash=
_info;
>> + =C2=A0 =C2=A0 =C2=A0 int oob_enable =3D info->reg_ndcr & NDCR_SPARE_EN=
;
>>
>> - =C2=A0 =C2=A0 =C2=A0 /* calculate data size */
>> - =C2=A0 =C2=A0 =C2=A0 switch (f->page_size) {
>> - =C2=A0 =C2=A0 =C2=A0 case 2048:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->data_size =3D (=
info->use_ecc) ? 2088 : 2112;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> - =C2=A0 =C2=A0 =C2=A0 case 512:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->data_size =3D (=
info->use_ecc) ? 520 : 528;
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;
>> - =C2=A0 =C2=A0 =C2=A0 default:
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -EINVAL;
>> + =C2=A0 =C2=A0 =C2=A0 info->data_size =3D info->page_size;
>> + =C2=A0 =C2=A0 =C2=A0 if (!oob_enable) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info->oob_size =3D 0;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> + =C2=A0 =C2=A0 =C2=A0 switch (info->page_size) {
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 2048:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 info->oob_size =3D (info->use_ecc) ? 40 : 64;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 case 512:
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 info->oob_size =3D (info->use_ecc) ? 8 : 16;
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;
>> + =C2=A0 =C2=A0 =C2=A0 }
>
> The OOB-related changes do not seem related to the $SUBJ.
>
>> +}
>> +
>> +static int prepare_read_prog_cmd(struct pxa3xx_nand_info *info,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uint16_t cmd, int col=
umn, int page_addr)
>> +{
>> + =C2=A0 =C2=A0 =C2=A0 pxa3xx_set_datasize(info);
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* generate values for NDCBx registers */
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->ndcb0 =3D cmd | ((cmd & 0xff00) ? NDCB0=
_DBC : 0);
>> @@ -436,6 +450,9 @@ static int handle_data_pio(struct pxa3xx_nand_info
>> *info)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0case STATE_PIO_WRITING:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__raw_writesl(inf=
o->mmio_base + NDDB, info->data_buff,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP(info->data_size, 4));
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->oob_size > =
0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __raw_writesl(info->mmio_base + NDDB,
>> info->oob_buff,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_ROUND_UP=
(info->oob_size, 4));
>
> The same here.
>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0enable_int(info, =
NDSR_CS0_BBD | NDSR_CS0_CMDD);
>>
>> @@ -448,6 +465,10 @@ static int handle_data_pio(struct pxa3xx_nand_info
>> *info)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0case STATE_PIO_READING:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0__raw_readsl(info=
->mmio_base + NDDB, info->data_buff,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0DIV_ROUND_UP(info->data_size, 4));
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info->oob_size > =
0)
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __raw_readsl(info->mmio_base + NDDB,
>> info->oob_buff,
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DIV_ROUND_UP=
(info->oob_size, 4));
>> +
>
> Ditto.
>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0default:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0printk(KERN_ERR "=
%s: invalid state %d\n", __func__,
>> @@ -462,7 +483,7 @@ static int handle_data_pio(struct pxa3xx_nand_info
>> *info)
>> =C2=A0static void start_data_dma(struct pxa3xx_nand_info *info, int dir_=
out)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa_dma_desc *desc =3D info->data_desc=
;
>> - =C2=A0 =C2=A0 =C2=A0 int dma_len =3D ALIGN(info->data_size, 32);
>> + =C2=A0 =C2=A0 =C2=A0 int dma_len =3D ALIGN(info->data_size + info->oob=
_size, 32);
>
> ditto
>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->ddadr =3D DDADR_STOP;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0desc->dcmd =3D DCMD_ENDIRQEN | DCMD_WIDTH4 | =
DCMD_BURST32 | dma_len;
>> @@ -857,6 +878,8 @@ static int pxa3xx_nand_config_flash(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0uint32_t ndcr =3D 0x00000FFF; /* disable all =
interrupts */
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* calculate flash information */
>> + =C2=A0 =C2=A0 =C2=A0 info->page_size =3D f->page_size;
>> + =C2=A0 =C2=A0 =C2=A0 info->oob_buff =3D info->data_buff + f->page_size=
;
>
> And here as well
>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->oob_size =3D (f->page_size =3D=3D 2048)=
 ? 64 : 16;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (f->page_size =3D=3D =
2048) ? 4 : 2;
>>
>> @@ -881,7 +904,6 @@ static int pxa3xx_nand_config_flash(struct
>> pxa3xx_nand_info *info,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->reg_ndcr =3D ndcr;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0pxa3xx_nand_set_timing(info, &f->timing);
>> - =C2=A0 =C2=A0 =C2=A0 info->flash_info =3D f;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;
>> =C2=A0}
>>
>> @@ -917,7 +939,6 @@ static int pxa3xx_nand_detect_config(struct
>> pxa3xx_nand_info *info)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0default_flash.dfc_width =3D ndcr & NDCR_DWIDT=
H_C ? 16 : 8;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0/* set info fields needed to __readid */
>> - =C2=A0 =C2=A0 =C2=A0 info->flash_info =3D &default_flash;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->read_id_bytes =3D (default_flash.page_s=
ize =3D=3D 2048) ? 4 : 2;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0info->reg_ndcr =3D ndcr;
>>
>> @@ -1047,10 +1068,9 @@ static struct nand_ecclayout hw_largepage_ecclayo=
ut
>> =3D {
>> =C2=A0static void pxa3xx_nand_init_mtd(struct mtd_info *mtd,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 struct pxa3xx_nand_info *info)
>> =C2=A0{
>> - =C2=A0 =C2=A0 =C2=A0 const struct pxa3xx_nand_flash *f =3D info->flash=
_info;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct nand_chip *this =3D &info->nand_chip;
>>
>> - =C2=A0 =C2=A0 =C2=A0 this->options =3D (f->flash_width =3D=3D 16) ? NA=
ND_BUSWIDTH_16: 0;
>> + =C2=A0 =C2=A0 =C2=A0 this->options =3D (info->reg_ndcr & NDCR_DWIDTH_C=
) ?
>> NAND_BUSWIDTH_16: 0;
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->waitfunc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0=3D pxa3xx_nand_waitfunc;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->select_chip =C2=A0 =C2=A0 =C2=A0 =3D px=
a3xx_nand_select_chip;
>> @@ -1066,9 +1086,9 @@ static void pxa3xx_nand_init_mtd(struct mtd_info
>> *mtd,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.hwctl =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D pxa3xx_nand_ecc_hwctl;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.calculate =C2=A0 =C2=A0 =3D pxa3xx_=
nand_ecc_calculate;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.correct =C2=A0 =C2=A0 =C2=A0 =3D px=
a3xx_nand_ecc_correct;
>> - =C2=A0 =C2=A0 =C2=A0 this->ecc.size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D f->page_size;
>> + =C2=A0 =C2=A0 =C2=A0 this->ecc.size =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D info->page_size;
>>
>> - =C2=A0 =C2=A0 =C2=A0 if (f->page_size =3D=3D 2048)
>> + =C2=A0 =C2=A0 =C2=A0 if (info->page_size =3D=3D 2048)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.layout =
=3D &hw_largepage_ecclayout;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0this->ecc.layout =
=3D &hw_smallpage_ecclayout;
>> @@ -1076,7 +1096,7 @@ static void pxa3xx_nand_init_mtd(struct mtd_info
>> *mtd,
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0this->chip_delay =3D 25;
>> =C2=A0}
>>
>> -static int pxa3xx_nand_probe(struct platform_device *pdev)
>> +static int __devinit pxa3xx_nand_probe(struct platform_device *pdev)
>> =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_platform_data *pdata;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info;
>> @@ -1264,9 +1284,11 @@ static int pxa3xx_nand_resume(struct
>> platform_device *pdev)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct mtd_info *mtd =3D (struct mtd_info
>> *)platform_get_drvdata(pdev);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0struct pxa3xx_nand_info *info =3D mtd->priv;
>>
>> + =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDTR0CS0, info->ndtr0cs0);
>> + =C2=A0 =C2=A0 =C2=A0 nand_writel(info, NDTR1CS0, info->ndtr1cs0);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0clk_enable(info->clk);
>>
>> - =C2=A0 =C2=A0 =C2=A0 return pxa3xx_nand_config_flash(info, info->flash=
_info);
>> + =C2=A0 =C2=A0 =C2=A0 return 0;
>> =C2=A0}
>> =C2=A0#else
>> =C2=A0#define pxa3xx_nand_suspend =C2=A0 =C2=A0NULL
>
>
> --
> Sincerely yours,
> Mike.


For this patch set change the original c file greatly, more than half
of original code is changed,
I cannot create a patch for each change. (If so, this patch set would
grow to be a very large one. Maybe 30+?)
So some of code change is not exactly follow the patch subject...

Best regards,
Lei
