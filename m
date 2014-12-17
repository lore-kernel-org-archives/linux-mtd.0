Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1HH0-0005O8-Vq
 for linux-mtd@lists.infradead.org; Wed, 17 Dec 2014 16:16:29 +0000
Date: Wed, 17 Dec 2014 17:15:52 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Oleksij Rempel <linux@rempel-privat.de>
Subject: Re: [PATCH RFC] mtd: nand: add asm9260 NFC driver
Message-ID: <20141217171552.27fb9ce8@bbrezillon>
In-Reply-To: <1418816718-29764-2-git-send-email-linux@rempel-privat.de>
References: <1418816718-29764-1-git-send-email-linux@rempel-privat.de>
 <1418816718-29764-2-git-send-email-linux@rempel-privat.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Oleksij,

Here is a quick review (didn't look at driver's internal logic yet).

On Wed, 17 Dec 2014 12:45:18 +0100
Oleksij Rempel <linux@rempel-privat.de> wrote:

I know that I'm the last person that should be saying this (as I often
send patches without any commit message), but you should really add a
commit message.

Moreover, you should really run scripts/checkpatch.pl on your patch
before sending it. Here is the result:

"total: 29 errors, 75 warnings, 1168 lines checked"

I won't detail all these errors/warnings in this review, but please
make sure all of them are gone before sending a new version.

And please add a documentation entry for your DT binding (in a
separate patch).

> Signed-off-by: Oleksij Rempel <linux@rempel-privat.de>
> ---
>  drivers/mtd/nand/Kconfig        |    7 +
>  drivers/mtd/nand/Makefile       |    1 +
>  drivers/mtd/nand/asm9260_nand.c | 1148 +++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 1156 insertions(+)
>  create mode 100644 drivers/mtd/nand/asm9260_nand.c
>=20
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index dd10646..580a608 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -41,6 +41,13 @@ config MTD_SM_COMMON
>  	tristate
>  	default n
> =20
> +config MTD_NAND_ASM9260
> +	tristate "NFC support for ASM9260 SoC"
> +	depends on OF
> +	default n
> +	help
> +	  Enable support for the NAND controller found on Alphascale ASM9260 So=
C.
> +
>  config MTD_NAND_DENALI
>          tristate "Support Denali NAND controller"
>          depends on HAS_DMA
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 9c847e4..08d660a 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -8,6 +8,7 @@ obj-$(CONFIG_MTD_NAND_BCH)		+=3D nand_bch.o
>  obj-$(CONFIG_MTD_NAND_IDS)		+=3D nand_ids.o
>  obj-$(CONFIG_MTD_SM_COMMON) 		+=3D sm_common.o
> =20
> +obj-$(CONFIG_MTD_NAND_ASM9260)		+=3D asm9260_nand.o
>  obj-$(CONFIG_MTD_NAND_CAFE)		+=3D cafe_nand.o
>  obj-$(CONFIG_MTD_NAND_AMS_DELTA)	+=3D ams-delta.o
>  obj-$(CONFIG_MTD_NAND_DENALI)		+=3D denali.o
> diff --git a/drivers/mtd/nand/asm9260_nand.c b/drivers/mtd/nand/asm9260_n=
and.c
> new file mode 100644
> index 0000000..67dde23
> --- /dev/null
> +++ b/drivers/mtd/nand/asm9260_nand.c
> @@ -0,0 +1,1148 @@
> +/*
> + * NAND controller driver for Alphascale ASM9260, which is probably
> + * based on Evatronix NANDFLASH-CTRL IP (version unknown)
> + *
> + * Copyright (C), 2007-2013, Alphascale Tech. Co., Ltd.
> + * 		  2014 Oleksij Rempel <linux@rempel-privat.de>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/dma-mapping.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/clk.h>
> +#include <linux/of_address.h>
> +#include <linux/of_irq.h>
> +#include <linux/of_platform.h>
> +
> +#define mtd_to_priv(m)	container_of(m, struct asm9260_nand_priv, mtd)
> +
> +#define HW_CMD				0x00
> +#define BM_CMD_CMD2_S			24
> +#define BM_CMD_CMD1_S			16
> +#define BM_CMD_CMD0_S			8
> +/* 0 - ADDR0, 1 - ADDR1 */
> +#define BM_CMD_ADDR1			BIT(7)
> +/* 0 - PIO, 1 - DMA */
> +#define BM_CMD_DMA			BIT(6)
> +#define BM_CMD_CMDSEQ_S			0
> +/* FIXME: some description for SEQ? */

