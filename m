Received: from mail.bugwerft.de ([2a03:6000:1011::59])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fkQ3u-0006Wl-2R
 for linux-mtd@lists.infradead.org; Tue, 31 Jul 2018 08:31:24 +0000
Subject: Re: [RFC PATCH] mtd: rawnand: Remove docg4
To: Miquel Raynal <miquel.raynal@bootlin.com>,
 Boris Brezillon <boris.brezillon@bootlin.com>
Cc: Haojian Zhuang <haojian.zhuang@gmail.com>,
 Robert Jarzmik <robert.jarzmik@free.fr>, Richard Weinberger
 <richard@nod.at>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Mike Dunn <mikedunn@newsguy.com>,
 Sergey Larin <cerg2010cerg2010@mail.ru>
References: <20180730201341.17365-1-boris.brezillon@bootlin.com>
 <20180731102035.018ad7d0@xps13>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <a101a70c-db8f-a1d7-1c34-e805f32dee26@zonque.org>
Date: Tue, 31 Jul 2018 10:31:07 +0200
MIME-Version: 1.0
In-Reply-To: <20180731102035.018ad7d0@xps13>
Content-Type: text/plain; charset=utf-8; format=flowed
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

On Tuesday, July 31, 2018 10:20 AM, Miquel Raynal wrote:
> Hi Boris,
> 
> Boris Brezillon <boris.brezillon@bootlin.com> wrote on Mon, 30 Jul 2018
> 22:13:41 +0200:
> 
>> The diskonchip G4 driver does not fit very well in the raw/parallel
>> NAND framework simply because such chips have an internal controller
>> translating DoC-specific commands into NAND ones.
>>
>> Keeping such a driver in the raw NAND framework is a real burden for
>> NAND maintainers.
>>
>> Not to mention that some part in this drivers are a bit worrisome:
>>
>> - writes are done by subpages, even though we're interfacing with an MLC
>>    chip which are known to not support subpage writes very well (it might
>>    be that the FTL handles the complexity for us though)
>>
>> - some part of the code are simply ignoring return codes of function that
>>    can fail in a few occasions
>>
>> - there's a hack to support OOB writes when no data is provided. This
>>    operation is not supported by the chip and should have been rejected,
>>    and nandwrite and other userspace tools should have been patched to
>>    deal with such devices
>>
>> - the driver is apparently broken when ignore_badblocks module param
>>    is not set to 1 and nobody noticed that (don't know since when this
>>    is the case, but it's not a recent change)
>>    http://lists.infradead.org/pipermail/linux-mtd/2018-July/082472.html
>>
>> Add to that the fact that we already have a docg3 driver in
>> drivers/mtd/devices/docg3.c and, looking at the code (and regs), it
>> seems docg3 and docg4 have a lot in common (even the author of this
>> driver seemed to have realized that interfacing with the raw NAND
>> framework might have been a bad idea
>> http://lists.infradead.org/pipermail/linux-mtd/2012-January/039517.html).
>>
>> For all these reasons, I'm proposing to remove this driver. If anyone
>> ever wants to add support for this chip back, I'd suggest extending
>> the docg3 driver instead of adding a completely new driver.
>>
>> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
>> Cc: Mike Dunn <mikedunn@newsguy.com>
>> Cc: Robert Jarzmik <robert.jarzmik@free.fr>
>> Cc: Sergey Larin <cerg2010cerg2010@mail.ru>
>> ---
> 
> I do agree in removing this driver.
> 
> I just checked for docg4 references and it looks like palmeo.c board
> file has some code related to it, enclosed in a
> 
>          #if IS_ENABLED(CONFIG_MTD_NAND_DOCG4)
> 
> Besides the fact that it is the only user, that's probably something
> we should also remove.

Thanks for the heads-up.

Yes, it seems reasonable to remove it, if that helps you in the MTD 
area. These boards are not really maintained by anybody. Robert and I 
will gradually move them over to DT over the next releases, and drop 
things that are no longer supported. They can then be added back by 
anyone with such hardware at hand.


Thanks,
Daniel
