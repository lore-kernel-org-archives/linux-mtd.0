Received: from mail-lb0-x22f.google.com ([2a00:1450:4010:c04::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YkZaS-0007dO-Qd
 for linux-mtd@lists.infradead.org; Tue, 21 Apr 2015 14:55:49 +0000
Received: by lbbzk7 with SMTP id zk7so157792252lbb.0
 for <linux-mtd@lists.infradead.org>; Tue, 21 Apr 2015 07:55:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1429624974-10335-1-git-send-email-bert@biot.com>
References: <1429624974-10335-1-git-send-email-bert@biot.com>
Date: Tue, 21 Apr 2015 17:55:20 +0300
Message-ID: <CAHp75VcKa1g_bt0+SwzOYjN9yyeKeYoZwPcMGpsjehyvCuDkyw@mail.gmail.com>
Subject: Re: [PATCH] nand: Add NAND driver for Mikrotik RB4xx series boards
From: Andy Shevchenko <andy.shevchenko@gmail.com>
To: Bert Vermeulen <bert@biot.com>
Content-Type: text/plain; charset=UTF-8
Cc: "open list:MEMORY TECHNOLOGY..." <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 21, 2015 at 5:02 PM, Bert Vermeulen <bert@biot.com> wrote:
> The NAND chip containing the root filesystem is behind an SPI-connected
> CPLD. This driver uses the spi-rb4xx driver to communicate with the CPLD.
>
> The CPLD also acts as a GPIO expander: the ALE/CLE/NCE pins are set via
> CPLD commands. Some LEDs on the board are also accessed this way.
>

Few comments below.

> Signed-off-by: Bert Vermeulen <bert@biot.com>
> ---
>  arch/mips/include/asm/mach-ath79/rb4xx.h |  41 +++
>  drivers/mtd/nand/Kconfig                 |   4 +
>  drivers/mtd/nand/Makefile                |   1 +
>  drivers/mtd/nand/rb4xx_nand.c            | 536 +++++++++++++++++++++++++++++++
>  4 files changed, 582 insertions(+)
>  create mode 100644 arch/mips/include/asm/mach-ath79/rb4xx.h
>  create mode 100644 drivers/mtd/nand/rb4xx_nand.c
>
> diff --git a/arch/mips/include/asm/mach-ath79/rb4xx.h b/arch/mips/include/asm/mach-ath79/rb4xx.h
> new file mode 100644
> index 0000000..989a55d
> --- /dev/null
> +++ b/arch/mips/include/asm/mach-ath79/rb4xx.h
> @@ -0,0 +1,41 @@
> +/*
> + * SPI driver definitions for the CPLD chip on the Mikrotik RB4xx boards
> + *
> + * Copyright (C) 2010 Gabor Juhos <juhosg@openwrt.org>
> + *
> + * This file was based on the patches for Linux 2.6.27.39 published by
> + * MikroTik for their RouterBoard 4xx series devices.
> + *
> + * This program is free software; you can redistribute it and/or modify it
> + * under the terms of the GNU General Public License version 2 as published
> + * by the Free Software Foundation.
> + */
> +
> +#define RB4XX_GPIO_CPLD_BASE   32
> +
> +#define CPLD_GPIO_LED1         0
> +#define CPLD_GPIO_LED2         2
> +#define CPLD_GPIO_LED3         1
> +#define CPLD_GPIO_LED4         3
> +#define CPLD_GPIO_FAN          4
> +#define CPLD_GPIO_ALE          5
> +#define CPLD_GPIO_CLE          6
> +#define CPLD_GPIO_NCE          7
> +#define CPLD_GPIO_LED5         8
> +
> +#define CPLD_NUM_GPIOS         9
> +
> +#define CPLD_CFG_LED1          BIT(CPLD_GPIO_LED1)
> +#define CPLD_CFG_LED2          BIT(CPLD_GPIO_LED2)
> +#define CPLD_CFG_LED3          BIT(CPLD_GPIO_LED3)
> +#define CPLD_CFG_LED4          BIT(CPLD_GPIO_LED4)
> +#define CPLD_CFG_FAN           BIT(CPLD_GPIO_FAN)
> +#define CPLD_CFG_ALE           BIT(CPLD_GPIO_ALE)
> +#define CPLD_CFG_CLE           BIT(CPLD_GPIO_CLE)
> +#define CPLD_CFG_NCE           BIT(CPLD_GPIO_NCE)
> +#define CPLD_CFG_LED5          BIT(CPLD_GPIO_LED5)
> +
> +struct rb4xx_cpld_platform_data {
> +       unsigned gpio_base;
> +};
> +
> diff --git a/drivers/mtd/nand/Kconfig b/drivers/mtd/nand/Kconfig
> index 5897d8d..c8639e4 100644
> --- a/drivers/mtd/nand/Kconfig
> +++ b/drivers/mtd/nand/Kconfig
> @@ -530,4 +530,8 @@ config MTD_NAND_HISI504
>         help
>           Enables support for NAND controller on Hisilicon SoC Hip04.
>
> +config MTD_NAND_RB4XX
> +       tristate "NAND flash driver for RouterBoard 4xx series"
> +       depends on MTD_NAND && ATH79_MACH_RB4XX
> +
>  endif # MTD_NAND
> diff --git a/drivers/mtd/nand/Makefile b/drivers/mtd/nand/Makefile
> index 582bbd05..56dbd08 100644
> --- a/drivers/mtd/nand/Makefile
> +++ b/drivers/mtd/nand/Makefile
> @@ -52,5 +52,6 @@ obj-$(CONFIG_MTD_NAND_XWAY)           += xway_nand.o
>  obj-$(CONFIG_MTD_NAND_BCM47XXNFLASH)   += bcm47xxnflash/
>  obj-$(CONFIG_MTD_NAND_SUNXI)           += sunxi_nand.o
>  obj-$(CONFIG_MTD_NAND_HISI504)         += hisi504_nand.o
> +obj-$(CONFIG_MTD_NAND_RB4XX)           += rb4xx_nand.o
>
>  nand-objs := nand_base.o nand_bbt.o nand_timings.o
> diff --git a/drivers/mtd/nand/rb4xx_nand.c b/drivers/mtd/nand/rb4xx_nand.c
> new file mode 100644
> index 0000000..72fbb5a
> --- /dev/null
> +++ b/drivers/mtd/nand/rb4xx_nand.c
> @@ -0,0 +1,536 @@
> +/*
> + *  NAND flash driver for the MikroTik RouterBoard 4xx series
> + *
> + *  Copyright (C) 2008-2011 Gabor Juhos <juhosg@openwrt.org>
> + *  Copyright (C) 2008 Imre Kaloz <kaloz@openwrt.org>

> + *
> + *  This file was based on the driver for Linux 2.6.22 published by
> + *  MikroTik for their RouterBoard 4xx series devices.
> + *
> + *  This program is free software; you can redistribute it and/or modify it
> + *  under the terms of the GNU General Public License version 2 as published
> + *  by the Free Software Foundation.
> + */
> +
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/init.h>
> +#include <linux/mtd/nand.h>
> +#include <linux/mtd/mtd.h>
> +#include <linux/mtd/partitions.h>
> +#include <linux/spi/spi.h>
> +#include <linux/platform_device.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/gpio.h>
> +#include <linux/slab.h>
> +
> +#include <asm/mach-ath79/ath79.h>
> +#include <asm/mach-ath79/rb4xx.h>
> +
> +#define RB4XX_NAND_GPIO_READY  5
> +#define RB4XX_NAND_GPIO_ALE    (RB4XX_GPIO_CPLD_BASE + CPLD_GPIO_ALE)
> +#define RB4XX_NAND_GPIO_CLE    (RB4XX_GPIO_CPLD_BASE + CPLD_GPIO_CLE)
> +#define RB4XX_NAND_GPIO_NCE    (RB4XX_GPIO_CPLD_BASE + CPLD_GPIO_NCE)
> +
> +#define CPLD_CMD_WRITE_NAND    0x08 /* send cmd, n x send data, send idle */
> +#define CPLD_CMD_WRITE_CFG     0x09 /* send cmd, n x send cfg */
> +#define CPLD_CMD_READ_NAND     0x0a /* send cmd, send idle, n x read data */
> +#define CPLD_CMD_READ_FAST     0x0b /* send cmd, 4 x idle, n x read data */
> +#define CPLD_CMD_LED5_ON       0x0c /* send cmd */
> +#define CPLD_CMD_LED5_OFF      0x0d /* send cmd */
> +
> +struct rb4xx_nand_info {
> +       struct nand_chip chip;
> +       struct mtd_info mtd;
> +       struct spi_device *spi_dev;
> +};
> +
> +struct rb4xx_cpld {
> +       struct spi_device *spi;
> +       struct mutex lock;
> +       struct gpio_chip chip;
> +       unsigned int config;
> +};
> +
> +/*
> + * We need to use the OLD Yaffs-1 OOB layout, otherwise the RB bootloader
> + * will not be able to find the kernel that we load.
> + */
> +static struct nand_ecclayout rb4xx_nand_ecclayout = {
> +       .eccbytes       = 6,
> +       .eccpos         = { 8, 9, 10, 13, 14, 15 },
> +       .oobavail       = 9,
> +       .oobfree        = { { 0, 4 }, { 6, 2 }, { 11, 2 }, { 4, 1 } }
> +};
> +
> +static struct mtd_partition rb4xx_nand_partitions[] = {
> +       {
> +               .name   = "booter",
> +               .offset = 0,
> +               .size   = (256 * 1024),
> +               .mask_flags = MTD_WRITEABLE,
> +       },
> +       {
> +               .name   = "kernel",
> +               .offset = (256 * 1024),
> +               .size   = (4 * 1024 * 1024) - (256 * 1024),
> +       },
> +       {
> +               .name   = "rootfs",
> +               .offset = MTDPART_OFS_NXTBLK,
> +               .size   = MTDPART_SIZ_FULL,
> +       },
> +};

Shouldn't be part of platform data?

> +
> +static inline struct rb4xx_cpld *gpio_to_cpld(struct gpio_chip *chip)
> +{
> +       return container_of(chip, struct rb4xx_cpld, chip);
> +}
> +
> +static int rb4xx_cpld_write_cmd(struct rb4xx_cpld *cpld, unsigned char cmd)
> +{
> +       struct spi_transfer t;
> +       struct spi_message m;
> +
> +       spi_message_init(&m);
> +
> +       memset(&t, 0, sizeof(t));
> +       t.tx_buf = &cmd;
> +       t.len = sizeof(cmd);
> +       spi_message_add_tail(&t, &m);
> +       return spi_sync(cpld->spi, &m);
> +}
> +
> +static int rb4xx_cpld_write_cfg(struct rb4xx_cpld *cpld, unsigned char config)
> +{
> +       struct spi_transfer t;
> +       struct spi_message m;
> +       unsigned char cmd[2] = {
> +               CPLD_CMD_WRITE_CFG, config
> +       };
> +
> +       spi_message_init(&m);
> +
> +       memset(&t, 0, sizeof(t));
> +       t.tx_buf = cmd;
> +       t.len = sizeof(cmd);
> +       spi_message_add_tail(&t, &m);
> +       return spi_sync(cpld->spi, &m);
> +}
> +
> +static int rb4xx_cpld_change_cfg(struct rb4xx_cpld *cpld, u32 mask, u32 value)
> +{
> +       unsigned int config;
> +       int ret;
> +
> +       config = cpld->config & ~mask;
> +       config |= value;
> +
> +       if (mask & 0xff)
> +               ret = rb4xx_cpld_write_cfg(cpld, config);
> +

ret is not used.

> +       if (mask & CPLD_CFG_LED5) {
> +               if (value & CPLD_CFG_LED5)
> +                       ret = rb4xx_cpld_write_cmd(cpld, CPLD_CMD_LED5_ON);
> +               else
> +                       ret = rb4xx_cpld_write_cmd(cpld, CPLD_CMD_LED5_OFF);
> +       }

ret is not used.

> +
> +       cpld->config = config;
> +
> +       return 0;
> +}
> +
> +static int rb4xx_cpld_gpio_get(struct gpio_chip *chip, unsigned offset)
> +{
> +       struct rb4xx_cpld *cpld = gpio_to_cpld(chip);
> +       int value;
> +
> +       mutex_lock(&cpld->lock);
> +       value = (cpld->config >> offset) & 1;
> +       mutex_unlock(&cpld->lock);
> +
> +       return value;
> +}
> +
> +static void rb4xx_cpld_gpio_set(struct gpio_chip *chip,
> +                               unsigned offset, int value)
> +{
> +       struct rb4xx_cpld *cpld = gpio_to_cpld(chip);
> +
> +       mutex_lock(&cpld->lock);
> +       rb4xx_cpld_change_cfg(cpld, (1 << offset), !!value << offset);
> +       mutex_unlock(&cpld->lock);
> +}
> +
> +static int rb4xx_cpld_gpio_direction_input(struct gpio_chip *chip,
> +                                          unsigned offset)
> +{
> +       return -EOPNOTSUPP;
> +}
> +
> +static int rb4xx_cpld_gpio_direction_output(struct gpio_chip *chip,
> +                                           unsigned offset, int value)
> +{
> +       struct rb4xx_cpld *cpld = gpio_to_cpld(chip);
> +       int ret;
> +
> +       mutex_lock(&cpld->lock);
> +       ret = rb4xx_cpld_change_cfg(cpld, (1 << offset), !!value << offset);
> +       mutex_unlock(&cpld->lock);
> +
> +       return ret;
> +}
> +
> +static int rb4xx_cpld_gpio_init(struct rb4xx_cpld *cpld, unsigned int base)
> +{
> +       u32 value;
> +       int ret;
> +
> +       value = CPLD_CFG_LED1 | CPLD_CFG_LED2 | CPLD_CFG_LED3 |
> +                      CPLD_CFG_LED4 | CPLD_CFG_LED5;
> +       rb4xx_cpld_change_cfg(cpld, value, value);
> +
> +       cpld->chip.label = "rb4xx-cpld";
> +       cpld->chip.base = base;
> +       cpld->chip.ngpio = CPLD_NUM_GPIOS;
> +       cpld->chip.can_sleep = 1;
> +       cpld->chip.dev = &cpld->spi->dev;
> +       cpld->chip.get = rb4xx_cpld_gpio_get;
> +       cpld->chip.set = rb4xx_cpld_gpio_set;
> +       cpld->chip.direction_input = rb4xx_cpld_gpio_direction_input;
> +       cpld->chip.direction_output = rb4xx_cpld_gpio_direction_output;
> +
> +       ret = gpiochip_add(&cpld->chip);
> +       if (ret)
> +               dev_err(&cpld->spi->dev, "adding GPIO chip failed, error %d\n",
> +                       ret);
> +
> +       return ret;
> +}
> +
> +static int rb4xx_cpld_read(struct spi_device *spi, unsigned char *rx_buf,
> +                          unsigned len)
> +{
> +       struct spi_message m;
> +       static const unsigned char cmd[2] = {
> +               CPLD_CMD_READ_NAND, 0
> +       };
> +       struct spi_transfer t[2] = {
> +               {
> +                       .tx_buf = &cmd,
> +                       .len = sizeof(cmd),
> +               }, {
> +                       .rx_buf = rx_buf,
> +                       .len = len,
> +               },
> +       };
> +
> +       spi_message_init(&m);
> +       spi_message_add_tail(&t[0], &m);
> +       spi_message_add_tail(&t[1], &m);
> +       return spi_sync(spi, &m);
> +}
> +
> +static int rb4xx_cpld_write(struct spi_device *spi, const u8 *buf, int len)
> +{
> +       struct spi_message m;
> +       static const unsigned char cmd = CPLD_CMD_WRITE_NAND;
> +       struct spi_transfer t[3] = {
> +               {
> +                       .tx_buf = &cmd,
> +                       .len = sizeof(cmd),
> +               }, {
> +                       .tx_buf = buf,
> +                       .len = len,
> +                       .tx_nbits = SPI_NBITS_DUAL,
> +               }, {
> +                       .len = 1,
> +                       .tx_nbits = SPI_NBITS_DUAL,
> +               },
> +       };
> +
> +       spi_message_init(&m);
> +       spi_message_add_tail(&t[0], &m);
> +       spi_message_add_tail(&t[1], &m);
> +       spi_message_add_tail(&t[2], &m);
> +       return spi_sync(spi, &m);
> +}
> +
> +static int rb4xx_nand_dev_ready(struct mtd_info *mtd)
> +{
> +       return gpio_get_value_cansleep(RB4XX_NAND_GPIO_READY);
> +}
> +
> +static void rb4xx_nand_cmd_ctrl(struct mtd_info *mtd, int cmd,
> +                               unsigned int ctrl)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       struct rb4xx_nand_info *info = chip->priv;
> +       u8 data = cmd;
> +       int ret;
> +
> +       if (ctrl & NAND_CTRL_CHANGE) {
> +               gpio_set_value_cansleep(RB4XX_NAND_GPIO_CLE,
> +                                       (ctrl & NAND_CLE) ? 1 : 0);
> +               gpio_set_value_cansleep(RB4XX_NAND_GPIO_ALE,
> +                                       (ctrl & NAND_ALE) ? 1 : 0);
> +               gpio_set_value_cansleep(RB4XX_NAND_GPIO_NCE,
> +                                       (ctrl & NAND_NCE) ? 0 : 1);
> +       }
> +
> +       if (cmd != NAND_CMD_NONE) {
> +               ret = rb4xx_cpld_write(info->spi_dev, &data, 1);
> +               if (ret)
> +                       pr_err("rb4xx_nand: write cmd failed, error %d\n", ret);
> +       }
> +}
> +
> +static unsigned char rb4xx_nand_read_byte(struct mtd_info *mtd)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       struct rb4xx_nand_info *info = chip->priv;
> +       unsigned char data = 0;
> +       int ret;
> +
> +       ret = rb4xx_cpld_read(info->spi_dev, &data, 1);
> +       if (ret) {
> +               pr_err("rb4xx_nand: read data failed, error %d\n", ret);

Is it possible to use dev_err() here and in other places?

> +               data = 0xff;
Why not
return 0xff;
... and remove assignment in the definition block?

> +       }
> +
> +       return data;
> +}
> +
> +static void rb4xx_nand_write_buf(struct mtd_info *mtd, const unsigned char *buf,
> +                                int len)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       struct rb4xx_nand_info *info = chip->priv;
> +       int ret;
> +
> +       ret = rb4xx_cpld_write(info->spi_dev, buf, len);
> +       if (ret)
> +               pr_err("rb4xx_nand: write buf failed, error %d\n", ret);
> +}
> +
> +static void rb4xx_nand_read_buf(struct mtd_info *mtd, unsigned char *buf,
> +                               int len)
> +{
> +       struct nand_chip *chip = mtd->priv;
> +       struct rb4xx_nand_info *info = chip->priv;
> +       int ret;
> +
> +       ret = rb4xx_cpld_read(info->spi_dev, buf, len);
> +       if (ret)
> +               pr_err("rb4xx_nand: read buf failed, error %d\n", ret);
> +}
> +
> +static int rb4xx_cpld_probe(struct spi_device *spi)
> +{
> +       struct rb4xx_cpld *cpld;
> +       struct rb4xx_cpld_platform_data *pdata;
> +       int ret;
> +
> +       pdata = dev_get_platdata(&spi->dev);

Hmm... do we have helper in SPI framework to do that?

> +       if (!pdata)
> +               return -ENODATA;
> +
> +       cpld = devm_kzalloc(&spi->dev, sizeof(*cpld), GFP_KERNEL);
> +       if (!cpld)
> +               return -ENOMEM;
> +
> +       mutex_init(&cpld->lock);
> +       cpld->spi = spi_dev_get(spi);
> +       dev_set_drvdata(&spi->dev, cpld);
> +
> +       ret = spi_setup(spi);
> +       if (ret) {
> +               dev_err(&spi->dev, "SPI setup failed, error %d\n", ret);
> +               return ret;
> +       }
> +
> +       return rb4xx_cpld_gpio_init(cpld, pdata->gpio_base);
> +}
> +
> +static int rb4xx_cpld_remove(struct spi_device *spi)
> +{
> +       struct rb4xx_cpld *cpld;
> +
> +       cpld = dev_get_drvdata(&spi->dev);
> +       mutex_destroy(&cpld->lock);
> +
> +       return 0;
> +}
> +
> +static struct spi_driver rb4xx_cpld_driver = {
> +       .probe = rb4xx_cpld_probe,
> +       .remove = rb4xx_cpld_remove,
> +       .driver = {
> +               .name = "rb4xx-cpld",
> +               .owner = THIS_MODULE,
> +       },
> +};
> +
> +static int rb4xx_nand_probe(struct platform_device *pdev)
> +{
> +       struct device *dev;
> +       struct rb4xx_nand_info  *info;
> +       int ret;
> +
> +       info = devm_kzalloc(&pdev->dev, sizeof(*info), GFP_KERNEL);
> +       if (!info)
> +               return -ENOMEM;
> +
> +       ret = spi_register_driver(&rb4xx_cpld_driver);
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to register CPLD SPI driver\n");
> +               return ret;
> +       }
> +
> +       ret = gpio_request(RB4XX_NAND_GPIO_READY, "NAND RDY");

