Received: from smtp.fh-landshut.de ([193.175.141.50])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BGfbI-0003mh-00
	for linux-mtd@lists.infradead.org; Thu, 22 Apr 2004 15:54:52 +0100
Received: from fh-landshut.de (dhcp-215-9.if.fh-landshut.de [193.175.215.209])
	i3MEskO05468
	for <linux-mtd@lists.infradead.org>; Thu, 22 Apr 2004 16:54:46 +0200
Message-ID: <4087DC65.7010703@fh-landshut.de>
Date: Thu, 22 Apr 2004 16:53:25 +0200
From: Oliver Korpilla <okorpil@fh-landshut.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: (interleaved chips) cfi_cmdset_0002 -> Kernel Panic
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello!

In recent posts it is mentioned that there is a kernel panic like this:

/ # cat tmp/rootfs.jffs2.img > /dev/mtd0
Waiting for write to complete timed out in do_write_oneword.Scheduling 
in interrupt
kernel BUG at sched.c:564! 

Oops: Exception in kernel mode, sig: 4
NIP: C0012AD8 XER: 00000000 LR: C0012AD8 SP: C1F8BF10 REGS: c1f8be60 
TRAP: 0700    Not tainted
MSR: 00089032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11 

TASK = c1f8a000[23] 'cat' Last syscall: 4
last math 00000000 last altivec 00000000
GPR00: C0012AD8 C1F8BF10 C1F8A000 0000001B 00001032 00000001 00000000 
C01D0000
GPR08: 00000DF8 00000000 00000000 C1F8BE30 44002008 00000000 7FFFFEB0 
00000000
GPR16: 30005140 30005000 00000002 000000E4 00009032 01F8BF40 00000000 
C0005E28
GPR24: C0005B80 30005154 00000004 00000001 00000001 7FFFEDF0 00000000 
C1F8BF10
Call backtrace: 

C0012AD8 C0005E44 00000488 10046E98 100451DC 1000B03C 10003C5C
10003808 30048EF4 10003590
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
  <0>Rebooting in 180 seconds..

It is happening because of the broken AMD command set for chips like 
mine (at least as far as I understand it from pretty recent posts to the 
list). I have the following startup with kernel.org 2.4.25:

physmap flash device: 300000 at ff000000
CFI: Found no Physically mapped flash device at location zero
Search for id:(100 100) interleave(2) type(2)
Search for id:(100 100) interleave(2) type(2)
Search for id:(100 100) interleave(2) type(2)
Search for id:(00 02) interleave(2) type(1)
Search for id:(00 02) interleave(2) type(1)
Search for id:(00 02) interleave(2) type(1)
Search for id:(01 22da) interleave(4) type(2)
Found: AMD AM29LV800BT
Physically mapped flash: Found 4 x16 devices at 0x0 in 32-bit mod

It wouldn't work with a recent patch from the CVS snaphost downloads, 
because auto detection won't work. AFAIK it is broken.

How are the chances of fixing it? Is there a working version "out there" 
that supports my flash chip, auto detection and works?? Is there a 
quickfix I could apply (increasing some timeout value, copying over 
another implementation of that do_write_oneword function)???

Thanks in advance,
Oliver Korpilla
