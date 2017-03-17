Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1covkE-0001Pk-TP
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 17:32:57 +0000
Received: by mail-wm0-x244.google.com with SMTP id u132so4358684wmg.1
 for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2017 10:32:34 -0700 (PDT)
Subject: Re: [PATCH v3 7/8] nand: spi: Add generic SPI controller support
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Peter Pan <peterpandong@micron.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-8-git-send-email-peterpandong@micron.com>
 <20170317152048.1eca677e@bbrezillon>
Cc: richard@nod.at, computersforpeace@gmail.com,
 thomas.petazzoni@free-electrons.com, linux-mtd@lists.infradead.org,
 peterpansjtu@gmail.com, linshunquan1@hisilicon.com
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <3efc4b1f-7391-03f9-497d-8ea5f89f5d59@gmail.com>
Date: Fri, 17 Mar 2017 18:32:28 +0100
MIME-Version: 1.0
In-Reply-To: <20170317152048.1eca677e@bbrezillon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 17/03/2017 15:20, Boris Brezillon wrote:
> [...]
> Should be done before calling spinand_detect(), just in case some DT
> props need to be parsed before the detection step.
>
> This being said, I'm not sure we should let the spinand controller
> driver do the registration step. I'm currently trying to rework the
> parallel NAND framework to act like all other busses, and I think SPI
> NAND controllers should also follow this road:
>
> 1/ spinand controller driver register a controller to the spinand core
>    (spinand_controller_register())
> 2/ the core parses the DT (or board info if DT is not available) and
>     creates N spinand devices (the N value depends on the number of SPI
>     nands connected to the controller)
> 3/ for each spinand device the detection/initialization takes place
>     directly in the core (the spinand_controller_ops should contain
>     anything required to do the detection)
> 4/ for each spinand dev the spinand_controller_ops->add() is called, to
>     let the controller driver attach private data to the device (if
>     required), and/or let it use it's own ECC engine (optional as well).
> 5/ underlying MTD device registered by spinand core code and spinand
>     dev added to the list of devices controlled by this controller (done
>     in the core)
>
> When removing a device, you just have the reverse steps:
>
> 1/ remove from list and unregister the MTD dev
> 2/ call spinand_controller_ops->remove()
> 3/ core/manufacturer cleanup
>
> Not sure how feasible this is, especially for the generic SPI NAND
> controller case where the SPI NAND controller does not have a node in
> the DT, but that would avoid all this boiler-plate duplication we have
> in the // NAND framework.

Since the probe for generic spi devices is generally triggered by the 
SPI layer, it will not match easily in the way you would like the 
registration done.
Can we let this registration question not be a showstopper for Peter's 
effort ?

Regards,
Arnaud
>> +
>> +	ret = mtd_device_register(mtd, NULL, 0);
>> +	if (!ret)
>> +		return 0;
>> +
>> +err5:
>> +	spinand_cleanup(chip);
>> +err4:
>> +	kfree(ecc_engine);
>> +err3:
>> +	kfree(controller);
>> +err2:
>> +	kfree(chip);
>> +err1:
>> +	return ret;
>> +}
>> +
>> +static int generic_spinand_remove(struct spi_device *spi)
>> +{
>> +	struct spinand_device *chip = spi_get_drvdata(spi);
>> +	struct mtd_info *mtd = spinand_to_mtd(chip);
>> +
>> +	mtd_device_unregister(mtd);
>> +	spinand_cleanup(chip);
>> +	kfree(chip->ecc.engine);
>> +	kfree(chip->controller);
>> +	kfree(chip);
>> +
>> +	return 0;
>> +}
>> +
>> +static struct spi_driver generic_spinand_driver = {
>> +	.driver = {
>> +		.name	= "generic_spinand",
>> +		.owner	= THIS_MODULE,
>> +	},
>> +	.probe	= generic_spinand_probe,
>> +	.remove	= generic_spinand_remove,
>> +};
>> +module_spi_driver(generic_spinand_driver);
>> +
>> +MODULE_DESCRIPTION("Generic SPI controller to support SPI NAND");
>> +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
>> +MODULE_LICENSE("GPL v2");