=46rom what I know these sequences can be easily described (they are
only describing operation sequences like READ, WRITE, ...).
Choosing a more talkative name or adding a comment would be fine.

> +#define  SEQ1				0x21 /* 6'b100001 */
> +#define  SEQ2				0x22 /* 6'b100010 */
> +#define  SEQ4				0x24 /* 6'b100100 */
> +#define  SEQ5				0x25 /* 6'b100101 */
> +#define  SEQ6				0x26 /* 6'b100110 */
> +#define  SEQ7				0x27 /* 6'b100111 */
> +#define  SEQ9				0x29 /* 6'b101001 */
> +#define  SEQ10				0x2a /* 6'b101010 */
> +#define  SEQ11				0x2b /* 6'b101011 */
> +#define  SEQ15				0x2f /* 6'b101111 */
> +#define  SEQ0				0x00 /* 6'b000000 */
> +#define  SEQ3				0x03 /* 6'b000011 */
> +#define  SEQ8				0x08 /* 6'b001000 */
> +#define  SEQ12				0x0c /* 6'b001100 */
> +#define  SEQ13				0x0d /* 6'b001101 */
> +#define  SEQ14				0x0e /* 6'b001110 */
> +#define  SEQ16				0x30 /* 6'b110000 */
> +#define  SEQ17				0x15 /* 6'b010101 */
> +#define  SEQ18				0x32 /* 6'h110010 */
> +

[...]

> +
> +/*8KB--16*512B, correction ability: 16bit--26Byte ecc*/
> +static struct nand_ecclayout asm9260_nand_oob_448 =3D {
> +	.eccbytes =3D 16*26,
> +	.eccpos =3D  {
> +			32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
> +			48, 49, 50,	51, 52, 53, 54, 55, 56, 57,	58, 59, 60, 61, 62, 63,
> +			64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
> +			80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92,	93, 94, 95,
> +
> +			96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110=
, 111,
> +			112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125,=
 126, 127,
> +			128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141,=
 142, 143,
> +			144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157,=
 158, 159,
> +
> +			160, 161, 162, 163, 164, 165, 166, 167, 168, 169, 170, 171, 172, 173,=
 174, 175,
> +			176, 177, 178, 179, 180, 181, 182, 183, 184, 185, 186, 187, 188, 189,=
 190, 191,
> +			192, 193, 194, 195, 196, 197, 198, 199, 200, 201, 202, 203, 204, 205,=
 206, 207,
> +			208, 209, 210, 211, 212, 213, 214, 215, 216, 217, 218, 219, 220, 221,=
 222, 223,
> +
> +			224, 225, 226, 227, 228, 229, 230, 231, 232, 233, 234, 235, 236, 237,=
 238, 239,
> +			240, 241, 242, 243, 244, 245, 246, 247, 248, 249, 250, 251, 252, 253,=
 254, 255,
> +			256, 257, 258, 259, 260, 261, 262, 263, 264, 265, 266, 267, 268, 269,=
 270, 271,
> +			272, 273, 274, 275, 276, 277, 278, 279, 280, 281, 282, 283, 284, 285,=
 286, 287,
> +
> +			288, 289, 290, 291, 292, 293, 294, 295, 296, 297, 298, 299, 300, 301,=
 302, 303,
> +			304, 305, 306, 307, 308, 309, 310, 311, 312, 313, 314, 315, 316, 317,=
 318, 319,
> +			320, 321, 322, 323, 324, 325, 326, 327, 328, 329, 330, 331, 332, 333,=
 334, 335,
> +			336, 337, 338, 339, 340, 341, 342, 343, 344, 345, 346, 347, 348, 349,=
 350, 351,
> +
> +			352, 353, 354, 355, 356, 357, 358, 359, 360, 361, 362, 363, 364, 365,=
 366, 367,
> +			368, 369, 370, 371, 372, 373, 374, 375, 376, 377, 378, 379, 380, 381,=
 382, 383,
> +			384, 385, 386, 387, 388, 389, 390, 391, 392, 393, 394, 395, 396, 397,=
 398 ,399,
> +			400, 401, 402, 403, 404, 405, 406, 407, 408, 409, 410, 411, 412, 413,=
 414, 415,
> +
> +			416, 417, 418, 419, 420, 421, 422, 423, 424, 425, 426, 427, 428, 429,=
 430, 431,
> +			432, 433, 434, 435, 436, 437, 438, 439, 440, 441, 442, 443, 444, 445,=
 446, 447},
> +	.oobfree =3D {{2, 30}}
> +};

