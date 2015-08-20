Message-ID: <55D5FB19.9010402@st.com>
Date: Thu, 20 Aug 2015 09:06:49 -0700
From: vikas <vikas.manocha@st.com>
MIME-Version: 1.0
To: Marek Vasut <marex@denx.de>
CC: Graham Moore <grmoore@opensource.altera.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Alan Tull
 <atull@opensource.altera.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Dinh Nguyen
 <dinguyen@opensource.altera.com>, Yves Vandervennet
 <yvanderv@opensource.altera.com>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>
Subject: Re: [PATCH V7 1/2] mtd: spi-nor: Bindings for Cadence Quad SPI Flash
 Controller driver.
References: <1439522892-7524-1-git-send-email-marex@denx.de>
 <55D3819D.1040009@opensource.altera.com> <55D39319.70108@st.com>
 <201508200603.19962.marex@denx.de>
In-Reply-To: <201508200603.19962.marex@denx.de>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On 08/19/2015 09:03 PM, Marek Vasut wrote:
> On Tuesday, August 18, 2015 at 10:18:33 PM, vikas wrote:
>> Hi,
>>
>> On 08/18/2015 12:03 PM, Graham Moore wrote:
>>> Hi all,
>>>
>>> On 08/18/2015 12:48 AM, Vikas MANOCHA wrote:
>>>
>>> [...]
>>>
>>>>>>> +Required properties:
>>>>>>> +- compatible : Should be "cdns,qspi-nor".
>>>>>>> +- reg : Contains two entries, each of which is a tuple consisting of
>>>>>>> a +    physical address and length.  The first entry is the address
>>>>>>> and +    length of the controller register set.  The second entry is
>>>>>>> the +    address and length of the QSPI Controller data area.
>>>>>>
>>>>>> "Controller data area", i think it means mapped NOR Flash address ?
>>>>>
>>>>> Probably ; Graham ?
>>>>>
>>>>>> If yes, it would be more clear with "Physical base address & size of
>>>>>> NOR Flash".
>>>>>
>>>>> This is the Direct mode thing, correct ? We don't support this, so I
>>>>> think we should drop this bit altogether and keep only one single
>>>>> address in this field.
>>>>
>>>> No it's not.
>>>
>>> It's the location of the SRAM fifo.  Also direct mode location I think,
>>> if that were ever used.
>>
>> Hmm...It is the base address of NOR flash. SRAM is not memory mapped.
> 
> Huh ? I am inclined to trust Graham more -- I have seen memory mapped SRAM,
> but I have yet to see memory mapped SPI NOR.

Well, SPI NOR flash in SOCs normally is memory mapped.
To give some mainline examples, all Spear family SOCs (spear300, 320, 1310, 1340).

> Also, the driver code clearly
> uses that area in a way one would use a memory mapped SRAM with FIFO on the
> other side. I think the above description is pretty much OK.

that is the purpose of making NOR flash memory mapped.

> 
>>> The size is determined by a configuration parameter during system
>>> design.  On Altera Cyclone5 the size is really big compared to SRAM
>>> fifo.  I don't know why, maybe some hw engineer thought it would be
>>> better to have a large size in case direct mode was used.
>>
>> my comment is about second parameter of property "reg" which is NOR flash
>> address, so above explanation does not make sense for it.
>> Also in direct mode, sram does not come into play.
> 
> This is absolutelly not a SPI NOR address.

Then i can only suggest to check out the controller literature.

Think like this : what is the purpose of SRAM in all this flash access business, It can work without SRAM also,
the only purpose of sram (& in fact indirect mode) is to access data from flash memory without AHB access to trigger it.
Once the data is available in SRAM(in case of read), AHB Master can access it with low letency. Same is true for writes.
SRAM is integral internal part of state machine in case of indirect mode, there is no need for it to memory mapped. If the controller
does not support indirect mode, there is no need of sram in the system.

Hope it is little bit more clear.

Cheers,
Vikas

> 
> Best regards,
> Marek Vasut
> .
> 
