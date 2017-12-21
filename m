Received: from smtp.exceet.ch ([77.245.33.226])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eS1Im-00058D-QX
 for linux-mtd@lists.infradead.org; Thu, 21 Dec 2017 13:54:27 +0000
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
To: Boris Brezillon <boris.brezillon@free-electrons.com>
CC: Peter Pan <peterpansjtu@gmail.com>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
 <20171205135804.478902dc@bbrezillon> <20171205140313.40f3f17d@bbrezillon>
 <256b4ab6-c104-4580-87cd-527178bde460@exceet.de>
 <20171213222710.32d12514@bbrezillon>
 <CAAyFORJcT1abbo21iA4cetLKmF0zE4akFGFryxPpwPO+730LDQ@mail.gmail.com>
 <20171214085036.436b4fcf@bbrezillon>
 <CAAyFOR+=JwTRTm2MXVdMy7KRPsnV8LV4t71kHUh_s=+QOsVurA@mail.gmail.com>
 <23d17416-e555-4b92-cc47-f644fbe676c6@exceet.de>
 <20171214163848.41f6d277@bbrezillon>
 <CAAyFORKeFq+=tF9AK+8hp6GYYiyp3DKcw8+LWrC3RWS2zLNU_w@mail.gmail.com>
 <CAAyFORJEuEaHDXgk+m0ax5RoZ-3cRJs6uFXw7syR4vHE1veEwQ@mail.gmail.com>
 <a06312e4-a7e6-8b7b-9eb5-8320302dcc55@exceet.de>
 <20171221140122.001bd196@bbrezillon>
From: Frieder Schrempf <frieder.schrempf@exceet.de>
Message-ID: <877f663d-d539-d578-fbbd-29d9ce6f0054@exceet.de>
Date: Thu, 21 Dec 2017 14:54:09 +0100
MIME-Version: 1.0
In-Reply-To: <20171221140122.001bd196@bbrezillon>
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

On 21.12.2017 14:01, Boris Brezillon wrote:
> Hi Frieder,
> 
> On Thu, 21 Dec 2017 12:48:16 +0100
> Frieder Schrempf <frieder.schrempf@exceet.de> wrote:
>>
>> * On calculating the row address for read/program/erase via
>> nanddev_pos_to_row, it seems like the eraseblock_addr_shift is wrong.
> 
> My version was incorrect, but yours is not good either :-), should
> be:
> 
> 	nand->rowconv.eraseblock_addr_shift =
> 				fls(memorg->pages_per_eraseblock - 1);
> 
> otherwise it doesn't work when the number of pages per block is not a
> power of 2, and that can happen :-/.

Ok, makes sense.

>> * Also, I'm not sure if the LUN should be taken into account when
>> calculating the row address. At least when you select the LUN by issuing
>> a separate command, the row address sent to the chip should only contain
>> the page address.
> 
> The LUN id is part of the row address on parallel ONFI NANDs. Are you
> sure what you're trying to access is actually a LUN?
> 
> The ONFI spec says:
> "
> LUN (logical unit number)
> The minimum unit that can independently execute commands and report
> status. There are one or more LUNs per NAND Target.
> "
> 
> I suspect what you're trying to expose is a chip with 2 targets
> (target is a synonym for die). If this is the case, then you should
> have:
> 
> 	luns_per_target = 1;
> 	ntargets = 2;	/* ntargets <=> number of dies */

Indeed. It seems like I misunderstood the meaning of LUN.
Thank you for explaining.

I fixed my chip setup and refactored my die/target selection code 
accordingly.

> 
>> But I'm not sure if that's the case in general, or if some code is
>> needed to differentiate.
>>
>> See my changes of nanddev_pos_to_row here: [3]
>>
>> * I run into a mutex deadlock, when spinand_write_page fails (e.g.
>> because of a bad block) as the lock is not released in such cases. See
>> my fix here: [4]
> 
> This is a valid fix.
> 
>>
>> With these fixes applied and as far as I can tell everything seems to
>> work fine. I'll do some tests with UBI next and look into the ECC topic.
> 
> Okay cool.
> 
> I'll squash your fixes in the original commits and push an updated
> version on my repo.

Ok, great!

Thanks a lot,

Frieder
