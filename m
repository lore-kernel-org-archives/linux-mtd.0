Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ctVS6-0002UX-Aj
 for linux-mtd@lists.infradead.org; Thu, 30 Mar 2017 08:29:08 +0000
Received: by mail-lf0-x242.google.com with SMTP id v2so3883025lfi.2
 for <linux-mtd@lists.infradead.org>; Thu, 30 Mar 2017 01:28:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1ef02557-0729-b122-4fe7-2e1298ab73f1@wedev4u.fr>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-9-git-send-email-peterpandong@micron.com>
 <1ef02557-0729-b122-4fe7-2e1298ab73f1@wedev4u.fr>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Thu, 30 Mar 2017 16:28:43 +0800
Message-ID: <CAAyFORJwM5f-rqFiTDwxg9RAXxSRUfcKRRzfhcDwgBJabPrewA@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] nand: spi: Add generic SPI controller support
To: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Marek Vasut <marex@denx.de>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Cyrille,

First of all, thank you for your valuable comments! It is really needed by =
me!

On Thu, Mar 30, 2017 at 5:37 AM, Cyrille Pitchen
<cyrille.pitchen@wedev4u.fr> wrote:
> Hi Peter,
>
> Le 23/03/2017 =C3=A0 10:43, Peter Pan a =C3=A9crit :
>> This commit supports to use generic spi controller
>> as spi nand controller.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>> ---
>>  drivers/mtd/nand/spi/Kconfig                   |   2 +
>>  drivers/mtd/nand/spi/Makefile                  |   1 +
>>  drivers/mtd/nand/spi/controllers/Kconfig       |   5 +
>>  drivers/mtd/nand/spi/controllers/Makefile      |   1 +
>>  drivers/mtd/nand/spi/controllers/generic-spi.c | 150 ++++++++++++++++++=
+++++++
>>  5 files changed, 159 insertions(+)
>>  create mode 100644 drivers/mtd/nand/spi/controllers/Kconfig
>>  create mode 100644 drivers/mtd/nand/spi/controllers/Makefile
>>  create mode 100644 drivers/mtd/nand/spi/controllers/generic-spi.c
>>
>> diff --git a/drivers/mtd/nand/spi/Kconfig b/drivers/mtd/nand/spi/Kconfig
>> index d77c46e..6bd1c65 100644
>> --- a/drivers/mtd/nand/spi/Kconfig
>> +++ b/drivers/mtd/nand/spi/Kconfig
>> @@ -3,3 +3,5 @@ menuconfig MTD_SPI_NAND
>>       depends on MTD_NAND
>>       help
>>         This is the framework for the SPI NAND device drivers.
>> +
>> +source "drivers/mtd/nand/spi/controllers/Kconfig"
>> diff --git a/drivers/mtd/nand/spi/Makefile b/drivers/mtd/nand/spi/Makefi=
le
>> index db0b91b..6ad5f24 100644
>> --- a/drivers/mtd/nand/spi/Makefile
>> +++ b/drivers/mtd/nand/spi/Makefile
>> @@ -1,3 +1,4 @@
>>  obj-$(CONFIG_MTD_SPI_NAND) +=3D core.o
>>  obj-$(CONFIG_MTD_SPI_NAND) +=3D manufactures.o
>>  obj-$(CONFIG_MTD_SPI_NAND) +=3D micron.o
>> +obj-$(CONFIG_MTD_SPI_NAND) +=3D controllers/
>> diff --git a/drivers/mtd/nand/spi/controllers/Kconfig b/drivers/mtd/nand=
/spi/controllers/Kconfig
>> new file mode 100644
>> index 0000000..8ab7023
>> --- /dev/null
>> +++ b/drivers/mtd/nand/spi/controllers/Kconfig
>> @@ -0,0 +1,5 @@
>> +config GENERIC_SPI_NAND
>> +     tristate "SPI NAND with generic SPI bus Support"
>> +     depends on MTD_SPI_NAND && SPI
>> +     help
>> +       This is to support SPI NAND device with generic SPI bus.
>> diff --git a/drivers/mtd/nand/spi/controllers/Makefile b/drivers/mtd/nan=
d/spi/controllers/Makefile
>> new file mode 100644
>> index 0000000..46cbf29
>> --- /dev/null
>> +++ b/drivers/mtd/nand/spi/controllers/Makefile
>> @@ -0,0 +1 @@
>> +obj-$(CONFIG_GENERIC_SPI_NAND) +=3D generic-spi.o
>> diff --git a/drivers/mtd/nand/spi/controllers/generic-spi.c b/drivers/mt=
d/nand/spi/controllers/generic-spi.c
>> new file mode 100644
>> index 0000000..da1f224
>> --- /dev/null
>> +++ b/drivers/mtd/nand/spi/controllers/generic-spi.c
>> @@ -0,0 +1,150 @@
>> +/*
>> + * Copyright (c) 2009-2017 Micron Technology, Inc.
>> + *
>> + * This program is free software; you can redistribute it and/or
>> + * modify it under the terms of the GNU General Public License
>> + * as published by the Free Software Foundation; either version 2
>> + * of the License, or (at your option) any later version.
>> + *
>> + * This program is distributed in the hope that it will be useful,
>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>> + * GNU General Public License for more details.
>> + */
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/spi/spi.h>
>> +#include <linux/mtd/spinand.h>
>> +
>> +struct gen_spi_spinand_controller {
>> +     struct spinand_controller ctrl;
>> +     struct spi_device *spi;
>> +};
>> +
>> +#define to_gen_spi_spinand_controller(c) \
>> +     container_of(c, struct gen_spi_spinand_controller, ctrl)
>> +
>> +/*
>> + * gen_spi_spinand_exec_op - to process a command to send to the
>> + * SPI NAND by generic SPI bus
>> + * @chip: SPI NAND device structure
>> + * @op: SPI NAND operation descriptor
>> + */
>> +static int gen_spi_spinand_exec_op(struct spinand_device *chip,
>> +                                struct spinand_op *op)
>> +{
>> +     struct spi_message message;
>> +     struct spi_transfer x[3];
>> +     struct spinand_controller *scontroller =3D chip->controller.contro=
ller;
>> +     struct gen_spi_spinand_controller *controller;
>> +
>> +     controller =3D to_gen_spi_spinand_controller(scontroller);
>> +     spi_message_init(&message);
>> +     memset(x, 0, sizeof(x));
>> +     x[0].len =3D 1;
>> +     x[0].tx_nbits =3D 1;
>> +     x[0].tx_buf =3D &op->cmd;
>> +     spi_message_add_tail(&x[0], &message);
>> +
>> +     if (op->n_addr + op->dummy_bytes) {
>> +             x[1].len =3D op->n_addr + op->dummy_bytes;
>> +             x[1].tx_nbits =3D op->addr_nbits;
>> +             x[1].tx_buf =3D op->addr;
>> +             spi_message_add_tail(&x[1], &message);
>> +     }
>> +     if (op->n_tx) {
>> +             x[2].len =3D op->n_tx;
>> +             x[2].tx_nbits =3D op->data_nbits;
>> +             x[2].tx_buf =3D op->tx_buf;
>> +             spi_message_add_tail(&x[2], &message);
>> +     } else if (op->n_rx) {
>> +             x[2].len =3D op->n_rx;
>> +             x[2].rx_nbits =3D op->data_nbits;
>> +             x[2].rx_buf =3D op->rx_buf;
>> +             spi_message_add_tail(&x[2], &message);
>> +     }
>> +     return spi_sync(controller->spi, &message);
>> +}
>
> 2 comments:
>
> 1/
> maybe you can merge 'struct spi_transfer' in some cases:
>
> for instance with SPI x-x-z protocols, you can carry both the
> instruction and address/dummy bytes in a single spi_transfer structure.
>
> Also for Read operations (not applicable for Write/Page Program), with
> SPI x-z-z, you can merge both the address/dummy and data bytes in a
> single spi_transfer structure.
>
> This could speed-up the operation with some SPI controller drivers.
> However this is just an optimization otherwise it should work as is.

