Received: from mail-gw3-out.broadcom.com ([216.31.210.64])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zu8ZE-0005Ym-Og
 for linux-mtd@lists.infradead.org; Thu, 05 Nov 2015 00:38:17 +0000
Subject: Re: [PATCH] mtd: brcmnand: Fix NAND_CMD_PARAM byte order
To: Brian Norris <computersforpeace@gmail.com>
References: <1445629626-27474-1-git-send-email-clay@daemons.net>
 <20151023232742.GV13239@google.com> <562AD54B.2000501@broadcom.com>
 <20151024011219.GW13239@google.com>
 <CAOVqfW-1YurDwJbKDgUJdQZVxJ_rWDg-x+28++SZtg-vPO4kYg@mail.gmail.com>
 <20151026181430.GA13239@google.com> <562E7667.5050406@broadcom.com>
 <CAOVqfW8g2w=u8fO5GTa=5Hw_OOPS6NcGFg3TiLbCPny14id0VQ@mail.gmail.com>
 <20151027204023.GV13239@google.com> <562FE4C4.3040605@broadcom.com>
 <20151104020457.GM7274@google.com>
CC: Clay McClure <clay@daemons.net>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Scott Branden <sbranden@broadcom.com>,
 "bcm-kernel-feedback-list@broadcom.com"
 <bcm-kernel-feedback-list@broadcom.com>, Kamal Dasu <kdasu.kdev@gmail.com>
From: Ray Jui <rjui@broadcom.com>
Message-ID: <563AA4E1.3090501@broadcom.com>
Date: Wed, 4 Nov 2015 16:37:53 -0800
MIME-Version: 1.0
In-Reply-To: <20151104020457.GM7274@google.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 11/3/2015 6:04 PM, Brian Norris wrote:
> On Tue, Oct 27, 2015 at 01:55:32PM -0700, Ray Jui wrote:
>> On 10/27/2015 1:40 PM, Brian Norris wrote:
>>> On Mon, Oct 26, 2015 at 01:08:41PM -0700, Clay McClure wrote:
>>>> The bug in read_byte() is due to the fact that it currently assumes
>>>> the host CPU byte order is big-endian (i.e., it always extracts byte 0
>>> >from the high bits of the word).
>>>
>>> No, the bug isn't really in read_byte() specifically, and it definitely
>>> isn't about the CPU being big-endian. As I said before, this is
>>> primarily tested on *little* endian MIPS and ARM STB chips.
>>>
>>> It appears that on these SoCs, at least, somehow (I have to wave my
>>> hands here; I really don't know why; I can only presume poor HW design)
>>> the PARAMETER_READ command fills the flash cache with big endian -like
>>> data. So when I looked at the parameter page in a register viewer, I'd
>>> see data like this:
>>>
>>> FLASH_CACHE[0] = 0x4f4e4649  (i.e., "ONFI")
>>> FLASH_CAHCE[1] = ....
>>>
>>> That is, byte[0] is 0x49 ("I"), byte[1] is 0x46 ("F"), byte[2] is 0x4e
>>> ("N"), byte[3] is 0x4f ("O"), and so on. That means this data needs to
>>> be byte-swapped before we can push it out of the brcmnand driver. There
>>> are no sideband toggles to reconfigure buses or anything, so the driver
>>> must do the swap on its own. Currently, that is done via ugly word
>>> shifting, but it can be more clearly done with this patch [1]. Note that
>>> this patch [1] just a simple refactoring and does not actually fix
>>> anything. It is just to clarify the logic.
>>>
>>> (Incidentally, I believe the above is all correct even for STB
>>> big-endian MIPS too, but I haven't tested.)
>>>
>>
>> Don't you think this may have something to do with the APB bus
>> endianness setting that's not used for all non-iProc SoCs? I suspect
>> not just the ONFI paramter page, but all other NAND data read into
>> FLASH_CACHE are in BE format on those SoCs (or am I completely out
>> of my mind and missing something here?)
>
> No, I don't think the NAND data in FLASH_CACHE is always in BE format.
> If you look at brcmnand_read_by_pio() and consider the LE STB case
> (i.e., no APB swapping to configure), then data is copied word-wise
> (with no swapping) into a byte array (note the cast in
> brcmnand_read_page(), for instance).
>
> So in the read page case, the FLASH_CACHE is currently treated as native
> endianness -- i.e., "little endian".
>
> Now, I don't think any of this means that you're out of your mind. I can
> definitively claim that I do *not* know what's going on here. I expect
> that this is some convoluted concoction of a disorganized and
> distributed (across different business units) "design" of a NAND
> controller.
>
> I think you need to consult with:
> (1) real hardware for all affected cases (i.e., both STB SoCs and iProc,
>      for starters) and
> (2) the core designers. (At a minimum, I think they should answer for
>      why ONFI parameter pages show up in big endian on STB chips. But
>      there are definitely more questions than that.)
>
> As I am no longer at Broadcom, I don't have access to my usual hardware
> for (1), and I definitely don't have access to (2).
>

Yes, I agree with you that this should really be sorted out with the 
ASIC designers. We really need to understand the effect of the APB bus 
endianness configuration at different levels.

I'm not currently working on NAND for the next-gen of iProc SoCs. But I 
should be able to identify the ASIC designer and start up an email 
thread on this subject with developers working on NAND for iProc SoCs 
included.

Thanks,

Ray

> Incidentally, I'm not sure it's best I'm the (sole) maintainer for
> drivers/mtd/nand/brcmnand/ any more, given my lack of hardware. (I could
> probably acquire consumer BRCM-based routers to hack on, but that's not
> quite my bread and butter, nor the source of this particular thorn.) I'm
> open to other additions to MAINTAINERS, and specifically someone who can
> answer for STB SoCs, where this mess all originated from. Florian?
> Kamal?
>
> Brian
>
