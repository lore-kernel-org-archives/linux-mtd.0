Received: from mail-wm0-f65.google.com ([74.125.82.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1casQe-0007mF-Vh
 for linux-mtd@lists.infradead.org; Mon, 06 Feb 2017 23:11:23 +0000
Received: by mail-wm0-f65.google.com with SMTP id u63so24963704wmu.2
 for <linux-mtd@lists.infradead.org>; Mon, 06 Feb 2017 15:10:20 -0800 (PST)
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for N25Q256A13 as N25Q256A
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>,
 linux-mtd@lists.infradead.org
References: <1485481897-6368-1-git-send-email-nobuhiro.iwamatsu.kw@hitachi.com>
 <23f8030c-272c-1aab-2146-db45dfe77daf@atmel.com>
 <32a30d91-4f42-6c64-45b7-d0abc9f3d91e@gmail.com>
 <994fa7e6-1927-16ef-82c1-79a538319833@atmel.com>
 <38800099-7dc5-fbaa-b8a2-c8b646c3a60a@gmail.com>
 <081dbb46-2e4d-953e-77b8-f91bbb5796bb@atmel.com>
Cc: Jagan Teki <jagan@openedev.com>
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <2a378cb2-b479-914c-4b0c-f57d3b8bd31e@gmail.com>
Date: Tue, 7 Feb 2017 00:09:17 +0100
MIME-Version: 1.0
In-Reply-To: <081dbb46-2e4d-953e-77b8-f91bbb5796bb@atmel.com>
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

On 02/06/2017 06:53 PM, Cyrille Pitchen wrote:
> Le 04/02/2017 à 22:32, Marek Vasut a écrit :
>> On 01/31/2017 11:18 AM, Cyrille Pitchen wrote:
>>> Le 30/01/2017 à 21:38, Marek Vasut a écrit :
>>>> On 01/30/2017 02:29 PM, Cyrille Pitchen wrote:
>>>>> Hi Nobuhiro,
>>>>>
>>>>> Le 27/01/2017 à 02:51, Nobuhiro Iwamatsu a écrit :
>>>>>> Add new Micron N25Q256A (N25Q256A13) 256Mbit NOR Flash in the list
>>>>>> of supported devices. This chip has the same structure as the N25Q256A
>>>>>> but ID is different. And this fixes N25Q256A to N25Q256 to fit chip
>>>>>> name to other n25q chip names.
>>>>>>
>>>>>> Signed-off-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.kw@hitachi.com>
>>>>>> CC: Jagan Teki <jagan@openedev.com>
>>>>>> CC: Marek Vasut <marek.vasut@gmail.com>
>>>>>> ---
>>>>>>  drivers/mtd/spi-nor/spi-nor.c | 3 ++-
>>>>>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/mtd/spi-nor/spi-nor.c b/drivers/mtd/spi-nor/spi-nor.c
>>>>>> index da7cd69d4857..a2a6922e356f 100644
>>>>>> --- a/drivers/mtd/spi-nor/spi-nor.c
>>>>>> +++ b/drivers/mtd/spi-nor/spi-nor.c
>>>>>> @@ -887,7 +887,8 @@ static const struct flash_info spi_nor_ids[] = {
>>>>>>  	{ "n25q064a",    INFO(0x20bb17, 0, 64 * 1024,  128, SECT_4K | SPI_NOR_QUAD_READ) },
>>>>>>  	{ "n25q128a11",  INFO(0x20bb18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>>>>>  	{ "n25q128a13",  INFO(0x20ba18, 0, 64 * 1024,  256, SECT_4K | SPI_NOR_QUAD_READ) },
>>>>>> -	{ "n25q256a",    INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>>>>> +	{ "n25q256",     INFO(0x20ba19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>>>>> +	{ "n25q256a",    INFO(0x20bb19, 0, 64 * 1024,  512, SECT_4K | SPI_NOR_QUAD_READ) },
>>>>>
>>>>> This patch changes the association "n25q256a" <-> 20 ba 19: "n25q256a"
>>>>> would be now associated to 20 bb 19.
>>>>> However some device trees use the "micron,n25q256a" as compatible string:
>>>>> - arch/arm/boot/dts/imx6sx-sbd.dts: compatible = "micron,n25q256a",
>>>>> "jedec,spi-nor";
>>>>> - arch/arm/boot/dts/socfpga_arria5_socdk.dts: compatible = "n25q256a";
>>>>> - arch/arm/boot/dts/socfpga_cyclone5_socrates.dts: compatible = "n25q256a";
>>>>> - arch/arm/boot/dts/imx6ul-14x14-evk.dts: compatible = "micron,n25q256a";
>>>>>
>>>>> If the actual JEDEC ID read from the Micron SPI memory of one of these
>>>>> boards is 20 ba 19 and if you now associate the string "n25q256a" to the
>>>>> different JEDEC ID 20 bb 19, then spi_nor_scan() is likely to display the
>>>>> warning message during the boot:
>>>>>
>>>>> dev_warn(dev, "found %s, expected %s\n", jinfo->name, info->name);
>>>>>
>>>>>
>>>>> Displaying such a warning during the boot process would be an unwanted side
>>>>> effect of this patch and users may complain or ask why such warning is now
>>>>> displayed in the boot log.
>>>>>
>>>>> You may create a new entry for the 20 bb 19 JEDEC ID but I don't think it
>>>>> is totally safe to remove the old n25q256a entry.
>>>>
>>>> If the old DTs were lazy and are now broken, then I think the warning is
>>>> justified ?
>>>>
>>>
>>> I'm reading a Micron datasheet for n25q256*:
>>> 1 - it states that the JEDEC ID is 20 BA 19.
>>> 2 - it explains the part number encoding
>>>
>>> Device Type    N25Q: Serial NOR Flash Memory, Multiple Input/Output
>>>                      (Single, Dual, Quad I/O, XIP)
>>> Density        256: 256Mb
>>> Technology     A: 65nm (this is the only value provided by the datasheet)
>>> ...
>>>
>>> So this datasheet applies to Micron n25q256a memory and its JEDEC ID is 20
>>> BA 19. Hence the current "n25q256a" entry in the spi_nor_ids[] array and
>>> the DTs using this string for the compatible value are all correct and
>>> should not be changed.
>>>
>>> Then, I'm sure Nobuhiro is right too when he claims that the JEDEC ID of
>>> his Micron n25q256a sample is 20 BB 19 (and not 20 BA 19). This just means
>>> that Micron has produced different samples of n25q256a with different JEDEC
>>> ID. However this is nothing new with Micron memories.
>>
>> Isn't the BA a 3V3 part and the BB a 1V8 part ? I recall something like
>> that.
>>
> 
> I've just looked at 2 Micron's datasheets, the first one for 3V3 and the
> other for some 1V8 memory and I guess you're right.

Good !

> About the part numbers, voltage and JEDEC ID:
> N25Q*Ax1 -> 1V8, 20 BB __
> N25Q*Ax3 -> 3V3, 20 BA __
> 
>>> We should keep the current entry as is since it is perfectly correct but we
>>> can add another entry with a different name for the JEDEC ID 20 BB 19.
>>>
>>> If we look at the entries for the other Micron memories, we see for each
>>> memory density there are 2 different ID: 20 BA xx and 20 BB xx.
>>>
>>> Besides the "rule" 20 BA xx -> n25q__ , 20 BB xx -> n25q__a is not always
>>> respected and is not relevant to the actual hardware. I guess this is just
>>> a legacy naming scheme to provide 2 different names, one for the 20 BB xx
>>> entry and the other for the 20 BA xx entry but from a hardware point of
>>> view, I think this naming scheme doesn't make sense.
>>
>> The micron ID/naming scheme does not make sense, it's complete chaos,
>> that is no news.
>>
>>> So don't worry about the accuracy of the name you will choose to add a new
>>> entry. For instance let's take "n25q256" since it is available.
>>
>> Or we can add "n25q256ax3" ?
>>
> 
> Indeed, it sounds like a good idea, so I vote for it :)

I like where this is going, hehehe.

> Just a small comment: the JEDEC ID 20 BA 19 is already associated to the
> string "n25q256a" and we have to keep this string for DT backward
> compatibility purpose. However the JEDEC ID 20 BB 19 is not handled yet so
> we can associate it to the string "n25q256ax1".
> 
> So if we all agree, let the "n25q256a" entry as is and just add a new
> "n25q256ax1" entry for the JEDEC ID 20 BB 19.

Fine

> In the future, for new Micron memories we could use the patterns "n25q*ax1"
> for 1V8 and "n25q*ax3" for 3V3 memories.

Indeed ... At least until Micron damagement has another big drinking
party and decides to re-randomize the JEDEC ID assignments ...

-- 
Best regards,
Marek Vasut
