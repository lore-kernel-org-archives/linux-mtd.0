Received: from world.rdmcorp.com ([204.225.180.10] helo=mailhost.rdmcorp.com)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BdupD-0001Uq-Q3
	for linux-mtd@lists.infradead.org; Fri, 25 Jun 2004 13:49:20 -0400
Received: from [10.1.1.158] (10.1.2.1) by mailhost.rdmcorp.com (Worldmail
	1.3.167) for linux-mtd@lists.infradead.org;
	25 Jun 2004 13:49:13 -0400
Date: Fri, 25 Jun 2004 13:45:10 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@mindspring.com>
To: linux-mtd@lists.infradead.org
Message-ID: <Pine.LNX.4.60.0406251337240.3573@localhost.localdomain>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Subject: couple problems with JFFS2 on a PPC-based embedded system
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


   i'm hoping this is the right place to ask a couple questions 
regarding some weirdnesses using JFFS2 on a PPC-based embedded system.

   first, some sudden errors that just cropped up during a boot on
one of the boards:
=============================================
...
Waiting for write to complete timed out in do_write_oneword.<5>Write 
of 2209
byt
es at 0x00737610 failed. returned -5, retlen 480
Scheduling in interrupt
kernel BUG at sched.c:564!
Oops: Kernel Mode Software FPU Emulation, sig: 8
NIP: C000E028 XER: 00000000 LR: C000E028 SP: C1581F10 REGS: c1581e60 
TRAP:
1000
    Not tainted
MSR: 00009032 EE: 1 PR: 0 FP: 0 ME: 1 IR/DR: 11
TASK = c1580000[172] 'tar' Last syscall: 4
last math 00000000 last altivec 00000000
GPR00: C000E028 C1581F10 C1580000 0000001B 00001032 00000001 00000001
FFFFFFFF
GPR08: 00000000 C015A0C8 0000001B C1581E20 FA200000 1006D20C 00000000
00000000
GPR16: 00000000 00000000 00000000 00000000 00009032 01581F40 00000000
C0004670
GPR24: C00043E0 10003CF0 100094B4 00000004 00000005 7FFFDAA8 00000000
C1581F10
Call backtrace:
C000E028 C000468C 00000000 100411E8 10040A54 10040B04 10005F40
10007AD4 10009524 10004E4C 1000418C 10003D70 0FE70E88 00000000
Kernel panic: Aiee, killing interrupt handler!
In interrupt handler - not syncing
=============================================

upon reboot, then, we get:

jffs2_scan_inode_node(): Data CRC failed on node at 0x0071dc4c: Read
0x92d5b956,
  calculated 0x571a911d
jffs2_scan_inode_node(): Data CRC failed on node at 0x00737610: Read
0x17cf0524,
  calculated 0x07b0d4c4


   ouch.  and, while this may show how little i know about JFFS2 
mechanics, here's something else i'm puzzled about.

   yesterday, on the same type of system, i ran "eraseall" to totally 
erase the user flash.  seemed to work fine, took its time, 64K at a 
time (total 8M).  afterwards, i could mount it -- not surprisingly it 
was totally empty.  unmounted, rebooted system, and got numerous 
errors at boot time (sorry, i don't have the actual errors at hand, 
dang).

   ok, "eraseall" again, mount and verify empty flash again, reboot, 
same thing.  third time, "eraseall", mount, and then copy a short file 
into the flash.  the write for a 2K file took the better part of a
minute, but eventually succeeded, the file was there, so unmount, 
reboot, and this time, no problem.

   so with me not knowing how JFFS2 FSes work internally, is there 
something about writing the very first file to an erased FS that 
somehow initializes it so that it works fine from then on?

   thanks for any help.

rday

p.s.  given that this is a 2.4.22-pre8 kernel, should i download the 
latest mtd kernel stuff and update?  the current drivers/mtd directory
appears to be dated mar, 2002.  at least, that's the date in the 
Makefile.
