Received: from 18.mo1.mail-out.ovh.net ([46.105.35.72])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bx9Tn-00006X-MB
 for linux-mtd@lists.infradead.org; Thu, 20 Oct 2016 09:17:40 +0000
Received: from player691.ha.ovh.net (b9.ovh.net [213.186.33.59])
 by mo1.mail-out.ovh.net (Postfix) with ESMTP id B0C15159B5
 for <linux-mtd@lists.infradead.org>; Thu, 20 Oct 2016 11:17:16 +0200 (CEST)
Subject: Re: [PATCH] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1476723427-13243-1-git-send-email-clg@kaod.org>
 <6964c1fd-3ac1-a28f-7b73-8113f0837e75@atmel.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <f5074ac1-e536-5817-377a-e39514c8ca97@kaod.org>
Date: Thu, 20 Oct 2016 11:17:14 +0200
MIME-Version: 1.0
In-Reply-To: <6964c1fd-3ac1-a28f-7b73-8113f0837e75@atmel.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Cyrille,

Thanks for taking a look, some answers and more questions below.

On 10/19/2016 07:06 PM, Cyrille Pitchen wrote:
> Hi Cédric,
> 
> Le 17/10/2016 à 18:57, Cédric Le Goater a écrit :
>> This driver adds mtd support for spi-nor attached to either or both of
>> the Firmware Memory Controller or the SPI Flash Controller (AST2400
>> only).
>>
>> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
>> ones found on the AST2400. The differences are on the number of
>> supported flash modules and their default mappings in the SoC address
>> space.
>>
>> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
>> for the host firmware. All controllers have now the same set of
>> registers compatible with the AST2400 FMC controller and the legacy
>> 'SMC' controller is fully gone.
>>
>> Based on previous work from Milton D. Miller II <miltonm@us.ibm.com>
>>
>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>> ---
> [...]
>> +
>> +static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>> +{
>> +	struct aspeed_smc_chip *chip = nor->priv;
>> +	__be32 temp;
>> +	u32 cmdaddr;
>> +
>> +	switch (nor->addr_width) {
>> +	default:
>> +		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
>> +			  nor->addr_width);
>> +		/* FALLTHROUGH */
>> +	case 3:
>> +		cmdaddr = addr & 0xFFFFFF;
>> +
>> +		cmdaddr |= (u32)cmd << 24;
>> +
>> +		temp = cpu_to_be32(cmdaddr);
>> +		aspeed_smc_to_fifo(chip->base, &temp, 4);
>> +		break;
>> +	case 4:
>> +		temp = cpu_to_be32(addr);
>> +		aspeed_smc_to_fifo(chip->base, &cmd, 1);
>> +		aspeed_smc_to_fifo(chip->base, &temp, 4);
>> +		break;
>> +	}
>> +}
>> +
>> +static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
>> +				    u_char *read_buf)
>> +{
>> +	struct aspeed_smc_chip *chip = nor->priv;
>> +
>> +	mutex_lock(&chip->controller->mutex);
>> +
>> +	aspeed_smc_start_user(nor);

I think this section of code lock+start_user should be in a prepare handler 
if I am correct ? and I could get rid of the lock in that case to rely on
the one of the spi nor.

>> +	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
> 
> I guess the dummy cycles are missing between address cycles and data cycles!
> Check nor->read_dummy ;)

ah yes, I meant to and I forgot to add it ... will do in v2. I suppose 
we are doing fine with the driver now because we only use normal speed.

> Or maybe this controller can really only perform READ operations but no FAST
> READ commands. Hence the "spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL)"
> below.

yes it can. I suppose the driver should also call spi_nor_set_flash_node() 
for module supporting it. that brings another question I would like 
to discuss for possible followups patches. 

The controller can be fine tuned for a particular chip module. The 
CE0 control register has a few bits to set the spi clock, the dummy 
cycles, the CS inactive width and there is also a register to setup 
read timings delay.
 
So you need to loop on these different settings to find a correct one
and for that, you use a gold image captured at low speed as reference.

But you need to know which chip module you are dealing with. would it 
be possible to expose the jedec to the controller for this purpose ? 
and then do the training to build the timing settings in the driver. 
This is a similar approach taken by some nand controllers.

Thanks,

C.

 
>> +	aspeed_smc_from_fifo(read_buf, chip->base, len);
>> +	aspeed_smc_stop_user(nor);
>> +
>> +	mutex_unlock(&chip->controller->mutex);
>> +
>> +	return len;
>> +}
> [...]
> 
> Best regards,
> 
> Cyrille
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
