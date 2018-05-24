Received: from esa3.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLmcC-0007FL-SL
 for linux-mtd@lists.infradead.org; Thu, 24 May 2018 09:33:02 +0000
Subject: Re: [RFC PATCH] mtd: spi-nor: add support to non-uniform SPI NOR
 flash memories
To: Marek Vasut <marek.vasut@gmail.com>, <cyrille.pitchen@microchip.com>,
 <dwmw2@infradead.org>, <computersforpeace@gmail.com>,
 <boris.brezillon@bootlin.com>, <richard@nod.at>
CC: <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <nicolas.ferre@microchip.com>, <Cristian.Birsan@microchip.com>
References: <20180518093233.24241-1-tudor.ambarus@microchip.com>
 <89d45190-95b0-b780-b219-e6c6adcb6147@gmail.com>
 <4cd7d47a-fd56-6b54-3b38-262adf46a97f@microchip.com>
 <bbb9387b-4404-e6a0-b8b5-f48bcebdd474@gmail.com>
 <123e50da-e49e-f876-bdb4-2719f7f7640a@microchip.com>
 <a32aa2ee-7d9e-37b6-811f-799570ce1cea@gmail.com>
 <66b2b859-72db-33cc-75ae-2493a4aad235@microchip.com>
 <aa083709-c3e2-f075-1a99-c31399a1cb77@gmail.com>
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <d4e73ccb-58d2-f7fb-5303-15dc3dbd63aa@microchip.com>
Date: Thu, 24 May 2018 12:32:38 +0300
MIME-Version: 1.0
In-Reply-To: <aa083709-c3e2-f075-1a99-c31399a1cb77@gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi, Marek,

On 05/23/2018 03:54 PM, Marek Vasut wrote:
> On 05/23/2018 02:52 PM, Tudor Ambarus wrote:
>> Hi, Marek,
> 
> Hi,
> 
>> On 05/23/2018 12:56 PM, Marek Vasut wrote:
>> [...]
>>>>> [...]
>>>>>
>>>>>>>> +    while (len) {
>>>>>>>> +        cmd = spi_nor_find_best_erase_cmd(map, region, addr, len);
>>>>>>>> +        if (!cmd)
>>>>>>>> +            return -EINVAL;
>>>>>>> What would happen if you realize mid-way that you cannot erase some
>>>>>>> sector , do you end up with partial erase ?
>>>>>> Is this possible? In non-overlaid regions, the address is aligned with
>>>>>> at least one of the erase commands, else -EINVAL. For overlaid regions
>>>>>> alignment doesn't matter. But yes, if this is possible, in this case,
>>>>>> this proposal will do a partial erase.
>>>>> Shouldn't we fail up front instead ?
>>>> It will be great if we can do this without having performance penalties.
>>>> Can we loose the conditions for the last erase command? If one wants to
>>>> erase 80k chunk starting from offset 0 and only 32k and 64k erase type
>>>> are supported, can we erase 96k?
>>> No. But can you maybe build a list of erase commands to be executed once
>>> you validate that the erase can be performed for example ?
>>
>> My second choice was an array witch saves u8 opcode and u32 erasesize.
>> There are flashes of 256MB, in the worst case scenario with 4k erase
>> type, we will end up with 64K entries.
> 
> Some RLE encoding might help here ?

Nice.

> 
>> How about enforcing the length to be multiple of mtd->erasesize, like we
>> do in uniform_erase? With this, the problem disappears.
> 
> What is the erase size for the 4k-sector 256MiB flash ?

S70FS01GS[1] is a 128 MByte flash with non-uniform erase support. It
supports 4k and 256k erase types. I would have to enforce the address
and the length to be multiple of 256k in order to vanish the issue. But
the whole point of non-uniform erase will vanish too, I guess.

I don't have any other good :) idea, so I'll implement your suggestion
with the list of erase commands and RLE encoding.

Thanks,
ta

[1] http://www.cypress.com/file/215911/download
