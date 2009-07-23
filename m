Received: from mail-qy0-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTpx0-0004EB-Fi
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 04:30:42 +0000
Received: by qyk6 with SMTP id 6so958424qyk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jul 2009 21:30:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <cae21cf16cad72ef35ce7e8cc3effe25b497924e.1248300341.git.rubini@unipv.it>
References: <cover.1248300341.git.rubini@unipv.it>
	<cae21cf16cad72ef35ce7e8cc3effe25b497924e.1248300341.git.rubini@unipv.it>
Date: Thu, 23 Jul 2009 10:00:37 +0530
Message-ID: <ce9ab5790907222130o2f1d704u199fbf7f1435e74f@mail.gmail.com>
Subject: Re: [PATCH V4 1/2] Nand driver for Nomadik 8815 SoC (on NHK8815
	board)
From: vimal singh <vimal.newwork@gmail.com>
To: Alessandro Rubini <rubini-list@gnudd.com>, linux-mtd@lists.infradead.org,
	andrea.gallo@stericsson.com, STEricsson_nomadik_linux@list.st.com,
	linux@arm.linux.org.uk
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

On Thu, Jul 23, 2009 at 3:55 AM, Alessandro Rubini<rubini-list@gnudd.com> w=
rote:
>
> Signed-off-by: Alessandro Rubini <rubini@unipv.it>
> Acked-by: Andrea Gallo <andrea.gallo@stericsson.com>
> ---
> =A0arch/arm/mach-nomadik/board-nhk8815.c =A0 =A0 | =A0 92 ++++++++
> =A0arch/arm/mach-nomadik/include/mach/fsmc.h | =A0 29 +++
> =A0arch/arm/mach-nomadik/include/mach/nand.h | =A0 16 ++
> =A0drivers/mtd/nand/Kconfig =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0 =A06=
 +
> =A0drivers/mtd/nand/Makefile =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =A01 +
> =A0drivers/mtd/nand/nomadik_nand.c =A0 =A0 =A0 =A0 =A0 | =A0329 +++++++++=
++++++++++++++++++++
> =A06 files changed, 473 insertions(+), 0 deletions(-)
> =A0create mode 100644 arch/arm/mach-nomadik/include/mach/fsmc.h
> =A0create mode 100644 arch/arm/mach-nomadik/include/mach/nand.h
> =A0create mode 100644 drivers/mtd/nand/nomadik_nand.c

--snip--

> diff --git a/drivers/mtd/nand/nomadik_nand.c b/drivers/mtd/nand/nomadik_n=
and.c
> new file mode 100644
> index 0000000..bbd1925
> --- /dev/null
> +++ b/drivers/mtd/nand/nomadik_nand.c
> @@ -0,0 +1,329 @@
> +/*
> + * =A0drivers/mtd/nand/nomadik_nand.c
> + *
> + * =A0Overview:
> + * =A0 =A0 Driver for on-board NAND flash on Nomadik Platforms
> + *
> + * Copyright (C) 2007 STMicroelectronics Pvt. Ltd.
> + * Author: Sachin Verma <sachin.verma@st.com>
> + *
> + * Copyright (C) 2009 Alessandro Rubini
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. =A0See the
> + * GNU General Public License for more details.
> + *
> + */
> +
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/types.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/platform_device.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/io.h>

I think one black line will be good here.

