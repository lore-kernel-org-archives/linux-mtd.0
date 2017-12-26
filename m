Received: from smtp3-g21.free.fr ([2a01:e0c:1:1599::12])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eToyJ-0002kB-FR
 for linux-mtd@lists.infradead.org; Tue, 26 Dec 2017 13:08:55 +0000
Subject: Re: [PATCH] mtd: spi-nor: use _lock_and_prep() in _read_sfdp()
To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Cc: "boris.brezillon@free-electrons.com" <boris.brezillon@free-electrons.com>,
 Prabhakar Kushwaha <prabhakar.kushwaha@nxp.com>,
 Suresh Gupta <suresh.gupta@nxp.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>
References: <1513931752-23387-1-git-send-email-yogeshnarayan.gaur@nxp.com>
 <af710291-c5d7-9c52-8313-0f2684f46f75@wedev4u.fr>
 <DB6PR0402MB2838152DA9ED3CA973FE99D899060@DB6PR0402MB2838.eurprd04.prod.outlook.com>
From: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
Message-ID: <e26e3bdd-9e56-26ce-b09f-193277b22c61@wedev4u.fr>
Date: Tue, 26 Dec 2017 14:08:18 +0100
MIME-Version: 1.0
In-Reply-To: <DB6PR0402MB2838152DA9ED3CA973FE99D899060@DB6PR0402MB2838.eurprd04.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yogesh,

