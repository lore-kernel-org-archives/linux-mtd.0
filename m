Received: from smtp.exceet.ch ([77.245.33.226])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYXFp-00032d-OZ
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 13:14:19 +0000
Subject: Re: mtd layer: support of hybrid flash(W25M161AW) having both NOR and
 NAND flash
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: <linux-mtd@lists.infradead.org>, <prabhakar.kushwaha@nxp.com>,
 <jonas.gorski@gmail.com>, <marex@denx.de>, <richard@nod.at>,
 <computersforpeace@gmail.com>, <cyrille.pitchen@wedev4u.fr>,
 <suresh.gupta@nxp.com>, <poonam.aggrwal@nxp.com>
References: <20180108101447.1d9ab212@bbrezillon>
 <dbefefbb-7e0e-2a25-00b5-d9bcffa91a4b@exceet.de>
 <20180108133118.02086991@bbrezillon>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <d688b07f-ddcf-9051-7f74-12c35b63c126@exceet.de>
Date: Mon, 8 Jan 2018 14:14:03 +0100
MIME-Version: 1.0
In-Reply-To: <20180108133118.02086991@bbrezillon>
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

Hi Boris,

On 08.01.2018 13:31, Boris Brezillon wrote:
> Hi Frieder,
> 
> On Mon, 8 Jan 2018 12:02:19 +0100
> Frieder Schrempf <frieder.schrempf@exceet.de> wrote:
> 
>>>>>>> with the "windbond,w25q16fw" driver modeled as a simple
>>>>>>> "spi-multiplexer" that registers its own virtual spi-bus. Then when
>>>>>>> spi-nor or spi-nand tries to communicate with their appropriate die,
>>>>>>> it sends the Software Die Select command if needed and then passes on
>>>>>>> the message to its parent bus.
>>>>>>>
>>>>>>> That way there should be no changes needed for spi-nor / spi-nand
>>>>>>> themselves. (The devil is probably in the details ;-)
>>>>>>
>>>>>> Yep, I thought about this approach, and it's indeed quite elegant, but
>>>>>> we're missing the lock I was mentioning in my previous reply. We need
>>>>>> to prevent die selection not only for the time we're sending a single
>>>>>> SPI message, but for the whole operation (which can be formed of
>>>>>> several SPI messages). Or maybe I'm wrong, and operations can actually
>>>>>> be interleaved, but I wouldn't bet on that ;-).
>>
>> With operations, that consist of several SPI messages, do you mean
>> something like NAND page program?
> 
> Yep.
> 
>>
>> Because I'm quite sure something like this should be possible (and all
>> of these commands consist only of one spi message, don't they?):
>> 1. Select second (NAND) die
>> 2. Send data to the NAND page buffer (PROGRAM)
>> 3. Select first (NOR) die
>> 4. Program data to a NOR block
>> 5. Select second (NAND) die
>> 6. Send command to transfer page buffer to flash (PROGRAM EXECUTE)
> 
> Yes, and that's the problem, if you don't have a lock, the sequence you
> describe above could be re-ordered like this:
> 
> 1. Select second (NAND) die
> 2. Select first (NOR) die
> 3. Send data to the NAND page buffer (PROGRAM)
> 4. Program data to a NOR block
> ...

Ok thanks. Now I got the problem.

> 
>>
>>>>>
>>>>> Ah, I missed that. I thought about it, and then tried to hand wave it
>>>>> away with the "if they behave like normal chips" ;-)
>>>>>
>>>>> The mdio-bus supports nested locking, so you can do something like this:
>>>>>
>>>>> mutex_lock_nested(bus->mdio_lock, MDIO_BUS_NESTED);
>>>>> bus->write();
>>>>> bus->read();
>>>>> mutex_unlock(bus->mdio_lock);
>>>>>
>>>>> without worrying someone else using the bus in between. [1] for an example
>>>>> user.
>>>>>
>>>>> So going a similar approach with flagging the appropriate chips in
>>>>> spi-nor/spi-nand as needing nested locking and then doing it for the
>>>>> appropriate commands should solve that issue.
>>>>>
>>>>>      
>>>>
>>>> Device tree update:-
>>>>
>>>> &qspi {
>>>>      ...
>>>>          qflash0: dual-flash at 0 {
>>>>                  compatible = "winbond,w25q16fw", "hybrid"; <-- new compatibility value
>>>
>>> "hybrid" is not needed, you know that the flash is hybrid with the
>>> "winbond,w25q16fw" string.
>>>    
>>>>                  reg = <0>;
>>>>                  spi-max-frequency = <20000000>;
>>>>                  #address-cells = <1>;
>>>>                  #size-cells = <0>;
>>>>
>>>>                  nor at 0 {
>>>>                                  compatible = "jedec,spi-nor";
>>>>                                  reg = <0>;
>>>>                                  #address-cells = <1>;
>>>>                                  #size-cells = <1>;
>>>>
>>>>                                  partitions {
>>>>                                                  ...
>>>>                                  };
>>>>                  };
>>>>
>>>>                  nand at 1 {
>>>>                                  compatible = "jedec,spi-nand"; /* or
>>>> whatever the correct nand-compatible would be */
>>>>                                  reg = <1>;
>>>>                                  #address-cells = <1>;
>>>>                                  #size-cells = <1>;
>>>>
>>>>                                  partitions {
>>>>                                                  ...
>>>>                                  };
>>>>                  };
>>>
>>> Not sure exposing the dies in the DT is such a good idea. You should
>>> have a specific handling for "winbond,w25q16fw" which registers one
>>> NAND and one NOR.
>>>    
>>>>
>>>>      };
>>>> };
>>>
>>>
>>>    
>>>>
>>>>
>>>> There will be only one file i.e. fsl_qspi.c handing NOR and NAND. QSPI controller will have SPI NOR and a SPI NAND controller embedded.
>>>> Question: What should be the location of this file?  driver/mtd/spi-nor definitely is not right place??
>>>
>>> It stay in driver/mtd/spi-nor until we create a spi-flash layer
>>> (driver/mtd/spi-flash).
>>
>> Can it really stay there even if it would have NAND support implemented
>> and be used by the SPI NAND framework?
> 
> Yes, as long as this is a temporary situation.

Ok.

> 
>>
>> How does the longterm plan for implementing SPI NAND, FSL QSPI NAND/NOR
>> and spi-flash layer look like?
>>
>> I would propose something like this, but I'm not sure if this is
>> appropriate:
>>
>> 1. Adding SPI NAND framework (with Micron and generic SPI)
> 
> Yep, that's the first step, and I think we should move on with what we
> have and work on improving the situation (to share more code between
> SPI NOR and SPI NAND) in parallel.

Ok.

> 
>> 2. Adding FSL QSPI as a SPI NAND controller in mtd/nand/spi/controllers
>> 3. Merging FSL QSPI NAND driver from mtd/nand/spi/controllers with NOR
>> driver at mtd/spi-nor/fsl_quadspi.c
> 
> I'd really prefer to have a single driver supporting both NOR and NAND
> devices. What's the problem with adding SPI NAND support to the
> mtd/spi-nor/fsl_quadspi.c?

There's not really a problem. I will see if can adapt my FSL QSPI NAND 
code to fit into the NOR driver.

> 
>> 4. Creating spi-flash layer and move FSL QSPI NOR/NAND driver to
>> mtd/spi-flash
> 
> Yep, that's the long term goal.
> 
>>
>> The support for hybrid NAND/NOR chips would not be available until the
>> spi-flash layer is done, right?
> 
> Exactly.
> 
> Regards,
> 
> Boris
> 

Thanks and regards,

Frieder
