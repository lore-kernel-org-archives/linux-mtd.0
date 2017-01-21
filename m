Received: from mail-wm0-f66.google.com ([74.125.82.66])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUjbK-0008DD-UW
 for linux-mtd@lists.infradead.org; Sat, 21 Jan 2017 00:32:16 +0000
Received: by mail-wm0-f66.google.com with SMTP id d140so10501926wmd.2
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2017 16:31:54 -0800 (PST)
Subject: Re: [PATCH 2/2] mtd: spi-nor: fix mr25h* definitions
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Bastian Stender <bst@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
 <20170116151214.11195-2-bst@pengutronix.de>
 <371bf936-b854-68a1-2c65-69e426ad3aa3@gmail.com>
 <91baef8b-7831-9d16-d2ad-708ed297ad50@pengutronix.de>
 <b224aef1-e24a-9ccf-9c20-aea701d30606@gmail.com>
 <ac4ff021-1384-e24a-f16c-a0a6038095fb@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <c10d3b85-165d-25d4-cf51-c381d48ca2c9@gmail.com>
Date: Sat, 21 Jan 2017 01:30:23 +0100
MIME-Version: 1.0
In-Reply-To: <ac4ff021-1384-e24a-f16c-a0a6038095fb@atmel.com>
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

On 01/20/2017 03:15 PM, Cyrille Pitchen wrote:
> Le 18/01/2017 à 16:57, Marek Vasut a écrit :
>> On 01/17/2017 03:51 PM, Bastian Stender wrote:
>>> Hi Marek,
>>
>> Hi!
>>
>>> On 01/16/2017 05:07 PM, Marek Vasut wrote:
>>>> On 01/16/2017 04:12 PM, Bastian Stender wrote:
>>>>> The previous definitions for mr25h* chips lead to unnecessary limits
>>>>> regarding writesize and eraseblocksize for MRAM. MRAM is random access
>>>>> memory rather than page, sector, or block organized memory.
>>>>>
>>>>> Instead of 1 sector with 512KB the mr25h40 MRAM chip should be defined
>>>>> as 512K sectors with 1 byte each. This makes it writesize and
>>>>> eraseblocksize aligned and reflects MRAM functionality properly.
>>>>
>>>> Wouldn't this degrade the performance ? ie. if you write the flash, it
>>>> will send PP opcode + 1 byte in a loop, right ?
>>>
>>> I don't think so, info->sector_size and info->n_sectors are used for
>>> calculating mtd->size and setting mtd->erasesize only. mtd->erasesize
>>> should be never used when SPI_NOR_NO_ERASE is set in info->flags as
>>> Cyrille pointed out.
>>
>> Hmmm, does that answer my second question ?
>>
> 
> Your second question is about Page Program with a single data byte, right?
> 
> Once in spi-nor.c, spi_nor_write() checks nor->page_size (=
> info->page_size) to limit the amount of data written into the memory in a
> single SPI command: spi_nor_write() itself doesn't check nor->mtd.erasesize
> (= info->sector_size) but it doesn't mean that upper mtd layers had not
> clamped the 'len' parameter before based on the mtd->erasesize limit.
> 
> Also I don't know whether the upper mtd layers expect cases where
> mtd->writebufsize (= nor->page_size == 256) > mtd->erasesize (=
> info->sector_size == 1).
> 
> If we also changed the page size to 1, we would keep the relation (page
> size <= erase size) but for sure, spi-nor would also send many Page Program
> commands with single data byte, hence a huge performance loss.

Yes, that's what my question was about. Looking at your explanation AND
at the patch 2/2, it now makes sense. Sorry for the noise.

> That's why I think we should take time to study to be sure the proposed
> modification won't introduce any unwanted side effect.

I don't think it will, and if it does, then it's a bug anyway.

-- 
Best regards,
Marek Vasut
