Received: from bear.ext.ti.com ([192.94.94.41])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzd0S-00081K-K8
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 04:09:05 +0000
Subject: Re: mmap support for m25p80 device
To: Brian Norris <computersforpeace@gmail.com>, Simon Falsig <simon@newtec.dk>
References: <9d83b70759c3d2507200432b4ff162be@mail.gmail.com>
 <20151118021503.GA140057@google.com>
CC: <linux-mtd@lists.infradead.org>
From: Vignesh R <vigneshr@ti.com>
Message-ID: <564E9CC5.50709@ti.com>
Date: Fri, 20 Nov 2015 09:38:37 +0530
MIME-Version: 1.0
In-Reply-To: <20151118021503.GA140057@google.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 11/18/2015 07:45 AM, Brian Norris wrote:
> + Vignesh
> 
> Vignesh is working on supporting mmap'd flash reads in the SPI core,
> particularly for the TI QSPI driver. I don't believe he's planning on
> exposing this to userspace, though, and I believe that might be pretty
> difficult to do now.
> 
> Perhaps Vignesh can comment.

I have no plans of exposing this to userspace anytime sooner. Supporting
DMA and all types of opcode/address/data combinations are the first steps.

> 
> On Tue, Oct 20, 2015 at 04:31:20PM +0200, Simon Falsig wrote:
>> Hi,
>>
>> I'm currently working on a new custom board (with a TI AM3356 ARM-Cortex
>> A8
>> CPU), with a 32 kB Everspin MR25H256 MRAM chip, attached over SPI. It
>> works
>> fine using the m25p80 driver, but I was wondering how complex it would be
>> to
>> add the possibility of memory-mapping the device in userspace? - mainly to
>> make the interface consistent with the board that it is replacing, which
>> uses
>> a different, mmap-able, RAM chip.
>>
>> I'm not very experienced in the deeper aspects of the kernel, but I've
>> been
>> poking around a bit in the mtd subsystem, and it seems as if the main
>> thing
>> that is missing, is a valid get_unmapped_area() function for the m25p80
>> driver, and then to change the mtdchar_mmap() function (in mtdchar.c) to
>> actually allow mmap'ing on MMU systems.
> 
> It's not quite so simple. Read the comments in mtdchar, and you'll see
> that there's some layering bugs that caused us to disable MMU mmap
> entirely. Apparently no one cared so far. Read the comments here:
> 
> commit f5cf8f07423b2677cebebcebc863af77223a4972
> Author: David Woodhouse <David.Woodhouse@intel.com>
> Date:   Tue Oct 9 15:08:10 2012 +0100
> 
>     mtd: Disable mtdchar mmap on MMU systems
> 
> But feel free to fix it.
> 
>> But - does it even make sense to create such a function for m25p80? - and
>> how would I start?
> 
> SPI drivers don't really expose a mmap-able interface, so this isn't
> possible at the moment. Even once it can be done, it would be restricted
> only to those controllers that can do memory map for you. AIUI, your SoC
> might (?).
> 
> But even if it supports it, I expect you'll have difficulty coordinating
> this properly, since the SPI bus technically can be shared with multiple
> devices, whereas mmap would kind of assume that user-space can access
> the flash at any time. So I guess m25p80 would have to grab exclusive
> access of the entire SPI bus? If your system design can handle that,
> then I guess it CAN be done...
> 
> ...but why do you want to do this, again?
> 
> Brian
> 
>> Any pointers and/or comments are appreciated!
>> Thanks and best regards,
>> Simon Falsig
>> simon@newtec.dk
>>
>> ______________________________________________________
>> Linux MTD discussion mailing list
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/

-- 
Regards
Vignesh
