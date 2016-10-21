Received: from eusmtp01.atmel.com ([212.144.249.243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bxa8D-0005J5-Fn
 for linux-mtd@lists.infradead.org; Fri, 21 Oct 2016 13:45:11 +0000
Subject: Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
To: "Esponde, Joel" <Joel.Esponde@Honeywell.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242544AEF1@DE08W1305.global.ds.honeywell.com>
 <f45e1845-573f-d0b7-0f23-abd035f25945@atmel.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <83e02f1d-2c58-10cc-567c-2a58a363767e@atmel.com>
Date: Fri, 21 Oct 2016 15:44:45 +0200
MIME-Version: 1.0
In-Reply-To: <f45e1845-573f-d0b7-0f23-abd035f25945@atmel.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 21/10/2016 à 14:50, Cyrille Pitchen a écrit :
> Hi Joël,
> 
> Le 21/10/2016 à 12:37, Esponde, Joel a écrit :
>> Hi Cyrille,
>>
>> First, thanks for your comments !
>> Please, see below mines.
>>
>>> -----Message d'origine-----
>>> De : Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
>>> Envoyé : jeudi 20 octobre 2016 17:23
>>> À : Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
>>> mtd@lists.infradead.org
>>> Objet : Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
>>>
>>> Hi Joël,
>>>
>>> Le 20/10/2016 à 15:43, Joël Esponde a écrit :
>>>> With the S25FL127S nor flash part, each writing to the configuration register
>>> takes hundreds of ms. During that  time, no more accesses to the flash
>>> should be done (even reads).
>>>>
>>>> This commit adds:
>>>> - a pre check of the quad enable bit to avoid a useless and time
>>>> consuming writing to the flash,
>>>> - a wait loop after the register writing until the flash finishes its work.
>>>>
>>>> This issue could make rootfs mounting fail when the latter was done too
>>> much closely to this quad enable bit setting step. And in this case, a driver as
>>> UBIFS may try to recover the filesystem and may broke it completely.
>>>> ---
>>>>  drivers/mtd/spi-nor/spi-nor.c | 31 +++++++++++++++++++++++++++----
>>>>  1 file changed, 27 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>>> b/drivers/mtd/spi-nor/spi-nor.c index d0fc165..df43cd7 100644
>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>> @@ -1246,18 +1246,41 @@ static int spansion_quad_enable(struct spi_nor
>>> *nor)
>>>>  	int ret;
>>>>  	int quad_en = CR_QUAD_EN_SPAN << 8;
>>>>
>>>> +	/* check quad enable bit
>>>> +	 * as S25FL127S takes 200 ms to execute each write of SR & CR
>>>> +	 * registers even if data is the same, write step will be shorted
>>>> +	 * if not needed
>>>> +	 */
>>>> +	ret = read_cr(nor);
>>>
>>> Sorry but the Read Configuration Register (35h) command is not supported
>>> by all Spansion (or Spansion-like) memories.
>>
>> I have a doubt here, if this is really the case, why read_cr() is already called at the end of the current implementation of the spansion_quad_enable() function to check that quad enable bit is set? 
>>
> 
> That's a very good remark and I think the reason is that the current
> implementation of spansion_quad_enable() suffers from a bug but this one is
> almost harmless:
> 
> I assume there is pull-up resistor on the MISO line: spansion_quad_enable()
> sends a 35h command, which is not supported hence ignored by some memories,
> then it reads a 1-byte value of FFh due to the pull-up so we pass the test
> which checks that the Quad Enable bit has successfully been set.
> 
> Then if we now add the same test before sending the Write Status (01h) command
> with 2 bytes (SR1 then CR/SR2), we also read a FFh value for the Configuration
> Register hence we skip the Write Status command because we think the Quad
> Enable bit has already been set but if we are using a brand new memory still
> using its factory settings the Quad Enable has never been set and won't be set
> since we now skip the Write Status command.
> 
> I think this what currently happens but I need to check with one of my memory
> samples if I can find one which doesn't support the Read CR command but I
> not sure to have such a sample...

The JESD216B specification clearly deals with 2 cases: a first one where the
35h command is not used, I guess because not supported, and a second case using
both the 05h and 35h commands to read the SR1 and SR2/CR1 memory registers
before writing both SR1 and SR2/CR1 with the 01h command.

However I can't provide any example of memory sample falling into the first
case. I guess case 1 only applies to old and buggy memories and maybe not so
used in production.
Besides, your patch is great so I wonder whether it makes sense to reject it
just because it might introduce a regression with some unidentified memories...
If so, I think we could still find a workaround later to handle those very
few (deprecated) parts.

The S25FL127S memory is still recommended by Cypress/Spansion for new designs.

> 
> spansion_quad_enable() is used by QSPI memories from some manufacturers other
> than Spansion.
> 
>>> For more details, please refer to the JEDEC JESD216B specification, especially
>>> the part dealing with the "Quad Enable Requirements". An extract of this
>>> specification can also be found in this patch:
>>> https://patchwork.ozlabs.org/patch/678408/
>>>
>>> Please have a look at values 001b, 100b and 101b for the bits[22:20] of the
>>> 15th DWORD.
>>>
>>> I think your patch is likely to introduce a regression on some old memory
>>> parts.
>>>
>>> However, *if* your S25FL127S memory implements the SFDP tables
>>> correctly, bits[22:20] of the 15th DWORD should be set to 101b, hence using
>>> SFDP patch above should fix the issue:
>>> spansion_new_quad_enable() will be called instead of the current
>>> spansion_quad_enable(). This new function adds the very same test on the
>>> Quad Enable bit as your patch does.
>>>
>>> If you want to test the SFDP patch, you will need to apply the whole series
>>> which introduces some improvement on QSPI memory support:
>>> http://lists.infradead.org/pipermail/linux-mtd/2016-October/069554.html
>>
>> Your patch using SFDP to dynamically manage memories seems really great (from a feature point of view, I am not yet able to have an opinion on the implementation...).
>>
>>>
>>> I'm just cautious with Spansion memories: I tested one sample, and I guess it
>>> was a S25FL127S, which claimed to be compliant with JESD216 rev B (minor 6)
>>> but words after the 9th one were all 0xffffffff.
>>> JESD216 (minor 0) describes only 9 DWORDs in the Basic Flash Parameter
>>> Table
>>> JESD216 rev A (minor 5) introduces 7 new DWORDS, hence 16 DWORDS in the
>>> (BFPT).
>>> the 15th DWORD provides the Quad Enable Requirements, which describes
>>> the procedure to set the Quad Enable bit.
>>>
>>> If the BFPT of your S25FL127S is incomplete but the memory still claiming to
>>> be
>>> JESD216 rev B compliant, neither spansion_quad_enable() nor
>>> spansion_new_quad_enable() would be called. Since the Quad Enable bit is
>>> non-volatile on Spansion memories, it will work if the bit as already been set
>>> before.
>>>
>>
>> See below for code that should be IMO added because of the non-volatibility of spansion memories.
>>
>>>> +	if (ret < 0) {
>>>> +		dev_err(nor->dev, "error %d reading CR\n", ret);
>>>> +		return ret;
>>>> +	}
>>>> +	if (ret & CR_QUAD_EN_SPAN) {
>>>> +		/* quad enable bit is already set */
>>>> +		return 0;
>>>> +	}
>>>> +
>>>> +	/* set SR & CR, enable quad I/O */
>>>>  	write_enable(nor);
>>>>
>>>>  	ret = write_sr_cr(nor, quad_en);
>>>>  	if (ret < 0) {
>>>> -		dev_err(nor->dev,
>>>> -			"error while writing configuration register\n");
>>>> +		dev_err(nor->dev, "error while writing SR and CR
>>> registers\n");
>>>>  		return -EINVAL;
>>>>  	}
>>>>
>>>> -	/* read back and check it */
>>>> +	ret = spi_nor_wait_till_ready(nor);
>>>> +	if (ret)
>>>> +		return ret;
>>>> +
>>
>> I think that this wait is required with every memories that store Quad Enable bit in a non-volatile way.
>> I am using today a stripped down kernel with a rootfs based on UBIFS.
>> When this bit is set, UBIFS will start reading the memory 100ms after.
>> As this bit writing step takes up to 200ms, spansion memory is not ready and UBIFS will fail when trying to read the content of the partition.
>> As UBIFS has a recovery mechanism, it will even broke the file system.
>>
> 
> I agree with you about adding the spi_nor_wait_till_ready() call. I plan to
> add it in my SFDP patch for the spansion_new_quad_enable(), if not done yet.
> 
>>>> +	/* read CR and check it */
>>>>  	ret = read_cr(nor);
>>>> -	if (!(ret > 0 && (ret & CR_QUAD_EN_SPAN))) {
>>>> +	if (ret < 0) {
>>>> +		dev_err(nor->dev, "error %d reading CR\n", ret);
>>>> +		return ret;
>>>> +	}
>>
>> This test on the validity of the returned data may also be useful.
>> When negative errors are returned, it is likely that the CR_QUAD_EN_SPAN bit is set, and so, next test may be meaningless...
>>
>>>> +	if (!(ret & CR_QUAD_EN_SPAN)) {
>>>>  		dev_err(nor->dev, "Spansion Quad bit not set\n");
>>>>  		return -EINVAL;
>>>>  	}
>>>>
>>
>> Best regards,
>> Joël
>>
> 
> Best regards,
> 
> Cyrille
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
