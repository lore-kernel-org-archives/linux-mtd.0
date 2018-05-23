Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fLTFo-0007YE-Kd
 for linux-mtd@lists.infradead.org; Wed, 23 May 2018 12:52:34 +0000
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
From: Tudor Ambarus <tudor.ambarus@microchip.com>
Message-ID: <66b2b859-72db-33cc-75ae-2493a4aad235@microchip.com>
Date: Wed, 23 May 2018 15:52:15 +0300
MIME-Version: 1.0
In-Reply-To: <a32aa2ee-7d9e-37b6-811f-799570ce1cea@gmail.com>
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

On 05/23/2018 12:56 PM, Marek Vasut wrote:
[...]
>>> [...]
>>>
>>>>>> +    while (len) {
>>>>>> +        cmd = spi_nor_find_best_erase_cmd(map, region, addr, len);
>>>>>> +        if (!cmd)
>>>>>> +            return -EINVAL;
>>>>> What would happen if you realize mid-way that you cannot erase some
>>>>> sector , do you end up with partial erase ?
>>>> Is this possible? In non-overlaid regions, the address is aligned with
>>>> at least one of the erase commands, else -EINVAL. For overlaid regions
>>>> alignment doesn't matter. But yes, if this is possible, in this case,
>>>> this proposal will do a partial erase.
>>> Shouldn't we fail up front instead ?
>> It will be great if we can do this without having performance penalties.
>> Can we loose the conditions for the last erase command? If one wants to
>> erase 80k chunk starting from offset 0 and only 32k and 64k erase type
>> are supported, can we erase 96k?
> No. But can you maybe build a list of erase commands to be executed once
> you validate that the erase can be performed for example ?

My second choice was an array witch saves u8 opcode and u32 erasesize.
There are flashes of 256MB, in the worst case scenario with 4k erase
type, we will end up with 64K entries.

How about enforcing the length to be multiple of mtd->erasesize, like we
do in uniform_erase? With this, the problem disappears.

Thanks,
ta