Le 26/12/2017 à 06:25, Yogesh Narayan Gaur a écrit :
> Hi Cyrille,
> 
>> -----Original Message-----
>> From: Cyrille Pitchen [mailto:cyrille.pitchen@wedev4u.fr]
>> Sent: Friday, December 22, 2017 6:20 PM
>> To: Yogesh Narayan Gaur <yogeshnarayan.gaur@nxp.com>; linux-
>> mtd@lists.infradead.org
>> Cc: boris.brezillon@free-electrons.com; Prabhakar Kushwaha
>> <prabhakar.kushwaha@nxp.com>; Suresh Gupta <suresh.gupta@nxp.com>;
>> computersforpeace@gmail.com
>> Subject: Re: [PATCH] mtd: spi-nor: use _lock_and_prep() in _read_sfdp()
>>
>> Hi Yogesh,
>>
>> Le 22/12/2017 à 09:35, Yogesh Gaur a écrit :
>>> spi_nor_read_sfdp() calls nor->read() to read the SFDP data.
>>> But first needs to call nor->prepare() to prepare the READ command
>>> before calling nor->read().
>>>
>>
>> Currently, I don't agree with this: spi_nor_read_sfdp() is called only from
>> spi_nor_scan(). Before the SFDP patch, spi_nor_scan() has already been calling
>> for years nor->read_reg() and nor->write_reg() without calling
>> spi_nor_lock_and_prep() first.
>>
>> Indeed, still being in spi_nor_scan(), the SPI NOR memory should have not been
>> registered yet to the above MTD layer. So there should be no need to lock nor-
>>> lock at this point.
>>
>> Then, about calling nor->prepare(), IMHO, it's look a little bit odd that neither
>> nor->read_reg() nor nor->write_reg() require nor->prepare() to be called first
>> whereas nor->read() does need it.
>>
>> You didn't describe what issue or bug you actually noticed so now I assume it
>> deals with the fsl-quadspi.c driver. So let's have a look at its implementation of
>> nor->prepare() / fsl_qspi_prep():
>>
>> +static int fsl_qspi_prep(struct spi_nor *nor, enum spi_nor_ops ops) {
>> +	struct fsl_qspi *q = nor->priv;
>> +	int ret;
>> +
>> +	mutex_lock(&q->lock);
>>
>> It was not needed before by fsl_qspi_read_reg() or fls_qspi_write_reg(), why
>> would it be needed now by fls_qspi_read()?
>>
>> Then I guess, this is not the issue.
>>
>> Anyway, if actually needed or safer, the mutex can be locked just after
>> mutex_init() and before for_each_available_child_of_node() in fsl_qspi_probe().
>>
> Actually, I am doing modification in the fsl-quadspi.c driver. 
> Presently in this driver LUT [Look-up Table] are being prepared in static manner i.e. for different commands we have prepared LUTs entry when controller is being probed fsl_qspi_probe().
> I am doing modification of preparing LUT entry dynamically rather statically and for that require information like opcode, proto, dummy info etc along with information of operation type.

good news! Indeed, this is the way to go.

 
> For this require instance of both struct spi_nor and enum spi_nor_ops. Presently this enum is having entry for SPI_NOR_OPS_READ, _WRITE, _ERASE. With input from this enum in nor->prepare() to fsl_qspi_prep(), able to identify the operation type and accordingly would parse entries from struct spi_nor.
> 
> Thus, require call to nor->prepare() before every call to nor->read().

I still don't agree with you on it: when you implement nor->read(), you
know you execute some (Fast) Read or Read SFDP operation. When you
implement nor->write(), you know that you perform some Page Program
operation. Finally, when you implement nor->erase(), you know a
block/sector is to be erased.

So you don't need 'enum spi_nor_ops'. Actually, I've just checked and no
driver uses this enum at all. Besides, you can't assume that
nor->read_opcode, resp. nor->program_opcode, doesn't change in between
calls of nor->prepare() and nor->read(), resp. nor->write().

Please have a look at sst_write() in spi-nor.c as an example:
nor->prepare() is called once for all at the beginning of the function then
nor->program_opcode may be updated between consecutive calls of
nor->write().

So nor->prepare() is not the right place to configure the Freescale SPI
flash controller like you seem to plan to do. You may implement a common
function in the fsl-quadspi.c driver then call it at the beginning of
fsl_qspi_read(), fsl_qspi_write() and fsl_qspi_erase().

> 
> I agree with your suggestion that we should refrain from modifying generic spi-nor.c for any specific driver. Thus, looking at other way to do this.
>

Based on what I've read from fsl_qspi_probe() and fsl_qspi_prep() and on
what you've explained in your reply, this patch currently does nothing nor
fixes anything for the fsl-quadpsi.c driver but may introduce regression
into other drivers. Sorry but I won't apply it.

Best regards,

Cyrille

> --
> Regards
> Yogesh Gaur
> 
>> +
>> +	ret = fsl_qspi_clk_prep_enable(q);
>>
>> Already called from fls_qpsi_probe() before calling spi_nor_scan():
>> should not be the issue neither.
>>
>> +	if (ret)
>> +		goto err_mutex;
>> +
>> +	fsl_qspi_set_base_addr(q, nor);
>>
>> Also called from fsl_qspi_probe() right before calling spi_nor_scan():
>>
>> 		/* set the chip address for READID */
>> 		fsl_qspi_set_base_addr(q, nor);
>>
>> 		ret = spi_nor_scan(nor, NULL, &hwcaps);
>> 		if (ret)
>> 			goto mutex_failed;
>>
>> 		ret = mtd_device_register(mtd, NULL, 0);
>> 		if (ret)
>> 			goto mutex_failed;
>>
>> 		/* Set the correct NOR size now. */
>> 		if (q->nor_size == 0) {
>> 			q->nor_size = mtd->size;
>>
>> 			/* Map the SPI NOR to accessiable address */
>> 			fsl_qspi_set_map_addr(q);
>> 		}
>>
>> q->nor_size is only updated after spi_nor_scan() hence I don't see why
>> calling nor->prepare() hence fsl_qpsi_set_base_addr() one more time now
>> during spi_nor_scan() would actually change anything.
>>
>> Please note that all I said was based on the assumption that you are trying to fix
>> an issue in the fsl-quadspi.c driver (based on your email address:
>> @nxp.com) as the nxp-spifi.c driver doesn't provide any implementation for the
>> optional nor->prepare().
>>
>> Then could you please describe a little bit more details about the actual issue?
>> What does this patch fix? Which drivers are involved?
>>
>> Indeed, you would like to have a precise understanding of the issue and also
>> avoid modifying spi-nor.c rather than the single fsl-quadspi.c driver or whatever
>> driver is concerned since calling nor->preprare() from
>> spi_nor_scan() has never been done before and may have unwanted side effects
>> on other SPI flash controller drivers.
>>
>> Actually, this is the reason why spi_nor_read_sfdp() directly calls
>> nor->read() instead of spi_nor_read().
>>
>> Best regards,
>>
>> Cyrille
>>
>> +	return 0;
>> +
>> +err_mutex:
>> +	mutex_unlock(&q->lock);
>> +	return ret;
>> +}
>>
>>
>>> Patch adds call to spi_nor_lock_and_prep() to prepare the READ command
>>> and add subsequent call to spi_nor_unlock_and_unprep() to release lock
>>> and call nor->unprepare().
>>>
>>> Signed-off-by: Yogesh Gaur <yogeshnarayan.gaur@nxp.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 6 ++++++
>>>  1 file changed, 6 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>> b/drivers/mtd/spi-nor/spi-nor.c index 2203d6ef..9fb85ae 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1807,6 +1807,10 @@ static int spi_nor_read_sfdp(struct spi_nor *nor,
>> u32 addr,
>>>  	nor->addr_width = 3;
>>>  	nor->read_dummy = 8;
>>>
>>> +	ret = spi_nor_lock_and_prep(nor, SPI_NOR_OPS_READ);
>>> +	if (ret)
>>> +		goto lock_err;
>>> +
>>>  	while (len) {
>>>  		ret = nor->read(nor, addr, len, (u8 *)buf);
>>>  		if (!ret || ret > len) {
>>> @@ -1822,6 +1826,8 @@ static int spi_nor_read_sfdp(struct spi_nor *nor,
>> u32 addr,
>>>  	}
>>>  	ret = 0;
>>>
>>> +	spi_nor_unlock_and_unprep(nor, SPI_NOR_OPS_READ);
>>> +lock_err:
>>>  read_err:
>>>  	nor->read_opcode = read_opcode;
>>>  	nor->addr_width = addr_width;
>>>
> 
