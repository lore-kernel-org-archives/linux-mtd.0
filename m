Received: from eu-smtp-delivery-143.mimecast.com ([146.101.78.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zcq5A-0004Iq-V3
 for linux-mtd@lists.infradead.org; Fri, 18 Sep 2015 07:27:47 +0000
Date: Fri, 18 Sep 2015 15:27:10 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Bayi Cheng <bayi.cheng@mediatek.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, Pawel Moll <pawel.moll@arm.com>,
 Ian Campbell <ijc+devicetree@hellion.org.uk>,
 Sascha Hauer <s.hauer@pengutronix.de>, linux-kernel@vger.kernel.org,
 Daniel Kurtz <djkurtz@chromium.org>, jteki@openedev.com,
 Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, ezequiel@vanduardiasur.com.ar,
 Kumar Gala <galak@codeaurora.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] mtd: mtk-nor: mtk serial flash controller driver
Message-ID: <20150918072710.GA30710@free64-pc.asiapac.arm.com>
References: <1442559533-17552-1-git-send-email-bayi.cheng@mediatek.com>
 <1442559533-17552-3-git-send-email-bayi.cheng@mediatek.com>
MIME-Version: 1.0
In-Reply-To: <1442559533-17552-3-git-send-email-bayi.cheng@mediatek.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 18, 2015 at 02:58:52PM +0800, Bayi Cheng wrote:
> add spi nor flash driver for mediatek controller
>=20
> Signed-off-by: Bayi Cheng <bayi.cheng@mediatek.com>
> ---
>  drivers/mtd/spi-nor/Kconfig       |   7 +
>  drivers/mtd/spi-nor/Makefile      |   1 +
>  drivers/mtd/spi-nor/mtk_quadspi.c | 483 ++++++++++++++++++++++++++++++++=
++++++
>  3 files changed, 491 insertions(+)
>  create mode 100644 drivers/mtd/spi-nor/mtk_quadspi.c
>=20
> diff --git a/drivers/mtd/spi-nor/Kconfig b/drivers/mtd/spi-nor/Kconfig
> index 89bf4c1..f433890 100644
> --- a/drivers/mtd/spi-nor/Kconfig
> +++ b/drivers/mtd/spi-nor/Kconfig
> @@ -7,6 +7,13 @@ menuconfig MTD_SPI_NOR
> =20
>  if MTD_SPI_NOR
> =20
> +config MTD_MT81xx_NOR
> +=09tristate "Support SPI flash Controller MTD_MT81xx_NOR"
> +=09help
> +=09  This enables access to SPI Nor flash, using MTD_MT81XX_NOR controll=
er.
> +=09  This controller does nor support generic SPI BUS, It only supports
> +=09  SPI NOR Flash.
> +
>  config MTD_SPI_NOR_USE_4K_SECTORS
>  =09bool "Use small 4096 B erase sectors"
>  =09default y
> diff --git a/drivers/mtd/spi-nor/Makefile b/drivers/mtd/spi-nor/Makefile
> index e53333e..138cfea 100644
> --- a/drivers/mtd/spi-nor/Makefile
> +++ b/drivers/mtd/spi-nor/Makefile
> @@ -1,3 +1,4 @@
> +obj-$(CONFIG_MTD_MT81xx_NOR)=09+=3D mtk_quadspi.o
>  obj-$(CONFIG_MTD_SPI_NOR)=09+=3D spi-nor.o
>  obj-$(CONFIG_SPI_FSL_QUADSPI)=09+=3D fsl-quadspi.o
>  obj-$(CONFIG_SPI_NXP_SPIFI)=09+=3D nxp-spifi.o
> diff --git a/drivers/mtd/spi-nor/mtk_quadspi.c b/drivers/mtd/spi-nor/mtk_=
quadspi.c
> new file mode 100644
> index 0000000..f60560e
> --- /dev/null
> +++ b/drivers/mtd/spi-nor/mtk_quadspi.c
> @@ -0,0 +1,483 @@
> +/*
> + * Copyright (c) 2015 MediaTek Inc.
> + * Author: Bayi Cheng <bayi.cheng@mediatek.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> + * GNU General Public License for more details.
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/delay.h>
> +#include <linux/device.h>
> +#include <linux/init.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/ioport.h>
> +#include <linux/math64.h>
> +#include <linux/module.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mutex.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/of_gpio.h>
> +#include <linux/pinctrl/consumer.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/mtd/spi-nor.h>
> +
> +#define MTK_NOR_CMD_REG=09=09=090x00
> +#define MTK_NOR_CNT_REG=09=09=090x04
> +#define MTK_NOR_RDSR_REG=09=090x08
> +#define MTK_NOR_RDATA_REG=09=090x0c
> +#define MTK_NOR_RADR0_REG=09=090x10
> +#define MTK_NOR_RADR1_REG=09=090x14
> +#define MTK_NOR_RADR2_REG=09=090x18
> +#define MTK_NOR_WDATA_REG=09=090x1c
> +#define MTK_NOR_PRGDATA0_REG=09=090x20
> +#define MTK_NOR_PRGDATA1_REG=09=090x24
> +#define MTK_NOR_PRGDATA2_REG=09=090x28
> +#define MTK_NOR_PRGDATA3_REG=09=090x2c
> +#define MTK_NOR_PRGDATA4_REG=09=090x30
> +#define MTK_NOR_PRGDATA5_REG=09=090x34
> +#define MTK_NOR_SHREG0_REG=09=090x38
> +#define MTK_NOR_SHREG1_REG=09=090x3c
> +#define MTK_NOR_SHREG2_REG=09=090x40
> +#define MTK_NOR_SHREG3_REG=09=090x44
> +#define MTK_NOR_SHREG4_REG=09=090x48
> +#define MTK_NOR_SHREG5_REG=09=090x4c
> +#define MTK_NOR_SHREG6_REG=09=090x50
> +#define MTK_NOR_SHREG7_REG=09=090x54
> +#define MTK_NOR_SHREG8_REG=09=090x58
> +#define MTK_NOR_SHREG9_REG=09=090x5c
> +#define MTK_NOR_FLHCFG_REG=09=090x84
> +#define MTK_NOR_PP_DATA_REG=09=090x98
> +#define MTK_NOR_PREBUF_STUS_REG=09=090x9c
> +#define MTK_NOR_INTRSTUS_REG=09=090xa8
> +#define MTK_NOR_INTREN_REG=09=090xac
> +#define MTK_NOR_TIME_REG=09=090x94
> +#define MTK_NOR_CHKSUM_CTL_REG=09=090xb8
> +#define MTK_NOR_CHKSUM_REG=09=090xbc
> +#define MTK_NOR_CMD2_REG=09=090xc0
> +#define MTK_NOR_WRPROT_REG=09=090xc4
> +#define MTK_NOR_RADR3_REG=09=090xc8
> +#define MTK_NOR_DUAL_REG=09=090xcc
> +#define MTK_NOR_DELSEL0_REG=09=090xa0
> +#define MTK_NOR_DELSEL1_REG=09=090xa4
> +#define MTK_NOR_DELSEL2_REG=09=090xd0
> +#define MTK_NOR_DELSEL3_REG=09=090xd4
> +#define MTK_NOR_DELSEL4_REG=09=090xd8
> +#define MTK_NOR_CFG1_REG=09=090x60
> +#define MTK_NOR_CFG2_REG=09=090x64
> +#define MTK_NOR_CFG3_REG=09=090x68
> +#define MTK_NOR_STATUS0_REG=09=090x70
> +#define MTK_NOR_STATUS1_REG=09=090x74
> +#define MTK_NOR_STATUS2_REG=09=090x78
> +#define MTK_NOR_STATUS3_REG=09=090x7c
> +/* commands for mtk nor controller */
> +#define MTK_NOR_READ_CMD=09=090x0
> +#define MTK_NOR_RDSR_CMD=09=090x2
> +#define MTK_NOR_PRG_CMD=09=09=090x4
> +#define MTK_NOR_WR_CMD=09=09=090x10
> +#define MTK_NOR_WRSR_CMD=09=090x20
> +#define MTK_NOR_PIO_READ_CMD=09=090x81
> +#define MTK_NOR_WR_BUF_ENABLE=09=090x1
> +#define MTK_NOR_WR_BUF_DISABLE=09=090x0
> +#define MTK_NOR_ENABLE_SF_CMD=09=090x30
> +#define MTK_NOR_DUAD_ADDR_EN=09=090x8
> +#define MTK_NOR_QUAD_READ_EN=09=090x4
> +#define MTK_NOR_DUAL_ADDR_EN=09=090x2
> +#define MTK_NOR_DUAL_READ_EN=09=090x1
> +#define MTK_NOR_DUAL_DISABLE=09=090x0
> +#define MTK_NOR_FAST_READ=09=090x1
> +
> +#define SFLASH_WRBUF_SIZE=09=09128
> +#define MAX_FLASHCOUNT=09=09=091
> +#define SFLASHHWNAME_LEN=09=0912
> +#define SFLASH_MAX_DMA_SIZE=09=09(1024 * 8)
> +
> +#define LOCAL_BUF_SIZE=09=09(SFLASH_MAX_DMA_SIZE * 20)
> +
> +struct mt8173_nor {
> +=09struct mtd_info mtd;
> +=09struct spi_nor nor;
> +=09struct device *dev;
> +=09void __iomem *base;=09/* nor flash base address */
> +=09struct clk *spi_clk;
> +=09struct clk *nor_clk;
> +};
> +
> +static void mt8173_nor_set_read_mode(struct mt8173_nor *mt8173_nor)
> +{
> +=09struct spi_nor *nor =3D &mt8173_nor->nor;
> +
> +=09switch (nor->flash_read) {
> +=09case SPI_NOR_FAST:
> +=09=09writeb(SPINOR_OP_READ_FAST, mt8173_nor->base +
> +=09=09       MTK_NOR_PRGDATA3_REG);
> +=09=09writeb(MTK_NOR_FAST_READ, mt8173_nor->base +
> +=09=09       MTK_NOR_CFG1_REG);
> +=09=09break;
> +=09case SPI_NOR_DUAL:
> +=09=09writeb(SPINOR_OP_READ_1_1_2, mt8173_nor->base +
> +=09=09       MTK_NOR_PRGDATA3_REG);
> +=09=09writeb(MTK_NOR_DUAL_READ_EN, mt8173_nor->base +
> +=09=09       MTK_NOR_DUAL_REG);
> +=09=09break;
> +=09case SPI_NOR_QUAD:
> +=09=09writeb(SPINOR_OP_READ_1_1_4, mt8173_nor->base +
> +=09=09       MTK_NOR_PRGDATA3_REG);
> +=09=09writeb(MTK_NOR_QUAD_READ_EN, mt8173_nor->base +
> +=09=09       MTK_NOR_DUAL_REG);
> +=09=09break;
> +=09default:
> +=09=09writeb(SPINOR_OP_READ, mt8173_nor->base +
> +=09=09       MTK_NOR_PRGDATA3_REG);
> +=09=09writeb(MTK_NOR_DUAL_DISABLE, mt8173_nor->base +
> +=09=09       MTK_NOR_DUAL_REG);
> +=09=09break;
> +=09}
> +}
> +
> +static int mt8173_nor_execute_cmd(struct mt8173_nor *mt8173_nor, u8 cmdv=
al)
> +{
> +=09int reg;
> +=09u8 val =3D cmdval & 0x1f;
> +
> +=09writeb(cmdval, mt8173_nor->base + MTK_NOR_CMD_REG);
> +=09return readl_poll_timeout(mt8173_nor->base + MTK_NOR_CMD_REG, reg,
> +=09=09=09=09  !(reg & val), 100, 10000);
> +}
> +
> +static int mt8173_nor_set_cmd(struct mt8173_nor *mt8173_nor, int addr, i=
nt len,
> +=09=09=09      int op)
> +{
> +=09writeb(op, mt8173_nor->base + MTK_NOR_PRGDATA5_REG);
> +=09/*  send the address to nor flash
> +=09 *  MTK_NOR_PRGDATA5_REG is shifted first
> +=09 *  MTK_NOR_PRGDATA0_REG is shifted last
> +=09 */
> +=09writeb(((addr >> 16) & 0xff), mt8173_nor->base + MTK_NOR_PRGDATA4_REG=
);
> +=09writeb(((addr >> 8) & 0xff), mt8173_nor->base + MTK_NOR_PRGDATA3_REG)=
;
> +=09writeb((addr & 0xff), mt8173_nor->base + MTK_NOR_PRGDATA2_REG);
Why not use some macros to wrap the hardcode such as:
=09     (addr >> 16) & 0xff.

thanks
Huang Shijie
