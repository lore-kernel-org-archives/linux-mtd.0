Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cr5g5-00073G-ID
 for linux-mtd@lists.infradead.org; Thu, 23 Mar 2017 16:33:36 +0000
Subject: Re: [PATCH v4 4/9] nand: spi: add basic blocks for infrastructure
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1490262226-29092-1-git-send-email-peterpandong@micron.com>
 <1490262226-29092-5-git-send-email-peterpandong@micron.com>
 <ac67260f-94ba-7336-5cd4-abc8e9c91cf1@denx.de>
 <20170323164000.34288ed9@bbrezillon>
Cc: Peter Pan <peterpandong@micron.com>, richard@nod.at,
 computersforpeace@gmail.com, arnaud.mouiche@gmail.com,
 thomas.petazzoni@free-electrons.com, cyrille.pitchen@atmel.com,
 linux-mtd@lists.infradead.org, peterpansjtu@gmail.com,
 linshunquan1@hisilicon.com
From: Marek Vasut <marex@denx.de>
Message-ID: <d35d8136-5c62-a144-2aaa-bb39f7a3bac3@denx.de>
Date: Thu, 23 Mar 2017 17:33:05 +0100
MIME-Version: 1.0
In-Reply-To: <20170323164000.34288ed9@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 03/23/2017 04:40 PM, Boris Brezillon wrote:
> On Thu, 23 Mar 2017 12:29:58 +0100
> Marek Vasut <marex@denx.de> wrote:
> 
> 
>>> +
>>> +/*
>>> + * spinand_read_status - get status register value
>>> + * @chip: SPI NAND device structure
>>> + * @status: buffer to store value
>>> + * Description:
>>> + *   After read, write, or erase, the NAND device is expected to set the
>>> + *   busy status.
>>> + *   This function is to allow reading the status of the command: read,
>>> + *   write, and erase.
>>> + */
>>> +static int spinand_read_status(struct spinand_device *chip, uint8_t *status)
>>> +{
>>> +	return spinand_read_reg(chip, REG_STATUS, status);
>>> +}
>>> +
>>> +/*
>>> + * spinand_wait - wait until the command is done
>>> + * @chip: SPI NAND device structure
>>> + * @s: buffer to store status register value (can be NULL)
>>> + */
>>> +static int spinand_wait(struct spinand_device *chip, u8 *s)
>>> +{
>>> +	unsigned long timeo = msecs_to_jiffies(400);
>>> +	u8 status;
>>> +
>>> +	do {
>>> +		spinand_read_status(chip, &status);
>>> +		if ((status & STATUS_OIP_MASK) == STATUS_READY)
>>> +			goto out;
>>> +	} while (time_before(jiffies, timeo));
>>> +
>>> +	/*
>>> +	 * Extra read, just in case the STATUS_READY bit has changed
>>> +	 * since our last check
>>> +	 */  
>>
>> Is this likely to happen ? Probably not ... so in case you reach this
>> place here, timeout happened.
> 
> If the timeout is big enough, no. But it does not hurt to do one last
> check.

400 mSec is not big enough ? It's huge ... this seems like a duplication
to me. btw the ad-hoc 400 mSec delay value should be replaced with a macro.

>>> +	spinand_read_status(chip, &status);
>>> +out:
>>> +	if (s)
>>> +		*s = status;
>>> +
>>> +	return (status & STATUS_OIP_MASK) == STATUS_READY ? 0 :	-ETIMEDOUT;
>>> +}
>>> +
>>> +/*
>>> + * spinand_read_id - send 9Fh command to get ID
>>> + * @chip: SPI NAND device structure
>>> + * @buf: buffer to store id
>>> + * Description:
>>> + *   Manufacturers' read ID method is not unique. Some need a dummy before
>>> + *   reading, some's ID has three byte.
>>> + *   This function send one byte opcode (9Fh) and then read
>>> + *   SPINAND_MAX_ID_LEN (4 currently) bytes. Manufacturer's detect function
>>> + *   need to filter out real ID from the 4 bytes.
>>> + */
>>> +static int spinand_read_id(struct spinand_device *chip, u8 *buf)
>>> +{
>>> +	struct spinand_op op;
>>> +
>>> +	spinand_op_init(&op);
>>> +	op.cmd = SPINAND_CMD_READ_ID;
>>> +	op.n_rx = SPINAND_MAX_ID_LEN;
>>> +	op.rx_buf = buf;
>>> +
>>> +	return spinand_exec_op(chip, &op);
>>> +}
>>> +
>>> +/*
>>> + * spinand_reset - reset device by FFh command.
>>> + * @chip: SPI NAND device structure
>>> + */
>>> +static int spinand_reset(struct spinand_device *chip)
>>> +{
>>> +	struct spinand_op op;
>>> +	int ret;
>>> +
>>> +	spinand_op_init(&op);
>>> +	op.cmd = SPINAND_CMD_RESET;
>>> +
>>> +	ret = spinand_exec_op(chip, &op);
>>> +	if (ret < 0) {
>>> +		pr_err("spinand reset failed!\n");  
>>
>> Can we use dev_err() ? Also , previous patch had some pr_fmt which added
>> "SPI NAND:" prefix, so replace "spinand" with "SPI NAND: " to be
>> consistent ...
> 
> The underlying dev is not ready/initialized the first time
> spinand_reset() is called.

OK, then at least be consistent with the prefix.

>>> +		goto out;
>>> +	}
>>> +	ret = spinand_wait(chip, NULL);
>>> +
>>> +out:
>>> +	return ret;
>>> +}
> 
>>> +/*
>>> + * spinand_manufacturer_detect - detect SPI NAND device by each manufacturer
>>> + * @chip: SPI NAND device structure
>>> + *
>>> + * ->detect() should decode raw id in chip->id.data and initialize device
>>> + * related part in spinand_device structure if it is the right device.
>>> + * ->detect() can not be NULL.
>>> + */
>>> +static int spinand_manufacturer_detect(struct spinand_device *chip)
>>> +{
>>> +	int i = 0;
>>> +
>>> +	for (; spinand_manufacturers[i]->id != 0x0; i++) {
>>> +		if (!spinand_manufacturers[i]->ops ||
>>> +		    !spinand_manufacturers[i]->ops->detect) {
>>> +			pr_err("%s's ops or ops->detect() is be NULL!\n",
>>> +			       spinand_manufacturers[i]->name);  
>>
>> Can this case happen, EVER ? I'd mandate the ->detect to be always set.
> 
> I agree. Let's assume ->detect is always != NULL. Same goes for ->ops
> (assuming you use the ARRAY_SIZE() approach I suggested below).
> 
>>
>>> +			return -EINVAL;
>>> +		}
>>> +		if (spinand_manufacturers[i]->ops->detect(chip)) {
>>> +			chip->manufacturer.manu = spinand_manufacturers[i];
>>> +			return 0;
>>> +		}
>>> +	}
>>> +
>>> +	return -ENODEV;
>>> +}
> 
> [...]
> 
>>> +/*
>>> + * spinand_alloc - [SPI NAND Interface] allocate SPI NAND device instance
>>> + * @dev: pointer to device model structure
>>> + */
>>> +struct spinand_device *spinand_alloc(struct device *dev)
>>> +{
>>> +	struct spinand_device *chip;
>>> +	struct spinand_ecc_engine *ecc_engine;
>>> +
>>> +	chip = kzalloc(sizeof(*chip), GFP_KERNEL);
>>> +	if (!chip)
>>> +		goto err1;
>>> +
>>> +	ecc_engine = kzalloc(sizeof(*ecc_engine), GFP_KERNEL);
>>> +	if (!ecc_engine)
>>> +		goto err2;  
>>
>> Just allocate a structure with both chip and ecc_engine in them, then
>> you don't have to kzalloc/kfree twice .
> 
> Actually, the ECC engine allocation/initialization should not be done
> here. At this point, you don't know yet which ECC engine will be used
> (on-die, external engine, software ECC, ...).
> 
> Let the real ECC implementation allocate the ecc.engine struct
> (and overload it if needed).

OK

>>> +	ecc_engine->mode = SPINAND_ECC_ONDIE;
> 
> The engine mode (which is more a type than a mode IMO) should be
> stored in chip->ecc.type (or chip->ecc.mode) and be used by the
> different components (core, vendor or controller code) to determine who
> is supposed to provide the ECC engine.
> 
>>> +	chip->ecc.engine = ecc_engine;
>>> +	spinand_set_of_node(chip, dev->of_node);
>>> +	mutex_init(&chip->lock);
>>> +
>>> +	return chip;
>>> +
>>> +err2:
>>> +	kfree(chip);
>>> +err1:
>>> +	return ERR_PTR(-ENOMEM);
>>> +}
>>> +EXPORT_SYMBOL_GPL(spinand_alloc);
>>> +
>>> +/*
>>> + * spinand_free - [SPI NAND Interface] free SPI NAND device instance
>>> + * @chip: SPI NAND device structure
>>> + */
>>> +void spinand_free(struct spinand_device *chip)
>>> +{
>>> +	kfree(chip->ecc.engine);
>>> +	kfree(chip);
>>> +}
>>> +EXPORT_SYMBOL_GPL(spinand_free);
>>> +
>>> +/*
>>> + * spinand_register - [SPI NAND Interface] register SPI NAND device
>>> + * @chip: SPI NAND device structure
>>> + */
>>> +int spinand_register(struct spinand_device *chip)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = spinand_detect(chip);
>>> +	if (ret) {
>>> +		pr_err("Detect SPI NAND failed with error %d.\n", ret);
>>> +		return ret;
>>> +	}
>>> +
>>> +	ret = spinand_init(chip);
>>> +	if (ret)
>>> +		pr_err("Init SPI NAND failed with error %d.\n", ret);
>>> +
>>> +	return ret;
>>> +}
>>> +EXPORT_SYMBOL_GPL(spinand_register);
>>> +
>>> +/*
>>> + * spinand_unregister - [SPI NAND Interface] unregister SPI NAND device
>>> + * @chip: SPI NAND device structure
>>> + */
>>> +int spinand_unregister(struct spinand_device *chip)
>>> +{
>>> +	struct nand_device *nand = &chip->base;
>>> +
>>> +	nand_unregister(nand);
>>> +	spinand_manufacturer_cleanup(chip);
>>> +	kfree(chip->buf);
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL_GPL(spinand_unregister);
>>> +
>>> +MODULE_DESCRIPTION("SPI NAND framework");
>>> +MODULE_AUTHOR("Peter Pan<peterpandong@micron.com>");
>>> +MODULE_LICENSE("GPL v2");
>>> diff --git a/drivers/mtd/nand/spi/manufactures.c b/drivers/mtd/nand/spi/manufactures.c
>>> new file mode 100644
>>> index 0000000..7e0b42d
>>> --- /dev/null
>>> +++ b/drivers/mtd/nand/spi/manufactures.c
> 
> manufacturers.c, but I don't think I want to keep this file anyway.
> 
>>> @@ -0,0 +1,24 @@
>>> +/**
>>> + *
>>> + * Copyright (c) 2009-2017 Micron Technology, Inc.  
>>
>> 2009-2017 ? Wow :)
>>
>>> + * This program is free software; you can redistribute it and/or
>>> + * modify it under the terms of the GNU General Public License
>>> + * as published by the Free Software Foundation; either version 2
>>> + * of the License, or (at your option) any later version.
>>> + *
>>> + * This program is distributed in the hope that it will be useful,
>>> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> + * GNU General Public License for more details.
>>> + */
>>> +
>>> +#include <linux/module.h>
>>> +#include <linux/mtd/spinand.h>
>>> +
>>> +struct spinand_manufacturer spinand_manufacturer_end = {0x0, "Unknown", NULL};
>>> +
>>> +struct spinand_manufacturer *spinand_manufacturers[] = {
>>> +	&spinand_manufacturer_end,  
>>
>> Just populate the array directly .
> 
> BTW, you don't need this sentinel. Just use ARRAY_SIZE() and put this
> table directly in the core.
> 


-- 
Best regards,
Marek Vasut
