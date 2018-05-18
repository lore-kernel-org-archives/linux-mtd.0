Received: from esa4.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fJeyZ-0001Z1-T7
 for linux-mtd@lists.infradead.org; Fri, 18 May 2018 12:59:30 +0000
Subject: Re: [PATCH] mtd: spi-nor: add support for Microchip 25LC256
To: Marek Vasut <marek.vasut@gmail.com>, Boris Brezillon
 <boris.brezillon@bootlin.com>
CC: <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>,
 <Zhiqiang.Hou@nxp.com>, <pp@emlix.com>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <dwmw2@infradead.org>
References: <20180504155404.5285-1-radu.pirea@microchip.com>
 <20180504204013.254d90cf@bbrezillon>
 <e2e23aa21b37754b0c84003e6d87c7cb7d5a17fe.camel@microchip.com>
 <1db092c8-95fb-5747-f7b9-f6a215b1aa5b@gmail.com>
 <a34429cf43124de623fcaa645d5d7a360c755867.camel@microchip.com>
 <30ab9516-abc9-d2d5-79ea-266c682c5fa9@gmail.com>
 <1993151b-4434-c671-8498-b6488288f5f6@microchip.com>
 <e495fbdd-1bda-8b7e-52b5-ee51247231a8@gmail.com>
From: Radu Pirea <radu.pirea@microchip.com>
Message-ID: <ba6be822-b8ac-588f-ec11-d7cb5cddd1a3@microchip.com>
Date: Fri, 18 May 2018 16:00:15 +0300
MIME-Version: 1.0
In-Reply-To: <e495fbdd-1bda-8b7e-52b5-ee51247231a8@gmail.com>
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



On 05/18/2018 01:03 PM, Marek Vasut wrote:
> On 05/18/2018 11:50 AM, Radu Pirea wrote:
>>
>>
>> On 05/16/2018 04:47 PM, Marek Vasut wrote:
>>> On 05/16/2018 12:05 PM, Radu Pirea wrote:
>>>> On Wed, 2018-05-16 at 00:17 +0200, Marek Vasut wrote:
>>>>> On 05/15/2018 06:22 PM, Radu Pirea wrote:
>>>>>> On Fri, 2018-05-04 at 20:40 +0200, Boris Brezillon wrote:
>>>>>>> On Fri, 4 May 2018 18:54:04 +0300
>>>>>>> Radu Pirea <radu.pirea@microchip.com> wrote:
>>>>>>>
>>>>>>>> Added geometry description for Microchip 25LC256 memory.
>>>>>>>
>>>>>>> Same as for the dataflash stuff you posted a few weeks ago: I
>>>>>>> don't
>>>>>>> think this device belongs in the SPI NOR framework.
>>>>>>
>>>>>> Hi Boris,
>>>>>>
>>>>>> 25lc256 memory is similar with mr25h256, the only difference is the
>>>>>> page size(64 vs 256). Because mr25h256 is already in SPI NOR
>>>>>> framework
>>>>>> I added here 25lc256.
>>>>>
>>>>> I think I must be reading the wrong datasheet, but can you show me
>>>>> how
>>>>> does it support things like READID opcode ?
>>>>>
>>>> Hi Marek,
>>>>
>>>> I read the datasheet for 25lc256 and for mr25h256 and none of them
>>>> supports READID. Is this required for a chip to be included in spi-nor
>>>> framework? I just followed the mr25h256 as an example.
>>>
>>> So I thought until you pointed out the MR25 devices.
>>>
>>> Does the 25LC device need erase or not ? I think the MR25s didn't, but I
>>> might be wrong.
>>
>> You are right. MR25s does not need erase and the same thing is true for
>> 25LC.
> 
> Oh. And the command set is (except for readid) comparable to SPI NOR ?
> 
>>> Maybe the framework could support the 25LC afterall.
>>>
>> Yes, this was my impression too.
> 
> I am still thinking that the AT25 driver might be a better fit for such
> devices. Can you take a look ?

I tested the memory with at25 driver and it works with no line changed 
in driver. :)

> 