Yes, I agree the less spi_transfer, the better performance. The reason I di=
dn't
to do the spi_transfer merge is this requires extra buffer to hold the
merged data.
And this patches is focus on the basic structure of SPI NAND core, I'd like=
 to
do the optimization later.

>
> 2/
> Some spi controller drivers, like the TI QSPI controller driver, may
> want to use something similar to the spi_flash_read() function used from
> drivers/mtd/spi-nor/m25p80.c.
>
> Indeed, some QSPI controllers can speed up read operations by mapping
> the flash data array into the system memory. In such a case, the regular
> SPI API (spi_message and spi_transfer structures) is no longer used.
> That's why spi_flash_read() was introduced.
>
> However unlike SPI-NOR memories, SPI-NAND memories require to read data
> in 2 steps: internal data array -> internal cache then internal cache ->
> SPI bus. Hence using a mapping in the system memory only for "read from
> cache" operations is likely less interesting than reading the whole data
> array like regular memory as we can do with SPI NOR.
>
> This is another optimization, so not mandatory at all, but I just wanted
> to warn you about that so be prepared to be queried about that ;)

Thanks for your notice again, very useful!

>
>
>
>> +
>> +static struct spinand_controller_ops gen_spi_spinand_ops =3D {
>> +     .exec_op =3D gen_spi_spinand_exec_op,
>> +};
>> +
>> +static int gen_spi_spinand_probe(struct spi_device *spi)
>> +{
>> +     struct spinand_device *chip;
>> +     struct gen_spi_spinand_controller *controller;
>> +     struct spinand_controller *spinand_controller;
>> +     int ret;
>> +     u32 max_speed_hz =3D spi->max_speed_hz;
>> +
>> +     chip =3D spinand_alloc(&spi->dev);
>> +     if (IS_ERR(chip)) {
>> +             ret =3D PTR_ERR(chip);
>> +             goto err1;
>> +     }
>> +     controller =3D kzalloc(sizeof(*controller), GFP_KERNEL);
>> +     if (!controller) {
>> +             ret =3D -ENOMEM;
>> +             goto err2;
>> +     }
>> +     controller->spi =3D spi;
>> +     spinand_controller =3D &controller->ctrl;
>> +     spinand_controller->ops =3D &gen_spi_spinand_ops;
>> +     spinand_controller->caps =3D SPINAND_CAP_RD_X1 | SPINAND_CAP_WR_X1=
;
>> +     if (spi->mode & SPI_RX_QUAD)
>> +             spinand_controller->caps |=3D SPINAND_CAP_RD_QUAD |
>> +                                         SPINAND_CAP_RD_X4;
>> +     if (spi->mode & SPI_RX_DUAL)
>> +             spinand_controller->caps |=3D SPINAND_CAP_RD_DUAL |
>> +                                         SPINAND_CAP_RD_X2;
>> +     if (spi->mode & SPI_TX_QUAD)
>> +             spinand_controller->caps |=3D SPINAND_CAP_WR_QUAD |
>> +                                         SPINAND_CAP_WR_X4;
>> +     if (spi->mode & SPI_TX_DUAL)
>> +             spinand_controller->caps |=3D SPINAND_CAP_WR_DUAL |
>> +                                         SPINAND_CAP_WR_X2;
>
> I think this is wrong:
> the SPI_RX_QUAD means the controller can receive data on 4 I/O line
> hence it allows SPINAND_CAP_RD_X4 (1-1-4) but not necessarily
> SPINAND_CAP_QUAD (1-4-4).
>
> To add SPINAND_CAP_QUAD (1-4-4), SPINAND_CAP_WR_X4 (1-1-4) and
> SPINAND_CAP_WR_QUAD (1-4-4) you need both SPI_RX_QUAD and SPI_TX_QUAD.
>
> So with Dual SPI protocols:
>
> at least SPI_RX_DUAL: caps =3D RD_X2
> both SPI_RX_DUAL and SPI_TX_DUAL: caps |=3D (RD_DUAL | WR_X2 | WR_DUAL);
>
> SPI masters (controllers) are not aware of SPI x-y-z flash protocols,
> they just claim they can use more than 1 I/O line to read data and/or
> more than 1 I/0 line to write data.

Yes, you are right. I misunderstood the meaning of SPI_RX_QUAD. I will
fix this in v5

Thanks,
Peter Pan

>
>> +     chip->controller.controller =3D spinand_controller;
>> +     spi_set_drvdata(spi, chip);
>> +     spi->max_speed_hz =3D min_t(int, 25000000, max_speed_hz);
>> +
>> +     ret =3D spinand_register(chip);
>> +     if (ret)
>> +             goto err3;
>> +
>> +     spi->max_speed_hz =3D max_speed_hz;
>> +
>> +     return 0;
>> +
>> +err3:
>> +     kfree(controller);
>> +err2:
>> +     spinand_free(chip);
>> +err1:
>> +     return ret;
>> +}
>> +
>> +static int gen_spi_spinand_remove(struct spi_device *spi)
>> +{
>> +     struct spinand_device *chip =3D spi_get_drvdata(spi);
>> +
>> +     spinand_unregister(chip);
>> +     kfree(to_gen_spi_spinand_controller(chip->controller.controller));
>> +     spinand_free(chip);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct spi_driver gen_spi_spinand_driver =3D {
>> +     .driver =3D {
>> +             .name   =3D "generic_spinand",
>> +             .owner  =3D THIS_MODULE,
>> +     },
>> +     .probe  =3D gen_spi_spinand_probe,
>> +     .remove =3D gen_spi_spinand_remove,
>> +};
>> +module_spi_driver(gen_spi_spinand_driver);
>> +
>> +MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
>> +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
>> +MODULE_LICENSE("GPL v2");
>>
>