Do you really have to keep these ECC layouts as static definitions ?
=46rom what I see here you're reserving the last OOB bytes for ECC (the
number of reserved ECC bytes depend on ECC strength), and it should
be pretty easy to build it dynamically...

> +
> +/**
> + * struct ecc_info - ASAP1826T ECC INFO Structure
> + * @ecc_cap:	The ECC module correction ability.
> + * @ecc_threshold:		The acceptable errors level
> + * @ecc_bytes_per_sector:		ECC bytes per sector
> + */
> +struct ecc_info {
> +	int ecc_cap;
> +	int ecc_threshold;

Can you name this field ecc_strength, so that we clearly see the
relationship between the ecc->strength field and this one ?

> +	int ecc_bytes_per_sector;
> +};
> +
> +/*
> +*	ECC info list
> +*
> +*	ecc_cap, ecc_threshold, ecc bytes per sector
> +*/
> +struct ecc_info ecc_info_table[8] =3D {
> +	{ECC_CAP_2, ECC_THRESHOLD_2, 4},
> +	{ECC_CAP_4, ECC_THRESHOLD_4, 7},
> +	{ECC_CAP_6, ECC_THRESHOLD_6, 10},
> +	{ECC_CAP_8, ECC_THRESHOLD_8, 13},
> +	{ECC_CAP_10, ECC_THRESHOLD_10, 17},
> +	{ECC_CAP_12, ECC_THRESHOLD_12, 20},
> +	{ECC_CAP_14, ECC_THRESHOLD_14, 23},
> +	{ECC_CAP_16, ECC_THRESHOLD_15, 26},
> +};
> +
> +static void asm9260_reg_rmw(struct asm9260_nand_priv *priv,
> +		u32 reg_offset, u32 set, u32 clr)
> +{
> +	u32 val;
> +
> +	val =3D ioread32(priv->base + reg_offset);
> +	val &=3D ~clr;
> +	val |=3D set;
> +	iowrite32(val, priv->base + reg_offset);
> +}
> +
> +static void asm9260_select_chip(struct mtd_info *mtd, int chip)
> +{
> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
> +
> +	if (chip =3D=3D -1)
> +		iowrite32(BM_MEM_CTRL_WP_STATE_MASK, priv->base + HW_MEM_CTRL);
> +	else
> +		iowrite32(BM_MEM_CTRL_UNWPn(chip) | BM_MEM_CTRL_CEn(chip),
> +			  priv->base + HW_MEM_CTRL);
> +}
> +
> +static void asm9260_cmd_ctrl(struct mtd_info *mtd, int dat, unsigned int=
 ctrl)
> +{
> +}

If you don't do anything in this function just drop it, though I'd
prefer to have this one implemented instead of the
asm9260_nand_command_lp and asm9260_nand_command functions (if
possible).

