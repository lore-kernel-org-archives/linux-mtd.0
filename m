Received: from mo69.mail-out.ovh.net ([178.32.228.69])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxXxL-0000kX-Ky
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 11:25:54 +0000
Received: from player798.ha.ovh.net (b7.ovh.net [213.186.33.57])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id CDEA980FA
 for <linux-mtd@lists.infradead.org>; Fri, 21 Oct 2016 13:25:24 +0200 (CEST)
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Subject: Re: [PATCH] mtd/spi-nor: Add SPI memory controllers for Aspeed SoCs
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>, linux-mtd@lists.infradead.org
References: <1476723427-13243-1-git-send-email-clg@kaod.org>
 <6964c1fd-3ac1-a28f-7b73-8113f0837e75@atmel.com>
 <f5074ac1-e536-5817-377a-e39514c8ca97@kaod.org>
 <420eece6-277d-6c8f-70ed-ba2a1c42d5d5@atmel.com>
Message-ID: <6d956d82-5966-c760-9332-7f9889ac17ff@kaod.org>
Date: Fri, 21 Oct 2016 13:25:21 +0200
MIME-Version: 1.0
In-Reply-To: <420eece6-277d-6c8f-70ed-ba2a1c42d5d5@atmel.com>
Content-Type: text/plain; charset=windows-1252
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

On 10/20/2016 04:33 PM, Cyrille Pitchen wrote:
> Hi Cédric,
> 
> Le 20/10/2016 à 11:17, Cédric Le Goater a écrit :
>> Hello Cyrille,
>>
>> Thanks for taking a look, some answers and more questions below.
>>
>> On 10/19/2016 07:06 PM, Cyrille Pitchen wrote:
>>> Hi Cédric,
>>>
>>> Le 17/10/2016 à 18:57, Cédric Le Goater a écrit :
>>>> This driver adds mtd support for spi-nor attached to either or both of
>>>> the Firmware Memory Controller or the SPI Flash Controller (AST2400
>>>> only).
>>>>
>>>> The SMC controllers on the Aspeed AST2500 SoC are very similar to the
>>>> ones found on the AST2400. The differences are on the number of
>>>> supported flash modules and their default mappings in the SoC address
>>>> space.
>>>>
>>>> The Aspeed AST2500 has one SPI controller for the BMC firmware and two
>>>> for the host firmware. All controllers have now the same set of
>>>> registers compatible with the AST2400 FMC controller and the legacy
>>>> 'SMC' controller is fully gone.
>>>>
>>>> Based on previous work from Milton D. Miller II <miltonm@us.ibm.com>
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>> [...]
>>>> +
>>>> +static void aspeed_smc_send_cmd_addr(struct spi_nor *nor, u8 cmd, u32 addr)
>>>> +{
>>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>>> +	__be32 temp;
>>>> +	u32 cmdaddr;
>>>> +
>>>> +	switch (nor->addr_width) {
>>>> +	default:
>>>> +		WARN_ONCE(1, "Unexpected address width %u, defaulting to 3\n",
>>>> +			  nor->addr_width);
>>>> +		/* FALLTHROUGH */
>>>> +	case 3:
>>>> +		cmdaddr = addr & 0xFFFFFF;
>>>> +
>>>> +		cmdaddr |= (u32)cmd << 24;
>>>> +
>>>> +		temp = cpu_to_be32(cmdaddr);
>>>> +		aspeed_smc_to_fifo(chip->base, &temp, 4);
>>>> +		break;
>>>> +	case 4:
>>>> +		temp = cpu_to_be32(addr);
>>>> +		aspeed_smc_to_fifo(chip->base, &cmd, 1);
>>>> +		aspeed_smc_to_fifo(chip->base, &temp, 4);
>>>> +		break;
>>>> +	}
>>>> +}
>>>> +
>>>> +static ssize_t aspeed_smc_read_user(struct spi_nor *nor, loff_t from, size_t len,
>>>> +				    u_char *read_buf)
>>>> +{
>>>> +	struct aspeed_smc_chip *chip = nor->priv;
>>>> +
>>>> +	mutex_lock(&chip->controller->mutex);
>>>> +
>>>> +	aspeed_smc_start_user(nor);
>>
>> I think this section of code lock+start_user should be in a prepare handler 
>> if I am correct ? and I could get rid of the lock in that case to rely on
>> the one of the spi nor.
>>
> 
> For the mutex, looking at your driver, you lock it at the beginning then unlock
> at the end of the four handlers:
> - nor->read()
> - nor->write()
> - nor->read_reg()
> - nor->write_reg()
> 
> If this is the only purpose of this mutex, yes, you can remove it and relie on
> the internal spi-nor one (nor->lock), which is locked from
> spi_nor_lock_and_prep() hence at the beginning of spi_nor_erase(),
> spi_nor_read() and spi_nor_write() calls.
> 
> However, about moving the call of aspeed_smc_start_user() into a new prepare
> handler, I don't know whether it would actually fit your needs: for sure, 
> aspeed_smc_start_user() would be no longer called at some points.
> 
> 2 examples:
> 
> A - spi_nor_write() calls:
> 1 - spi_nor_lock_and_prep() -> nor->prepare()
> 2 - write_enable() -> nor->write_reg()
> 3 - nor->write()
> 4 - spi_nor_wait_till_ready() -> nor->read_reg()
> 5 - spi_nor_unlock_and_unprep() -> nor->unprepare()
> 
> With your current driver, aspeed_smc_start_user()/aspeed_smc_stop_user() are
> called 3 times, indeed each time a command is sent on the SPI bus:
> WRITE ENABLE, PAGE PROGRAM, READ STATUS
> 
> Then if you move then into spi_nor_[un]lock_and_[un]prep(), those two functions
> would only be called once each.
> 
> 
> B - spi_nor_scan() calls:
> 1 - spi_nor_read_id() -> nor->read_reg()
> 
> but spi_nor_lock_and_prep() is not called before, so if you nead to call
> aspeed_smc_start_user() before sending any command on the SPI bus, it won't
> work.

ok. So I need to keep it for now as the driver only supports the 
'User mode' of the controller.

In 'User mode', the controller sends commands to the module doing 
writes at the base address where the module is mapped and gets 
the results doing reads. So whatever is done, we need to make sure
this mode is enforced.

There is another mode called 'Command Mode' in the specs (the naming
is rather confusing) in which you can access the contents of the 
flash doing memory accesses in the memory window in which the module 
is mapped. The controller uses the setting in the CE control register
to generate the commands. This is not supported yet.

> I don't know how your SPI controller works but maybe using the nor->prepare()
> handler is not what you want!

Thanks a lot for the analysis.

>>>> +	aspeed_smc_send_cmd_addr(nor, nor->read_opcode, from);
>>>
>>> I guess the dummy cycles are missing between address cycles and data cycles!
>>> Check nor->read_dummy ;)
>>
>> ah yes, I meant to and I forgot to add it ... will do in v2. I suppose 
>> we are doing fine with the driver now because we only use normal speed.
>>
> 
> Indeed, the legacy READ (03h) command has no dummy cycles as opposed to all
> other FAST READ commands. Of course, the READ command is far much slower.
> 
>>> Or maybe this controller can really only perform READ operations but no FAST
>>> READ commands. Hence the "spi_nor_scan(&chip->nor, NULL, SPI_NOR_NORMAL)"
>>> below.
>>
>> yes it can. I suppose the driver should also call spi_nor_set_flash_node() 
>> for module supporting it. that brings another question I would like 
>> to discuss for possible followups patches. 
>>
> 
> Calling spi_nor_set_flash_node() with the relevant parameter tells
> spi_nor_scan() which DT node to parse to tune some settings.
> For instance, you could add the "m25p,fast-read" DT property so spi_nor_scan()
> would select Fast Read operations rather than Read operations.

