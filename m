Received: from petasus.ims.intel.com ([62.118.80.130])
	by pentafluge.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfdcC-0002N7-Ai
	for linux-mtd@lists.infradead.org; Fri, 25 Nov 2005 13:27:49 +0000
Message-ID: <4387113C.3050206@intel.com>
Date: Fri, 25 Nov 2005 16:27:24 +0300
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <Pine.LNX.4.64.0511241116270.6022@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.64.0511241116270.6022@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Deadlock in cfi_cmdset_0001.c on simultaneous write operations.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:

> On Thu, 24 Nov 2005, Alexey, Korolev wrote:
>
> > Nicolas,
> >
> > I'm using non SMP platform ( Mainstone II). CONFIG_PREEMPT is disabled.
>
> What kernel version are you using?
>
linux 2.6.11

> Can you send me your kernel .config?  I'll try to reproduce it here.
>
> > Partition size is 8MB. Current configuration: each logical volume is 
> located
> > on each h/w partition. Logical volumes don't share h/w partitions.
>
> This is Sibley flash?
>
Yes it is M18 flash chip.

> > I also disabled erase suspend on write feature.
>
> Why?
>
I thought that it would be better for the bug localization. Please 
correct me  if  I'm wrong. The code recursion in get_chip function  is 
mostly related to usage of  erase suspend on write feature.
Code just fall to sleep on attempt to get busy chip if  I disable erase 
suspend on write. It just showed to me that it is not a problem with 
erase suspend.

> > I applied code which you have send in previous letter.
> > After that code behavior has changed.
> > It didn't halt on basic simultaneous write operations.
>
> Actually, I wonder why.  Especially with CONFIG_PREEMPT on non SMP
> system all spin_locks are just no ops.
>
> > But it failed to kernel panic in our test case. (Five applications, 
> each of
> > them performs writing, erasing and reading own logical volume )
>
> Can you share your test application with me?
>
The test application is a part of rather big test harness.
I'm will try to find a way for you to reproduce the issue.

> > Here is kernel panic message:
> > After this message I received two more almost the same as this 
> kernel panic
> > messages.
> >
> [...]
> > Stack: (0xc391dfa8 to 0xc391e000)
> > dfa0:                   c391dfc8 c391dfb8 c003129c c0030eb4 02c76300 
> c391e004
> > dfc0: c391dfcc c01a0928 c0031284 02734e47 33c93d00 00000075 c3982450 
> c3c732f0
> > dfe0: c391e08c c02deba0 00000007 c3c732d4 00000001 00000001 c391e0c8 
> c391e008
> > Backtrace:
> [...]
>
> This looks extremely suspicious, given that the backtrace has at least
> 40 calls and the stack cannot contain all of them given its location
> (the kernel stack is 8kb aligned).  So this really looks like a kernel
> stack overflow, and frankly I wonder how you managed that.
>
> Did you modify your kernel somehow?  What patches if any did you apply
> to it?
>
Yes we modified kernel. We made own patches for kernel. But it doesn't 
relate to chip getting process.
I think it will be possible to reproduce the issue on default 
configuration . I need some time to find a way how to do it.

Thanks,
Alexey
