Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAA77-0005kF-Jc
 for linux-mtd@lists.infradead.org; Tue, 07 Jun 2016 06:03:47 +0000
Received: by mail-wm0-x244.google.com with SMTP id k184so14882774wme.2
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2016 23:03:25 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd: m25p80: consider max_transfer_size when reading
To: Marek Vasut <marex@denx.de>, Geert Uytterhoeven <geert@linux-m68k.org>
References: <56D22823.7090005@gmail.com> <20160405193952.GA5243@localhost>
 <57041B43.2000109@gmail.com> <20160405210727.GB5243@localhost>
 <5706B084.2070909@gmail.com> <20160505235700.GA99474@google.com>
 <20160506121431.GQ6292@sirena.org.uk>
 <77a22258-95ca-031a-825d-a9e98e30a162@gmail.com>
 <20160606174003.GE7510@sirena.org.uk>
 <a57adb90-0d80-186f-17d3-6fdf106bfb4a@gmail.com>
 <CAMuHMdW5zEmiN=Qw+Ed-gi=M1FffHXu1uSEvUOuRDG+j14ZZBA@mail.gmail.com>
 <971ad721-5644-e5f9-2918-65db0e6b1996@gmail.com> <5755F8FB.2070409@denx.de>
Cc: Mark Brown <broonie@kernel.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Michal Suchanek <hramrach@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Han Xu <han.xu@nxp.com>,
 linux-spi <linux-spi@vger.kernel.org>
From: Heiner Kallweit <hkallweit1@gmail.com>
Message-ID: <63aa1f2f-44dc-5e5f-d0c2-7725354620ad@gmail.com>
Date: Tue, 7 Jun 2016 06:52:50 +0200
MIME-Version: 1.0
In-Reply-To: <5755F8FB.2070409@denx.de>
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

Am 07.06.2016 um 00:28 schrieb Marek Vasut:
> On 06/06/2016 11:20 PM, Heiner Kallweit wrote:
>> Am 06.06.2016 um 21:46 schrieb Geert Uytterhoeven:
>>> Hi Heiner,
>>>
>>> On Mon, Jun 6, 2016 at 8:53 PM, Heiner Kallweit <hkallweit1@gmail.com> wrote:
>>>> Am 06.06.2016 um 19:40 schrieb Mark Brown:
>>>>> On Sat, Jun 04, 2016 at 12:22:37AM +0200, Heiner Kallweit wrote:
>>>>>> Am 06.05.2016 um 14:14 schrieb Mark Brown:
>>>>>>> Yes, it's called the maximum transfer size because it is the
>>>>>>> maximum size of a transfer, not because it's the maximum size of
>>>>>>> a message.
>>>>>
>>>>>> I'd like to come back to this discussion. You said best would be
>>>>>> to fix the chip driver. To do this and calculate an appropriate
>>>>>> value for max_transfer_size the chip driver would have to know that
>>>>>> the spi_device is a spi-nor device.
>>>>>
>>>>> That doesn't make any sense, the controller hardware doesn't
>>>>> magically change based on what is connected to it.
>>>>>
>>>> The issue with fsl-espi is that the controller deactivates CS after
>>>> each physical transfer. And a lot of HW designs use the hardware CS,
>>>> therefore the advise to use a GPIO instead doesn't really help.
>>>
>>> And you can't use pinmux to configure the pin used for hardware CS
>>> to become a GPIO?
>>>
>> Sadly enough, no. Only the complete block of SPI signals can be switched
>> to GPIO mode. But then we'd have to use bitbanging and would loose all
>> features of the integrated SPI controller (FIFO's etc.)
> 
> Just for completeness, which SoC are we talking about here ?
> 
Freescale (now NXP) P1014