> +
> +/* TODO: 3 commands are supported by HW. 3-d can be used for TWO PLANE. =
*/
> +static void asm9260_nand_cmd_prep(struct asm9260_nand_priv *priv,
> +		u8 cmd0, u8 cmd1, u8 cmd2, u8 seq)
> +{
> +	priv->cmd_cache  =3D (cmd0 << BM_CMD_CMD0_S) | (cmd1 << BM_CMD_CMD1_S);
> +	priv->cmd_cache |=3D seq << BM_CMD_CMDSEQ_S;
> +}
> +
> +static dma_addr_t asm9260_nand_dma_set(struct mtd_info *mtd, void *buf,
> +		enum dma_data_direction dir, size_t size)
> +{
> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
> +	dma_addr_t dma_addr;
> +
> +	dma_addr =3D dma_map_single(priv->dev, buf, size, dir);
> +	if (dma_mapping_error(priv->dev, dma_addr)) {
> +		dev_err(priv->dev, "dma_map_single failed!\n");
> +		return dma_addr;
> +
> +	}
> +
> +	iowrite32(dma_addr, priv->base + HW_DMA_ADDR);
> +	iowrite32(size, priv->base + HW_DMA_CNT);
> +	iowrite32(BM_DMA_CTRL_START
> +		  | (dir =3D=3D DMA_FROM_DEVICE ? BM_DMA_CTRL_FROM_DEVICE : 0)
> +			/* TODO: check different DMA_BURST_INCR16 settings */
> +		  | (DMA_BURST_INCR16 << BM_DMA_CTRL_BURST_S),
> +		  priv->base + HW_DMA_CTRL);
> +	return dma_addr;
> +}
> +
> +/* complete command request */
> +static void asm9260_nand_cmd_comp(struct mtd_info *mtd, int dma)
> +{
> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
> +	int timeout;
> +	u32 cmd;
> +
> +	if (!priv->cmd_cache)
> +		return;
> +
> +	if (dma) {
> +		priv->cmd_cache |=3D BM_CMD_DMA;
> +		priv->irq_done =3D 0;
> +		/* FIXME: should we allow all MEM* device? */
> +		iowrite32(BM_INT_MEM0_RDY, priv->base + HW_INT_MASK);
> +	}
> +
> +	iowrite32(priv->cmd_cache, priv->base + HW_CMD);
> +	cmd =3D priv->cmd_cache;
> +	priv->cmd_cache =3D 0;
> +
> +	if (dma) {
> +		struct nand_chip *nand =3D &priv->nand;
> +
> +		/* FIXME: change timeout value */
> +		timeout =3D wait_event_timeout(nand->controller->wq,
> +				priv->irq_done, 1 * HZ);
> +		if (timeout <=3D 0) {
> +			dev_info(priv->dev,
> +					"Request 0x%08x timed out\n", cmd);
> +			/* TODO: Do something useful here? */
> +			/* FIXME: if we have problems on DMA or PIO, we need to
> +			 * reset NFC. On asm9260 it is possible only with global
> +			 * reset register. How can we use it here? */
> +		}
> +	} else
> +		nand_wait_ready(mtd);
> +}
> +
> +static int asm9260_nand_dev_ready(struct mtd_info *mtd)
> +{
> +	struct asm9260_nand_priv *priv =3D mtd_to_priv(mtd);
> +	u32 tmp;
> +
> +	tmp =3D ioread32(priv->base + HW_STATUS);
> +
> +	/* FIXME: use define instead of 0x1 */
> +	return (!(tmp & BM_CTRL_NFC_BUSY) &&
> +			(tmp & 0x1));

As stated in your FIXME, add a macro for the 0x1 value.

> +}
> +
> +static void asm9260_nand_ctrl(struct asm9260_nand_priv *priv, u32 set)
> +{
> +	iowrite32(priv->ctrl_cache | set, priv->base + HW_CTRL);
> +}
> +

[...]

