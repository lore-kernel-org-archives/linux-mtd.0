Received: from smtpout.microchip.com ([198.175.253.82]
 helo=email.microchip.com)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUZd6-0002Qa-3B
 for linux-mtd@lists.infradead.org; Fri, 20 Jan 2017 13:53:26 +0000
Subject: Re: [PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 bit wide
To: Bastian Stender <bst@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
 <24d558a9-7e7b-8165-cd5d-f3a311deef17@atmel.com>
 <afb06b83-e97b-48db-9875-9f76b365a5f4@pengutronix.de>
CC: Brian Norris <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, <linux-mtd@lists.infradead.org>,
 <kernel@pengutronix.de>
From: Cyrille Pitchen <cyrille.pitchen@atmel.com>
Message-ID: <3b30dea4-00db-3fd6-1414-19c8b4bad8af@atmel.com>
Date: Fri, 20 Jan 2017 14:53:00 +0100
MIME-Version: 1.0
In-Reply-To: <afb06b83-e97b-48db-9875-9f76b365a5f4@pengutronix.de>
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

Le 17/01/2017 à 11:47, Bastian Stender a écrit :
> Hi Cyrille,
> 
> On 01/16/2017 06:34 PM, Cyrille Pitchen wrote:
>> Le 16/01/2017 à 16:12, Bastian Stender a écrit :
>>> Since MRAM chips (like the Everspin mr25h40) are not sector
>>> organized they should be defined as n_sectors * 1 byte sectors. To
>>> be able to store the higher number of sectors n_sectors should be
>>> an unsigned 32 bit integer just like sector_size.
>>>
>>
>> Could you comment a little bit more on what this series improves or
>> fixes?
> 
> Sure. I want to create multiple writeable partitions on a mr25h40 MRAM
> chip. This does not currently work because drivers/mtd/mtdpart.c makes sure
> that partitions start on erase block boundaries and end on erase blocks.
> That is obviously not the case for multiple partitions with the current
> definition:
>

OK now I better understand your issue so let's take it as a bug since it
prevents you from using full features of the memory. However we have to be
cautious because the modification you propose may have unwanted side
effects hence may introduce some regressions.

For instance, currently the erase size >= page size. After your patch it
will no longer be the case: I guess it should be OK for spi-nor.c but I
have no real idea whether the upper mtd layers expect such a thing. We have
to study!


> { "mr25h40",  CAT25_INFO(1, 512 * 1024, 256, 3, SPI_NOR_NO_ERASE |
> SPI_NOR_NO_FR) },
> 
> So I get
> 
> mtd: partition "mtd2" doesn't start on an erase block boundary -- force
> read-only
> 
> Adding a check for SPI_NOR_NO_ERASE does not seem to be the way to go:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2017-January/071386.html
> 
> Setting the erasesize to 1 neither:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2014-March/052410.html
> 
> I could use SECT_4K, but I'd like to use the advantage of MRAM without
> limitations.
> 
>> Swapping the info->sector_size and info->n_sectors doesn't change the
>> value of mtd->size: mtd->size = info->sector_size * info->n_sectors;
> 
> To be clear: mtd->size is perfectly fine, no need to change it.
> 
>> info->n_sectors is used nowhere else whereas info->sector_size is
>> only used once more to initialized mtd->erasesize but due to the
>> SPI_NOR_NO_ERASE info->flags, mtd->erasesize should be never used.
> 
> mtd->erasesize gets used even with SPI_NOR_NO_ERASE set in the check
> mentioned above in mtd_mod_by_eb().
> 
>> However changing the type of n_sectors from u16 to unsigned int
>> would increase the size of the struct flash_info hence the size of
>> the spi_nor_ids[] array. So I don't know whether it's worth it.
>>
>> However maybe swapping the values would better respect the meaning
>> of sector "size" and "number".
> 
> MRAM is not page, sector, or block organized memory, so I do not know about
> this one.
> 
> Regards,
> Bastian Stender
> 
