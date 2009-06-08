Received: from yw-out-1718.google.com ([74.125.46.153])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MDYS2-0006tC-0c
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 06:35:28 +0000
Received: by yw-out-1718.google.com with SMTP id 9so1761738ywk.72
	for <linux-mtd@lists.infradead.org>;
	Sun, 07 Jun 2009 23:35:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <E1MCedl-0006ua-8j@bombadil.infradead.org>
References: <E1MCedl-0006ua-8j@bombadil.infradead.org>
Date: Mon, 8 Jun 2009 12:05:20 +0530
Message-ID: <9bde694e0906072335i625d75dsfdf97b9609a8444e@mail.gmail.com>
Subject: Re: mtd: Flex-OneNAND support
From: naveen yadav <yad.naveen@gmail.com>
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I want to know in version 2.6.18. is samsung flexi one nand support is
there or not ?

Best Regards
Naveen

On Sat, Jun 6, 2009 at 12:29 AM, Linux-MTD Mailing
List<linux-mtd@lists.infradead.org> wrote:
> Gitweb: =A0 =A0 http://git.infradead.org/?p=3Dmtd-2.6.git;a=3Dcommit;h=3D=
5988af2319781bc8e0ce418affec4e09cfa77907
> Commit: =A0 =A0 5988af2319781bc8e0ce418affec4e09cfa77907
> Parent: =A0 =A0 67ce04bf2746f8a1f8c2a104b313d20c63f68378
> Author: =A0 =A0 Rohit Hagargundgi <h.rohit@samsung.com>
> AuthorDate: Tue May 12 13:46:57 2009 -0700
> Committer: =A0David Woodhouse <David.Woodhouse@intel.com>
> CommitDate: Fri Jun 5 18:59:21 2009 +0100
>
> =A0 =A0mtd: Flex-OneNAND support
>
> =A0 =A0Add support for Samsung Flex-OneNAND devices.
>
> =A0 =A0Flex-OneNAND combines SLC and MLC technologies into a single devic=
e.
> =A0 =A0SLC area provides increased reliability and speed, suitable for st=
oring
> =A0 =A0code such as bootloader, kernel and root file system. =A0MLC area
> =A0 =A0provides high density and is suitable for storing user data.
>
> =A0 =A0SLC and MLC regions can be configured through kernel parameter.
>
> =A0 =A0[akpm@linux-foundation.org: export flexoand_region and onenand_add=
r]
> =A0 =A0Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
> =A0 =A0Signed-off-by: Kyungmin Park <kyungmin.park@samsung.com>
> =A0 =A0Cc: Vishak G <vishak.g@samsung.com>
> =A0 =A0Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> =A0 =A0Signed-off-by: David Woodhouse <David.Woodhouse@intel.com>
> ---
> =A0Documentation/kernel-parameters.txt | =A0 10 +
> =A0drivers/mtd/onenand/onenand_base.c =A0| =A0857 +++++++++++++++++++++++=
+++++++++---
> =A0drivers/mtd/onenand/onenand_bbt.c =A0 | =A0 14 +-
> =A0drivers/mtd/onenand/onenand_sim.c =A0 | =A0 81 +++-
> =A0include/linux/mtd/onenand.h =A0 =A0 =A0 =A0 | =A0 18 +
> =A0include/linux/mtd/onenand_regs.h =A0 =A0| =A0 20 +-
> =A06 files changed, 913 insertions(+), 87 deletions(-)
>
> diff --git a/Documentation/kernel-parameters.txt b/Documentation/kernel-p=
arameters.txt
> index e87bdbf..12df135 100644
> --- a/Documentation/kernel-parameters.txt
> +++ b/Documentation/kernel-parameters.txt
> @@ -1380,6 +1380,16 @@ and is between 256 and 4096 characters. It is defi=
ned in the file
> =A0 =A0 =A0 =A0mtdparts=3D =A0 =A0 =A0 [MTD]
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0See drivers/mtd/cmdlinepar=
t.c.
>
> + =A0 =A0 =A0 onenand.bdry=3D =A0 [HW,MTD] Flex-OneNAND Boundary Configur=
ation
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 Format: [die0_boundary][,di=
e0_lock][,die1_boundary][,die1_lock]
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 boundary - index of last SL=
C block on Flex-OneNAND.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0The =
remaining blocks are configured as MLC blocks.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 lock =A0 =A0 - Configure if=
 Flex-OneNAND boundary should be locked.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0Once=
 locked, the boundary cannot be changed.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A01 in=