> +#include <mach/nand.h>
> +#include <mach/fsmc.h>
> +
> +#include <mtd/mtd-abi.h>
> +
> +struct nomadik_nand_host {
> + =A0 =A0 =A0 struct mtd_info =A0 =A0 =A0 =A0 mtd;
> + =A0 =A0 =A0 struct nand_chip =A0 =A0 =A0 =A0nand;
> + =A0 =A0 =A0 void __iomem *data_va;
> + =A0 =A0 =A0 void __iomem *cmd_va;
> + =A0 =A0 =A0 void __iomem *addr_va;
> + =A0 =A0 =A0 struct nand_bbt_descr *bbt_desc;
> +};
> +
> +static inline int parity(int b) /* uses low 8 bits: returns 0 or all-1 *=
/
> +{
> + =A0 =A0 =A0 b =3D b ^ (b >> 4);
> + =A0 =A0 =A0 b =3D b ^ (b >> 2);
> + =A0 =A0 =A0 return (b ^ (b >> 1)) & 1
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ? ~0 : 0;
> +}
> +
> +/*
> + * This is the ECC routine used in hardware, according to the manual.
> + * HW claims to make the calculation but not the correction. However,
> + * I haven't managed to get the desired data out of it; so do it in sw.
> + * There is problably some errata involved, but currently miss the info.
> + */

'nand_calculate_ecc' and 'nand_correct_data' (nand_ecc.c) do it in SW.
This need not to be re-do.