Can you switch to GPIO descriptor API and use devm_gpiod_* ?

> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to request gpio %d\n",
> +                       RB4XX_NAND_GPIO_READY);
> +               goto err_spi;
> +       }
> +
> +       ret = gpio_direction_input(RB4XX_NAND_GPIO_READY);
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to set input mode on gpio %d\n",
> +                       RB4XX_NAND_GPIO_READY);
> +               goto err_free_gpio_ready;
> +       }
> +
> +       ret = gpio_request(RB4XX_NAND_GPIO_ALE, "NAND ALE");
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to request gpio %d\n",
> +                       RB4XX_NAND_GPIO_ALE);
> +               goto err_free_gpio_ready;
> +       }
> +
> +       ret = gpio_direction_output(RB4XX_NAND_GPIO_ALE, 0);
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to set output mode on gpio %d\n",
> +                       RB4XX_NAND_GPIO_ALE);
> +               goto err_free_gpio_ale;
> +       }
> +
> +       ret = gpio_request(RB4XX_NAND_GPIO_CLE, "NAND CLE");
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to request gpio %d\n",
> +                       RB4XX_NAND_GPIO_CLE);
> +               goto err_free_gpio_ale;
> +       }
> +
> +       ret = gpio_direction_output(RB4XX_NAND_GPIO_CLE, 0);
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to set output mode on gpio %d\n",
> +                       RB4XX_NAND_GPIO_CLE);
> +               goto err_free_gpio_cle;
> +       }
> +
> +       ret = gpio_request(RB4XX_NAND_GPIO_NCE, "NAND NCE");
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to request gpio %d\n",
> +                       RB4XX_NAND_GPIO_NCE);
> +               goto err_free_gpio_cle;
> +       }
> +
> +       ret = gpio_direction_output(RB4XX_NAND_GPIO_NCE, 1);
> +       if (ret) {
> +               dev_err(&pdev->dev, "unable to set output mode on gpio %d\n",
> +                       RB4XX_NAND_GPIO_ALE);
> +               goto err_free_gpio_nce;
> +       }
> +
> +       /* NAND chip is behind the CPLD on SPI bus 0 CS 1 */
> +       dev = bus_find_device_by_name(&spi_bus_type, NULL, "spi0.1");
> +       if (!dev) {
> +               ret = -ENODEV;
> +               goto err_free_gpio_nce;
> +       }
> +       info->spi_dev = container_of(dev, struct spi_device, dev);
> +
> +       info->chip.priv = info;
> +       info->mtd.priv  = &info->chip;
> +       info->mtd.owner = THIS_MODULE;
> +
> +       info->chip.cmd_ctrl     = rb4xx_nand_cmd_ctrl;
> +       info->chip.dev_ready    = rb4xx_nand_dev_ready;
> +       info->chip.read_byte    = rb4xx_nand_read_byte;
> +       info->chip.write_buf    = rb4xx_nand_write_buf;
> +       info->chip.read_buf     = rb4xx_nand_read_buf;
> +
> +       info->chip.chip_delay   = 25;
> +       info->chip.ecc.mode     = NAND_ECC_SOFT;
> +
> +       platform_set_drvdata(pdev, info);
> +
> +       ret = nand_scan_ident(&info->mtd, 1, NULL);
> +       if (ret) {
> +               ret = -ENXIO;
> +               goto err_free_gpio_nce;
> +       }
> +
> +       if (info->mtd.writesize == 512)
> +               info->chip.ecc.layout = &rb4xx_nand_ecclayout;
> +
> +       ret = nand_scan_tail(&info->mtd);
> +       if (ret) {
> +               ret = -ENXIO;
> +               goto err_free_gpio_nce;
> +       }
> +
> +       ret = mtd_device_register(&info->mtd, rb4xx_nand_partitions,
> +                                 ARRAY_SIZE(rb4xx_nand_partitions));
> +       if (ret)
> +               goto err_release_nand;
> +
> +       return 0;
> +
> +err_release_nand:
> +       nand_release(&info->mtd);
> +err_free_gpio_nce:
> +       gpio_free(RB4XX_NAND_GPIO_NCE);
> +err_free_gpio_cle:
> +       gpio_free(RB4XX_NAND_GPIO_CLE);
> +err_free_gpio_ale:
> +       gpio_free(RB4XX_NAND_GPIO_ALE);
> +err_free_gpio_ready:
> +       gpio_free(RB4XX_NAND_GPIO_READY);
> +err_spi:
> +       spi_unregister_driver(&rb4xx_cpld_driver);
> +
> +       return ret;
> +}
> +
> +static int rb4xx_nand_remove(struct platform_device *pdev)
> +{
> +       struct rb4xx_nand_info *info = platform_get_drvdata(pdev);
> +
> +       gpio_free(RB4XX_NAND_GPIO_NCE);
> +       gpio_free(RB4XX_NAND_GPIO_CLE);
> +       gpio_free(RB4XX_NAND_GPIO_ALE);
> +       gpio_free(RB4XX_NAND_GPIO_READY);
> +       nand_release(&info->mtd);
> +       spi_unregister_driver(&rb4xx_cpld_driver);
> +
> +       return 0;
> +}
> +
> +static struct platform_driver rb4xx_nand_driver = {
> +       .probe = rb4xx_nand_probe,
> +       .remove = rb4xx_nand_remove,
> +       .driver = {
> +               .name = "rb4xx-nand",
> +       },
> +};
> +
> +module_platform_driver(rb4xx_nand_driver);
> +
> +MODULE_DESCRIPTION("NAND flash driver for RouterBoard 4xx series");
> +MODULE_AUTHOR("Gabor Juhos <juhosg@openwrt.org>");
> +MODULE_AUTHOR("Imre Kaloz <kaloz@openwrt.org>");
> +MODULE_LICENSE("GPL v2");
> --
> 1.9.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> Please read the FAQ at  http://www.tux.org/lkml/



-- 
With Best Regards,
Andy Shevchenko
