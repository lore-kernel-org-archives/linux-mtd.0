Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eS0Tg-000360-OU
 for linux-mtd@lists.infradead.org; Thu, 21 Dec 2017 13:01:42 +0000
Date: Thu, 21 Dec 2017 14:01:22 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Frieder Schrempf <frieder.schrempf@exceet.de>
Cc: Peter Pan <peterpansjtu@gmail.com>, "Peter Pan =?UTF-8?B?5r2Y5qCL?=
 (peterpandong)" <peterpandong@micron.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v6 00/15] A SPI NAND framework under generic NAND framework
Message-ID: <20171221140122.001bd196@bbrezillon>
In-Reply-To: <a06312e4-a7e6-8b7b-9eb5-8320302dcc55@exceet.de>
References: <20170529225931.226da943@bbrezillon>
 <90bcb366-c494-2dee-3bb7-d16b77e347c6@exceet.de>
 <20171204150514.1f17671d@bbrezillon>
 <A0FE66EC-7E17-43BE-9B66-896F112B92A0@micron.com>
 <20171205135804.478902dc@bbrezillon>
 <20171205140313.40f3f17d@bbrezillon>
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
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Frieder,

On Thu, 21 Dec 2017 12:48:16 +0100
Frieder Schrempf <frieder.schrempf@exceet.de> wrote:

> Hello Boris,
> 
> >>>> So shouldn't there be an spinand_die_select_op in the SPI NAND core that
> >>>> is executed when necessary and skipped if there's only one die.  
> >>>
> >>> Sure, I was arguing against a ->select_chip() at the generic NAND
> >>> level. That's something you can add in the SPI NAND framework.  
> 
> I added an op to send the die selection command and call it, where I 
> think it is needed: [1]
> 
> Accessing both dies on the Winbond SPI NAND works fine like this.

Okay, I'll have a look.

> 
> While running tests I came across some problems:
> 
> * On accessing the BBT in RAM via nanddev_bbt_[set/get]_block_status, 
> the calculation of position and offset seems to be wrong.
> My fix is here: [2]

Indeed.

> 
> * On calculating the row address for read/program/erase via 
> nanddev_pos_to_row, it seems like the eraseblock_addr_shift is wrong.

My version was incorrect, but yours is not good either :-), should
be:

	nand->rowconv.eraseblock_addr_shift =
				fls(memorg->pages_per_eraseblock - 1);

otherwise it doesn't work when the number of pages per block is not a
power of 2, and that can happen :-/.

> 
> * Also, I'm not sure if the LUN should be taken into account when 
> calculating the row address. At least when you select the LUN by issuing 
> a separate command, the row address sent to the chip should only contain 
> the page address.

The LUN id is part of the row address on parallel ONFI NANDs. Are you
sure what you're trying to access is actually a LUN?

The ONFI spec says:
"
LUN (logical unit number)
The minimum unit that can independently execute commands and report
status. There are one or more LUNs per NAND Target.
"

I suspect what you're trying to expose is a chip with 2 targets
(target is a synonym for die). If this is the case, then you should
have:

	luns_per_target = 1;
	ntargets = 2;	/* ntargets <=> number of dies */

> But I'm not sure if that's the case in general, or if some code is 
> needed to differentiate.
> 
> See my changes of nanddev_pos_to_row here: [3]
> 
> * I run into a mutex deadlock, when spinand_write_page fails (e.g. 
> because of a bad block) as the lock is not released in such cases. See 
> my fix here: [4]

This is a valid fix.

> 
> With these fixes applied and as far as I can tell everything seems to 
> work fine. I'll do some tests with UBI next and look into the ECC topic.

Okay cool.

I'll squash your fixes in the original commits and push an updated
version on my repo.

Thanks,

Boris
