Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bA1fj-00059c-S7
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 21:02:57 +0000
Received: by mail-wm0-x243.google.com with SMTP id r5so1237096wmr.0
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2016 14:02:35 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
To: Michal Suchanek <hramrach@gmail.com>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
 <5706B084.2070909@gmail.com> <20160505235700.GA99474@google.com>
 <20160506121431.GQ6292@sirena.org.uk>
 <77a22258-95ca-031a-825d-a9e98e30a162@gmail.com>
 <20160606174003.GE7510@sirena.org.uk>
 <a57adb90-0d80-186f-17d3-6fdf106bfb4a@gmail.com>
 <CAOMqctRH9a0QmubdAvbyk=AC10MSa=nsNRkSURU+JOwKrN9HCA@mail.gmail.com>
Cc: Mark Brown <broonie@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Marek Vasut <marex@denx.de>,
 Han Xu <han.xu@nxp.com>, linux-spi <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <094596dc-ad0f-1962-ebcc-91cc59fda44d@gmail.com>
Date: Mon, 6 Jun 2016 23:02:22 +0200
MIME-Version: 1.0
In-Reply-To: <CAOMqctRH9a0QmubdAvbyk=AC10MSa=nsNRkSURU+JOwKrN9HCA@mail.gmail.com>
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

Am 06.06.2016 um 21:40 schrieb Michal Suchanek:
> On 6 June 2016 at 20:53, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>> Am 06.06.2016 um 19:40 schrieb Mark Brown:
>>> On Sat, Jun 04, 2016 at 12:22:37AM +0200, Heiner Kallweit wrote:
>>>
>>> Please fix your mail client to word wrap within paragraphs at
>>> something substantially less than 80 columns.  Doing this makes your
>>> messages much easier to read and reply to.
>>>
>>>> Am 06.05.2016 um 14:14 schrieb Mark Brown:
>>>
>>>>> Yes, it's called the maximum transfer size because it is the
>>>>> maximum size of a transfer, not because it's the maximum size of
>>>>> a message.
>>>
>>>> I'd like to come back to this discussion. You said best would be
>>>> to fix the chip driver. To do this and calculate an appropriate
>>>> value for max_transfer_size the chip driver would have to know that
>>>> the spi_device is a spi-nor device.
>>>
>>> That doesn't make any sense, the controller hardware doesn't
>>> magically change based on what is connected to it.
>>>
>> The issue with fsl-espi is that the controller deactivates CS after
>> each physical transfer. And a lot of HW designs use the hardware CS,
>> therefore the advise to use a GPIO instead doesn't really help.
>>
>> If deactivating and reactivating CS between two transfers doesn't
>> affect the functionality of a spi device then we can go with the
>> full max transfer size.
>>
>> In case of SPI NOR CS needs to stay active between command and data
>> read. Therefore the two transfers in the m25p80 read SPI message need
>> to be combined to one physical transfer by the controller driver.
>> Result is that the max read size is effectively reduced by the length
>> of the m25p80 read command.
> 
> Which is what the dummy bytes are used for AFAIK.
> They are received while you are sending the command and white the
> flash is getting ready to send data and after the transfer are deducted
> from the received data in m25p80.
> 
Thanks for the feedback.
The dummy bytes are inserted *after* the read command.
Therefore in the low speed modes usually no dummy bytes are needed.

> If this does not work for fsl-espi for some reason it should be corrected.
> I am working with a controller that can transfer 63 bytes at once and
> I am quite positive it does not do any magic transfer coalescing.
> Still it can read a 4Mbyte flash chip.
> 
> However, spi-sun4 implements transfer_one and fsl-espi implements
> transfer_one_message so the different interface may work out differently.
> 
> Indeed, the spi.c transfer_one_message calls set_cs and then calls
> transfer_one repeatedly which is exactly what fsl-espi cannot do due to
> automagic CS handling. So the fsl-espi limit is probably on message size.
> 
> Maybe adding another quirk the m25p80 driver can query to know to deduct
> the command size from the maximum data size would resolve both cases.
> 
> Thanks
> 
> Michal
> 
