Received: from eusmtp01.atmel.com ([212.144.249.242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c6znH-0007D9-7V
 for linux-mtd@lists.infradead.org; Wed, 16 Nov 2016 12:58:28 +0000
Subject: Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
To: "Esponde, Joel" <Joel.Esponde@Honeywell.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Marek Vasut
 <marex@denx.de>
References: <1476971026-9665-1-git-send-email-joel.esponde@honeywell.com>
 <56670303-e8e8-fb2c-e043-035c566f347c@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242544AEF1@DE08W1305.global.ds.honeywell.com>
 <f45e1845-573f-d0b7-0f23-abd035f25945@atmel.com>
 <F6CD090A69E64C4289DC608E1C5D20242545487D@DE08W1305.global.ds.honeywell.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <eb2ce083-3854-a0a3-c82e-345b4de3dc26@atmel.com>
Date: Wed, 16 Nov 2016 13:58:03 +0100
MIME-Version: 1.0
In-Reply-To: <F6CD090A69E64C4289DC608E1C5D20242545487D@DE08W1305.global.ds.honeywell.com>
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

Hi Joel,

+Marek

Le 24/10/2016 à 10:33, Esponde, Joel a écrit :
> Hi Cyrille,
> 
>> -----Message d'origine-----
>> De : Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
>> Envoyé : vendredi 21 octobre 2016 14:50
>> À : Esponde, Joel <Joel.Esponde@Honeywell.com>; linux-
>> mtd@lists.infradead.org
>> Objet : Re: [PATCH] mtd: spi-nor: fixed spansion quad enable
>>
>>>>> +	/* set SR & CR, enable quad I/O */
>>>>>  	write_enable(nor);
>>>>>
>>>>>  	ret = write_sr_cr(nor, quad_en);
>>>>>  	if (ret < 0) {
>>>>> -		dev_err(nor->dev,
>>>>> -			"error while writing configuration register\n");
>>>>> +		dev_err(nor->dev, "error while writing SR and CR
>>>> registers\n");
>>>>>  		return -EINVAL;
>>>>>  	}
>>>>>
>>>>> -	/* read back and check it */
>>>>> +	ret = spi_nor_wait_till_ready(nor);
>>>>> +	if (ret)
>>>>> +		return ret;
>>>>> +
>>>
>>> I think that this wait is required with every memories that store Quad
>> Enable bit in a non-volatile way.
>>> I am using today a stripped down kernel with a rootfs based on UBIFS.
>>> When this bit is set, UBIFS will start reading the memory 100ms after.
>>> As this bit writing step takes up to 200ms, spansion memory is not ready
>> and UBIFS will fail when trying to read the content of the partition.
>>> As UBIFS has a recovery mechanism, it will even broke the file system.
>>>
>>
>> I agree with you about adding the spi_nor_wait_till_ready() call. I plan to add
>> it in my SFDP patch for the spansion_new_quad_enable(), if not done yet.
>>
> 
> Good news !!
> Because I think that this part of the patch is the most critical.
> Without this, you may broke your filesystem so this is a big issue.
> 
> Best regards,
> 
> Joël
> 

I've recently tested with two Winbond QSPI memories, W25Q256 and W25M512 and
now I can confirm that the issue you reported also applies to those memories:
if spi_nor_wait_till_ready() is not called after write_sr_cr(), the next SPI
command may be sent too quickly and bad data may be read.
Indeed, this issue occured in some bare metal (boot loader) code, when I
performed a Fast Read 1-4-4 (EBh) command right after the Write Status Register
(01h) command, without polling the BUSY bit with Read Status Register (05h)
commands.

Also the W25Q256 datasheet I have claims that the memory supports the Read
Status Register2 (35h) however the data read from the SFDP table of my memory
sample tells that the Quad Enable bit should be set only using the Write
Status Register (01h) command with 2 data bytes (SR1 then SR2) and without
using the Read Status Register 2 (35h) command:

Indeed, bits[22:20] of the 15th dword in the Basic Flash Parameter Table (BFPT)
are 100b and not 101b!

100b: QE is bit 1 of status register 2. It is set wia Write Status with two
      data bytes where bit 1 of the second byte is one.

101b: QE is bit 1 of status register 2. Status register 1 is read using Read
      Status instruction 05h. Status register 2 is read using instruction 35h.
      QE is set via Write Status instruction 01h with two data bytes where bit
      1 of the second byte is one.

I didn't test whether the datasheet is right and the 35h command is actually
supported by those Winbond memories so their bits[22:20] of the 15th dword in
the BFPT should have been set to 101b instead of 100b.
However I'd rather be compliant with the JESD216B specification.

So could you please send a new version of your patch adding only the
spi_nor_wait_till_ready() call but without adding other read to the Status
Register 2/Control Register 1 (35h)?

The 2nd procedure, which uses the 35h instruction to check whether the Quad
Enable bit has already been set, will be implemented by
spansion_new_quad_enable() from the SFDP patch. I've already fixed this patch
to add the call of spi_nor_wait_till_ready().

With both your patch and mine, we will fix the issue and still be compliant
with the SFDP specification.

Best regards,

Cyrille
