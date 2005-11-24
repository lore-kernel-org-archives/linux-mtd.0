Received: from relais.videotron.ca ([24.201.245.36])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EfK7z-00067F-0Y
	for linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 11:39:25 -0500
Received: from xanadu.home ([24.202.136.67]) by VL-MO-MR003.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0IQG0041HWXE6DO0@VL-MO-MR003.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 24 Nov 2005 11:39:14 -0500 (EST)
Date: Thu, 24 Nov 2005 11:39:14 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
In-reply-to: <4385E2F4.6010603@intel.com>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
Message-id: <Pine.LNX.4.64.0511241116270.6022@localhost.localdomain>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <Pine.LNX.4.64.0511231440450.6022@localhost.localdomain>
	<4385E2F4.6010603@intel.com>
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

On Thu, 24 Nov 2005, Alexey, Korolev wrote:

> Nicolas,
> 
> I'm using non SMP platform ( Mainstone II). CONFIG_PREEMPT is disabled.

What kernel version are you using?

Can you send me your kernel .config?  I'll try to reproduce it here.

> Partition size is 8MB. Current configuration: each logical volume is located
> on each h/w partition. Logical volumes don't share h/w partitions.

This is Sibley flash?

> I also disabled erase suspend on write feature.

Why?

> I applied code which you have send in previous letter.
> After that code behavior has changed.
> It didn't halt on basic simultaneous write operations.

Actually, I wonder why.  Especially with CONFIG_PREEMPT on non SMP 
system all spin_locks are just no ops.

> But it failed to kernel panic in our test case. (Five applications, each of
> them performs writing, erasing and reading own logical volume )

Can you share your test application with me?

> Here is kernel panic message:
> After this message I received two more almost the same as this kernel panic
> messages.
> 
[...]
> Stack: (0xc391dfa8 to 0xc391e000)
> dfa0:                   c391dfc8 c391dfb8 c003129c c0030eb4 02c76300 c391e004
> dfc0: c391dfcc c01a0928 c0031284 02734e47 33c93d00 00000075 c3982450 c3c732f0
> dfe0: c391e08c c02deba0 00000007 c3c732d4 00000001 00000001 c391e0c8 c391e008
> Backtrace:
[...]

This looks extremely suspicious, given that the backtrace has at least 
40 calls and the stack cannot contain all of them given its location 
(the kernel stack is 8kb aligned).  So this really looks like a kernel 
stack overflow, and frankly I wonder how you managed that.

Did you modify your kernel somehow?  What patches if any did you apply 
to it?


Nicolas
