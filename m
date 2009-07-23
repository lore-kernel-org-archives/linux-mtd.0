Received: from mail-pz0-f201.google.com ([209.85.222.201])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTmPy-0006Nt-3j
	for linux-mtd@lists.infradead.org; Thu, 23 Jul 2009 00:44:23 +0000
Received: by pzk39 with SMTP id 39so399636pzk.28
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jul 2009 17:44:15 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A56EB07.20606@gmail.com>
References: <4A56EB07.20606@gmail.com>
Date: Thu, 23 Jul 2009 08:44:15 +0800
Message-ID: <e68bb3470907221744v4edb76f5s50082a70e88c4be2@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: Add nand support for w90p910
From: Wan ZongShun <mcuos.com@gmail.com>
To: linux-arm-kernel <linux-arm-kernel@lists.arm.linux.org.uk>,
	linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear David,

What about this patch?


2009/7/10 Wan ZongShun <mcuos.com@gmail.com>:
> Dear David,
>
> I have modified some clock api issue,and resubmitted
> it, marking it as V2.Thanks!
>
> Add w90p910 NAND driver for w90p910 evaluation board
> based on w90p910,there is a K8F1G08 NAND on my board.
>
> Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>
>
> ---
> =C2=A0drivers/mtd/nand/Kconfig =C2=A0 =C2=A0 =C2=A0 =C2=A0| =C2=A0 =C2=A0=
7 +
> =C2=A0drivers/mtd/nand/Makefile =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A01 +
> =C2=A0drivers/mtd/nand/w90p910_nand.c | =C2=A0382 +++++++++++++++++++++++=
++++++++++++++++
> =C2=A03 files changed, 390 insertions(+), 0 deletions(-)
> =C2=A0create mode 100644 drivers/mtd/nand/w90p910_nand.c
>
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index ce96c09..14201c8 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -452,4 +452,11 @@ config MTD_NAND_SOCRATES
> =C2=A0 =C2=A0 =C2=A0 =C2=A0help
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Enables support for NAND Flash chips wi=
red onto Socrates board.
>
> +config MTD_NAND_W90P910
> + =C2=A0 =C2=A0 =C2=A0 tristate "Support for NAND on w90p910 evaluation b=
oard."
> + =C2=A0 =C2=A0 =C2=A0 depends on ARCH_W90X900
> + =C2=A0 =C2=A0 =C2=A0 help
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 This enables the driver for the NAND Flash =
on evaluation board based
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 on w90p910.
> +
> =C2=A0endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index f3a786b..4f7b189 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -40,5 +40,6 @@ obj-$(CONFIG_MTD_NAND_SH_FLCTL) =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D sh_flctl.o
> =C2=A0obj-$(CONFIG_MTD_NAND_MXC) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 +=3D mxc_nand.o
> =C2=A0obj-$(CONFIG_MTD_NAND_SOCRATES) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0+=3D socrates_nand.o
> =C2=A0obj-$(CONFIG_MTD_NAND_TXX9NDFMC) =C2=A0 =C2=A0 =C2=A0 +=3D txx9ndfm=
c.o
> +obj-$(CONFIG_MTD_NAND_W90P910) =C2=A0 =C2=A0 =C2=A0 =C2=A0 +=3D w90p910_=
nand.o
>
> =C2=A0nand-objs :=3D nand_base.o nand_bbt.o
> diff --git a/drivers/mtd/nand/w90p910_nand.c b/drivers/mtd/nand/w90p910_n=
and.c
> new file mode 100644
> index 0000000..7680e73
> --- /dev/null
> +++ b/drivers/mtd/nand/w90p910_nand.c
> @@ -0,0 +1,382 @@
> +/*
> + * Copyright (c) 2009 Nuvoton technology corporation.
> + *
> + * Wan ZongShun <mcuos.com@gmail.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation;version 2 of the License.
> + *
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/init.h>
> +#include <linux/module.h>
> +#include <linux/interrupt.h>
> +#include <linux/io.h>
> +#include <linux/platform_device.h>
> +#include <linux/delay.h>
> +#include <linux/clk.h>
> +#include <linux/err.h>
> +
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/partitions.h>
> +
> +#define REG_FMICSR =C2=A0 =C2=A0 0x00
> +#define REG_SMCSR =C2=A0 =C2=A0 =C2=A00xa0
> +#define REG_SMISR =C2=A0 =C2=A0 =C2=A00xac
> +#define REG_SMCMD =C2=A0 =C2=A0 =C2=A00xb0
> +#define REG_SMADDR =C2=A0 =C2=A0 0xb4
> +#define REG_SMDATA =C2=A0 =C2=A0 0xb8
> +
> +#define RESET_FMI =C2=A0 =C2=A0 =C2=A00x01
> +#define NAND_EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00=
x08
> +#define READYBUSY =C2=A0 =C2=A0 =C2=A0(0x01 << 18)
> +
> +#define SWRST =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00x01
> +#define PSIZE =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(0x01 << 3)
> +#define DMARWEN =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
0x03 << 1)
> +#define BUSWID =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x01 << 4)
> +#define ECC4EN =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x01 << 5)
> +#define WP =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x01 << 24)
> +#define NANDCS =C2=A0 =C2=A0 =C2=A0 =C2=A0 (0x01 << 25)
> +#define ENDADDR =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(=
0x01 << 31)
> +
> +#define read_data_reg(dev) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 __raw_readl((dev)->reg + REG_SMDATA)
> +
> +#define write_data_reg(dev, val) =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((val), (dev)->reg + REG_SMDATA)
> +
> +#define write_cmd_reg(dev, val) =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0\
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((val), (dev)->reg + REG_SMCMD)
> +
> +#define write_addr_reg(dev, val) =C2=A0 =C2=A0 =C2=A0 \
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel((val), (dev)->reg + REG_SMADDR)
> +
> +struct w90p910_nand {
> + =C2=A0 =C2=A0 =C2=A0 struct mtd_info mtd;
> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip chip;
> + =C2=A0 =C2=A0 =C2=A0 void __iomem *reg;
> + =C2=A0 =C2=A0 =C2=A0 struct clk *clk;
> + =C2=A0 =C2=A0 =C2=A0 spinlock_t lock;
> +};
> +
> +static const struct mtd_partition partitions[] =3D {
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D "NAND FS 0",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D 0,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D 8 * 1024 * 1024
> + =C2=A0 =C2=A0 =C2=A0 },
> + =C2=A0 =C2=A0 =C2=A0 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.name =3D "NAND FS 1",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.offset =3D MTDPART_OFS_APPEND,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0.size =3D MTDPART_SIZ_FULL
> + =C2=A0 =C2=A0 =C2=A0 }
> +};
> +
> +static unsigned char w90p910_nand_read_byte(struct mtd_info *mtd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned char ret;
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *nand;
> +
> + =C2=A0 =C2=A0 =C2=A0 nand =3D container_of(mtd, struct w90p910_nand, mt=
d);
> +
> + =C2=A0 =C2=A0 =C2=A0 ret =3D (unsigned char)read_data_reg(nand);
> +
> + =C2=A0 =C2=A0 =C2=A0 return ret;
> +}
> +
> +static void w90p910_nand_read_buf(struct mtd_info *mtd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 unsigned char *buf, int len)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *nand;
> +
> + =C2=A0 =C2=A0 =C2=A0 nand =3D container_of(mtd, struct w90p910_nand, mt=
d);
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < len; i++)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 buf[i] =3D (unsigned c=
har)read_data_reg(nand);
> +}
> +
> +static void w90p910_nand_write_buf(struct mtd_info *mtd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const unsign=
ed char *buf, int len)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *nand;
> +
> + =C2=A0 =C2=A0 =C2=A0 nand =3D container_of(mtd, struct w90p910_nand, mt=
d);
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < len; i++)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_data_reg(nand, b=
uf[i]);
> +}
> +
> +static int w90p910_verify_buf(struct mtd_info *mtd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 const unsign=
ed char *buf, int len)
> +{
> + =C2=A0 =C2=A0 =C2=A0 int i;
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *nand;
> +
> + =C2=A0 =C2=A0 =C2=A0 nand =3D container_of(mtd, struct w90p910_nand, mt=
d);
> +
> + =C2=A0 =C2=A0 =C2=A0 for (i =3D 0; i < len; i++) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (buf[i] !=3D (unsig=
ned char)read_data_reg(nand))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return -EFAULT;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static int w90p910_check_rb(struct w90p910_nand *nand)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned int val;
> + =C2=A0 =C2=A0 =C2=A0 spin_lock(&nand->lock);
> + =C2=A0 =C2=A0 =C2=A0 val =3D __raw_readl(REG_SMISR);
> + =C2=A0 =C2=A0 =C2=A0 val &=3D READYBUSY;
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock(&nand->lock);
> +
> + =C2=A0 =C2=A0 =C2=A0 return val;
> +}
> +
> +static int w90p910_nand_devready(struct mtd_info *mtd)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *nand;
> + =C2=A0 =C2=A0 =C2=A0 int ready;
> +
> + =C2=A0 =C2=A0 =C2=A0 nand =3D container_of(mtd, struct w90p910_nand, mt=
d);
> +
> + =C2=A0 =C2=A0 =C2=A0 ready =3D (w90p910_check_rb(nand)) ? 1 : 0;
> + =C2=A0 =C2=A0 =C2=A0 return ready;
> +}
> +
> +static void w90p910_nand_command_lp(struct mtd_info *mtd,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 unsigned int command, int column, int page_addr)
> +{
> + =C2=A0 =C2=A0 =C2=A0 register struct nand_chip *chip =3D mtd->priv;
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *nand;
> +
> + =C2=A0 =C2=A0 =C2=A0 nand =3D container_of(mtd, struct w90p910_nand, mt=
d);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (command =3D=3D NAND_CMD_READOOB) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 column +=3D mtd->write=
size;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 command =3D NAND_CMD_R=
EAD0;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 write_cmd_reg(nand, command & 0xff);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (column !=3D -1 || page_addr !=3D -1) {
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (column !=3D -1) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (chip->options & NAND_BUSWIDTH_16)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 column >>=3D 1;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 write_addr_reg(nand, column);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 write_addr_reg(nand, column >> 8 | ENDADDR);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (page_addr !=3D -1)=
 {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 write_addr_reg(nand, page_addr);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if (chip->chipsize > (128 << 20)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_addr_reg(nand, page_addr >> 8);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_addr_reg(nand, page_addr >> 16 | E=
NDADDR);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 } else {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_addr_reg(nand, page_addr >> 8 | EN=
DADDR);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 switch (command) {
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_CACHEDPROG:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_PAGEPROG:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_ERASE1:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_ERASE2:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_SEQIN:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_RNDIN:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_STATUS:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_DEPLETE1:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> +
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_STATUS_ERROR:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_STATUS_ERROR0:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_STATUS_ERROR1:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_STATUS_ERROR2:
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_STATUS_ERROR3:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udelay(chip->chip_dela=
y);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> +
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_RESET:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (chip->dev_ready)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 break;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 udelay(chip->chip_dela=
y);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_cmd_reg(nand, NA=
ND_CMD_STATUS);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_cmd_reg(nand, co=
mmand);
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (!w90p910_check_=
rb(nand))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 ;
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> +
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_RNDOUT:
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_cmd_reg(nand, NA=
ND_CMD_RNDOUTSTART);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;
> +
> + =C2=A0 =C2=A0 =C2=A0 case NAND_CMD_READ0:
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 write_cmd_reg(nand, NA=
ND_CMD_READSTART);
> + =C2=A0 =C2=A0 =C2=A0 default:
> +
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!chip->dev_ready) =
{
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 udelay(chip->chip_delay);
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 return;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 /* Apply this short delay always to ensure that we=
 do wait tWB in
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0* any case on any machine. */
> + =C2=A0 =C2=A0 =C2=A0 ndelay(100);
> +
> + =C2=A0 =C2=A0 =C2=A0 while (!chip->dev_ready(mtd))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ;
> +}
> +
> +
> +static void w90p910_nand_enable(struct w90p910_nand *nand)
> +{
> + =C2=A0 =C2=A0 =C2=A0 unsigned int val;
> + =C2=A0 =C2=A0 =C2=A0 spin_lock(&nand->lock);
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(RESET_FMI, (nand->reg + REG_FMICSR));
> +
> + =C2=A0 =C2=A0 =C2=A0 val =3D __raw_readl(nand->reg + REG_FMICSR);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!(val & NAND_EN))
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 __raw_writel(val | NAN=
D_EN, REG_FMICSR);
> +
> + =C2=A0 =C2=A0 =C2=A0 val =3D __raw_readl(nand->reg + REG_SMCSR);
> +
> + =C2=A0 =C2=A0 =C2=A0 val &=3D ~(SWRST|PSIZE|DMARWEN|BUSWID|ECC4EN|NANDC=
S);
> + =C2=A0 =C2=A0 =C2=A0 val |=3D WP;
> +
> + =C2=A0 =C2=A0 =C2=A0 __raw_writel(val, nand->reg + REG_SMCSR);
> +
> + =C2=A0 =C2=A0 =C2=A0 spin_unlock(&nand->lock);
> +}
> +
> +static int __devinit w90p910_nand_probe(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *w90p910_nand;
> + =C2=A0 =C2=A0 =C2=A0 struct nand_chip *chip;
> + =C2=A0 =C2=A0 =C2=A0 int retval;
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res;
> +
> + =C2=A0 =C2=A0 =C2=A0 retval =3D 0;
> +
> + =C2=A0 =C2=A0 =C2=A0 w90p910_nand =3D kzalloc(sizeof(struct w90p910_nan=
d), GFP_KERNEL);
> + =C2=A0 =C2=A0 =C2=A0 if (!w90p910_nand)
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 chip =3D &(w90p910_nand->chip);
> +
> + =C2=A0 =C2=A0 =C2=A0 w90p910_nand->mtd.priv =C2=A0=3D chip;
> + =C2=A0 =C2=A0 =C2=A0 w90p910_nand->mtd.owner =3D THIS_MODULE;
> + =C2=A0 =C2=A0 =C2=A0 spin_lock_init(&w90p910_nand->lock);
> +
> + =C2=A0 =C2=A0 =C2=A0 w90p910_nand->clk =3D clk_get(&pdev->dev, NULL);
> + =C2=A0 =C2=A0 =C2=A0 if (IS_ERR(w90p910_nand->clk)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D -ENOENT;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail1;
> + =C2=A0 =C2=A0 =C2=A0 }
> + =C2=A0 =C2=A0 =C2=A0 clk_enable(w90p910_nand->clk);
> +
> + =C2=A0 =C2=A0 =C2=A0 chip->cmdfunc =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D w90p910_nand_command_lp;
> + =C2=A0 =C2=A0 =C2=A0 chip->dev_ready =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D w9=
0p910_nand_devready;
> + =C2=A0 =C2=A0 =C2=A0 chip->read_byte =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D w9=
0p910_nand_read_byte;
> + =C2=A0 =C2=A0 =C2=A0 chip->write_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D w9=
0p910_nand_write_buf;
> + =C2=A0 =C2=A0 =C2=A0 chip->read_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D w90p910_nand_read_buf;
> + =C2=A0 =C2=A0 =C2=A0 chip->verify_buf =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D w9=
0p910_verify_buf;
> + =C2=A0 =C2=A0 =C2=A0 chip->chip_delay =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D 50=
;
> + =C2=A0 =C2=A0 =C2=A0 chip->options =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=3D 0;
> + =C2=A0 =C2=A0 =C2=A0 chip->ecc.mode =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
=3D NAND_ECC_SOFT;
> +
> + =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM=
, 0);
> + =C2=A0 =C2=A0 =C2=A0 if (!res) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D -ENXIO;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail1;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 if (!request_mem_region(res->start, resource_size(=
res), pdev->name)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D -EBUSY;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail1;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 w90p910_nand->reg =3D ioremap(res->start, resource=
_size(res));
> + =C2=A0 =C2=A0 =C2=A0 if (!w90p910_nand->reg) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D -ENOMEM;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail2;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 w90p910_nand_enable(w90p910_nand);
> +
> + =C2=A0 =C2=A0 =C2=A0 if (nand_scan(&(w90p910_nand->mtd), 1)) {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 retval =3D -ENXIO;
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 goto fail3;
> + =C2=A0 =C2=A0 =C2=A0 }
> +
> + =C2=A0 =C2=A0 =C2=A0 add_mtd_partitions(&(w90p910_nand->mtd), partition=
s,
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 ARRAY_SIZE(partitions));
> +
> + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, w90p910_nand);
> +
> + =C2=A0 =C2=A0 =C2=A0 return retval;
> +
> +fail3: iounmap(w90p910_nand->reg);
> +fail2: release_mem_region(res->start, resource_size(res));
> +fail1: kfree(w90p910_nand);
> + =C2=A0 =C2=A0 =C2=A0 return retval;
> +}
> +
> +static int __devexit w90p910_nand_remove(struct platform_device *pdev)
> +{
> + =C2=A0 =C2=A0 =C2=A0 struct w90p910_nand *w90p910_nand =3D platform_get=
_drvdata(pdev);
> + =C2=A0 =C2=A0 =C2=A0 struct resource *res;
> +
> + =C2=A0 =C2=A0 =C2=A0 iounmap(w90p910_nand->reg);
> +
> + =C2=A0 =C2=A0 =C2=A0 res =3D platform_get_resource(pdev, IORESOURCE_MEM=
, 0);
> + =C2=A0 =C2=A0 =C2=A0 release_mem_region(res->start, resource_size(res))=
;
> +
> + =C2=A0 =C2=A0 =C2=A0 clk_disable(w90p910_nand->clk);
> + =C2=A0 =C2=A0 =C2=A0 clk_put(w90p910_nand->clk);
> +
> + =C2=A0 =C2=A0 =C2=A0 kfree(w90p910_nand);
> +
> + =C2=A0 =C2=A0 =C2=A0 platform_set_drvdata(pdev, NULL);
> +
> + =C2=A0 =C2=A0 =C2=A0 return 0;
> +}
> +
> +static struct platform_driver w90p910_nand_driver =3D {
> + =C2=A0 =C2=A0 =C2=A0 .probe =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D w90p9=
10_nand_probe,
> + =C2=A0 =C2=A0 =C2=A0 .remove =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D __devexit_=
p(w90p910_nand_remove),
> + =C2=A0 =C2=A0 =C2=A0 .driver =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D {
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .name =C2=A0 =3D "w90p=
910-fmi",
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 .owner =C2=A0=3D THIS_=
MODULE,
> + =C2=A0 =C2=A0 =C2=A0 },
> +};
> +
> +static int __init w90p910_nand_init(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 return platform_driver_register(&w90p910_nand_driv=
er);
> +}
> +
> +static void __exit w90p910_nand_exit(void)
> +{
> + =C2=A0 =C2=A0 =C2=A0 platform_driver_unregister(&w90p910_nand_driver);
> +}
> +
> +module_init(w90p910_nand_init);
> +module_exit(w90p910_nand_exit);
> +
> +MODULE_AUTHOR("Wan ZongShun <mcuos.com@gmail.com>");
> +MODULE_DESCRIPTION("w90p910 nand driver!");
> +MODULE_LICENSE("GPL");
> +MODULE_ALIAS("platform:w90p910-fmi");
> --
> 1.5.6.3
>



--=20
Wan z.s
