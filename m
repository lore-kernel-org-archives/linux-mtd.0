Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by casper.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYVWX-0002CZ-1u
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 10:18:55 +0000
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for N25Q256A13 as N25Q256A
To: Marek Vasut <marek.vasut@gmail.com>, Nobuhiro Iwamatsu
 <nobuhiro.iwamatsu.kw@hitachi.com>, <linux-mtd@lists.infradead.org>
References: <1485481897-6368-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
 <23f8030c-272c-1aab-2146-db45dfe77daf@atmel.com>
 <32a30d91-4f42-6c64-45b7-d0abc9f3d91e@gmail.com>
CC: Jagan Teki <jagan@openedev.com>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <994fa7e6-1927-16ef-82c1-79a538319833@atmel.com>
Date: Tue, 31 Jan 2017 11:18:26 +0100
MIME-Version: 1.0
In-Reply-To: <32a30d91-4f42-6c64-45b7-d0abc9f3d91e@gmail.com>
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

Le 30/01/2017 à 21:38, Marek Vasut a écrit :
> On 01/30/2017 02:29 PM, Cyrille Pitchen wrote:
>> Hi Nobuhiro,
>>
>> Le 27/01/2017 à 02:51, Nobuhiro Iwamatsu a écrit :
>>> Add new Micron N25Q256A (N25Q256A13) 256Mbit NOR Flash in the list
>>> of supported devices. This chip has the same structure as the N25Q256A
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
>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>> index da7cd69d4857..a2a6922e356f 100644
>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>> @@ -887,7 +887,8 @@ static const struct flash_info spi_nor_ids[] = {
>>>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>>>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>> +	{ "n25q256",     INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>> +	{ "n25q256a",    INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>
>> This patch changes the association "n25q256a" <-> 20 ba 19: "n25q256a"
>> would be now associated to 20 bb 19.
>> However some device trees use the "micron,n25q256a" as compatible string:
>> - arch/arm/boot/dts/imx6sx-sbd.dts: compatible = "micron,n25q256a",
>> "jedec,spi-nor";
>> - arch/arm/boot/dts/socfpga_arria5_socdk.dts: compatible = "n25q256a";
>> - arch/arm/boot/dts/socfpga_cyclone5_socrates.dts: compatible = "n25q256a";
>> - arch/arm/boot/dts/imx6ul-14x14-evk.dts: compatible = "micron,n25q256a";
>>
>> If the actual JEDEC ID read from the Micron SPI memory of one of these
>> boards is 20 ba 19 and if you now associate the string "n25q256a" to the
>> different JEDEC ID 20 bb 19, then spi_nor_scan() is likely to display the
>> warning message during the boot:
>>
>> dev_warn(dev, "found %s, expected %s\n", jinfo->name, info->name);
>>
>>
>> Displaying such a warning during the boot process would be an unwanted side
>> effect of this patch and users may complain or ask why such warning is now
>> displayed in the boot log.
>>
>> You may create a new entry for the 20 bb 19 JEDEC ID but I don't think it
>> is totally safe to remove the old n25q256a entry.
> 
> If the old DTs were lazy and are now broken, then I think the warning is
> justified ?
> 

I'm reading a Micron datasheet for n25q256*:
1 - it states that the JEDEC ID is 20 BA 19.
2 - it explains the part number encoding

Device Type    N25Q: Serial NOR Flash Memory, Multiple Input/Output
                     (Single, Dual, Quad I/O, XIP)
Density        256: 256Mb
Technology     A: 65nm (this is the only value provided by the datasheet)
...

So this datasheet applies to Micron n25q256a memory and its JEDEC ID is 20
BA 19. Hence the current "n25q256a" entry in the spi_nor_ids[] array and
the DTs using this string for the compatible value are all correct and
should not be changed.

Then, I'm sure Nobuhiro is right too when he claims that the JEDEC ID of
his Micron n25q256a sample is 20 BB 19 (and not 20 BA 19). This just means
that Micron has produced different samples of n25q256a with different JEDEC
ID. However this is nothing new with Micron memories.

We should keep the current entry as is since it is perfectly correct but we
can add another entry with a different name for the JEDEC ID 20 BB 19.

If we look at the entries for the other Micron memories, we see for each
memory density there are 2 different ID: 20 BA xx and 20 BB xx.

Besides the "rule" 20 BA xx -> n25q__ , 20 BB xx -> n25q__a is not always
respected and is not relevant to the actual hardware. I guess this is just
a legacy naming scheme to provide 2 different names, one for the 20 BB xx
entry and the other for the 20 BA xx entry but from a hardware point of
view, I think this naming scheme doesn't make sense.

So don't worry about the accuracy of the name you will choose to add a new
entry. For instance let's take "n25q256" since it is available.


Best regards,

Cyrille
