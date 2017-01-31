Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYVkM-0005Xu-2K
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 10:33:12 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for N25Q256A13 as N25Q256A
To: =?UTF-8?B?5bKp5p2+5L+h5rSLIC8gSVdBTUFUU1XvvIxOT0JVSElSTw==?=
 <nobuhiro.iwamatsu.kw@hitachi.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <1485481897-6368-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
 <23f8030c-272c-1aab-2146-db45dfe77daf@atmel.com>
 <F89ECF87BC754A49BB74E794F6A0EC2F01074B11@GSjpTKYDCembx31.service.hitachi.net>
CC: Marek Vasut <marek.vasut@gmail.com>, Jagan Teki <jagan@openedev.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <03193482-06bc-c184-356b-0bee0716f25a@atmel.com>
Date: Tue, 31 Jan 2017 11:32:46 +0100
MIME-Version: 1.0
In-Reply-To: <F89ECF87BC754A49BB74E794F6A0EC2F01074B11@GSjpTKYDCembx31.service.hitachi.net>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Le 31/01/2017 ¨¤ 05:51, ÑÒËÉÐÅÑó / IWAMATSU£¬NOBUHIRO a ¨¦crit :
> Hi,
> 
> Thanks for your review.
> 
>> -----Original Message-----
>> From: Cyrille Pitchen [mailto:cyrille.pitchen@atmel.com]
>> Sent: Monday, January 30, 2017 10:29 PM
>> To: ÑÒËÉÐÅÑó / IWAMATSU£¬NOBUHIRO; linux-mtd@lists.infradead.org
>> Cc: Marek Vasut; Jagan Teki
>> Subject: Re: [PATCH v2] mtd: spi-nor: Add support for N25Q256A13 as N25Q256A
>>
>> Hi Nobuhiro,
>>
>> Le 27/01/2017 ¨¤ 02:51, Nobuhiro Iwamatsu a ¨¦crit :
>>> Add new Micron N25Q256A (N25Q256A13) 256Mbit NOR Flash in the list of
>>> supported devices. This chip has the same structure as the N25Q256A
>>> but ID is different. And this fixes N25Q256A to N25Q256 to fit chip
>>> name to other n25q chip names.
>>>
>>> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
>>> CC: Jagan Teki <jagan@openedev.com>
>>> CC: Marek Vasut <marek.vasut@gmail.com>
>>> ---
>>>  drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c
>>> b/drivers/mtd/spi-nor/spi-nor.c index da7cd69d4857..a2a6922e356f
>>> 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -887,7 +887,8 @@ static const struct flash_info spi_nor_ids[] = {
>>>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>> +	{ "n25q256",     INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>> +	{ "n25q256a",    INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K |
>> SPI_NOR_QUAD_READ) },
>>
>> This patch changes the association "n25q256a" <-> 20 ba 19: "n25q256a"
>> would be now associated to 20 bb 19.
>> However some device trees use the "micron,n25q256a" as compatible string:
>> - arch/arm/boot/dts/imx6sx-sbd.dts: compatible = "micron,n25q256a",
>> "jedec,spi-nor";
>> - arch/arm/boot/dts/socfpga_arria5_socdk.dts: compatible = "n25q256a";
>> - arch/arm/boot/dts/socfpga_cyclone5_socrates.dts: compatible =
>> "n25q256a";
>> - arch/arm/boot/dts/imx6ul-14x14-evk.dts: compatible =
>> "micron,n25q256a";
>>
>> If the actual JEDEC ID read from the Micron SPI memory of one of these boards
>> is 20 ba 19 and if you now associate the string "n25q256a" to the different
>> JEDEC ID 20 bb 19, then spi_nor_scan() is likely to display the warning
>> message during the boot:
>>
>> dev_warn(dev, "found %s, expected %s\n", jinfo->name, info->name);
>>
>>
>> Displaying such a warning during the boot process would be an unwanted side
>> effect of this patch and users may complain or ask why such warning is now
>> displayed in the boot log.
>>
> 
> I see.
> 
>> You may create a new entry for the 20 bb 19 JEDEC ID but I don't think it
>> is totally safe to remove the old n25q256a entry.
> 
> We can not solve this problem if we use an old DTB, but I think that this
> problem can be solved by updating DTS.
> In order not to output this warning, I think that it is necessary to change the
> DTS of the target boards.
> Is this right?
>

As I explain in the mail I've just sent, those DTS are actually correct so
there is no valid reason to change them.

Besides, when possible, "the usage of the Device Tree on ARM also came with
a requirement: it should be a stable ABI. An old Device Tree for a given
hardware platform must continue to work with newer kernel versions." [1]

This is not always so easy to respect this rule but in our case we can,
especially since the device trees we are talking about are actually right.


[1]
http://free-electrons.com/pub/conferences/2015/elc/petazzoni-dt-as-stable-abi-fairy-tale/petazzoni-dt-as-stable-abi-fairy-tale.pdf


>>
>> Best regards,
>>
>> Cyrille
> 
> Best regards,
>   Nobuhiro
> 
