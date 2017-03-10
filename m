Received: from mail-wr0-x241.google.com ([2a00:1450:400c:c0c::241])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cmGcw-0005MX-0g
 for linux-mtd@lists.infradead.org; Fri, 10 Mar 2017 09:14:24 +0000
Received: by mail-wr0-x241.google.com with SMTP id u48so10824868wrc.1
 for <linux-mtd@lists.infradead.org>; Fri, 10 Mar 2017 01:14:01 -0800 (PST)
Subject: Re: [PATCH v2 1/6] nand: spi: Add init/release function
To: Peter Pan <peterpansjtu@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <1488358330-23832-1-git-send-email-peterpandong@micron.com>
 <1488358330-23832-2-git-send-email-peterpandong@micron.com>
 <20170301105851.5bc9eb0d@bbrezillon>
 <CAAyFORLoRLAJeC=1AUXiK5XiDg0t1qjcn-1Qe9DhvWug_O_5Ag@mail.gmail.com>
Cc: Peter Pan <peterpandong@micron.com>, Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
From: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Message-ID: <915b71c3-3582-0f9e-e873-fadb0c641ca6@gmail.com>
Date: Fri, 10 Mar 2017 10:13:57 +0100
MIME-Version: 1.0
In-Reply-To: <CAAyFORLoRLAJeC=1AUXiK5XiDg0t1qjcn-1Qe9DhvWug_O_5Ag@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 10/03/2017 08:50, Peter Pan wrote:
> On Wed, Mar 1, 2017 at 5:58 PM, Boris Brezillon
> <boris.brezillon@free-electrons.com> wrote:
>> +Arnaud
>>
>> Hi Peter,
>>
>> Can you please Cc Arnaud (and in general all reviewers) each time you
>> send a new version.
>>
>> On Wed, 1 Mar 2017 16:52:05 +0800
>> Peter Pan <peterpandong@micron.com> wrote:
>>
>>> This is the first commit for spi nand framkework.
>>> This commit is to add spi nand initialization and
>>> release functions.
>> Hm, actually you're doing more than that. Just say that you add basic
>> building blocks for the SPI NAND infrastructure.
>>
>>> Signed-off-by: Peter Pan <peterpandong@micron.com>
>>> ---
>>>   drivers/mtd/nand/Kconfig            |   1 +
>>>   drivers/mtd/nand/Makefile           |   1 +
>>>   drivers/mtd/nand/spi/Kconfig        |   5 +
>>>   drivers/mtd/nand/spi/Makefile       |   2 +
>>>   drivers/mtd/nand/spi/spinand_base.c | 469 ++++++++++++++++++++++++++++++++++++
>>>   drivers/mtd/nand/spi/spinand_ids.c  |  29 +++
>>>   include/linux/mtd/spinand.h         | 315 ++++++++++++++++++++++++
>> If you're okay with that, I'd like you to add an entry in MAINTAINERS
>> for the spinand sub-sub-sub-system :-). This way you'll be tagged as
>> the maintainer of this code and will be Cc when a patch is submitted.
>>
>>>   7 files changed, 822 insertions(+)
>>>   create mode 100644 drivers/mtd/nand/spi/Kconfig
>>>   create mode 100644 drivers/mtd/nand/spi/Makefile
>>>   create mode 100644 drivers/mtd/nand/spi/spinand_base.c
>>>   create mode 100644 drivers/mtd/nand/spi/spinand_ids.c
>>>   create mode 100644 include/linux/mtd/spinand.h
>>>
> [...]
>>> diff --git a/include/linux/mtd/spinand.h b/include/linux/mtd/spinand.h
>>> new file mode 100644
>>> index 0000000..f3d0351
>>> --- /dev/null
>>> +++ b/include/linux/mtd/spinand.h
>>> @@ -0,0 +1,315 @@
>>> +/**
>>> +* spinand.h
>>> +*
>>> +* Copyright (c) 2009-2017 Micron Technology, Inc.
>>> +*
>>> +* This program is free software; you can redistribute it and/or
>>> +* modify it under the terms of the GNU General Public License
>>> +* as published by the Free Software Foundation; either version 2
>>> +* of the License, or (at your option) any later version.
>>> +*
>>> +* This program is distributed in the hope that it will be useful,
>>> +* but WITHOUT ANY WARRANTY; without even the implied warranty of
>>> +* MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>> +* GNU General Public License for more details.
>>> +*/
>>> +#ifndef __LINUX_MTD_SPINAND_H
>>> +#define __LINUX_MTD_SPINAND_H
>>> +
>>> +#include <linux/wait.h>
>>> +#include <linux/spinlock.h>
>>> +#include <linux/mtd/mtd.h>
>>> +#include <linux/mtd/flashchip.h>
>>> +#include <linux/mtd/nand.h>
> [...]
>
>>> +
>>> +/*SPI NAND manufacture ID definition*/
>>> +#define SPINAND_MFR_MICRON           0x2C
>> Should not be exposed here (keep it in your vendor source file.
> Boris and Arnaud,
>
> I'm thinking about where to keep these SPINAND_MFR_XXX macros.
> Now the case is both spinand_ids.c and spinand_micron(vendor).c need
> this macro. spinand_ids.c stores struct spinand_manufacturer
> spinand_manuf_ids[] table
> and spinand_micron(vendor).c need this macro when detecting device by
> 4 bytes data from read ID. Of course we can create a spinand-manufacture.h
> to keep these macros. Another way is spinand_vendor.c defines own
> struct spinand_manufacturer (instead of struct spinand_manufacturer_ops), in
> this way, the table in spinand_ids.c only contains pointers to these
> struct spinand_manufacturer.
> What's your opinion?

It depends on how you have implemented the scan in your v3.

If the core call every manufacturer op->detect to tell if the 4 bytes 
are matching, AND  to return/fill the the chip info and parameters (size 
/ layout / etc...), the core doesn't even need to know the manufacturer ID.

On the other hand, if manufacturer op->detect just tell "I'm the 
manufacturer and this is it's ID" (leaving the core to lookup in its 
spinand ID table which device it is finally) then yes, you need a 
centralized spinand-manufacture.h

I prefer the first option, where detect returns directly the chip ops + 
info + layout at once.
Arnaud
>
> Thanks,
> Peter Pan