> +
> +static irqreturn_t asm9260_nand_irq(int irq, void *device_info)
> +{
> +	struct asm9260_nand_priv *priv =3D device_info;
> +	struct nand_chip *nand =3D &priv->nand;
> +	u32 status;
> +
> +	status =3D ioread32(priv->base + HW_INT_STATUS);
> +	if (!status)
> +		return IRQ_NONE;
> +
> +	iowrite32(0, priv->base + HW_INT_MASK);
> +	iowrite32(0, priv->base + HW_INT_STATUS);
> +        priv->irq_done =3D 1;
> +        wake_up(&nand->controller->wq);
> +
> +        return IRQ_HANDLED;
> +}
> +
> +static void __init asm9260_nand_init_chip(struct nand_chip *nand_chip)
> +{
> +	nand_chip->select_chip	=3D asm9260_select_chip;
> +	nand_chip->cmd_ctrl	=3D asm9260_cmd_ctrl;

AFAIR, you don't need to specify this one as you're already specifying
select_chip and cmdfunc.

> +	nand_chip->cmdfunc	=3D asm9260_nand_command_lp;
> +	nand_chip->read_byte	=3D asm9260_nand_read_byte;
> +	nand_chip->read_word	=3D asm9260_nand_read_word;
> +	nand_chip->read_buf	=3D asm9260_nand_read_buf;
> +	nand_chip->write_buf	=3D asm9260_nand_write_buf;
> +
> +	nand_chip->dev_ready	=3D asm9260_nand_dev_ready;
> +	nand_chip->chip_delay	=3D 100;
> +
> +	nand_chip->ecc.mode	=3D NAND_ECC_HW;
> +
> +	nand_chip->ecc.write_page	=3D asm9260_nand_write_page_hwecc;
> +	nand_chip->ecc.read_page	=3D asm9260_nand_read_page_hwecc;
> +}
> +
> +static void __init asm9260_nand_cached_config(struct asm9260_nand_priv *=
priv)
> +{
> +	struct nand_chip *nand =3D &priv->nand;
> +	struct mtd_info *mtd =3D &priv->mtd;
> +	u32 addr_cycles, col_cycles, block_shift;
> +
> +	/* FIXME: remove it or replace it */
> +	/* FIXME: these complete part need fixing  */
> +	block_shift =3D __ffs(mtd->erasesize) - nand->page_shift;
> +	col_cycles  =3D 2;
> +	addr_cycles =3D col_cycles +
> +		(((mtd->size >> mtd->writesize) > 65536) ? 3 : 2);
> +
> +	priv->mem_status_mask =3D BM_CTRL_MEM0_RDY;
> +	priv->ctrl_cache =3D BM_CTRL_READ_STAT
> +		| addr_cycles << BM_CTRL_ADDR_CYCLE1_S
> +		| ((nand->page_shift - 8) & 0x7) << BM_CTRL_PAGE_SIZE_S
> +		| ((block_shift - 5) & 0x3) << BM_CTRL_BLOCK_SIZE_S
> +		| BM_CTRL_INT_EN
> +		| addr_cycles << BM_CTRL_ADDR_CYCLE0_S;
> +
> +	iowrite32(priv->ecc_threshold << BM_ECC_ERR_THRESHOLD_S
> +			| priv->ecc_cap << BM_ECC_CAP_S,
> +			priv->base + HW_ECC_CTRL);
> +	iowrite32(mtd->writesize + priv->spare_size,
> +			priv->base + HW_ECC_OFFSET);
> +
> +}
> +
> +static void __init asm9260_nand_timing_config(struct asm9260_nand_priv *=
priv)
> +{
> +	u32 twhr;
> +	u32 trhw;
> +	u32 trwh;
> +	u32 trwp;
> +	u32 tadl =3D 0;
> +	u32 tccs =3D 0;
> +	u32 tsync =3D 0;
> +	u32 trr =3D 0;
> +	u32 twb =3D 0;
> +
> +	trwh =3D 1; //TWH;
> +	trwp =3D 1; //TWP;
> +	iowrite32((trwh << 4) | (trwp), priv->base + HW_TIMING_ASYN);
> +
> +	twhr =3D 2;
> +	trhw =3D 4;
> +	iowrite32((twhr << 24) | (trhw << 16)
> +		| (tadl << 8) | (tccs), priv->base + HW_TIM_SEQ_0);
> +
> +	iowrite32((tsync << 16) | (trr << 9) | (twb),
> +			priv->base + HW_TIM_SEQ_1);

You should take NAND chip specific timings here, not randomly assigning
values.
Take a look at [1].

> +}
> +
> +static int __init asm9260_ecc_cap_select(struct asm9260_nand_priv *priv,
> +		int nand_page_size, int nand_oob_size)
> +{
> +	int ecc_bytes =3D 0;
> +	int i;
> +
> +	for (i=3D(ARRAY_SIZE(ecc_info_table) - 1); i>=3D0; i--)
> +	{
> +		if ((nand_oob_size - ecc_info_table[i].ecc_bytes_per_sector
> +					* (nand_page_size >> 9)) > (28 + 2))
> +		{
> +			priv->ecc_cap =3D
> +				ecc_info_table[i].ecc_cap;
> +			priv->ecc_threshold =3D
> +				ecc_info_table[i].ecc_threshold;
> +			ecc_bytes =3D ecc_info_table[i].ecc_bytes_per_sector
> +				* (nand_page_size >> 9);
> +			break;
> +		}


You should really select the ECC config based on ECC strength and ECC
step instead of choosing it from the OOB size...

> +	}
> +
> +	return ecc_bytes;
> +}
> +
> +static void __init asm9260_nand_ecc_conf(struct asm9260_nand_priv *priv)
> +{
> +	struct nand_chip *nand =3D &priv->nand;
> +	struct mtd_info *mtd =3D &priv->mtd;
> +
> +	if (nand->ecc.mode =3D=3D NAND_ECC_HW) {
> +		/* ECC is calculated for the whole page (1 step) */
> +		nand->ecc.size =3D mtd->writesize;
> +
> +		/* set ECC page size and oob layout */
> +		switch (mtd->writesize) {
> +			case 2048:
> +				nand->ecc.bytes  =3D
> +					asm9260_ecc_cap_select(priv, 2048,
> +							mtd->oobsize);
> +				nand->ecc.layout =3D &asm9260_nand_oob_64;
> +				nand->ecc.strength =3D 4;
> +				break;
> +
> +			case 4096:
> +				nand->ecc.bytes =3D
> +					asm9260_ecc_cap_select(priv, 4096,
> +							mtd->oobsize);
> +
> +				if (mtd->oobsize =3D=3D 128) {
> +					nand->ecc.layout =3D
> +						&asm9260_nand_oob_128;
> +					nand->ecc.strength =3D 6;
> +				} else if (mtd->oobsize =3D=3D 218) {
> +					nand->ecc.layout =3D
> +						&asm9260_nand_oob_218;
> +					nand->ecc.strength =3D 14;
> +				} else if (mtd->oobsize =3D=3D 224) {
> +					nand->ecc.layout =3D
> +						&asm9260_nand_oob_224;
> +					nand->ecc.strength =3D 14;
> +				} else
> +					dev_err(priv->dev, "Unsupported Oob size [%d].\n",
> +							mtd->oobsize);
> +
> +				break;
> +
> +			case 8192:
> +				nand->ecc.bytes =3D
> +					asm9260_ecc_cap_select(priv, 8192,
> +							mtd->oobsize);
> +
> +				if (mtd->oobsize =3D=3D 256) {
> +					nand->ecc.layout =3D
> +						&asm9260_nand_oob_256;
> +					nand->ecc.strength =3D 8;
> +				} else if (mtd->oobsize =3D=3D 436) {
> +					nand->ecc.layout =3D
> +						&asm9260_nand_oob_436;
> +					nand->ecc.strength =3D 14;
> +				} else if (mtd->oobsize =3D=3D 448) {
> +					nand->ecc.layout =3D
> +						&asm9260_nand_oob_448;
> +					nand->ecc.strength =3D 16;
> +				} else
> +					dev_err(priv->dev, "Unsupported Oob size [%d].\n",
> +							mtd->oobsize);
> +				break;
> +
> +			default:
> +				dev_err(priv->dev, "Unsupported Page size [%d].\n",
> +						mtd->writesize);
> +				break;
> +		}
> +	}

Again, choose ECC config according to ECC requirements instead of using
as much bytes as possible.

> +
> +	priv->spare_size =3D mtd->oobsize - nand->ecc.bytes;
> +}
> +
> +static int __init asm9260_nand_get_dt_clks(struct asm9260_nand_priv *pri=
v)
> +{
> +	struct device_node *np =3D priv->dev->of_node;
> +	int clk_idx =3D 0, err;
> +
> +	priv->clk =3D of_clk_get(np, clk_idx);

Use devm_clk_get + a name, and specify a "clock-names" property in your
DT, instead of using clk indexes.

> +	if (IS_ERR(priv->clk))
> +		goto out_err;
> +
> +	/* configure AHB clock */
> +	clk_idx =3D 1;
> +	priv->clk_ahb =3D of_clk_get(np, clk_idx);
> +	if (IS_ERR(priv->clk_ahb))
> +		goto out_err;
> +
> +	err =3D clk_prepare_enable(priv->clk_ahb);
> +	if (err)
> +		dev_err(priv->dev, "Failed to enable ahb_clk!\n");
> +
> +	err =3D clk_set_rate(priv->clk, clk_get_rate(priv->clk_ahb));
> +	if (err)

Disable (I mean disable_unprepare of course) clk_ahb in case of error.

> +		dev_err(priv->dev, "Failed to set rate!\n");
> +
> +	err =3D clk_prepare_enable(priv->clk);
> +	if (err)

Ditto

> +		dev_err(priv->dev, "Failed to enable clk!\n");
> +
> +	return 0;
> +out_err:
> +	dev_err(priv->dev, "%s: Failed to get clk (%i)\n", __func__, clk_idx);
> +	return 1;
> +}
> +
> +static int __init asm9260_nand_probe(struct platform_device *pdev)
> +{
> +	struct asm9260_nand_priv *priv;
> +	struct nand_chip *nand;
> +	struct mtd_info *mtd;
> +	struct device_node *np =3D pdev->dev.of_node;
> +	int ret;
> +	unsigned int irq;
> +
> +	priv =3D devm_kzalloc(&pdev->dev, sizeof(struct asm9260_nand_priv),
> +			GFP_KERNEL);
> +	if (!priv) {
> +		dev_err(&pdev->dev, "Allocation filed!\n");
> +		return -ENOMEM;
> +	}
> +
> +	priv->base =3D of_io_request_and_map(np, 0, np->full_name);

Use platform_get_resource + devm_ioremap_resource here (it does the
request and ioremap).

> +        if (!priv->base) {
> +		dev_err(&pdev->dev, "Unable to map resource!\n");
> +		return -EINVAL;
> +	}
> +
> +	priv->dev =3D &pdev->dev;
> +	nand =3D &priv->nand;
> +	nand->priv =3D priv;
> +
> +	platform_set_drvdata(pdev, priv);
> +	mtd =3D &priv->mtd;
> +	mtd->priv =3D nand;
> +	mtd->owner =3D THIS_MODULE;
> +	mtd->name =3D dev_name(&pdev->dev);
> +
> +	priv->read_cache_cnt =3D 0;
> +        priv->irq_done =3D 0;
> +
> +	/* FIXME: add more dt options? for example chip number? */

Yes, if you support multiple chips, then you should specify which chip
is controller by which CS in your DT.

> +	if (asm9260_nand_get_dt_clks(priv))
> +		return -ENODEV;
> +
> +	irq =3D irq_of_parse_and_map(np, 0);

Use plaform_get_irq.

> +	if (!irq)
> +		return -ENODEV;
> +
> +	iowrite32(0, priv->base + HW_INT_MASK);
> +	ret =3D devm_request_irq(priv->dev, irq, asm9260_nand_irq,
> +				IRQF_ONESHOT | IRQF_SHARED,
> +				dev_name(&pdev->dev), priv);
> +
> +	asm9260_nand_init_chip(nand);
> +
> +	asm9260_nand_timing_config(priv);
> +
> +	/* first scan to find the device and get the page size */
> +	if (nand_scan_ident(mtd, 1, NULL)) {
> +		dev_err(&pdev->dev, "scan_ident filed!\n");
> +		return -ENXIO;
> +	}
> +
> +	asm9260_nand_ecc_conf(priv);
> +	asm9260_nand_cached_config(priv);
> +
> +	/* second phase scan */
> +	if (nand_scan_tail(mtd)) {
> +		dev_err(&pdev->dev, "scan_tail filed!\n");
> +		return -ENXIO;
> +	}
> +
> +
> +	ret =3D mtd_device_parse_register(mtd, NULL,
> +			&(struct mtd_part_parser_data) {
> +				.of_node =3D pdev->dev.of_node,
> +			},
> +			NULL, 0);
> +
> +	return ret;
> +}
> +
> +
> +static int asm9260_nand_remove(struct platform_device *pdev)
> +{
> +	struct asm9260_nand_priv *priv =3D platform_get_drvdata(pdev);
> +

Disable your clks here.

> +	nand_release(&priv->mtd);
> +
> +	return 0;
> +}
> +
> +static const struct of_device_id asm9260_nand_match[] =3D
> +{
> +	{
> +		.compatible   =3D "alphascale,asm9260-nand",
> +	},
> +	{},
> +};
> +MODULE_DEVICE_TABLE(of, asm9260_nand_match);
> +
> +static struct platform_driver asm9260_nand_driver =3D {
> +	.probe		=3D asm9260_nand_probe,
> +	.remove		=3D asm9260_nand_remove,
> +	.driver		=3D {
> +		.name	=3D "asm9260_nand",
> +		.owner	=3D THIS_MODULE,
> +		.of_match_table =3D of_match_ptr(asm9260_nand_match),
> +	},
> +};
> +
> +module_platform_driver(asm9260_nand_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("ASM9260 NAND driver");

That's all for now, but that's really a quick review.
I'll try to have a closer look at cmdfunc, read and write functions
later.

Best Regards,

Boris

[1]http://lxr.free-electrons.com/source/include/linux/mtd/nand.h#L1014

--=20
Boris Brezillon, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
