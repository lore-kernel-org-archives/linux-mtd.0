Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dNFNK-0004LB-OV
 for linux-mtd@lists.infradead.org; Tue, 20 Jun 2017 09:23:08 +0000
Received: by mail-wm0-x244.google.com with SMTP id d64so21740385wmf.2
 for <linux-mtd@lists.infradead.org>; Tue, 20 Jun 2017 02:22:46 -0700 (PDT)
Subject: Re: [PATCH v3] spi-nor: Add Winbond w25q512jv
To: Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Joel Stanley <joel@jms.id.au>, Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>
References: <20170620062028.7520-1-joel@jms.id.au>
 <5e822197-9fcd-192e-82e6-310236ee50e4@gmail.com>
 <1497949706.31581.46.camel@kernel.crashing.org>
Cc: linux-mtd@lists.infradead.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <d9f1d30a-6ef5-6352-84fd-b5e552a75ced@gmail.com>
Date: Tue, 20 Jun 2017 11:22:43 +0200
MIME-Version: 1.0
In-Reply-To: <1497949706.31581.46.camel@kernel.crashing.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/20/2017 11:08 AM, Benjamin Herrenschmidt wrote:
> On Tue, 2017-06-20 at 09:23 +0200, Marek Vasut wrote:
>> On 06/20/2017 08:20 AM, Joel Stanley wrote:
>>> From: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>>
>>> Similar to the other ones, different size. The "JV" suffix is in
>>> the datasheet, I haven't seen mentions of a different one.
>>>
>>> The the datasheet indicates DUAL and QUAD are supported.
>>>
>>> http://www.winbond.com/resource-files/w25m512jv%20revc%2001062017.pdf
>>
>> The datasheet says W25M512 not W25Q512.
>>                       ^-----------^-------- different letter here.
> 
> Page 23 mentions the "Q" version which is what we have.

So the M means "Multiple Q dies on single package" ? Why don't you use
w25m in the patch then ?

> Cheers,
> Ben.
> 
>>
>>> Signed-off-by: Benjamin Herrenschmidt <benh@kernel.crashing.org>
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> ---
>>> v3:
>>>  - Added the DUAL and QUAD flags for ben. Tested with aspeed-smc driver.
>>>
>>>  drivers/mtd/spi-nor/spi-nor.c | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index eef55b597ec7..ad46dc82c8d1 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -1146,6 +1146,8 @@ static const struct flash_info spi_nor_ids[] = {
>>>  	{ "w25q80bl", INFO(0xef4014, 0, 64 * 1024,  16, SECT_4K) },
>>>  	{ "w25q128", INFO(0xef4018, 0, 64 * 1024, 256, SECT_4K) },
>>>  	{ "w25q256", INFO(0xef4019, 0, 64 * 1024, 512, SECT_4K) },
>>> +	{ "w25q512jv", INFO(0xef7119, 0, 64 * 1024, 1024,
>>> +			SECT_4K | SPI_NOR_QUAD_READ | SPI_NOR_DUAL_READ) },
>>>  
>>>  	/* Catalyst / On Semiconductor -- non-JEDEC */
>>>  	{ "cat25c11", CAT25_INFO(  16, 8, 16, 1, SPI_NOR_NO_ERASE | SPI_NOR_NO_FR) },
>>>
>>
>>


-- 
Best regards,
Marek Vasut
