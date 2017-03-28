Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1csg6D-0007qW-GT
 for linux-mtd@lists.infradead.org; Tue, 28 Mar 2017 01:39:07 +0000
Received: by mail-lf0-x242.google.com with SMTP id v2so9035987lfi.2
 for <linux-mtd@lists.infradead.org>; Mon, 27 Mar 2017 18:38:44 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <ec582e0d-8aa3-0694-12ed-12173a436bcc@denx.de>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-9-git-send-email-peterpandong@micron.com>
 <ec582e0d-8aa3-0694-12ed-12173a436bcc@denx.de>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Tue, 28 Mar 2017 09:38:43 +0800
Message-ID: <CAAyFORJdzH4fMXSR1ByTztdh38GFui9bxDqtQyK5K73netDXMg@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] nand: spi: Add generic SPI controller support
To: Marek Vasut <marex@denx.de>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Thu, Mar 23, 2017 at 7:33 PM, Marek Vasut <marex@denx.de> wrote:
> On 03/23/2017 10:43 AM, Peter Pan wrote:
>> This commit supports to use generic spi controller
>> as spi nand controller.
>>
>> Signed-off-by: Peter Pan <peterpandong@micron.com>
> [...]
>> +static int gen_spi_spinand_probe(struct spi_device *spi)
>> +{
>> +     struct spinand_device *chip;
>> +     struct gen_spi_spinand_controller *controller;
>> +     struct spinand_controller *spinand_controller;
>> +     int ret;
>> +     u32 max_speed_hz = spi->max_speed_hz;
>> +
>> +     chip = spinand_alloc(&spi->dev);
>> +     if (IS_ERR(chip)) {
>> +             ret = PTR_ERR(chip);
>> +             goto err1;
>> +     }
>> +     controller = kzalloc(sizeof(*controller), GFP_KERNEL);
>> +     if (!controller) {
>> +             ret = -ENOMEM;
>> +             goto err2;
>> +     }
>> +     controller->spi = spi;
>> +     spinand_controller = &controller->ctrl;
>> +     spinand_controller->ops = &gen_spi_spinand_ops;
>> +     spinand_controller->caps = SPINAND_CAP_RD_X1 | SPINAND_CAP_WR_X1;
>> +     if (spi->mode & SPI_RX_QUAD)
>> +             spinand_controller->caps |= SPINAND_CAP_RD_QUAD |
>> +                                         SPINAND_CAP_RD_X4;
>> +     if (spi->mode & SPI_RX_DUAL)
>> +             spinand_controller->caps |= SPINAND_CAP_RD_DUAL |
>> +                                         SPINAND_CAP_RD_X2;
>> +     if (spi->mode & SPI_TX_QUAD)
>> +             spinand_controller->caps |= SPINAND_CAP_WR_QUAD |
>> +                                         SPINAND_CAP_WR_X4;
>> +     if (spi->mode & SPI_TX_DUAL)
>> +             spinand_controller->caps |= SPINAND_CAP_WR_DUAL |
>> +                                         SPINAND_CAP_WR_X2;
>> +     chip->controller.controller = spinand_controller;
>> +     spi_set_drvdata(spi, chip);
>> +     spi->max_speed_hz = min_t(int, 25000000, max_speed_hz);
>
> Please avoid hard-coding random numbers, make the 25 MHz into a macro
> and add a comment explaining why you use 25 MHz

Yes, I forgot the comment. Fix this in v5

>
>> +
>> +     ret = spinand_register(chip);
>> +     if (ret)
>> +             goto err3;
>> +
>> +     spi->max_speed_hz = max_speed_hz;
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
>> +     struct spinand_device *chip = spi_get_drvdata(spi);
>> +
>> +     spinand_unregister(chip);
>> +     kfree(to_gen_spi_spinand_controller(chip->controller.controller));
>
> This looks pretty awful, introduce a variable maybe ?

Fix this in v5

Thanks,
Peter Pan

>
>> +     spinand_free(chip);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct spi_driver gen_spi_spinand_driver = {
>> +     .driver = {
>> +             .name   = "generic_spinand",
>> +             .owner  = THIS_MODULE,
>> +     },
>> +     .probe  = gen_spi_spinand_probe,
>> +     .remove = gen_spi_spinand_remove,
>> +};
>> +module_spi_driver(gen_spi_spinand_driver);
>> +
>> +MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
>> +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
>> +MODULE_LICENSE("GPL v2");
>>
>
>
> --
> Best regards,
> Marek Vasut
