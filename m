Received: from mail-wm0-f65.google.com ([74.125.82.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cUjbJ-0008CD-KE
 for linux-mtd@lists.infradead.org; Sat, 21 Jan 2017 00:32:15 +0000
Received: by mail-wm0-f65.google.com with SMTP id r144so10494252wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Jan 2017 16:31:52 -0800 (PST)
Subject: Re: [PATCH 1/2] mtd: spi-nor: make n_sectors in flash_info 32 bit wide
To: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Bastian Stender <bst@pengutronix.de>, David Woodhouse <dwmw2@infradead.org>
References: <20170116151214.11195-1-bst@pengutronix.de>
 <24d558a9-7e7b-8165-cd5d-f3a311deef17@atmel.com>
 <afb06b83-e97b-48db-9875-9f76b365a5f4@pengutronix.de>
 <3b30dea4-00db-3fd6-1414-19c8b4bad8af@atmel.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 kernel@pengutronix.de
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <aa4b2169-dab1-7f98-c4d4-0fd5585166c9@gmail.com>
Date: Sat, 21 Jan 2017 01:25:15 +0100
MIME-Version: 1.0
In-Reply-To: <3b30dea4-00db-3fd6-1414-19c8b4bad8af@atmel.com>
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

On 01/20/2017 02:53 PM, Cyrille Pitchen wrote:
> Le 17/01/2017 à 11:47, Bastian Stender a écrit :
>> Hi Cyrille,
>>
>> On 01/16/2017 06:34 PM, Cyrille Pitchen wrote:
>>> Le 16/01/2017 à 16:12, Bastian Stender a écrit :
>>>> Since MRAM chips (like the Everspin mr25h40) are not sector
>>>> organized they should be defined as n_sectors * 1 byte sectors. To
>>>> be able to store the higher number of sectors n_sectors should be
>>>> an unsigned 32 bit integer just like sector_size.
>>>>
>>>
>>> Could you comment a little bit more on what this series improves or
>>> fixes?
>>
>> Sure. I want to create multiple writeable partitions on a mr25h40 MRAM
>> chip. This does not currently work because drivers/mtd/mtdpart.c makes sure
>> that partitions start on erase block boundaries and end on erase blocks.
>> That is obviously not the case for multiple partitions with the current
>> definition:
>>
> 
> OK now I better understand your issue so let's take it as a bug since it
> prevents you from using full features of the memory. However we have to be
> cautious because the modification you propose may have unwanted side
> effects hence may introduce some regressions.

This clearly feels like an improvement, not a bugfix .. unless I missed
something?

> For instance, currently the erase size >= page size. After your patch it
> will no longer be the case: I guess it should be OK for spi-nor.c but I
> have no real idea whether the upper mtd layers expect such a thing. We have
> to study!
> 
[...]


-- 
Best regards,
Marek Vasut
