Received: from gw1.transmode.se ([213.115.205.20])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NulDm-0005Cz-US
	for linux-mtd@lists.infradead.org; Thu, 25 Mar 2010 11:27:35 +0000
In-Reply-To: <4BAB4186.5080805@algotrim.com>
References: <4BAA11DF.3060306@algotrim.com>	<OF34D80617.67587BAB-ONC12576F0.00554519-C12576F0.005583EF@transmode.se>
	<4BAB4186.5080805@algotrim.com>
Subject: Re: Enabling D-cache for OneNAND bufferram
To: Leo Barnes <leo.barnes@algotrim.com>
Message-ID: <OF3A2BD3B7.06165486-ONC12576F1.003DEF5F-C12576F1.003E8F26@transmode.se>
From: Joakim Tjernlund <joakim.tjernlund@transmode.se>
Date: Thu, 25 Mar 2010 12:23:18 +0100
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>
> Joakim Tjernlund wrote:
> >> Hello!
> >>
> >> I am currently writing a piece of software that takes advantage of the
> >> fact that OneNAND supports read-while-loading. What I am doing is trying
> >> to achieve higher efficiency when decoding data from the OneNAND by
> >> decoding data that is available in the OneNAND bufferram directly
> >> instead of copying it to normal RAM and decoding there. So far, I have
> >> gotten quite poor results due to the fact that the bufferrams are not
> >> cached (for good reason since it is Device memory). My software will be
> >> used on ARM devices of different types, with my testrigs being a Nokia
> >> N810 and a N900.
> >>
> >> I have exclusive access to the OneNAND chip, and as such know exactly
> >> what information is stored in the bufferrams at all times. If I could
> >> only enable the D-cache for the bufferrams, I could therefore make sure
> >> to invalidate the cache whenever I reprogram the OneNAND chip.
> >>
> >>  From what I have read so far, it seems that the only way to enable
> >> cacheing of the bufferrams would be to somehow change how the memory
> >> attributes for the memory region in the MMU. I have however not found
> >> any easy way of doing this. Any tips? I dont really have very much
> >> experience when it comes to how the MMU works.
> >>
> >
> > Have a look at ioremap_cached(). Seems to be availabe on ARM
> > Basically you need to create a second virtual address mapping of the devices
> > RAM which is cached.
> >
> >     Jocke
> >
> >
> Thanks for the suggestion, but I am having some trouble getting it to
> work. This is how I tried to use ioremap_cached, along with the problems
> I got:
>
> Given a pointer to the first byte in the bufferram, I did:
> unsigned long int phys_addr = virt_to_phys(bufaddr);
> void *rmap = ioremap_cached(phys_addr, 2048);
> /* Read from rmap */
> iounmap(rmap);
>
> This would not compile however since L_PTE_CACHEABLE was not defined.
> After scanning through the kernel source, I found that L_PTE_CACHEABLE
> was usually defined as (1 << 3) for arm. With this defined,
> ioremap_cached returned a new virtual address, but gave a segmentation
> fault along with "Unhandled fault: external abort on non-linefetch
> (0x008) at 0xc8accc00" in /proc/kmsg when trying to do a read. Am I
> using ioremap correctly? Does ioremap change the old mapping, or simply
> add a second one? If it creates a second one without changing the first,
> this is illegal on ARM IIRC since two mappings cannot have differing
> memory attributes...
>
> Any other ideas?

ioremap returns a *second* mapping to the same RAM so you first original mapping
should be fine.

I have used ioremap in 2.4 to access NOR flash in cached mode and it worked
fine. one just have to rember to invalidate the cache when needed. This was on
PPC and I knonw nothing about ARM.


I can think of two things:
 1) check that virt_to_phys(bufaddr) returns
    the correct physical address for your NAND.
 2) have a look at __ioremap instead of ioremap_cached

Perhaps you need to talk to the ARM people, it may very well be
a bug in ARM arch code.

 Jocke
