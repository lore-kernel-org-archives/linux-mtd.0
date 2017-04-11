Received: from 4.mo173.mail-out.ovh.net ([46.105.34.219])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cxyNM-0002RH-Ow
 for linux-mtd@lists.infradead.org; Tue, 11 Apr 2017 16:10:43 +0000
Received: from player778.ha.ovh.net (b6.ovh.net [213.186.33.56])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id C3A14306D9
 for <linux-mtd@lists.infradead.org>; Tue, 11 Apr 2017 18:10:17 +0200 (CEST)
Subject: Re: [PATCH 01/10] mtd: spi-nor: aspeed: fix the AST2400 SMC window
 size
To: Marek Vasut <marek.vasut@gmail.com>, linux-mtd@lists.infradead.org
References: <1491497808-25487-1-git-send-email-clg@kaod.org>
 <1491497808-25487-2-git-send-email-clg@kaod.org>
 <1031c587-4d69-d8a0-921a-40886fbb1575@gmail.com>
 <b791c4ae-3a12-0c6d-805d-49601a3e72b4@kaod.org>
 <352c3fc5-cdf6-12d6-f263-ddc026bd7f5d@gmail.com>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Joel Stanley <joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <7044f7c1-d164-0ab2-0c51-3f5b2825982e@kaod.org>
Date: Tue, 11 Apr 2017 18:10:02 +0200
MIME-Version: 1.0
In-Reply-To: <352c3fc5-cdf6-12d6-f263-ddc026bd7f5d@gmail.com>
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

On 04/11/2017 12:42 PM, Marek Vasut wrote:
> On 04/11/2017 12:18 PM, Cédric Le Goater wrote:
>> On 04/06/2017 09:17 PM, Marek Vasut wrote:
>>> On 04/06/2017 06:56 PM, Cédric Le Goater wrote:
>>>> The window of the Aspeed AST2400 SMC Controller to map chips on the
>>>> AHB Bus has a 256MB size. 64MB is the default size for the first chip
>>>> select and not the full window range: [ 0x20000000 - 0x2FFFFFFF ].
>>>>
>>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>>> ---
>>>>  drivers/mtd/spi-nor/aspeed-smc.c | 2 +-
>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/mtd/spi-nor/aspeed-smc.c b/drivers/mtd/spi-nor/aspeed-smc.c
>>>> index 56051d30f000..aa2c647c8507 100644
>>>> --- a/drivers/mtd/spi-nor/aspeed-smc.c
>>>> +++ b/drivers/mtd/spi-nor/aspeed-smc.c
>>>> @@ -48,7 +48,7 @@ static void aspeed_smc_chip_set_4b_spi_2400(struct aspeed_smc_chip *chip);
>>>>  static void aspeed_smc_chip_set_4b(struct aspeed_smc_chip *chip);
>>>>  
>>>>  static const struct aspeed_smc_info fmc_2400_info = {
>>>> -	.maxsize = 64 * 1024 * 1024,
>>>> +	.maxsize = 256 * 1024 * 1024,
>>>
>>> How does the second part of reg property in DT relate to this ?
>>> DT binding example has it set to 0x02000000 = 32 MiB ...
>>
>> Thanks for pointing this out. There is an inconsistency and
>> a redundancy here ... The patch is wrong as I am mixing up 
>> different limits. Anyhow, there are some concerns to discuss. 
>>
>> The DT binding is the size of the overall AHB window in which 
>> a controller can directly memory access the chips bound to 
>> itself. This is for the Command mode.
>>
>> The .maxsize attribute, not being used until this patchset, 
>> holds the size limit of a chip that the controller supports 
>> to do direct memory access. This limit is 64MB on the AST2400 
>> and 256MB (full window) on the AST2500. 
>>
>> I think that this value should be moved in the DT also ? 
> 
> No, I don't think so, this is a chip property which can be derived from
> the compatible string, right ?

yes.

C. 


>> The second thing to do is to retrieve the size of the overall 
>> AHB window from the DT and stop using the .maxsize attribute 
>> in the subsequent patches configuring the segment registers 
>> and introducing the command mode.
>>
>> But the SPI controller window on the AST2400 is :
>>
>> 	 [ 0x30000000 - 0x3FFFFFFF ] 
>>
>> which is a problem because, if I remember well, it requires us 
>> to configure CONFIG_VMSPLIT_2G to reserve space for the iomap.
>> I am not sure how to correctly handle that case, today we are 
>> just defining a small 32MB window.
>>
>>
>> Thanks,
>>
>> C. 
>>
> 
> 