dicates lock status, 0 indicates unlock status.
> +
> =A0 =A0 =A0 =A0mtdset=3D =A0 =A0 =A0 =A0 [ARM]
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ARM/S3C2412 JIVE boot cont=
rol
>
> diff --git a/drivers/mtd/onenand/onenand_base.c b/drivers/mtd/onenand/one=
nand_base.c
> index 2346857..8d4c9c2 100644
> --- a/drivers/mtd/onenand/onenand_base.c
> +++ b/drivers/mtd/onenand/onenand_base.c
> @@ -9,6 +9,10 @@
> =A0* =A0 =A0 auto-placement support, read-while load support, various fix=
es
> =A0* =A0 =A0 Copyright (C) Nokia Corporation, 2007
> =A0*
> + * =A0 =A0 Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohi=
t at samsung.com>
> + * =A0 =A0 Flex-OneNAND support
> + * =A0 =A0 Copyright (C) Samsung Electronics, 2008
> + *
> =A0* This program is free software; you can redistribute it and/or modify
> =A0* it under the terms of the GNU General Public License version 2 as
> =A0* published by the Free Software Foundation.
> @@ -27,6 +31,30 @@
>
> =A0#include <asm/io.h>
>
> +/* Default Flex-OneNAND boundary and lock respectively */
> +static int flex_bdry[MAX_DIES * 2] =3D { -1, 0, -1, 0 };
> +
> +/**
> + * =A0onenand_oob_128 - oob info for Flex-Onenand with 4KB page
> + * =A0For now, we expose only 64 out of 80 ecc bytes
> + */
> +static struct nand_ecclayout onenand_oob_128 =3D {
> + =A0 =A0 =A0 .eccbytes =A0 =A0 =A0 =3D 64,
> + =A0 =A0 =A0 .eccpos =A0 =A0 =A0 =A0 =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 6, 7, 8, 9, 10, 11, 12, 13, 14, 15,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 22, 23, 24, 25, 26, 27, 28, 29, 30, 31,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 38, 39, 40, 41, 42, 43, 44, 45, 46, 47,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 54, 55, 56, 57, 58, 59, 60, 61, 62, 63,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 86, 87, 88, 89, 90, 91, 92, 93, 94, 95,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 102, 103, 104, 105
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 },
> + =A0 =A0 =A0 .oobfree =A0 =A0 =A0 =A0=3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {2, 4}, {18, 4}, {34, 4}, {50, 4},
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 {66, 4}, {82, 4}, {98, 4}, {114, 4}
> + =A0 =A0 =A0 }
> +};
> +
> =A0/**
> =A0* onenand_oob_64 - oob info for large (2KB) page
> =A0*/
> @@ -65,6 +93,14 @@ static const unsigned char ffchars[] =3D {
> =A0 =A0 =A0 =A00xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 48 */
> =A0 =A0 =A0 =A00xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> =A0 =A0 =A0 =A00xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 64 */
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 80 */
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 96 */
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 112 */
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff,
> + =A0 =A0 =A0 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, /* 128 */
> =A0};
>
> =A0/**
> @@ -171,6 +207,70 @@ static int onenand_buffer_address(int dataram1, int =
sectors, int count)
> =A0}
>
> =A0/**
> + * flexonenand_block- For given address return block number
> + * @param this =A0 =A0 =A0 =A0 - OneNAND device structure
> + * @param addr =A0 =A0 =A0 =A0 - Address for which block number is neede=
d
> + */
> +static unsigned flexonenand_block(struct onenand_chip *this, loff_t addr=
)
> +{
> + =A0 =A0 =A0 unsigned boundary, blk, die =3D 0;
> +
> + =A0 =A0 =A0 if (ONENAND_IS_DDP(this) && addr >=3D this->diesize[0]) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 die =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr -=3D this->diesize[0];
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 boundary =3D this->boundary[die];
> +
> + =A0 =A0 =A0 blk =3D addr >> (this->erase_shift - 1);
> + =A0 =A0 =A0 if (blk > boundary)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 blk =3D (blk + boundary + 1) >> 1;
> +
> + =A0 =A0 =A0 blk +=3D die ? this->density_mask : 0;
> + =A0 =A0 =A0 return blk;
> +}
> +
> +inline unsigned onenand_block(struct onenand_chip *this, loff_t addr)
> +{
> + =A0 =A0 =A0 if (!FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return addr >> this->erase_shift;
> + =A0 =A0 =A0 return flexonenand_block(this, addr);
> +}
> +
> +/**
> + * flexonenand_addr - Return address of the block
> + * @this: =A0 =A0 =A0 =A0 =A0 =A0 =A0OneNAND device structure
> + * @block: =A0 =A0 =A0 =A0 =A0 =A0 Block number on Flex-OneNAND
> + *
> + * Return address of the block
> + */
> +static loff_t flexonenand_addr(struct onenand_chip *this, int block)
> +{
> + =A0 =A0 =A0 loff_t ofs =3D 0;
> + =A0 =A0 =A0 int die =3D 0, boundary;
> +
> + =A0 =A0 =A0 if (ONENAND_IS_DDP(this) && block >=3D this->density_mask) =
{
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block -=3D this->density_mask;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 die =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ofs =3D this->diesize[0];
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 boundary =3D this->boundary[die];
> + =A0 =A0 =A0 ofs +=3D (loff_t)block << (this->erase_shift - 1);
> + =A0 =A0 =A0 if (block > (boundary + 1))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ofs +=3D (loff_t)(block - boundary - 1) << =
(this->erase_shift - 1);
> + =A0 =A0 =A0 return ofs;
> +}
> +
> +loff_t onenand_addr(struct onenand_chip *this, int block)
> +{
> + =A0 =A0 =A0 if (!FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return (loff_t)block << this->erase_shift;
> + =A0 =A0 =A0 return flexonenand_addr(this, block);
> +}
> +EXPORT_SYMBOL(onenand_addr);
> +
> +/**
> =A0* onenand_get_density - [DEFAULT] Get OneNAND density
> =A0* @param dev_id =A0 =A0 =A0 OneNAND device ID
> =A0*
> @@ -183,6 +283,22 @@ static inline int onenand_get_density(int dev_id)
> =A0}
>
> =A0/**
> + * flexonenand_region - [Flex-OneNAND] Return erase region of addr
> + * @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> + * @param addr =A0 =A0 =A0 =A0 address whose erase region needs to be id=
entified
> + */
> +int flexonenand_region(struct mtd_info *mtd, loff_t addr)
> +{
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 for (i =3D 0; i < mtd->numeraseregions; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (addr < mtd->eraseregions[i].offset)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 return i - 1;
> +}
> +EXPORT_SYMBOL(flexonenand_region);
> +
> +/**
> =A0* onenand_command - [DEFAULT] Send command to OneNAND device
> =A0* @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> =A0* @param cmd =A0 =A0 =A0 =A0 =A0the command to be sent
> @@ -207,16 +323,28 @@ static int onenand_command(struct mtd_info *mtd, in=
t cmd, loff_t addr, size_t le
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0page =3D -1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> + =A0 =A0 =A0 case FLEXONENAND_CMD_PI_ACCESS:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* addr contains die index */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D addr * this->density_mask;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D -1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> =A0 =A0 =A0 =A0case ONENAND_CMD_ERASE:
> =A0 =A0 =A0 =A0case ONENAND_CMD_BUFFERRAM:
> =A0 =A0 =A0 =A0case ONENAND_CMD_OTP_ACCESS:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D (int) (addr >> this->erase_shift)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D onenand_block(this, addr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0page =3D -1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> + =A0 =A0 =A0 case FLEXONENAND_CMD_READ_PI:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cmd =3D ONENAND_CMD_READ;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D addr * this->density_mask;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> =A0 =A0 =A0 =A0default:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D (int) (addr >> this->erase_shift)=
;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D (int) (addr >> this->page_shift);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block =3D onenand_block(this, addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 page =3D (int) (addr - onenand_addr(this, b=
lock)) >> this->page_shift;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_2PLANE(this)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Make the even block num=
ber */
> @@ -236,7 +364,7 @@ static int onenand_command(struct mtd_info *mtd, int =
cmd, loff_t addr, size_t le
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0value =3D onenand_bufferram_address(this, =
block);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->write_word(value, this->base + ONENA=
ND_REG_START_ADDRESS2);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_2PLANE(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_MLC(this) || ONENAND_IS_2PLA=
NE(this))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* It is always BufferRAM0=
 */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_BUFFERRAM0(thi=
s);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> @@ -258,13 +386,18 @@ static int onenand_command(struct mtd_info *mtd, in=
t cmd, loff_t addr, size_t le
>
> =A0 =A0 =A0 =A0if (page !=3D -1) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Now we use page size operation */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int sectors =3D 4, count =3D 4;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int sectors =3D 0, count =3D 0;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int dataram;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0switch (cmd) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 case FLEXONENAND_CMD_RECOVER_LSB:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case ONENAND_CMD_READ:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0case ONENAND_CMD_READOOB:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dataram =3D ONENAND_SET_NEX=
T_BUFFERRAM(this);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_MLC(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* It is al=
ways BufferRAM0 */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dataram =3D=
 ONENAND_SET_BUFFERRAM0(this);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 dataram =3D=
 ONENAND_SET_NEXT_BUFFERRAM(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0default:
> @@ -293,6 +426,30 @@ static int onenand_command(struct mtd_info *mtd, int=
 cmd, loff_t addr, size_t le
> =A0}
>
> =A0/**
> + * onenand_read_ecc - return ecc status
> + * @param this =A0 =A0 =A0 =A0 onenand chip structure
> + */
> +static inline int onenand_read_ecc(struct onenand_chip *this)
> +{
> + =A0 =A0 =A0 int ecc, i, result =3D 0;
> +
> + =A0 =A0 =A0 if (!FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return this->read_word(this->base + ONENAND=
_REG_ECC_STATUS);
> +
> + =A0 =A0 =A0 for (i =3D 0; i < 4; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ecc =3D this->read_word(this->base + ONENAN=
D_REG_ECC_STATUS + i);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (likely(!ecc))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ecc & FLEXONENAND_UNCORRECTABLE_ERROR)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ONENAND_ECC_2BIT_ALL=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 result =3D ONENAND_ECC_1BIT=
_ALL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return result;
> +}
> +
> +/**
> =A0* onenand_wait - [DEFAULT] wait until the command is done
> =A0* @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> =A0* @param state =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0state to select the max.=
 timeout value
> @@ -331,14 +488,14 @@ static int onenand_wait(struct mtd_info *mtd, int s=
tate)
> =A0 =A0 =A0 =A0 * power off recovery (POR) test, it should read ECC statu=
s first
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0if (interrupt & ONENAND_INT_READ) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ecc =3D this->read_word(this->base + ON=
ENAND_REG_ECC_STATUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ecc =3D onenand_read_ecc(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ecc) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ecc & ONENAND_ECC_2BIT=
_ALL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KER=
N_ERR "onenand_wait: ECC error =3D 0x%04x\n", ecc);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->ecc_s=
tats.failed++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EB=
ADMSG;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0} else if (ecc & ONENAND_E=
CC_1BIT_ALL) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_INFO "onenand_wait: correctable ECC error =3D 0x%04x\n", ecc);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_DEBUG "onenand_wait: correctable ECC error =3D 0x%04x\n", ecc);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->ecc_s=
tats.corrected++;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> @@ -656,7 +813,7 @@ static int onenand_check_bufferram(struct mtd_info *m=
td, loff_t addr)
>
> =A0 =A0 =A0 =A0if (found && ONENAND_IS_DDP(this)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Select DataRAM for DDP */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int block =3D (int) (addr >> this->erase_sh=
ift);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int block =3D onenand_block(this, addr);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int value =3D onenand_bufferram_address(th=
is, block);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->write_word(value, this->base + ONENA=
ND_REG_START_ADDRESS2);
> =A0 =A0 =A0 =A0}
> @@ -816,6 +973,149 @@ static int onenand_transfer_auto_oob(struct mtd_inf=
o *mtd, uint8_t *buf, int col
> =A0}
>
> =A0/**
> + * onenand_recover_lsb - [Flex-OneNAND] Recover LSB page data
> + * @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> + * @param addr =A0 =A0 =A0 =A0 address to recover
> + * @param status =A0 =A0 =A0 return value from onenand_wait / onenand_bb=
t_wait
> + *
> + * MLC NAND Flash cell has paired pages - LSB page and MSB page. LSB pag=
e has
> + * lower page address and MSB page has higher page address in paired pag=
es.
> + * If power off occurs during MSB page program, the paired LSB page data=
 can
> + * become corrupt. LSB page recovery read is a way to read LSB page thou=
gh page
> + * data are corrupted. When uncorrectable error occurs as a result of LS=
B page
> + * read after power up, issue LSB page recovery read.
> + */
> +static int onenand_recover_lsb(struct mtd_info *mtd, loff_t addr, int st=
atus)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 int i;
> +
> + =A0 =A0 =A0 /* Recovery is only for Flex-OneNAND */
> + =A0 =A0 =A0 if (!FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return status;
> +
> + =A0 =A0 =A0 /* check if we failed due to uncorrectable error */
> + =A0 =A0 =A0 if (status !=3D -EBADMSG && status !=3D ONENAND_BBT_READ_EC=
C_ERROR)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return status;
> +
> + =A0 =A0 =A0 /* check if address lies in MLC region */
> + =A0 =A0 =A0 i =3D flexonenand_region(mtd, addr);
> + =A0 =A0 =A0 if (mtd->eraseregions[i].erasesize < (1 << this->erase_shif=
t))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return status;
> +
> + =A0 =A0 =A0 /* We are attempting to reread, so decrement stats.failed
> + =A0 =A0 =A0 =A0* which was incremented by onenand_wait due to read fail=
ure
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 printk(KERN_INFO "onenand_recover_lsb: Attempting to recove=
r from uncorrectable read\n");
> + =A0 =A0 =A0 mtd->ecc_stats.failed--;
> +
> + =A0 =A0 =A0 /* Issue the LSB page recovery command */
> + =A0 =A0 =A0 this->command(mtd, FLEXONENAND_CMD_RECOVER_LSB, addr, this-=
>writesize);
> + =A0 =A0 =A0 return this->wait(mtd, FL_READING);
> +}
> +
> +/**
> + * onenand_mlc_read_ops_nolock - MLC OneNAND read main and/or out-of-ban=
d
> + * @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> + * @param from =A0 =A0 =A0 =A0 offset to read from
> + * @param ops: =A0 =A0 =A0 =A0 oob operation description structure
> + *
> + * MLC OneNAND / Flex-OneNAND has 4KB page size and 4KB dataram.
> + * So, read-while-load is not present.
> + */
> +static int onenand_mlc_read_ops_nolock(struct mtd_info *mtd, loff_t from=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_=
oob_ops *ops)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 struct mtd_ecc_stats stats;
> + =A0 =A0 =A0 size_t len =3D ops->len;
> + =A0 =A0 =A0 size_t ooblen =3D ops->ooblen;
> + =A0 =A0 =A0 u_char *buf =3D ops->datbuf;
> + =A0 =A0 =A0 u_char *oobbuf =3D ops->oobbuf;
> + =A0 =A0 =A0 int read =3D 0, column, thislen;
> + =A0 =A0 =A0 int oobread =3D 0, oobcolumn, thisooblen, oobsize;
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int writesize =3D this->writesize;
> +
> + =A0 =A0 =A0 DEBUG(MTD_DEBUG_LEVEL3, "onenand_mlc_read_ops_nolock: from =
=3D 0x%08x, len =3D %i\n", (unsigned int) from, (int) len);
> +
> + =A0 =A0 =A0 if (ops->mode =3D=3D MTD_OOB_AUTO)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobsize =3D this->ecclayout->oobavail;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobsize =3D mtd->oobsize;
> +
> + =A0 =A0 =A0 oobcolumn =3D from & (mtd->oobsize - 1);
> +
> + =A0 =A0 =A0 /* Do not allow reads past end of device */
> + =A0 =A0 =A0 if (from + len > mtd->size) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_mlc_read_ops_noloc=
k: Attempt read beyond end of device\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops->retlen =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops->oobretlen =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 stats =3D mtd->ecc_stats;
> +
> + =A0 =A0 =A0 while (read < len) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 cond_resched();
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 thislen =3D min_t(int, writesize, len - rea=
d);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 column =3D from & (writesize - 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (column + thislen > writesize)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 thislen =3D writesize - col=
umn;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!onenand_check_bufferram(mtd, from)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_=
CMD_READ, from, writesize);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D this->wait(mtd, FL_=
READING);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(ret))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D one=
nand_recover_lsb(mtd, from, ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_update_bufferram(mt=
d, from, !ret);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret =3D=3D -EBADMSG)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->read_bufferram(mtd, ONENAND_DATARAM, =
buf, column, thislen);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (oobbuf) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 thisooblen =3D oobsize - oo=
bcolumn;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 thisooblen =3D min_t(int, t=
hisooblen, ooblen - oobread);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ops->mode =3D=3D MTD_OO=
B_AUTO)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_tra=
nsfer_auto_oob(mtd, oobbuf, oobcolumn, thisooblen);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->read_=
bufferram(mtd, ONENAND_SPARERAM, oobbuf, oobcolumn, thisooblen);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobread +=3D thisooblen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobbuf +=3D thisooblen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 oobcolumn =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 read +=3D thislen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (read =3D=3D len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 from +=3D thislen;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf +=3D thislen;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Return success, if no ECC failures, else -EBADMSG
> + =A0 =A0 =A0 =A0* fs driver will take care of that, because
> + =A0 =A0 =A0 =A0* retlen =3D=3D desired len and result =3D=3D -EBADMSG
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 ops->retlen =3D read;
> + =A0 =A0 =A0 ops->oobretlen =3D oobread;
> +
> + =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 if (mtd->ecc_stats.failed - stats.failed)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EBADMSG;
> +
> + =A0 =A0 =A0 return mtd->ecc_stats.corrected - stats.corrected ? -EUCLEA=
N : 0;
> +}
> +
> +/**
> =A0* onenand_read_ops_nolock - [OneNAND Interface] OneNAND read main and/=
or out-of-band
> =A0* @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> =A0* @param from =A0 =A0 =A0 =A0 offset to read from
> @@ -962,7 +1262,7 @@ static int onenand_read_oob_nolock(struct mtd_info *=
mtd, loff_t from,
> =A0 =A0 =A0 =A0size_t len =3D ops->ooblen;
> =A0 =A0 =A0 =A0mtd_oob_mode_t mode =3D ops->mode;
> =A0 =A0 =A0 =A0u_char *buf =3D ops->oobbuf;
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int ret =3D 0, readcmd;
>
> =A0 =A0 =A0 =A0from +=3D ops->ooboffs;
>
> @@ -993,17 +1293,22 @@ static int onenand_read_oob_nolock(struct mtd_info=
 *mtd, loff_t from,
>
> =A0 =A0 =A0 =A0stats =3D mtd->ecc_stats;
>
> + =A0 =A0 =A0 readcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENA=
ND_CMD_READOOB;
> +
> =A0 =A0 =A0 =A0while (read < len) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cond_resched();
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thislen =3D oobsize - column;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thislen =3D min_t(int, thislen, len);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_READOOB, fro=
m, mtd->oobsize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, readcmd, from, mtd->oobs=
ize);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_update_bufferram(mtd, from, 0);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D this->wait(mtd, FL_READING);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(ret))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_recover_lsb=
(mtd, from, ret);
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret && ret !=3D -EBADMSG) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "onenand_r=
ead_oob_nolock: read failed =3D 0x%x\n", ret);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> @@ -1053,6 +1358,7 @@ static int onenand_read_oob_nolock(struct mtd_info =
*mtd, loff_t from,
> =A0static int onenand_read(struct mtd_info *mtd, loff_t from, size_t len,
> =A0 =A0 =A0 =A0size_t *retlen, u_char *buf)
> =A0{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0struct mtd_oob_ops ops =3D {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.len =A0 =A0=3D len,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.ooblen =3D 0,
> @@ -1062,7 +1368,9 @@ static int onenand_read(struct mtd_info *mtd, loff_=
t from, size_t len,
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0onenand_get_device(mtd, FL_READING);
> - =A0 =A0 =A0 ret =3D onenand_read_ops_nolock(mtd, from, &ops);
> + =A0 =A0 =A0 ret =3D ONENAND_IS_MLC(this) ?
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_mlc_read_ops_nolock(mtd, from, &ops=
) :
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_read_ops_nolock(mtd, from, &ops);
> =A0 =A0 =A0 =A0onenand_release_device(mtd);
>
> =A0 =A0 =A0 =A0*retlen =3D ops.retlen;
> @@ -1080,6 +1388,7 @@ static int onenand_read(struct mtd_info *mtd, loff_=
t from, size_t len,
> =A0static int onenand_read_oob(struct mtd_info *mtd, loff_t from,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0struct mtd_oob_ops=
 *ops)
> =A0{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0switch (ops->mode) {
> @@ -1094,7 +1403,9 @@ static int onenand_read_oob(struct mtd_info *mtd, l=
off_t from,
>
> =A0 =A0 =A0 =A0onenand_get_device(mtd, FL_READING);
> =A0 =A0 =A0 =A0if (ops->datbuf)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_read_ops_nolock(mtd, from, =
ops);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D ONENAND_IS_MLC(this) ?
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_mlc_read_ops_nolock=
(mtd, from, ops) :
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_read_ops_nolock(mtd=
, from, ops);
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D onenand_read_oob_nolock(mtd, from,=
 ops);
> =A0 =A0 =A0 =A0onenand_release_device(mtd);
> @@ -1128,11 +1439,11 @@ static int onenand_bbt_wait(struct mtd_info *mtd,=
 int state)
> =A0 =A0 =A0 =A0ctrl =3D this->read_word(this->base + ONENAND_REG_CTRL_STA=
TUS);
>
> =A0 =A0 =A0 =A0if (interrupt & ONENAND_INT_READ) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ecc =3D this->read_word(this->base + ON=
ENAND_REG_ECC_STATUS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int ecc =3D onenand_read_ecc(this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ecc & ONENAND_ECC_2BIT_ALL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_INFO "onenand_=
bbt_wait: ecc error =3D 0x%04x"
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0", control=
ler error 0x%04x\n", ecc, ctrl);
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ONENAND_BBT_READ_ERR=
OR;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ONENAND_BBT_READ_ECC=
_ERROR;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0} else {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_ERR "onenand_bbt_wait: read ti=
meout!"
> @@ -1163,7 +1474,7 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, loff=
_t from,
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0int read =3D 0, thislen, column;
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 int ret =3D 0, readcmd;
> =A0 =A0 =A0 =A0size_t len =3D ops->ooblen;
> =A0 =A0 =A0 =A0u_char *buf =3D ops->oobbuf;
>
> @@ -1183,17 +1494,22 @@ int onenand_bbt_read_oob(struct mtd_info *mtd, lo=
ff_t from,
>
> =A0 =A0 =A0 =A0column =3D from & (mtd->oobsize - 1);
>
> + =A0 =A0 =A0 readcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENA=
ND_CMD_READOOB;
> +
> =A0 =A0 =A0 =A0while (read < len) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0cond_resched();
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thislen =3D mtd->oobsize - column;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0thislen =3D min_t(int, thislen, len);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_READOOB, fro=
m, mtd->oobsize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, readcmd, from, mtd->oobs=
ize);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_update_bufferram(mtd, from, 0);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D onenand_bbt_wait(mtd, FL_READING);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(ret))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_recover_lsb=
(mtd, from, ret);
> +
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> @@ -1230,9 +1546,11 @@ static int onenand_verify_oob(struct mtd_info *mtd=
, const u_char *buf, loff_t to
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0u_char *oob_buf =3D this->oob_buf;
> - =A0 =A0 =A0 int status, i;
> + =A0 =A0 =A0 int status, i, readcmd;
> +
> + =A0 =A0 =A0 readcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_READ : ONENA=
ND_CMD_READOOB;
>
> - =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_READOOB, to, mtd->oobsize);
> + =A0 =A0 =A0 this->command(mtd, readcmd, to, mtd->oobsize);
> =A0 =A0 =A0 =A0onenand_update_bufferram(mtd, to, 0);
> =A0 =A0 =A0 =A0status =3D this->wait(mtd, FL_READING);
> =A0 =A0 =A0 =A0if (status)
> @@ -1633,7 +1951,7 @@ static int onenand_write_oob_nolock(struct mtd_info=
 *mtd, loff_t to,
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0int column, ret =3D 0, oobsize;
> - =A0 =A0 =A0 int written =3D 0;
> + =A0 =A0 =A0 int written =3D 0, oobcmd;
> =A0 =A0 =A0 =A0u_char *oobbuf;
> =A0 =A0 =A0 =A0size_t len =3D ops->ooblen;
> =A0 =A0 =A0 =A0const u_char *buf =3D ops->oobbuf;
> @@ -1675,6 +1993,8 @@ static int onenand_write_oob_nolock(struct mtd_info=
 *mtd, loff_t to,
>
> =A0 =A0 =A0 =A0oobbuf =3D this->oob_buf;
>
> + =A0 =A0 =A0 oobcmd =3D ONENAND_IS_MLC(this) ? ONENAND_CMD_PROG : ONENAN=
D_CMD_PROGOOB;
> +
> =A0 =A0 =A0 =A0/* Loop until all data write */
> =A0 =A0 =A0 =A0while (written < len) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int thislen =3D min_t(int, oobsize, len - =
written);
> @@ -1692,7 +2012,14 @@ static int onenand_write_oob_nolock(struct mtd_inf=
o *mtd, loff_t to,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(oobbuf + column, bu=
f, thislen);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->write_bufferram(mtd, ONENAND_SPARERA=
M, oobbuf, 0, mtd->oobsize);
>
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_PROGOOB, to,=
 mtd->oobsize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_MLC(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Set main area of DataRAM=
 to 0xff*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 memset(this->page_buf, 0xff=
, mtd->writesize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_bufferram(mtd, =
ONENAND_DATARAM,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0this->page_buf, 0, mtd->writesize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, oobcmd, to, mtd->oobsize=
);
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0onenand_update_bufferram(mtd, to, 0);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ONENAND_IS_2PLANE(this)) {
> @@ -1815,29 +2142,48 @@ static int onenand_erase(struct mtd_info *mtd, st=
ruct erase_info *instr)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0unsigned int block_size;
> - =A0 =A0 =A0 loff_t addr;
> - =A0 =A0 =A0 int len;
> - =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 loff_t addr =3D instr->addr;
> + =A0 =A0 =A0 loff_t len =3D instr->len;
> + =A0 =A0 =A0 int ret =3D 0, i;
> + =A0 =A0 =A0 struct mtd_erase_region_info *region =3D NULL;
> + =A0 =A0 =A0 loff_t region_end =3D 0;
>
> =A0 =A0 =A0 =A0DEBUG(MTD_DEBUG_LEVEL3, "onenand_erase: start =3D 0x%012ll=
x, len =3D %llu\n", (unsigned long long) instr->addr, (unsigned long long) =
instr->len);
>
> - =A0 =A0 =A0 block_size =3D (1 << this->erase_shift);
> -
> - =A0 =A0 =A0 /* Start address must align on block boundary */
> - =A0 =A0 =A0 if (unlikely(instr->addr & (block_size - 1))) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Unaligned a=
ddress\n");
> + =A0 =A0 =A0 /* Do not allow erase past end of device */
> + =A0 =A0 =A0 if (unlikely((len + addr) > mtd->size)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Erase past =
end of device\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 /* Length must align on block boundary */
> - =A0 =A0 =A0 if (unlikely(instr->len & (block_size - 1))) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Length not =
block aligned\n");
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 if (FLEXONENAND(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Find the eraseregion of this address */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 i =3D flexonenand_region(mtd, addr);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 region =3D &mtd->eraseregions[i];
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block_size =3D region->erasesize;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 region_end =3D region->offset + region->era=
sesize * region->numblocks;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Start address within region must align o=
n block boundary.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Erase region's start offset is always =
block start address.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely((addr - region->offset) & (blo=
ck_size - 1))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_er=
ase: Unaligned address\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 block_size =3D 1 << this->erase_shift;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Start address must align on block bounda=
ry */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (unlikely(addr & (block_size - 1))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_er=
ase: Unaligned address\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0}
>
> - =A0 =A0 =A0 /* Do not allow erase past end of device */
> - =A0 =A0 =A0 if (unlikely((instr->len + instr->addr) > mtd->size)) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Erase past =
end of device\n");
> + =A0 =A0 =A0 /* Length must align on block boundary */
> + =A0 =A0 =A0 if (unlikely(len & (block_size - 1))) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_erase: Length not =
block aligned\n");
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return -EINVAL;
> =A0 =A0 =A0 =A0}
>
> @@ -1847,9 +2193,6 @@ static int onenand_erase(struct mtd_info *mtd, stru=
ct erase_info *instr)
> =A0 =A0 =A0 =A0onenand_get_device(mtd, FL_ERASING);
>
> =A0 =A0 =A0 =A0/* Loop throught the pages */
> - =A0 =A0 =A0 len =3D instr->len;
> - =A0 =A0 =A0 addr =3D instr->addr;
> -
> =A0 =A0 =A0 =A0instr->state =3D MTD_ERASING;
>
> =A0 =A0 =A0 =A0while (len) {
> @@ -1869,7 +2212,8 @@ static int onenand_erase(struct mtd_info *mtd, stru=
ct erase_info *instr)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ret =3D this->wait(mtd, FL_ERASING);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Check, if it is write protected */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (ret) {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_er=
ase: Failed erase, block %d\n", (unsigned) (addr >> this->erase_shift));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "onenand_er=
ase: Failed erase, block %d\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0onenand_block(this, addr));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0instr->state =3D MTD_ERASE=
_FAILED;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0instr->fail_addr =3D addr;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0goto erase_exit;
> @@ -1877,6 +2221,22 @@ static int onenand_erase(struct mtd_info *mtd, str=
uct erase_info *instr)
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len -=3D block_size;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0addr +=3D block_size;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (addr =3D=3D region_end) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!len)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 region++;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 block_size =3D region->eras=
esize;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 region_end =3D region->offs=
et + region->erasesize * region->numblocks;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (len & (block_size - 1))=
 {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* FIXME: T=
his should be handled at MTD partitioning level. */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN=
_ERR "onenand_erase: Unaligned address\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto erase_=
exit;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0instr->state =3D MTD_ERASE_DONE;
> @@ -1955,13 +2315,17 @@ static int onenand_default_block_markbad(struct m=
td_info *mtd, loff_t ofs)
> =A0 =A0 =A0 =A0int block;
>
> =A0 =A0 =A0 =A0/* Get block number */
> - =A0 =A0 =A0 block =3D ((int) ofs) >> bbm->bbt_erase_shift;
> + =A0 =A0 =A0 block =3D onenand_block(this, ofs);
> =A0 =A0 =A0 =A0 if (bbm->bbt)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 bbm->bbt[block >> 2] |=3D 0x01 << ((block=
 & 0x03) << 1);
>
> =A0 =A0 =A0 =A0 /* We write two bytes, so we dont have to mess with 16 bi=
t access */
> =A0 =A0 =A0 =A0 ofs +=3D mtd->oobsize + (bbm->badblockpos & ~0x01);
> - =A0 =A0 =A0 =A0return onenand_write_oob_nolock(mtd, ofs, &ops);
> + =A0 =A0 =A0 /* FIXME : What to do when marking SLC block in partition
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 with MLC erasesize? For now, it is not=
 advisable to
> + =A0 =A0 =A0 =A0* =A0 =A0 =A0 =A0 create partitions containing both SLC =
and MLC regions.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 return onenand_write_oob_nolock(mtd, ofs, &ops);
> =A0}
>
> =A0/**
> @@ -2005,8 +2369,8 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd=
, loff_t ofs, size_t len, int
> =A0 =A0 =A0 =A0int start, end, block, value, status;
> =A0 =A0 =A0 =A0int wp_status_mask;
>
> - =A0 =A0 =A0 start =3D ofs >> this->erase_shift;
> - =A0 =A0 =A0 end =3D len >> this->erase_shift;
> + =A0 =A0 =A0 start =3D onenand_block(this, ofs);
> + =A0 =A0 =A0 end =3D onenand_block(this, ofs + len) - 1;
>
> =A0 =A0 =A0 =A0if (cmd =3D=3D ONENAND_CMD_LOCK)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0wp_status_mask =3D ONENAND_WP_LS;
> @@ -2018,7 +2382,7 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd=
, loff_t ofs, size_t len, int
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Set start block address */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->write_word(start, this->base + ONENA=
ND_REG_START_BLOCK_ADDRESS);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Set end block address */
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(start + end - 1, this->bas=
e + ONENAND_REG_END_BLOCK_ADDRESS);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->write_word(end, this->base + =A0ONENA=
ND_REG_END_BLOCK_ADDRESS);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Write lock command */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->command(mtd, cmd, 0, 0);
>
> @@ -2039,7 +2403,7 @@ static int onenand_do_lock_cmd(struct mtd_info *mtd=
, loff_t ofs, size_t len, int
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0/* Block lock scheme */
> - =A0 =A0 =A0 for (block =3D start; block < start + end; block++) {
> + =A0 =A0 =A0 for (block =3D start; block < end + 1; block++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Set block address */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0value =3D onenand_block_address(this, bloc=
k);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->write_word(value, this->base + ONENA=
ND_REG_START_ADDRESS1);
> @@ -2147,7 +2511,7 @@ static void onenand_unlock_all(struct mtd_info *mtd=
)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> =A0 =A0 =A0 =A0loff_t ofs =3D 0;
> - =A0 =A0 =A0 size_t len =3D this->chipsize;
> + =A0 =A0 =A0 loff_t len =3D mtd->size;
>
> =A0 =A0 =A0 =A0if (this->options & ONENAND_HAS_UNLOCK_ALL) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Set start block address */
> @@ -2168,7 +2532,7 @@ static void onenand_unlock_all(struct mtd_info *mtd=
)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0return;
>
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Workaround for all block unlock in DDP =
*/
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_DDP(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ONENAND_IS_DDP(this) && !FLEXONENAND(th=
is)) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* All blocks on another c=
hip */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ofs =3D this->chipsize >> =
1;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0len =3D this->chipsize >> =
1;
> @@ -2210,7 +2574,9 @@ static int do_otp_read(struct mtd_info *mtd, loff_t=
 from, size_t len,
> =A0 =A0 =A0 =A0this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
> =A0 =A0 =A0 =A0this->wait(mtd, FL_OTPING);
>
> - =A0 =A0 =A0 ret =3D onenand_read_ops_nolock(mtd, from, &ops);
> + =A0 =A0 =A0 ret =3D ONENAND_IS_MLC(this) ?
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_mlc_read_ops_nolock(mtd, from, &ops=
) :
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 onenand_read_ops_nolock(mtd, from, &ops);
>
> =A0 =A0 =A0 =A0/* Exit OTP access mode */
> =A0 =A0 =A0 =A0this->command(mtd, ONENAND_CMD_RESET, 0, 0);
> @@ -2277,21 +2643,32 @@ static int do_otp_lock(struct mtd_info *mtd, loff=
_t from, size_t len,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t *retlen, u_char *buf)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> - =A0 =A0 =A0 struct mtd_oob_ops ops =3D {
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mode =3D MTD_OOB_PLACE,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ooblen =3D len,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .oobbuf =3D buf,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ooboffs =3D 0,
> - =A0 =A0 =A0 };
> + =A0 =A0 =A0 struct mtd_oob_ops ops;
> =A0 =A0 =A0 =A0int ret;
>
> =A0 =A0 =A0 =A0/* Enter OTP access mode */
> =A0 =A0 =A0 =A0this->command(mtd, ONENAND_CMD_OTP_ACCESS, 0, 0);
> =A0 =A0 =A0 =A0this->wait(mtd, FL_OTPING);
>
> - =A0 =A0 =A0 ret =3D onenand_write_oob_nolock(mtd, from, &ops);
> -
> - =A0 =A0 =A0 *retlen =3D ops.oobretlen;
> + =A0 =A0 =A0 if (FLEXONENAND(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* For Flex-OneNAND, we write lock mark t=
o 1st word of sector 4 of
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* main area of page 49.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.len =3D mtd->writesize;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.ooblen =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.datbuf =3D buf;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.oobbuf =3D NULL;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_write_ops_nolock(mtd, mtd->=
writesize * 49, &ops);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *retlen =3D ops.retlen;
> + =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.mode =3D MTD_OOB_PLACE;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.ooblen =3D len;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.oobbuf =3D buf;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ops.ooboffs =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_write_oob_nolock(mtd, from,=
 &ops);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 *retlen =3D ops.oobretlen;
> + =A0 =A0 =A0 }
>
> =A0 =A0 =A0 =A0/* Exit OTP access mode */
> =A0 =A0 =A0 =A0this->command(mtd, ONENAND_CMD_RESET, 0, 0);
> @@ -2475,27 +2852,34 @@ static int onenand_lock_user_prot_reg(struct mtd_=
info *mtd, loff_t from,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0size_t len)
> =A0{
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
> - =A0 =A0 =A0 u_char *oob_buf =3D this->oob_buf;
> + =A0 =A0 =A0 u_char *buf =3D FLEXONENAND(this) ? this->page_buf : this->=
oob_buf;
> =A0 =A0 =A0 =A0size_t retlen;
> =A0 =A0 =A0 =A0int ret;
>
> - =A0 =A0 =A0 memset(oob_buf, 0xff, mtd->oobsize);
> + =A0 =A0 =A0 memset(buf, 0xff, FLEXONENAND(this) ? this->writesize
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0: mtd->oobsize);
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Note: OTP lock operation
> =A0 =A0 =A0 =A0 * =A0 =A0 =A0 OTP block : 0xXXFC
> =A0 =A0 =A0 =A0 * =A0 =A0 =A0 1st block : 0xXXF3 (If chip support)
> =A0 =A0 =A0 =A0 * =A0 =A0 =A0 Both =A0 =A0 =A0: 0xXXF0 (If chip support)
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 oob_buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
> + =A0 =A0 =A0 if (FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[FLEXONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 buf[ONENAND_OTP_LOCK_OFFSET] =3D 0xFC;
>
> =A0 =A0 =A0 =A0/*
> =A0 =A0 =A0 =A0 * Write lock mark to 8th word of sector0 of page0 of the =
spare0.
> =A0 =A0 =A0 =A0 * We write 16 bytes spare area instead of 2 bytes.
> + =A0 =A0 =A0 =A0* For Flex-OneNAND, we write lock mark to 1st word of se=
ctor 4 of
> + =A0 =A0 =A0 =A0* main area of page 49.
> =A0 =A0 =A0 =A0 */
> +
> =A0 =A0 =A0 =A0from =3D 0;
> - =A0 =A0 =A0 len =3D 16;
> + =A0 =A0 =A0 len =3D FLEXONENAND(this) ? mtd->writesize : 16;
>
> - =A0 =A0 =A0 ret =3D onenand_otp_walk(mtd, from, len, &retlen, oob_buf, =
do_otp_lock, MTD_OTP_USER);
> + =A0 =A0 =A0 ret =3D onenand_otp_walk(mtd, from, len, &retlen, buf, do_o=
tp_lock, MTD_OTP_USER);
>
> =A0 =A0 =A0 =A0return ret ? : retlen;
> =A0}
> @@ -2542,6 +2926,14 @@ static void onenand_check_features(struct mtd_info=
 *mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 if (ONENAND_IS_MLC(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->options &=3D ~ONENAND_HAS_2PLANE;
> +
> + =A0 =A0 =A0 if (FLEXONENAND(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->options &=3D ~ONENAND_HAS_CONT_LOCK;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->options |=3D ONENAND_HAS_UNLOCK_ALL;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0if (this->options & ONENAND_HAS_CONT_LOCK)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0printk(KERN_DEBUG "Lock scheme is Continuo=
us Lock\n");
> =A0 =A0 =A0 =A0if (this->options & ONENAND_HAS_UNLOCK_ALL)
> @@ -2559,14 +2951,16 @@ static void onenand_check_features(struct mtd_inf=
o *mtd)
> =A0*/
> =A0static void onenand_print_device_info(int device, int version)
> =A0{
> - =A0 =A0 =A0 =A0int vcc, demuxed, ddp, density;
> + =A0 =A0 =A0 int vcc, demuxed, ddp, density, flexonenand;
>
> =A0 =A0 =A0 =A0 vcc =3D device & ONENAND_DEVICE_VCC_MASK;
> =A0 =A0 =A0 =A0 demuxed =3D device & ONENAND_DEVICE_IS_DEMUX;
> =A0 =A0 =A0 =A0 ddp =3D device & ONENAND_DEVICE_IS_DDP;
> =A0 =A0 =A0 =A0 density =3D onenand_get_density(device);
> - =A0 =A0 =A0 =A0printk(KERN_INFO "%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n=
",
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0demuxed ? "" : "Muxed ",
> + =A0 =A0 =A0 flexonenand =3D device & DEVICE_IS_FLEXONENAND;
> + =A0 =A0 =A0 printk(KERN_INFO "%s%sOneNAND%s %dMB %sV 16-bit (0x%02x)\n"=
,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 demuxed ? "" : "Muxed ",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flexonenand ? "Flex-" : "",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ddp ? "(DDP)" : "",
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (16 << density),
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 vcc ? "2.65/3.3" : "1.8",
> @@ -2606,6 +3000,280 @@ static int onenand_check_maf(int manuf)
> =A0}
>
> =A0/**
> +* flexonenand_get_boundary =A0 =A0 - Reads the SLC boundary
> +* @param onenand_info =A0 =A0 =A0 =A0 =A0- onenand info structure
> +**/
> +static int flexonenand_get_boundary(struct mtd_info *mtd)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 unsigned die, bdry;
> + =A0 =A0 =A0 int ret, syscfg, locked;
> +
> + =A0 =A0 =A0 /* Disable ECC */
> + =A0 =A0 =A0 syscfg =3D this->read_word(this->base + ONENAND_REG_SYS_CFG=
1);
> + =A0 =A0 =A0 this->write_word((syscfg | 0x0100), this->base + ONENAND_RE=
G_SYS_CFG1);
> +
> + =A0 =A0 =A0 for (die =3D 0; die < this->dies; die++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, FLEXONENAND_CMD_PI_ACCES=
S, die, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->wait(mtd, FL_SYNCING);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, FLEXONENAND_CMD_READ_PI,=
 die, 0);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D this->wait(mtd, FL_READING);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 bdry =3D this->read_word(this->base + ONENA=
ND_DATARAM);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if ((bdry >> FLEXONENAND_PI_UNLOCK_SHIFT) =
=3D=3D 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 locked =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 locked =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->boundary[die] =3D bdry & FLEXONENAND_=
PI_MASK;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_RESET, 0, 0)=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D this->wait(mtd, FL_RESETING);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "Die %d boundary: %d%s\n",=
 die,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->boundary[die], locked =
? "(Locked)" : "(Unlocked)");
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Enable ECC */
> + =A0 =A0 =A0 this->write_word(syscfg, this->base + ONENAND_REG_SYS_CFG1)=
;
> + =A0 =A0 =A0 return 0;
> +}
> +
> +/**
> + * flexonenand_get_size - Fill up fields in onenand_chip and mtd_info
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 boundary[], diesize[], mt=
d->size, mtd->erasesize
> + * @param mtd =A0 =A0 =A0 =A0 =A0- MTD device structure
> + */
> +static void flexonenand_get_size(struct mtd_info *mtd)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 int die, i, eraseshift, density;
> + =A0 =A0 =A0 int blksperdie, maxbdry;
> + =A0 =A0 =A0 loff_t ofs;
> +
> + =A0 =A0 =A0 density =3D onenand_get_density(this->device_id);
> + =A0 =A0 =A0 blksperdie =3D ((loff_t)(16 << density) << 20) >> (this->er=
ase_shift);
> + =A0 =A0 =A0 blksperdie >>=3D ONENAND_IS_DDP(this) ? 1 : 0;
> + =A0 =A0 =A0 maxbdry =3D blksperdie - 1;
> + =A0 =A0 =A0 eraseshift =3D this->erase_shift - 1;
> +
> + =A0 =A0 =A0 mtd->numeraseregions =3D this->dies << 1;
> +
> + =A0 =A0 =A0 /* This fills up the device boundary */
> + =A0 =A0 =A0 flexonenand_get_boundary(mtd);
> + =A0 =A0 =A0 die =3D ofs =3D 0;
> + =A0 =A0 =A0 i =3D -1;
> + =A0 =A0 =A0 for (; die < this->dies; die++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!die || this->boundary[die-1] !=3D maxb=
dry) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].offset=
 =3D ofs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].erases=
ize =3D 1 << eraseshift;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].numblo=
cks =3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->boundary[die] + 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ofs +=3D mtd->eraseregions[=
i].numblocks << eraseshift;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eraseshift++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->numeraseregions -=3D 1=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].numblo=
cks +=3D
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->boundary[die] + 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ofs +=3D (this->boundary[di=
e] + 1) << (eraseshift - 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (this->boundary[die] !=3D maxbdry) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 i++;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].offset=
 =3D ofs;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].erases=
ize =3D 1 << eraseshift;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].numblo=
cks =3D maxbdry ^
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->boundary[die];
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 ofs +=3D mtd->eraseregions[=
i].numblocks << eraseshift;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 eraseshift--;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->numeraseregions -=3D 1=
;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Expose MLC erase size except when all blocks are SLC */
> + =A0 =A0 =A0 mtd->erasesize =3D 1 << this->erase_shift;
> + =A0 =A0 =A0 if (mtd->numeraseregions =3D=3D 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->erasesize >>=3D 1;
> +
> + =A0 =A0 =A0 printk(KERN_INFO "Device has %d eraseregions\n", mtd->numer=
aseregions);
> + =A0 =A0 =A0 for (i =3D 0; i < mtd->numeraseregions; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_INFO "[offset: 0x%08x, erasesiz=
e: 0x%05x,"
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 " numblocks: %04u]\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 (unsigned int) mtd->erasere=
gions[i].offset,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].erases=
ize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions[i].numblo=
cks);
> +
> + =A0 =A0 =A0 for (die =3D 0, mtd->size =3D 0; die < this->dies; die++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->diesize[die] =3D (loff_t)blksperdie <=
< this->erase_shift;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->diesize[die] -=3D (loff_t)(this->boun=
dary[die] + 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0<< (this->erase_shift - 1);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->size +=3D this->diesize[die];
> + =A0 =A0 =A0 }
> +}
> +
> +/**
> + * flexonenand_check_blocks_erased - Check if blocks are erased
> + * @param mtd_info =A0 =A0 - mtd info structure
> + * @param start =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0- first erase block to ch=
eck
> + * @param end =A0 =A0 =A0 =A0 =A0- last erase block to check
> + *
> + * Converting an unerased block from MLC to SLC
> + * causes byte values to change. Since both data and its ECC
> + * have changed, reads on the block give uncorrectable error.
> + * This might lead to the block being detected as bad.
> + *
> + * Avoid this by ensuring that the block to be converted is
> + * erased.
> + */
> +static int flexonenand_check_blocks_erased(struct mtd_info *mtd, int sta=
rt, int end)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 int i, ret;
> + =A0 =A0 =A0 int block;
> + =A0 =A0 =A0 struct mtd_oob_ops ops =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .mode =3D MTD_OOB_PLACE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ooboffs =3D 0,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .ooblen =3D mtd->oobsize,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .datbuf =3D NULL,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .oobbuf =3D this->oob_buf,
> + =A0 =A0 =A0 };
> + =A0 =A0 =A0 loff_t addr;
> +
> + =A0 =A0 =A0 printk(KERN_DEBUG "Check blocks from %d to %d\n", start, en=
d);
> +
> + =A0 =A0 =A0 for (block =3D start; block <=3D end; block++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 addr =3D flexonenand_addr(this, block);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (onenand_block_isbad_nolock(mtd, addr, 0=
))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 continue;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* Since main area write results in ECC w=
rite to spare,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0* it is sufficient to check only ECC byt=
es for change.
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D onenand_read_oob_nolock(mtd, addr, =
&ops);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 for (i =3D 0; i < mtd->oobsize; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (this->oob_buf[i] !=3D 0=
xff)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (i !=3D mtd->oobsize) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_WARNING "Block =
%d not erased.\n", block);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 return 0;
> +}
> +
> +/**
> + * flexonenand_set_boundary =A0 =A0- Writes the SLC boundary
> + * @param mtd =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0- mtd info structure
> + */
> +int flexonenand_set_boundary(struct mtd_info *mtd, int die,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 int=
 boundary, int lock)
> +{
> + =A0 =A0 =A0 struct onenand_chip *this =3D mtd->priv;
> + =A0 =A0 =A0 int ret, density, blksperdie, old, new, thisboundary;
> + =A0 =A0 =A0 loff_t addr;
> +
> + =A0 =A0 =A0 /* Change only once for SDP Flex-OneNAND */
> + =A0 =A0 =A0 if (die && (!ONENAND_IS_DDP(this)))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 /* boundary value of -1 indicates no required change */
> + =A0 =A0 =A0 if (boundary < 0 || boundary =3D=3D this->boundary[die])
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 density =3D onenand_get_density(this->device_id);
> + =A0 =A0 =A0 blksperdie =3D ((16 << density) << 20) >> this->erase_shift=
;
> + =A0 =A0 =A0 blksperdie >>=3D ONENAND_IS_DDP(this) ? 1 : 0;
> +
> + =A0 =A0 =A0 if (boundary >=3D blksperdie) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "flexonenand_set_boundary: =
Invalid boundary value. "
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "Boundary n=
ot changed.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -EINVAL;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Check if converting blocks are erased */
> + =A0 =A0 =A0 old =3D this->boundary[die] + (die * this->density_mask);
> + =A0 =A0 =A0 new =3D boundary + (die * this->density_mask);
> + =A0 =A0 =A0 ret =3D flexonenand_check_blocks_erased(mtd, min(old, new) =
+ 1, max(old, new));
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "flexonenand_set_boundary: =
Please erase blocks before boundary change\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 this->command(mtd, FLEXONENAND_CMD_PI_ACCESS, die, 0);
> + =A0 =A0 =A0 this->wait(mtd, FL_SYNCING);
> +
> + =A0 =A0 =A0 /* Check is boundary is locked */
> + =A0 =A0 =A0 this->command(mtd, FLEXONENAND_CMD_READ_PI, die, 0);
> + =A0 =A0 =A0 ret =3D this->wait(mtd, FL_READING);
> +
> + =A0 =A0 =A0 thisboundary =3D this->read_word(this->base + ONENAND_DATAR=
AM);
> + =A0 =A0 =A0 if ((thisboundary >> FLEXONENAND_PI_UNLOCK_SHIFT) !=3D 3) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "flexonenand_set_boundary: =
boundary locked\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 printk(KERN_INFO "flexonenand_set_boundary: Changing die %d=
 boundary: %d%s\n",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 die, boundary, lock ? "(Loc=
ked)" : "(Unlocked)");
> +
> + =A0 =A0 =A0 addr =3D die ? this->diesize[0] : 0;
> +
> + =A0 =A0 =A0 boundary &=3D FLEXONENAND_PI_MASK;
> + =A0 =A0 =A0 boundary |=3D lock ? 0 : (3 << FLEXONENAND_PI_UNLOCK_SHIFT)=
;
> +
> + =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_ERASE, addr, 0);
> + =A0 =A0 =A0 ret =3D this->wait(mtd, FL_ERASING);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "flexonenand_set_boundary: =
Failed PI erase for Die %d\n", die);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 this->write_word(boundary, this->base + ONENAND_DATARAM);
> + =A0 =A0 =A0 this->command(mtd, ONENAND_CMD_PROG, addr, 0);
> + =A0 =A0 =A0 ret =3D this->wait(mtd, FL_WRITING);
> + =A0 =A0 =A0 if (ret) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 printk(KERN_ERR "flexonenand_set_boundary: =
Failed PI write for Die %d\n", die);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto out;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 this->command(mtd, FLEXONENAND_CMD_PI_UPDATE, die, 0);
> + =A0 =A0 =A0 ret =3D this->wait(mtd, FL_WRITING);
> +out:
> + =A0 =A0 =A0 this->write_word(ONENAND_CMD_RESET, this->base + ONENAND_RE=
G_COMMAND);
> + =A0 =A0 =A0 this->wait(mtd, FL_RESETING);
> + =A0 =A0 =A0 if (!ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Recalculate device size on boundary chan=
ge*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flexonenand_get_size(mtd);
> +
> + =A0 =A0 =A0 return ret;
> +}
> +
> +/**
> + * flexonenand_setup - =A0 =A0 =A0 =A0 capture Flex-OneNAND boundary and=
 lock
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 values =A0passed as kernel pa=
rameters
> + * @param s =A0 =A0kernel parameter string
> + */
> +static int flexonenand_setup(char *s)
> +{
> + =A0 =A0 =A0 int ints[5], i;
> +
> + =A0 =A0 =A0 s =3D get_options(s, 5, ints);
> +
> + =A0 =A0 =A0 for (i =3D 0; i < ints[0]; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flex_bdry[i] =3D ints[i + 1];
> +
> + =A0 =A0 =A0 return 1;
> +}
> +
> +__setup("onenand.bdry=3D", flexonenand_setup);
> +
> +/**
> =A0* onenand_probe - [OneNAND Interface] Probe the OneNAND device
> =A0* @param mtd =A0 =A0 =A0 =A0 =A0MTD device structure
> =A0*
> @@ -2647,6 +3315,7 @@ static int onenand_probe(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0maf_id =3D this->read_word(this->base + ONENAND_REG_MANUFA=
CTURER_ID);
> =A0 =A0 =A0 =A0dev_id =3D this->read_word(this->base + ONENAND_REG_DEVICE=
_ID);
> =A0 =A0 =A0 =A0ver_id =3D this->read_word(this->base + ONENAND_REG_VERSIO=
N_ID);
> + =A0 =A0 =A0 this->technology =3D this->read_word(this->base + ONENAND_R=
EG_TECHNOLOGY);
>
> =A0 =A0 =A0 =A0/* Check OneNAND device */
> =A0 =A0 =A0 =A0if (maf_id !=3D bram_maf_id || dev_id !=3D bram_dev_id)
> @@ -2658,29 +3327,55 @@ static int onenand_probe(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0this->version_id =3D ver_id;
>
> =A0 =A0 =A0 =A0density =3D onenand_get_density(dev_id);
> + =A0 =A0 =A0 if (FLEXONENAND(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->dies =3D ONENAND_IS_DDP(this) ? 2 : 1=
;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* Maximum possible erase regions */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->numeraseregions =3D this->dies << 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->eraseregions =3D kzalloc(sizeof(struct=
 mtd_erase_region_info)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 * (this->dies << 1), GFP_KERNEL);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (!mtd->eraseregions)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* For Flex-OneNAND, chipsize represents maximum possible=
 device size.
> + =A0 =A0 =A0 =A0* mtd->size represents the actual device size.
> + =A0 =A0 =A0 =A0*/
> =A0 =A0 =A0 =A0this->chipsize =3D (16 << density) << 20;
> - =A0 =A0 =A0 /* Set density mask. it is used for DDP */
> - =A0 =A0 =A0 if (ONENAND_IS_DDP(this))
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->density_mask =3D (1 << (density + 6))=
;
> - =A0 =A0 =A0 else
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->density_mask =3D 0;
>
> =A0 =A0 =A0 =A0/* OneNAND page size & block size */
> =A0 =A0 =A0 =A0/* The data buffer size is equal to page size */
> =A0 =A0 =A0 =A0mtd->writesize =3D this->read_word(this->base + ONENAND_RE=
G_DATA_BUFFER_SIZE);
> + =A0 =A0 =A0 /* We use the full BufferRAM */
> + =A0 =A0 =A0 if (ONENAND_IS_MLC(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->writesize <<=3D 1;
> +
> =A0 =A0 =A0 =A0mtd->oobsize =3D mtd->writesize >> 5;
> =A0 =A0 =A0 =A0/* Pages per a block are always 64 in OneNAND */
> =A0 =A0 =A0 =A0mtd->erasesize =3D mtd->writesize << 6;
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Flex-OneNAND SLC area has 64 pages per block.
> + =A0 =A0 =A0 =A0* Flex-OneNAND MLC area has 128 pages per block.
> + =A0 =A0 =A0 =A0* Expose MLC erase size to find erase_shift and page_mas=
k.
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->erasesize <<=3D 1;
>
> =A0 =A0 =A0 =A0this->erase_shift =3D ffs(mtd->erasesize) - 1;
> =A0 =A0 =A0 =A0this->page_shift =3D ffs(mtd->writesize) - 1;
> =A0 =A0 =A0 =A0this->page_mask =3D (1 << (this->erase_shift - this->page_=
shift)) - 1;
> + =A0 =A0 =A0 /* Set density mask. it is used for DDP */
> + =A0 =A0 =A0 if (ONENAND_IS_DDP(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->density_mask =3D this->chipsize >> (t=
his->erase_shift + 1);
> =A0 =A0 =A0 =A0/* It's real page size */
> =A0 =A0 =A0 =A0this->writesize =3D mtd->writesize;
>
> =A0 =A0 =A0 =A0/* REVIST: Multichip handling */
>
> - =A0 =A0 =A0 mtd->size =3D this->chipsize;
> + =A0 =A0 =A0 if (FLEXONENAND(this))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flexonenand_get_size(mtd);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->size =3D this->chipsize;
>
> =A0 =A0 =A0 =A0/* Check OneNAND features */
> =A0 =A0 =A0 =A0onenand_check_features(mtd);
> @@ -2735,7 +3430,7 @@ static void onenand_resume(struct mtd_info *mtd)
> =A0*/
> =A0int onenand_scan(struct mtd_info *mtd, int maxchips)
> =A0{
> - =A0 =A0 =A0 int i;
> + =A0 =A0 =A0 int i, ret;
> =A0 =A0 =A0 =A0struct onenand_chip *this =3D mtd->priv;
>
> =A0 =A0 =A0 =A0if (!this->read_word)
> @@ -2797,6 +3492,10 @@ int onenand_scan(struct mtd_info *mtd, int maxchip=
s)
> =A0 =A0 =A0 =A0 * Allow subpage writes up to oobsize.
> =A0 =A0 =A0 =A0 */
> =A0 =A0 =A0 =A0switch (mtd->oobsize) {
> + =A0 =A0 =A0 case 128:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 this->ecclayout =3D &onenand_oob_128;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 mtd->subpage_sft =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> =A0 =A0 =A0 =A0case 64:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0this->ecclayout =3D &onenand_oob_64;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0mtd->subpage_sft =3D 2;
> @@ -2862,7 +3561,16 @@ int onenand_scan(struct mtd_info *mtd, int maxchip=
s)
> =A0 =A0 =A0 =A0/* Unlock whole block */
> =A0 =A0 =A0 =A0onenand_unlock_all(mtd);
>
> - =A0 =A0 =A0 return this->scan_bbt(mtd);
> + =A0 =A0 =A0 ret =3D this->scan_bbt(mtd);
> + =A0 =A0 =A0 if ((!FLEXONENAND(this)) || ret)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return ret;
> +
> + =A0 =A0 =A0 /* Change Flex-OneNAND boundaries if required */
> + =A0 =A0 =A0 for (i =3D 0; i < MAX_DIES; i++)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 flexonenand_set_boundary(mtd, i, flex_bdry[=
2 * i],
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0flex_bdry[(2 * i) + 1]);
> +
> + =A0 =A0 =A0 return 0;
> =A0}
>
> =A0/**
> @@ -2891,6 +3599,7 @@ void onenand_release(struct mtd_info *mtd)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(this->page_buf);
> =A0 =A0 =A0 =A0if (this->options & ONENAND_OOBBUF_ALLOC)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0kfree(this->oob_buf);
> + =A0 =A0 =A0 kfree(mtd->eraseregions);
> =A0}
>
> =A0EXPORT_SYMBOL_GPL(onenand_scan);
> diff --git a/drivers/mtd/onenand/onenand_bbt.c b/drivers/mtd/onenand/onen=
and_bbt.c
> index 2f53b51..a91fcac 100644
> --- a/drivers/mtd/onenand/onenand_bbt.c
> +++ b/drivers/mtd/onenand/onenand_bbt.c
> @@ -63,6 +63,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *bu=
f, struct nand_bbt_descr
> =A0 =A0 =A0 =A0loff_t from;
> =A0 =A0 =A0 =A0size_t readlen, ooblen;
> =A0 =A0 =A0 =A0struct mtd_oob_ops ops;
> + =A0 =A0 =A0 int rgn;
>
> =A0 =A0 =A0 =A0printk(KERN_INFO "Scanning device for bad blocks\n");
>
> @@ -76,7 +77,7 @@ static int create_bbt(struct mtd_info *mtd, uint8_t *bu=
f, struct nand_bbt_descr
> =A0 =A0 =A0 =A0/* Note that numblocks is 2 * (real numblocks) here;
> =A0 =A0 =A0 =A0 * see i +=3D 2 below as it makses shifting and masking le=
ss painful
> =A0 =A0 =A0 =A0 */
> - =A0 =A0 =A0 numblocks =3D mtd->size >> (bbm->bbt_erase_shift - 1);
> + =A0 =A0 =A0 numblocks =3D this->chipsize >> (bbm->bbt_erase_shift - 1);
> =A0 =A0 =A0 =A0startblock =3D 0;
> =A0 =A0 =A0 =A0from =3D 0;
>
> @@ -106,7 +107,12 @@ static int create_bbt(struct mtd_info *mtd, uint8_t =
*buf, struct nand_bbt_descr
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0}
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0i +=3D 2;
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 from +=3D (1 << bbm->bbt_erase_shift);
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (FLEXONENAND(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rgn =3D flexonenand_region(=
mtd, from);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from +=3D mtd->eraseregions=
[rgn].erasesize;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 from +=3D (1 << bbm->bbt_er=
ase_shift);
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0return 0;
> @@ -143,7 +149,7 @@ static int onenand_isbad_bbt(struct mtd_info *mtd, lo=
ff_t offs, int allowbbt)
> =A0 =A0 =A0 =A0uint8_t res;
>
> =A0 =A0 =A0 =A0/* Get block number * 2 */
> - =A0 =A0 =A0 block =3D (int) (offs >> (bbm->bbt_erase_shift - 1));
> + =A0 =A0 =A0 block =3D (int) (onenand_block(this, offs) << 1);
> =A0 =A0 =A0 =A0res =3D (bbm->bbt[block >> 3] >> (block & 0x06)) & 0x03;
>
> =A0 =A0 =A0 =A0DEBUG(MTD_DEBUG_LEVEL2, "onenand_isbad_bbt: bbt info for o=
ffs 0x%08x: (block %d) 0x%02x\n",
> @@ -178,7 +184,7 @@ int onenand_scan_bbt(struct mtd_info *mtd, struct nan=
d_bbt_descr *bd)
> =A0 =A0 =A0 =A0struct bbm_info *bbm =3D this->bbm;
> =A0 =A0 =A0 =A0int len, ret =3D 0;
>
> - =A0 =A0 =A0 len =3D mtd->size >> (this->erase_shift + 2);
> + =A0 =A0 =A0 len =3D this->chipsize >> (this->erase_shift + 2);
> =A0 =A0 =A0 =A0/* Allocate memory (2bit per block) and clear the memory b=
ad block table */
> =A0 =A0 =A0 =A0bbm->bbt =3D kzalloc(len, GFP_KERNEL);
> =A0 =A0 =A0 =A0if (!bbm->bbt) {
> diff --git a/drivers/mtd/onenand/onenand_sim.c b/drivers/mtd/onenand/onen=
and_sim.c
> index d64200b..f6e3c8a 100644
> --- a/drivers/mtd/onenand/onenand_sim.c
> +++ b/drivers/mtd/onenand/onenand_sim.c
> @@ -6,6 +6,10 @@
> =A0* =A0Copyright =A9 2005-2007 Samsung Electronics
> =A0* =A0Kyungmin Park <kyungmin.park@samsung.com>
> =A0*
> + * =A0Vishak G <vishak.g at samsung.com>, Rohit Hagargundgi <h.rohit at =
samsung.com>
> + * =A0Flex-OneNAND simulator support
> + * =A0Copyright (C) Samsung Electronics, 2008
> + *
> =A0* This program is free software; you can redistribute it and/or modify
> =A0* it under the terms of the GNU General Public License version 2 as
> =A0* published by the Free Software Foundation.
> @@ -24,16 +28,38 @@
> =A0#ifndef CONFIG_ONENAND_SIM_MANUFACTURER
> =A0#define CONFIG_ONENAND_SIM_MANUFACTURER =A0 =A0 =A0 =A0 0xec
> =A0#endif
> +
> =A0#ifndef CONFIG_ONENAND_SIM_DEVICE_ID
> =A0#define CONFIG_ONENAND_SIM_DEVICE_ID =A0 =A0 =A0 =A0 =A0 =A00x04
> =A0#endif
> +
> +#define CONFIG_FLEXONENAND ((CONFIG_ONENAND_SIM_DEVICE_ID >> 9) & 1)
> +
> =A0#ifndef CONFIG_ONENAND_SIM_VERSION_ID
> =A0#define CONFIG_ONENAND_SIM_VERSION_ID =A0 =A0 =A0 =A0 =A0 0x1e
> =A0#endif
>
> +#ifndef CONFIG_ONENAND_SIM_TECHNOLOGY_ID
> +#define CONFIG_ONENAND_SIM_TECHNOLOGY_ID CONFIG_FLEXONENAND
> +#endif
> +
> +/* Initial boundary values for Flex-OneNAND Simulator */
> +#ifndef CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY
> +#define CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY =A0 0x01
> +#endif
> +
> +#ifndef CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY
> +#define CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY =A0 0x01
> +#endif
> +
> =A0static int manuf_id =A0 =A0=3D CONFIG_ONENAND_SIM_MANUFACTURER;
> =A0static int device_id =A0 =3D CONFIG_ONENAND_SIM_DEVICE_ID;
> =A0static int version_id =A0=3D CONFIG_ONENAND_SIM_VERSION_ID;
> +static int technology_id =3D CONFIG_ONENAND_SIM_TECHNOLOGY_ID;
> +static int boundary[] =3D {
> + =A0 =A0 =A0 CONFIG_FLEXONENAND_SIM_DIE0_BOUNDARY,
> + =A0 =A0 =A0 CONFIG_FLEXONENAND_SIM_DIE1_BOUNDARY,
> +};
>
> =A0struct onenand_flash {
> =A0 =A0 =A0 =A0void __iomem *base;
> @@ -57,12 +83,18 @@ struct onenand_flash {
> =A0 =A0 =A0 =A0(writew(v, this->base + ONENAND_REG_WP_STATUS))
>
> =A0/* It has all 0xff chars */
> -#define MAX_ONENAND_PAGESIZE =A0 =A0 =A0 =A0 =A0 (2048 + 64)
> +#define MAX_ONENAND_PAGESIZE =A0 =A0 =A0 =A0 =A0 (4096 + 128)
> =A0static unsigned char *ffchars;
>
> +#if CONFIG_FLEXONENAND
> +#define PARTITION_NAME "Flex-OneNAND simulator partition"
> +#else
> +#define PARTITION_NAME "OneNAND simulator partition"
> +#endif
> +
> =A0static struct mtd_partition os_partitions[] =3D {
> =A0 =A0 =A0 =A0{
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D "OneNAND simu=
lator partition",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 .name =A0 =A0 =A0 =A0 =A0 =3D PARTITION_NAM=
E,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.offset =A0 =A0 =A0 =A0 =3D 0,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.size =A0 =A0 =A0 =A0 =A0 =3D MTDPART_SIZ_=
FULL,
> =A0 =A0 =A0 =A0},
> @@ -104,6 +136,7 @@ static void onenand_lock_handle(struct onenand_chip *=
this, int cmd)
>
> =A0 =A0 =A0 =A0switch (cmd) {
> =A0 =A0 =A0 =A0case ONENAND_CMD_UNLOCK:
> + =A0 =A0 =A0 case ONENAND_CMD_UNLOCK_ALL:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0if (block_lock_scheme)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0ONENAND_SET_WP_STATUS(ONEN=
AND_WP_US, this);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0else
> @@ -228,10 +261,12 @@ static void onenand_data_handle(struct onenand_chip=
 *this, int cmd,
> =A0{
> =A0 =A0 =A0 =A0struct mtd_info *mtd =3D &info->mtd;
> =A0 =A0 =A0 =A0struct onenand_flash *flash =3D this->priv;
> - =A0 =A0 =A0 int main_offset, spare_offset;
> + =A0 =A0 =A0 int main_offset, spare_offset, die =3D 0;
> =A0 =A0 =A0 =A0void __iomem *src;
> =A0 =A0 =A0 =A0void __iomem *dest;
> =A0 =A0 =A0 =A0unsigned int i;
> + =A0 =A0 =A0 static int pi_operation;
> + =A0 =A0 =A0 int erasesize, rgn;
>
> =A0 =A0 =A0 =A0if (dataram) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0main_offset =3D mtd->writesize;
> @@ -241,10 +276,27 @@ static void onenand_data_handle(struct onenand_chip=
 *this, int cmd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0spare_offset =3D 0;
> =A0 =A0 =A0 =A0}
>
> + =A0 =A0 =A0 if (pi_operation) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 die =3D readw(this->base + ONENAND_REG_STAR=
T_ADDRESS2);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 die >>=3D ONENAND_DDP_SHIFT;
> + =A0 =A0 =A0 }
> +
> =A0 =A0 =A0 =A0switch (cmd) {
> + =A0 =A0 =A0 case FLEXONENAND_CMD_PI_ACCESS:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pi_operation =3D 1;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 case ONENAND_CMD_RESET:
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pi_operation =3D 0;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> =A0 =A0 =A0 =A0case ONENAND_CMD_READ:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0src =3D ONENAND_CORE(flash) + offset;
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dest =3D ONENAND_MAIN_AREA(this, main_offs=
et);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pi_operation) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 writew(boundary[die], this-=
>base + ONENAND_DATARAM);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memcpy(dest, src, mtd->writesize);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* Fall through */
>
> @@ -257,6 +309,10 @@ static void onenand_data_handle(struct onenand_chip =
*this, int cmd,
> =A0 =A0 =A0 =A0case ONENAND_CMD_PROG:
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0src =3D ONENAND_MAIN_AREA(this, main_offse=
t);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dest =3D ONENAND_CORE(flash) + offset;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pi_operation) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 boundary[die] =3D readw(thi=
s->base + ONENAND_DATARAM);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 }
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0/* To handle partial write */
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0for (i =3D 0; i < (1 << mtd->subpage_sft);=
 i++) {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0int off =3D i * this->subp=
agesize;
> @@ -284,9 +340,18 @@ static void onenand_data_handle(struct onenand_chip =
*this, int cmd,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0case ONENAND_CMD_ERASE:
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 memset(ONENAND_CORE(flash) + offset, 0xff, =
mtd->erasesize);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (pi_operation)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 break;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 if (FLEXONENAND(this)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 rgn =3D flexonenand_region(=
mtd, offset);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 erasesize =3D mtd->erasereg=
ions[rgn].erasesize;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 } else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 erasesize =3D mtd->erasesiz=
e;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 memset(ONENAND_CORE(flash) + offset, 0xff, =
erasesize);
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0memset(ONENAND_CORE_SPARE(flash, this, off=
set), 0xff,
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(mtd->erasesize >> 5));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(erasesize >> 5));
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0break;
>
> =A0 =A0 =A0 =A0default:
> @@ -339,7 +404,7 @@ static void onenand_command_handle(struct onenand_chi=
p *this, int cmd)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0if (block !=3D -1)
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset +=3D block << this->erase_shift;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 offset =3D onenand_addr(this, block);
>
> =A0 =A0 =A0 =A0if (page !=3D -1)
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0offset +=3D page << this->page_shift;
> @@ -390,6 +455,7 @@ static int __init flash_init(struct onenand_flash *fl=
ash)
> =A0 =A0 =A0 =A0}
>
> =A0 =A0 =A0 =A0density =3D device_id >> ONENAND_DEVICE_DENSITY_SHIFT;
> + =A0 =A0 =A0 density &=3D ONENAND_DEVICE_DENSITY_MASK;
> =A0 =A0 =A0 =A0size =3D ((16 << 20) << density);
>
> =A0 =A0 =A0 =A0ONENAND_CORE(flash) =3D vmalloc(size + (size >> 5));
> @@ -405,8 +471,9 @@ static int __init flash_init(struct onenand_flash *fl=
ash)
> =A0 =A0 =A0 =A0writew(manuf_id, flash->base + ONENAND_REG_MANUFACTURER_ID=
);
> =A0 =A0 =A0 =A0writew(device_id, flash->base + ONENAND_REG_DEVICE_ID);
> =A0 =A0 =A0 =A0writew(version_id, flash->base + ONENAND_REG_VERSION_ID);
> + =A0 =A0 =A0 writew(technology_id, flash->base + ONENAND_REG_TECHNOLOGY)=
;
>
> - =A0 =A0 =A0 if (density < 2)
> + =A0 =A0 =A0 if (density < 2 && (!CONFIG_FLEXONENAND))
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buffer_size =3D 0x0400; =A0 /* 1KiB page *=
/
> =A0 =A0 =A0 =A0else
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0buffer_size =3D 0x0800; =A0 /* 2KiB page *=
/
> diff --git a/include/linux/mtd/onenand.h b/include/linux/mtd/onenand.h
> index 0fa3ac4..9aab82c 100644
> --- a/include/linux/mtd/onenand.h
> +++ b/include/linux/mtd/onenand.h
> @@ -17,6 +17,7 @@
> =A0#include <linux/mtd/onenand_regs.h>
> =A0#include <linux/mtd/bbm.h>
>
> +#define MAX_DIES =A0 =A0 =A0 =A0 =A0 =A0 =A0 2
> =A0#define MAX_BUFFERRAM =A0 =A0 =A0 =A0 =A02
>
> =A0/* Scan and identify a OneNAND device */
> @@ -51,7 +52,12 @@ struct onenand_bufferram {
> =A0/**
> =A0* struct onenand_chip - OneNAND Private Flash Chip Data
> =A0* @base: =A0 =A0 =A0 =A0 =A0 =A0 =A0[BOARDSPECIFIC] address to access =
OneNAND
> + * @dies: =A0 =A0 =A0 =A0 =A0 =A0 =A0[INTERN][FLEX-ONENAND] number of di=
es on chip
> + * @boundary: =A0 =A0 =A0 =A0 =A0[INTERN][FLEX-ONENAND] Boundary of the =
dies
> + * @diesize: =A0 =A0 =A0 =A0 =A0 [INTERN][FLEX-ONENAND] Size of the dies
> =A0* @chipsize: =A0 =A0 =A0 =A0 =A0[INTERN] the size of one chip for mult=
ichip arrays
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 FIXME For Flex-OneNAND, chips=
ize holds maximum possible
> + * =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 device size ie when all block=
s are considered MLC
> =A0* @device_id: =A0 =A0 =A0 =A0 [INTERN] device ID
> =A0* @density_mask: =A0 =A0 =A0chip density, used for DDP devices
> =A0* @verstion_id: =A0 =A0 =A0 [INTERN] version ID
> @@ -92,9 +98,13 @@ struct onenand_bufferram {
> =A0*/
> =A0struct onenand_chip {
> =A0 =A0 =A0 =A0void __iomem =A0 =A0 =A0 =A0 =A0 =A0*base;
> + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0dies;
> + =A0 =A0 =A0 unsigned =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0boundary[MAX_DIES];
> + =A0 =A0 =A0 loff_t =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0diesize[MAX_DIES]=
;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0chipsize;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0device_id;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0version_id;
> + =A0 =A0 =A0 unsigned int =A0 =A0 =A0 =A0 =A0 =A0technology;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0density_mask;
> =A0 =A0 =A0 =A0unsigned int =A0 =A0 =A0 =A0 =A0 =A0options;
>
> @@ -145,6 +155,8 @@ struct onenand_chip {
> =A0#define ONENAND_SET_BUFFERRAM0(this) =A0 =A0 =A0 =A0 =A0 (this->buffer=
ram_index =3D 0)
> =A0#define ONENAND_SET_BUFFERRAM1(this) =A0 =A0 =A0 =A0 =A0 (this->buffer=
ram_index =3D 1)
>
> +#define FLEXONENAND(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> + =A0 =A0 =A0 (this->device_id & DEVICE_IS_FLEXONENAND)
> =A0#define ONENAND_GET_SYS_CFG1(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0(this->read_word(this->base + ONENAND_REG_SYS_CFG1))
> =A0#define ONENAND_SET_SYS_CFG1(v, this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> @@ -153,6 +165,9 @@ struct onenand_chip {
> =A0#define ONENAND_IS_DDP(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> =A0 =A0 =A0 =A0(this->device_id & ONENAND_DEVICE_IS_DDP)
>
> +#define ONENAND_IS_MLC(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0=
 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 \
> + =A0 =A0 =A0 (this->technology & ONENAND_TECHNOLOGY_IS_MLC)
> +
> =A0#ifdef CONFIG_MTD_ONENAND_2X_PROGRAM
> =A0#define ONENAND_IS_2PLANE(this) =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0\
> =A0 =A0 =A0 =A0(this->options & ONENAND_HAS_2PLANE)
> @@ -190,5 +205,8 @@ struct onenand_manufacturers {
>
> =A0int onenand_bbt_read_oob(struct mtd_info *mtd, loff_t from,
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 struct mtd_oob_ops *ops);
> +unsigned onenand_block(struct onenand_chip *this, loff_t addr);
> +loff_t onenand_addr(struct onenand_chip *this, int block);
> +int flexonenand_region(struct mtd_info *mtd, loff_t addr);
>
> =A0#endif /* __LINUX_MTD_ONENAND_H */
> diff --git a/include/linux/mtd/onenand_regs.h b/include/linux/mtd/onenand=
_regs.h
> index 0c6bbe2..86a6bbe 100644
> --- a/include/linux/mtd/onenand_regs.h
> +++ b/include/linux/mtd/onenand_regs.h
> @@ -67,6 +67,9 @@
> =A0/*
> =A0* Device ID Register F001h (R)
> =A0*/
> +#define DEVICE_IS_FLEXONENAND =A0 =A0 =A0 =A0 =A0(1 << 9)
> +#define FLEXONENAND_PI_MASK =A0 =A0 =A0 =A0 =A0 =A0(0x3ff)
> +#define FLEXONENAND_PI_UNLOCK_SHIFT =A0 =A0(14)
> =A0#define ONENAND_DEVICE_DENSITY_MASK =A0 =A0(0xf)
> =A0#define ONENAND_DEVICE_DENSITY_SHIFT =A0 (4)
> =A0#define ONENAND_DEVICE_IS_DDP =A0 =A0 =A0 =A0 =A0(1 << 3)
> @@ -84,6 +87,11 @@
> =A0#define ONENAND_VERSION_PROCESS_SHIFT =A0(8)
>
> =A0/*
> + * Technology Register F006h (R)
> + */
> +#define ONENAND_TECHNOLOGY_IS_MLC =A0 =A0 =A0(1 << 0)
> +
> +/*
> =A0* Start Address 1 F100h (R/W) & Start Address 2 F101h (R/W)
> =A0*/
> =A0#define ONENAND_DDP_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(15)
> @@ -93,7 +101,8 @@
> =A0/*
> =A0* Start Address 8 F107h (R/W)
> =A0*/
> -#define ONENAND_FPA_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x3f)
> +/* Note: It's actually 0x3f in case of SLC */
> +#define ONENAND_FPA_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x7f)
> =A0#define ONENAND_FPA_SHIFT =A0 =A0 =A0 =A0 =A0 =A0 =A0(2)
> =A0#define ONENAND_FSA_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x03)
>
> @@ -105,7 +114,8 @@
> =A0#define ONENAND_BSA_BOOTRAM =A0 =A0 =A0 =A0 =A0 =A0(0 << 2)
> =A0#define ONENAND_BSA_DATARAM0 =A0 =A0 =A0 =A0 =A0 (2 << 2)
> =A0#define ONENAND_BSA_DATARAM1 =A0 =A0 =A0 =A0 =A0 (3 << 2)
> -#define ONENAND_BSC_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x03)
> +/* Note: It's actually 0x03 in case of SLC */
> +#define ONENAND_BSC_MASK =A0 =A0 =A0 =A0 =A0 =A0 =A0 (0x07)
>
> =A0/*
> =A0* Command Register F220h (R/W)
> @@ -124,9 +134,13 @@
> =A0#define ONENAND_CMD_RESET =A0 =A0 =A0 =A0 =A0 =A0 =A0(0xF0)
> =A0#define ONENAND_CMD_OTP_ACCESS =A0 =A0 =A0 =A0 (0x65)
> =A0#define ONENAND_CMD_READID =A0 =A0 =A0 =A0 =A0 =A0 (0x90)
> +#define FLEXONENAND_CMD_PI_UPDATE =A0 =A0 =A0(0x05)
> +#define FLEXONENAND_CMD_PI_ACCESS =A0 =A0 =A0(0x66)
> +#define FLEXONENAND_CMD_RECOVER_LSB =A0 =A0(0x05)
>
> =A0/* NOTE: Those are not *REAL* commands */
> =A0#define ONENAND_CMD_BUFFERRAM =A0 =A0 =A0 =A0 =A0(0x1978)
> +#define FLEXONENAND_CMD_READ_PI =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(0x1985)
>
> =A0/*
> =A0* System Configuration 1 Register F221h (R, R/W)
> @@ -192,10 +206,12 @@
> =A0#define ONENAND_ECC_1BIT_ALL =A0 =A0 =A0 =A0 =A0 (0x5555)
> =A0#define ONENAND_ECC_2BIT =A0 =A0 =A0 =A0 =A0 =A0 =A0 (1 << 1)
> =A0#define ONENAND_ECC_2BIT_ALL =A0 =A0 =A0 =A0 =A0 (0xAAAA)
> +#define FLEXONENAND_UNCORRECTABLE_ERROR =A0 =A0 =A0 =A0(0x1010)
>
> =A0/*
> =A0* One-Time Programmable (OTP)
> =A0*/
> +#define FLEXONENAND_OTP_LOCK_OFFSET =A0 =A0 =A0 =A0 =A0 =A0(2048)
> =A0#define ONENAND_OTP_LOCK_OFFSET =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0(14)
>
> =A0#endif /* __ONENAND_REG_H */
>
> __________________________________________________________
> Linux-MTD CVS commit list
> http://lists.infradead.org/mailman/listinfo/linux-mtd-cvs/
>
