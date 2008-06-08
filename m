Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K5Dc0-0001wx-GQ
	for linux-mtd@lists.infradead.org; Sun, 08 Jun 2008 05:38:40 +0000
Received: from edison2.selinc.com (edison2.selinc.com [12.110.71.8])
	by tesla.selinc.com (8.12.11.20060308/8.12.11) with ESMTP id
	m585ccNt016628
	for <linux-mtd@lists.infradead.org>; Sat, 7 Jun 2008 22:38:38 -0700
To: linux-mtd@lists.infradead.org
Subject: mtd_info->size again (lengthy)
MIME-Version: 1.0
Message-ID: <OFD87C95E7.367C9580-ON88257462.00177BAD-88257462.001EF9FC@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Sat, 7 Jun 2008 22:38:21 -0700
Content-Type: text/plain; charset="US-ASCII"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

There's been some chatter on the list in the last couple of months (mostly 
by me) about the limit on MTD devices of no more than 2GiB because struct 
mtd_info->size is a 32-bit value.  A few weeks ago I asked for ideas on 
how to get around this limit, the most popular on being that I should 
change the meaning of mtd_info->size from "the size of the device in 
bytes" to "the size of the device in kilobytes".  I took the suggestion to 
heart and when I started working on this last week, that was the direction 
I took.  Now I'm in deep trouble.  I'm having multiple problems with this 
solution.

A quick grep of mtd->info turns up on the order of 225 hits in various and 
assorted drivers and core code, not counting other structures that have an 
mtd_info buried inside them.  A lot of those hits are simple things like 
"if(off + len > mtd->info)".  So if I change the meaning of mtd_info->size 
to KiB, then I have to change everyplace that touches/checkes/uses 
mtd_info->size to use KiB.  A duanting task, especially as there are other 
places where the value of mtd_info->size is used to initialize other 
structures (JFFS2 leeps to mind).  Would I then have to go through those 
other places and ripple the change in meaning there as well?  This idea 
was getting out of hand in a hurry.

So I stepped back and rethought this.  Maybe just leaving the meaning as 
bytes and changing the type to 64-bits wasn't such a bad idea after all. 
As I said, a sizable percentage of the 225 hits are simple compares, the 
compiler would take care of my problem by promotion.  Plus places like the 
NAND layer that does calculations by shifting mtd_info->size could safely 
be left alone.  However, I'm still left with the problem of ripple effect 
into other layers like JFFS2 and some of the MTD map files.

Plus I run into this problem with making it a 64-bit value: there are a 
few places (add_mtd_device() for example) where mtd_info->size is passed 
as a parameter of type size_t, which in my case on an mpc8347 is a 32-bit 
value.  This is where I really start to get bogged down.  size_t (please 
correct me if I'm wrong because I probably am) is defined to be a type 
that will tell you the largest item (in bytes) that can be accessed by 
that particular processor.  In other words, the biggest structure you 
could access in the RAM on the local bus of an mpc8347 would be 4GiB, or 
0x0 - 0xffffffff, a 32-bit value, and thus size_t on an 8347 is defined to 
be an unsigned long.  That makes my poor little HW engineer brain hurt, 
though I think I get it.  But wait....now I have 8GiB of NAND flash, 
connected to a PCI controller, handled by a single PCI driver and thus 
presented to the kernel as a single item, 8GiB in size which doesn't fit 
in size_t.  So now, my call to mtd->unlock() in the function 
add_mtd_device() passes a length of 0 because mtd->size gets truncated to 
32-bits!  Ouch, my poor little HW engineer brain just had an aneurysm :(.

We then thought, why don't we just break the NAND controller up into four 
controllers (we can do that becuase we rolled our own in an FPGA) with 
2GiB of flash on each controller.  Then we can just concatenate the four 
together in the MTD layer.  Great idea.  Not!  Same problem.  When you 
concatenate devices together in MTD, each devices size gets added to 
mtd_info->size, and again I've overflowed my 32-bit size.

Then we thought, okay just have four 2GiB devices on /dev/mtd0-3.  After 
all, we can mount as much stuff on the root directory as we want.  Except 
my SW folks are telling me that, due to archiving requirements we will 
probably end up with sub-directories in excess of 2GiB which will make 
file management a real nightmare.  Well, fine, so I'm back to trying to 
get the MTD layer to support >2GiB devices.  And to be honest, I really 
believe it's the best solution for all.  As flash densities continue to 
grow, I think there are going to be more and more embedded designs where 
using Compact Flash or some other SSD hidden behind an IDE interface is 
not going to be acceptible.  This is a good thing to change and now is a 
good time.

But folks, I'm stuck.  I'm just a dumb HW engineer trying to get my box 
running.  I'm willing to make the change and I want to make the change, 
but I need help.  I hate asking, I know that the etiquette on the lists 
frowns on asking for specific help.  And usually after a few days of 
poking I can come up with my own solution.  It's not pretty but it works 
:).  But right now I'm totally lost in the subtle complexeties and the 
shear size of MTD.  It's way beyond me.  What I need is a concrete code 
example from someone on what and how to go about expanding MTD to support 
large sizes.  Can someone please help me out?  If I can get a good solid 
idea of how to fix it, I'm more than happy to do the work of making all 
the code changes and putting together a patch.  The open source community 
has been good to me and I'd love nothing more than being able to 
contribute something back.

Thanks for listening.

Bruce