> +static int nomadik_ecc512_calc(struct mtd_info *mtd, const u_char *data,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 u_char *ecc)
> +{
> + =A0 =A0 =A0 int gpar =3D 0;
> + =A0 =A0 =A0 int i, val, par;
> + =A0 =A0 =A0 int pbits =3D 0; =A0 =A0 =A0 =A0 =A0/* P8, P16, ... P2048 *=
/
> + =A0 =A0 =A0 int pprime =3D 0; =A0 =A0 =A0 =A0 /* P8', P16', ... P2048' =
*/
> + =A0 =A0 =A0 int lowbits; =A0 =A0 =A0 =A0 =A0 =A0/* P1, P2, P4 and prime=
s */
> +
> + =A0 =A0 =A0 for (i =3D 0; i < 512; i++) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 par =3D parity((val =3D data[i]));
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 gpar ^=3D val;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pbits ^=3D (i & par);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Ok, now gpar is global parity (xor of all bytes)
> + =A0 =A0 =A0 =A0* pbits are all the parity bits (non-prime ones)
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 par =3D parity(gpar);
> + =A0 =A0 =A0 pprime =3D pbits ^ par;
> + =A0 =A0 =A0 /* Put low bits in the right position for ecc[2] (bits 7..2=
) */
> + =A0 =A0 =A0 lowbits =3D 0
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 | (parity(gpar & 0xf0) & 0x80) =A0/* P4 =A0=
*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 | (parity(gpar & 0x0f) & 0x40) =A0/* P4' */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 | (parity(gpar & 0xcc) & 0x20) =A0/* P2 =A0=
*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 | (parity(gpar & 0x33) & 0x10) =A0/* P2' */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 | (parity(gpar & 0xaa) & 0x08) =A0/* P1 =A0=
*/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 | (parity(gpar & 0x55) & 0x04); /* P1' */
> +
> + =A0 =A0 =A0 ecc[2] =3D ~(lowbits | ((pbits & 0x100) >> 7) | ((pprime & =
0x100) >> 8));
> + =A0 =A0 =A0 /* now intermix bits for ecc[1] (P1024..P128') and ecc[0] (=
P64..P8') */
> + =A0 =A0 =A0 ecc[1] =3D ~( =A0 =A0(pbits & 0x80) >> 0 =A0| ((pprime & 0x=
80) >> 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((pbits & 0x40) >> 1) | ((pprime =
& 0x40) >> 2)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((pbits & 0x20) >> 2) | ((pprime =
& 0x20) >> 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((pbits & 0x10) >> 3) | ((pprime =
& 0x10) >> 4));
> +
> + =A0 =A0 =A0 ecc[0] =3D ~( =A0 =A0(pbits & 0x8) << 4 =A0| ((pprime & 0x8=
) << 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((pbits & 0x4) << 3) | ((pprime &=
 0x4) << 2)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((pbits & 0x2) << 2) | ((pprime &=
 0x2) << 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((pbits & 0x1) << 1) | ((pprime &=
 0x1) << 0));
> + =A0 =A0 =A0 return 0;
> +}
> +
> +static int nomadik_ecc512_correct(struct mtd_info *mtd, uint8_t *dat,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 uint8_t *r_=
ecc, uint8_t *c_ecc)
> +{
> + =A0 =A0 =A0 struct nand_chip *chip =3D mtd->priv;
> + =A0 =A0 =A0 uint32_t r, c, d, diff; /*read, calculated, xor of them */
> +
> + =A0 =A0 =A0 if (!memcmp(r_ecc, c_ecc, chip->ecc.bytes))
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> +
> + =A0 =A0 =A0 /* Reorder the bytes into ascending-order 24 bits -- see ma=
nual */
> + =A0 =A0 =A0 r =3D r_ecc[2] << 22 | r_ecc[1] << 14 | r_ecc[0] << 6 | r_e=
cc[2] >> 2;
> + =A0 =A0 =A0 c =3D c_ecc[2] << 22 | c_ecc[1] << 14 | c_ecc[0] << 6 | c_e=
cc[2] >> 2;
> + =A0 =A0 =A0 diff =3D (r ^ c) & ((1 << 24) - 1); /* use 24 bits only */
> +
> + =A0 =A0 =A0 /* If 12 bits are different, one per pair, it's correctable=
 */
> + =A0 =A0 =A0 if (((diff | (diff>>1)) & 0x555555) =3D=3D 0x555555) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int bit =3D ((diff & 2) >> 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((diff & 0x8) >> 2) | ((d=
iff & 0x20) >> 3);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 int byte;
> +
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 d =3D diff >> 6; /* remove bit-order info *=
/
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 byte =3D =A0((d & 2) >> 1)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((d & 0x8) >> 2) | ((d & =
0x20) >> 3)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((d & 0x80) >> 4) | ((d &=
 0x200) >> 5)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((d & 0x800) >> 6) | ((d =
& 0x2000) >> 7)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 | ((d & 0x8000) >> 8) | ((d=
 & 0x20000) >> 9);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 /* correct the single bit */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dat[byte] ^=3D 1 << bit;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 /* If 1 bit only differs, it's one bit error in ECC, ignore=
 */
> + =A0 =A0 =A0 if ((diff ^ (1 << (ffs(diff) - 1))) =3D=3D 0)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return 0;
> + =A0 =A0 =A0 /* Otherwise, uncorrectable */
> + =A0 =A0 =A0 return -1;
> +}
> +
> +static struct nand_ecclayout nomadik_ecc_layout =3D {
> + =A0 =A0 =A0 .eccbytes =3D 3 * 4,
> + =A0 =A0 =A0 .eccpos =3D { /* each subpage has 16 bytes: pos 2,3,4 hosts=
 ECC */
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x02, 0x03, 0x04,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x12, 0x13, 0x14,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x22, 0x23, 0x24,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 0x32, 0x33, 0x34},
> + =A0 =A0 =A0 /* let's keep bytes 5,6,7 for us, just in case we change EC=
C algo */
> + =A0 =A0 =A0 .oobfree =3D { {0x08, 0x08}, {0x18, 0x08}, {0x28, 0x08}, {0=
x38, 0x08} },
> +};
> +
> +static void nomadik_ecc_control(struct mtd_info *mtd, int mode)
> +{
> + =A0 =A0 =A0 /* No need to enable hw ecc, it's on by default */
> +}
> +
> +static void nomadik_cmd_ctrl(struct mtd_info *mtd, int cmd, unsigned int=
 ctrl)
> +{
> + =A0 =A0 =A0 struct nand_chip *nand =3D mtd->priv;
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D nand->priv;
> +
> + =A0 =A0 =A0 if (cmd =3D=3D NAND_CMD_NONE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return;
> +
> + =A0 =A0 =A0 if (ctrl & NAND_CLE)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->cmd_va);
> + =A0 =A0 =A0 else
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 writeb(cmd, host->addr_va);
> +}
> +
> +static int nomadik_nand_probe(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> + =A0 =A0 =A0 struct nomadik_nand_host *host;
> + =A0 =A0 =A0 struct mtd_info *mtd;
> + =A0 =A0 =A0 struct nand_chip *nand;
> + =A0 =A0 =A0 struct resource *res;
> + =A0 =A0 =A0 int ret =3D 0;
> +
> + =A0 =A0 =A0 /* Allocate memory for the device structure (and zero it) *=
/
> + =A0 =A0 =A0 host =3D kzalloc(sizeof(struct nomadik_nand_host), GFP_KERN=
EL);
> + =A0 =A0 =A0 if (!host) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Failed to allocate dev=
ice structure.\n");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 return -ENOMEM;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Call the client's init function, if any */
> + =A0 =A0 =A0 if (pdata->init && (ret =3D pdata->init()) < 0) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 dev_err(&pdev->dev, "Init function failed\n=
");
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* ioremap three regions */
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_addr");
> + =A0 =A0 =A0 if (!res) {ret =3D -EIO; goto err_unmap; }

We should not write multiple statements in single line needlessly.

> + =A0 =A0 =A0 host->addr_va =3D ioremap(res->start, res->end - res->start=
 + 1);
> +
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_data");
> + =A0 =A0 =A0 if (!res) {ret =3D -EIO; goto err_unmap; }

ditto

> + =A0 =A0 =A0 host->data_va =3D ioremap(res->start, res->end - res->start=
 + 1);
> +
> + =A0 =A0 =A0 res =3D platform_get_resource_byname(pdev, IORESOURCE_MEM, =
"nand_cmd");
> + =A0 =A0 =A0 if (!res) {ret =3D -EIO; goto err_unmap; }

ditto...

> + =A0 =A0 =A0 host->cmd_va =3D ioremap(res->start, res->end - res->start =
+ 1);
> +
> + =A0 =A0 =A0 if (!host->addr_va || !host->data_va || !host->cmd_va) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENOMEM;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> +
> + =A0 =A0 =A0 /* Link all private pointers */
> + =A0 =A0 =A0 mtd =3D &host->mtd;
> + =A0 =A0 =A0 nand =3D &host->nand;
> + =A0 =A0 =A0 mtd->priv =3D nand;
> + =A0 =A0 =A0 nand->priv =3D host;
> +
> + =A0 =A0 =A0 host->mtd.owner =3D THIS_MODULE;
> + =A0 =A0 =A0 nand->IO_ADDR_R =3D host->data_va;
> + =A0 =A0 =A0 nand->IO_ADDR_W =3D host->data_va;
> + =A0 =A0 =A0 nand->cmd_ctrl =3D nomadik_cmd_ctrl;
> +
> + =A0 =A0 =A0 nand->ecc.mode =3D NAND_ECC_HW;
> + =A0 =A0 =A0 nand->ecc.layout =3D &nomadik_ecc_layout;
> + =A0 =A0 =A0 nand->ecc.calculate =3D nomadik_ecc512_calc;
> + =A0 =A0 =A0 nand->ecc.correct =3D nomadik_ecc512_correct;
> + =A0 =A0 =A0 nand->ecc.hwctl =3D nomadik_ecc_control;
> + =A0 =A0 =A0 nand->ecc.size =3D 512;
> + =A0 =A0 =A0 nand->ecc.bytes =3D 3;
> +
> + =A0 =A0 =A0 nand->options =3D pdata->options;
> +
> + =A0 =A0 =A0 /*
> + =A0 =A0 =A0 =A0* Scan to find existance of the device
> + =A0 =A0 =A0 =A0*/
> + =A0 =A0 =A0 if (nand_scan(&host->mtd, 1)) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D -ENXIO;
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 goto err_unmap;
> + =A0 =A0 =A0 }
> +
> +#ifdef CONFIG_MTD_PARTITIONS
> + =A0 =A0 =A0 add_mtd_partitions(&host->mtd, pdata->parts, pdata->nparts)=
;
> +#else
> + =A0 =A0 =A0 pr_info("Registering %s as whole device\n", mtd->name);
> + =A0 =A0 =A0 add_mtd_device(mtd);
> +#endif
> +
> + =A0 =A0 =A0 platform_set_drvdata(pdev, host);
> + =A0 =A0 =A0 return 0;
> +
> + err_unmap:
> + =A0 =A0 =A0 if (host->cmd_va) iounmap(host->cmd_va);
> + =A0 =A0 =A0 if (host->data_va) iounmap(host->data_va);
> + =A0 =A0 =A0 if (host->addr_va) iounmap(host->addr_va);
> + err:
> + =A0 =A0 =A0 kfree(host);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +/*
> + * Clean up routine
> + */
> +static int nomadik_nand_remove(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D platform_get_drvdata(pde=
v);
> + =A0 =A0 =A0 struct nomadik_nand_platform_data *pdata =3D pdev->dev.plat=
form_data;
> +
> + =A0 =A0 =A0 if (pdata->exit)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 pdata->exit();
> +
> + =A0 =A0 =A0 if (host) {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->cmd_va);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->data_va);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 iounmap(host->addr_va);
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 kfree(host);
> + =A0 =A0 =A0 }
> + =A0 =A0 =A0 return 0;
> +}
> +
> +#ifdef CONFIG_PM
> +static int nomadik_nand_suspend(struct platform_device *pdev,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 pm_message_=
t state)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D platform_get_drvdata(pde=
v);
> + =A0 =A0 =A0 int ret =3D 0;
> + =A0 =A0 =A0 if (host)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 ret =3D host->mtd.suspend(&host->mtd);
> + =A0 =A0 =A0 return ret;
> +}
> +
> +static int nomadik_nand_resume(struct platform_device *pdev)
> +{
> + =A0 =A0 =A0 struct nomadik_nand_host *host =3D platform_get_drvdata(pde=
v);
> + =A0 =A0 =A0 if (host)
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 host->mtd.resume(&host->mtd);
> + =A0 =A0 =A0 return 0;
> +}
> +
> +#else
> +#define nomadik_nand_suspend NULL
> +#define nomadik_nand_resume NULL
> +#endif /* CONFIG_PM */
> +
> +static struct platform_driver nomadik_nand_driver =3D {
> + =A0 =A0 =A0 .probe =3D nomadik_nand_probe,
> + =A0 =A0 =A0 .remove =3D nomadik_nand_remove,
> + =A0 =A0 =A0 .driver =3D {
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.owner =3D THIS_MODULE,
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0.name =3D "nomadik_nand",
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0},
> + =A0 =A0 =A0 .suspend =3D nomadik_nand_suspend,
> + =A0 =A0 =A0 .resume =3D nomadik_nand_resume,
> +};
> +
> +static int __init nand_nomadik_init(void)
> +{
> + =A0 =A0 =A0 pr_info("Nomadik NAND driver\n");
> + =A0 =A0 =A0 return platform_driver_register(&nomadik_nand_driver);
> +}
> +
> +static void __exit nand_nomadik_exit(void)
> +{
> + =A0 =A0 =A0 platform_driver_unregister(&nomadik_nand_driver);
> +}
> +
> +module_init(nand_nomadik_init);
> +module_exit(nand_nomadik_exit);
> +
> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("ST Microelectronics (sachin.verma@st.com)");
> +MODULE_DESCRIPTION("NAND driver for Nomadik Platform");
> --
> 1.6.0.2
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>



--=20
---
Regards,
\/ | |\/| /-\ |_

____      __o
------   -\<,
-----  ( )/ ( )