Yes. That is something I will try pretty soon on the boards we have.

>> The controller can be fine tuned for a particular chip module. The 
>> CE0 control register has a few bits to set the spi clock, the dummy 
>> cycles, the CS inactive width and there is also a register to setup 
>> read timings delay.
>>  
>> So you need to loop on these different settings to find a correct one
>> and for that, you use a gold image captured at low speed as reference.
>>
>> But you need to know which chip module you are dealing with. would it 
>> be possible to expose the jedec to the controller for this purpose ? 
>> and then do the training to build the timing settings in the driver. 
>> This is a similar approach taken by some nand controllers.
>>
> 
> I'm not sure to fully understand your needs.
> The spi clock is often provided in the device tree, on the controller or memory
> node, with the "spi-max-frequency" DT property.

yes but it is possible also to discover what is the best timing at runtime 
depending on the chip model found and not rely on the DT for that. That is 
what I am trying to explain poorly. 

> The number of dummy cycles is set in nor->read_dummy by spi_nor_scan()
> according to the actual memory model and the selected (Fast) Read op code.
> For chip-select timings, those settings aren't currently handled by
> spi_nor_scan() but might be supported inside the SPI controller driver 
> through DT properties if needed.
>
> I don't know why your SPI controller driver needs to know the exact memory
> model to work. Aren't the pieces of information provided by spi-nor.c enough?
> Actually, for this point I don't quite exactly understand your needs! :)

he. Let's start with a non optimized version, then I will check the fast 
read op with the different boards/modules we have. Timings will come later, 
DMA also.

Thanks for the review.

C. 


> 
> Best regards,
> 
> Cyrille
> 
> 
>> Thanks,
>>
>> C.
>>
>>  
>>>> +	aspeed_smc_from_fifo(read_buf, chip->base, len);
>>>> +	aspeed_smc_stop_user(nor);
>>>> +
>>>> +	mutex_unlock(&chip->controller->mutex);
>>>> +
>>>> +	return len;
>>>> +}
>>> [...]
>>>
>>> Best regards,
>>>
>>> Cyrille
>>>
>>> ______________________________________________________
>>> Linux MTD discussion mailing list
>>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>>>
>>
> 
